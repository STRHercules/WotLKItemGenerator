#!/usr/bin/env python3
from __future__ import annotations
import argparse, csv, hashlib, json, math, os, re, shutil, struct, sys, time, uuid, zipfile
from collections import Counter, defaultdict, deque
from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DATA_DIR = ROOT / 'Data'
USER_GUID_FILE = Path.home() / '.azerothcore-item-generator-guid'
SEED = None
OUT = None
SQLDIR = None
LOOT_CHANCE = None
WORLD_LOOT_SOURCE = None
REFERENCE_LOOT_SOURCE = None
ITEM_TEMPLATE_SOURCE = None
ITEM_DBC_SOURCES = None
ITEM_DBC_OVERWRITE = False
ITEM_SET_DBC_SOURCE = None
SPELL_DBC_SOURCE = None
SPELL_ENCHANTMENT_DBC_SOURCE = None
DISENCHANT_SOURCE = None
SPELL_PROC_SOURCE = None
SPELL_SCRIPT_NAMES_SOURCE = None
DISABLED_FEATURES = set()
FEATURE_CATALOG = None
SET_RATE = None
SET_MIN_LEVEL = None
SET_SIZE = None
SPELL_EFFECT_RATE_MULTIPLIER = None
PROC_RATE_MULTIPLIER = None
ON_USE_RATE_MULTIPLIER = None
EFFECT_ILVL_WINDOW = None
SOCKET_BONUS_RATE = None
DISENCHANT_RATE = None
MAX_SPECIAL_EFFECTS = None
REFERENCE_CATALOG_AUDIT = None
CONTENT_MANIFEST = None
TARGETED_PLAN = None
QUEST_TEMPLATE_SOURCE = None
QUEST_REWARD_ROWS = {}
ENCOUNTER_SOURCE_CATALOG = None
DEFAULT_ENCOUNTER_MANIFEST = None
ENCOUNTER_SOURCE_PATHS = None
GAMEOBJECT_SOURCE_PATHS = None
BATCH_SIZE = 500
DEFAULT_TOTAL_ITEMS = 100_000
DEFAULT_ITEMS_PER_CLASS = 10_000
MAX_ITEMS_PER_CLASS = 20_000
MAX_TOTAL_ITEMS = 200_000
def _default_data_source(filename):
    return DATA_DIR / filename

DEFAULT_WORLD_LOOT_SOURCE = _default_data_source('creature_loot_template.sql')
DEFAULT_REFERENCE_LOOT_SOURCE = _default_data_source('reference_loot_template.sql')
DEFAULT_ITEM_TEMPLATE_SOURCE = _default_data_source('item_template.sql')
DEFAULT_ITEM_DBC_SOURCE = _default_data_source('Item.dbc')
DEFAULT_ITEM_DBC_CUSTOM_SOURCE = _default_data_source('Item.custom.dbc')
DEFAULT_ITEM_SET_DBC_SOURCE = _default_data_source('ItemSet.dbc')
DEFAULT_SPELL_DBC_SOURCE = _default_data_source('Spell.dbc')
DEFAULT_SPELL_ENCHANTMENT_DBC_SOURCE = _default_data_source('SpellItemEnchantment.dbc')
DEFAULT_DISENCHANT_SOURCE = _default_data_source('disenchant_loot_template.sql')
DEFAULT_SPELL_PROC_SOURCE = _default_data_source('spell_proc.sql')
DEFAULT_SPELL_SCRIPT_NAMES_SOURCE = _default_data_source('spell_script_names.sql')
DEFAULT_MAP_DBC_SOURCE = _default_data_source('Map.dbc')
DEFAULT_MAP_DIFFICULTY_DBC_SOURCE = _default_data_source('MapDifficulty.dbc')
DEFAULT_DUNGEON_MAP_DBC_SOURCE = _default_data_source('DungeonMap.dbc')
DEFAULT_CREATURE_SOURCE = _default_data_source('creature.sql')
DEFAULT_CREATURE_TEMPLATE_SOURCE = _default_data_source('creature_template.sql')
DEFAULT_INSTANCE_ENCOUNTERS_SOURCE = _default_data_source('instance_encounters.sql')
DEFAULT_GAMEOBJECT_SOURCE = _default_data_source('gameobject.sql')
DEFAULT_GAMEOBJECT_TEMPLATE_SOURCE = _default_data_source('gameobject_template.sql')
DEFAULT_GAMEOBJECT_LOOT_SOURCE = _default_data_source('gameobject_loot_template.sql')

def resolve_optional_gameobject_sources(explicit_paths=None, data_dir=DATA_DIR):
    explicit=tuple(explicit_paths or (None, None, None))
    if len(explicit) != 3:
        raise ValueError('gameobject sources must contain exactly three paths')
    if any(path is not None for path in explicit):
        if not all(path is not None for path in explicit):
            raise ValueError('gameobject sources must be supplied together')
        paths=tuple(Path(path).expanduser().resolve() for path in explicit)
        return None if any(not path.is_file() for path in paths) else paths
    defaults=tuple(Path(data_dir) / name for name in (
        'gameobject.sql', 'gameobject_template.sql', 'gameobject_loot_template.sql'))
    return defaults if all(path.is_file() for path in defaults) else None

NEW_FEATURES = (
    'sets', 'spell-effects', 'chance-on-hit', 'on-use', 'socket-bonuses', 'disenchant',
)
DISABLE_ALIASES = {
    'effects': ('spell-effects', 'chance-on-hit', 'on-use'),
    'all-new': NEW_FEATURES,
}

# Terminal UI is presentation-only. Rich is optional so the generator remains runnable with
# the Python standard library alone; interactive terminals automatically use it when present.
try:
    from rich import box as rich_box
    from rich.console import Console, Group
    from rich.live import Live
    from rich.panel import Panel
    from rich.progress_bar import ProgressBar
    from rich.spinner import Spinner
    from rich.table import Table
    from rich.text import Text
    RICH_AVAILABLE = True
except ImportError:  # pragma: no cover - exercised on installations without Rich
    Console = Group = Live = Panel = ProgressBar = Spinner = Table = Text = rich_box = None
    RICH_AVAILABLE = False

UI_MODES = ('auto','fancy','plain')


def resolve_ui_mode(requested='auto',is_tty=None,rich_available=None):
    requested=str(requested or 'auto').lower()
    if requested not in UI_MODES:
        raise ValueError(f'unknown UI mode: {requested}')
    if is_tty is None:
        is_tty=bool(getattr(sys.stdout,'isatty',lambda:False)())
    if rich_available is None:
        rich_available=RICH_AVAILABLE
    if requested=='plain':
        return 'plain'
    if requested=='fancy':
        return 'fancy' if rich_available else 'plain'
    return 'fancy' if is_tty and rich_available else 'plain'


def _format_elapsed(seconds):
    seconds=max(0.0,float(seconds or 0.0))
    minutes,sec=divmod(seconds,60)
    hours,minutes=divmod(int(minutes),60)
    if hours:
        return f'{hours:02d}:{minutes:02d}:{sec:05.2f}'
    return f'{minutes:02d}:{sec:05.2f}'


def _feature_display_names(disabled):
    labels=(('sets','Sets'),('spell-effects','Effects'),('chance-on-hit','Procs'),('on-use','On-Use'),
            ('socket-bonuses','Socket Bonuses'),('disenchant','Disenchant'))
    return [label for key,label in labels if key not in set(disabled or ())]


def notable_item_event(item):
    if item.get('Quality')==5:
        return {'kind':'legendary','title':item.get('name','Legendary item'),
                'detail':f"{item.get('class_name','')} • Level {item.get('RequiredLevel','?')} • ilvl {item.get('ItemLevel','?')} • {len(item.get('sockets',()))} sockets"}
    if item.get('itemset'):
        return {'kind':'set','title':item.get('set_name') or item.get('name','Generated set'),
                'detail':f"{item.get('class_name','')} • {str(item.get('role','')).replace('_',' ').title()} • set {item.get('itemset')}"}
    feature=item.get('special_effect_feature')
    if feature:
        kind={'chance-on-hit':'proc','on-use':'on-use','spell-effects':'effect'}.get(feature,'effect')
        return {'kind':kind,'title':item.get('name','Special item'),
                'detail':f"{feature} • stock item {item.get('effect_source_entry',0)} • spell {item.get('effect_source_spell',0)}"}
    return None


class PlainTerminalUI:
    """Low-noise terminal output used for redirected output, CI, and Rich fallback."""
    def __init__(self,stream=None,animations=True,show_items=False,quiet=False):
        self.stream=stream or sys.stdout
        self.animations=bool(animations)
        self.show_items=bool(show_items)
        self.quiet=bool(quiet)
        self._phase=''
        self._last_percent=-1
        self._seen_sets=set()
        self.runtime=None

    def _write(self,text=''):
        if not self.quiet:
            print(text,file=self.stream,flush=True)

    def banner(self):
        if self.quiet: return
        self._write('╔══════════════════════════════════════════════╗')
        self._write('║              ⚒  WotLK ITEM FORGE            ║')
        self._write('║          AzerothCore • WotLK 3.3.5a         ║')
        self._write('╚══════════════════════════════════════════════╝')

    def configure(self,runtime):
        self.runtime=runtime
        if self.quiet: return
        features=' • '.join(_feature_display_names(runtime.get('disabled_features',()))) or 'None'
        self._write(f"Seed: {runtime['seed']} ({runtime['source']})")
        self._write(f"Items: {runtime['number']:,} | Classes: {', '.join(runtime['classes'])}")
        self._write(f"Features: {features}")
        if runtime.get('default_encounter_profile_count'):
            self._write(f"Loot placement: world + dungeon/raid ({runtime['default_encounter_profile_count']} profiles)")
        self._write(f"Output: {runtime['output_dir']}")

    def source_check(self,label,path,ok=True):
        if self.quiet: return
        mark='✓' if ok else '✗'
        self._write(f'{mark} {label}: {Path(path).name}')

    def phase(self,name,total=None,detail=''):
        self._phase=name; self._last_percent=-1
        if self.quiet: return
        suffix=f' — {detail}' if detail else ''
        self._write(f'\n⚙ {name}{suffix}')

    def progress(self,completed,total,current='',class_name=None,class_completed=None,class_total=None):
        if self.quiet or not total: return
        percent=int((completed/max(1,total))*100)
        milestone=(percent==100 or percent>=self._last_percent+10 or completed==1)
        if not milestone: return
        self._last_percent=percent
        detail=f' | {current}' if current else ''
        class_detail=''
        if class_name and class_total:
            class_detail=f' | {class_name} {class_completed or 0:,}/{class_total:,}'
        self._write(f'  [{percent:3d}%] {completed:,}/{total:,}{class_detail}{detail}')

    def status(self,text):
        if not self.quiet: self._write(f'  → {text}')

    def event(self,kind,title,detail=''):
        if self.quiet: return
        icon={'legendary':'★','set':'◈','proc':'⚡','on-use':'✧','effect':'✦','epic':'◆'}.get(kind,'•')
        self._write(f'  {icon} {title}' + (f' — {detail}' if detail else ''))

    def item(self,item):
        event=notable_item_event(item)
        if event and event['kind']=='set':
            set_id=item.get('itemset')
            if set_id in self._seen_sets: return
            self._seen_sets.add(set_id)
        if event and (event['kind'] in ('legendary','set') or self.show_items):
            self.event(event['kind'],event['title'],event['detail'])
        elif not event and self.show_items and item.get('Quality')==4:
            self.event('epic',item.get('name','Epic item'),f"{item.get('class_name','')} • Level {item.get('RequiredLevel','?')} • ilvl {item.get('ItemLevel','?')}")

    def phase_done(self,name=None,detail=''):
        if self.quiet: return
        label=name or self._phase
        self._write(f'✓ {label}' + (f' — {detail}' if detail else ''))

    def validation(self,errors,name_changes=()):
        if name_changes:
            self._write(f'! NAME REPAIRS — {len(name_changes)} names shortened')
            for change in name_changes[:50]:
                self._write(f"  {change['entry']}: {change['old_name']} -> {change['new_name']}")
            if len(name_changes)>50:
                self._write(f'  ... and {len(name_changes)-50} more; see validation_report.json')
        if errors:
            self._write(f'✗ VALIDATION FAILED — {len(errors)} errors')
        else:
            self._write('✓ VALIDATION PASSED')

    def complete(self,report,elapsed,output_dir):
        if self.quiet:
            repairs=report.get('name_repair_count',0)
            suffix=f' ({repairs} names shortened)' if repairs else ''
            print(f"Generation complete: {report.get('item_count',report.get('total_items',0)):,} items -> {output_dir}{suffix}",file=self.stream,flush=True)
            return
        q=report.get('quality_distribution',report.get('quality_counts',{}))
        f=report.get('feature_counts',{})
        self._write('\n╔══════════════════ GENERATION COMPLETE ══════════════════╗')
        self._write(f"  Items        {report.get('item_count',report.get('total_items',0)):>10,}")
        for quality in ('Uncommon','Rare','Epic','Legendary'):
            if quality in q: self._write(f"  {quality:<12} {q.get(quality,0):>10,}")
        self._write(f"  Sets         {f.get('sets',0):>10,}")
        self._write(f"  Effects      {f.get('spell-effects',0):>10,}")
        self._write(f"  Procs        {f.get('chance-on-hit',0):>10,}")
        self._write(f"  On Use       {f.get('on-use',0):>10,}")
        self._write(f"  Socket bonus {f.get('socket-bonuses',0):>10,}")
        self._write(f"  Disenchant   {f.get('disenchant',0):>10,}")
        self._write(f"  Name repairs {report.get('name_repair_count',0):>10,}")
        self._write(f"  Validation   {'PASSED' if report.get('validation_errors',0)==0 else 'FAILED'}")
        self._write(f"  Time         {_format_elapsed(elapsed)}")
        self._write(f"  Output       {output_dir}")
        self._write('╚══════════════════════════════════════════════════════════╝')

    def error(self,message):
        print(f'ERROR: {message}',file=self.stream,flush=True)

    def close(self):
        pass


class QuietTerminalUI(PlainTerminalUI):
    def __init__(self,stream=None,**kwargs):
        super().__init__(stream=stream,quiet=True,animations=False,show_items=False)


class FancyTerminalUI(PlainTerminalUI):
    """Rich live dashboard for interactive terminals."""
    def __init__(self,stream=None,animations=True,show_items=False,quiet=False):
        if not RICH_AVAILABLE:
            raise RuntimeError('Rich terminal UI requested but Rich is not installed')
        super().__init__(stream=stream or sys.stdout,animations=animations,show_items=show_items,quiet=quiet)
        self.console=Console(file=self.stream,force_terminal=None,soft_wrap=False)
        self.live=None
        self.phase_total=0; self.phase_completed=0; self.current=''; self.detail=''
        self.class_progress={}; self.class_totals={}
        self.events=deque(maxlen=7)
        self.sources=[]
        self.phase_started=time.monotonic()

    def banner(self):
        if self.quiet: return
        self.live=Live(self._render(),console=self.console,refresh_per_second=12 if self.animations else 4,
                       transient=False,vertical_overflow='visible')
        self.live.start()

    def configure(self,runtime):
        self.runtime=runtime
        self.class_totals=dict(runtime.get('class_counts',{}))
        self.class_progress={name:0 for name in self.class_totals}
        self._refresh()

    def source_check(self,label,path,ok=True):
        self.sources.append((label,Path(path).name,bool(ok)))
        self._refresh()

    def phase(self,name,total=None,detail=''):
        self._phase=name; self.detail=detail; self.phase_total=int(total or 0); self.phase_completed=0
        self.current=''; self._last_percent=-1; self.phase_started=time.monotonic()
        if name in ('Generating item skeletons','Finalizing generated items'):
            self.class_progress={name:0 for name in self.class_totals}
        self._refresh()

    def progress(self,completed,total,current='',class_name=None,class_completed=None,class_total=None):
        self.phase_completed=int(completed); self.phase_total=int(total or self.phase_total or 0); self.current=current or self.current
        if class_name:
            self.class_progress[class_name]=int(class_completed if class_completed is not None else self.class_progress.get(class_name,0))
            if class_total is not None: self.class_totals[class_name]=int(class_total)
        self._refresh(throttled=True)

    def status(self,text):
        self.current=text; self._refresh()

    def event(self,kind,title,detail=''):
        icon={'legendary':'★','set':'◈','proc':'⚡','on-use':'✧','effect':'✦','epic':'◆'}.get(kind,'•')
        style={'legendary':'bold yellow','set':'bold magenta','proc':'bright_cyan','on-use':'bright_blue','effect':'cyan','epic':'magenta'}.get(kind,'white')
        self.events.append((icon,title,detail,style))
        self._refresh()

    def item(self,item):
        event=notable_item_event(item)
        if event and event['kind']=='set':
            set_id=item.get('itemset')
            if set_id in self._seen_sets: return
            self._seen_sets.add(set_id)
        if event:
            self.event(event['kind'],event['title'],event['detail'])
        elif self.show_items and item.get('Quality')==4:
            self.event('epic',item.get('name','Epic item'),f"{item.get('class_name','')} • Level {item.get('RequiredLevel','?')} • ilvl {item.get('ItemLevel','?')}")

    def phase_done(self,name=None,detail=''):
        label=name or self._phase
        self.events.append(('✓',label,detail,'green'))
        if self.phase_total: self.phase_completed=self.phase_total
        self.current=''; self._refresh()

    def validation(self,errors,name_changes=()):
        if name_changes:
            self.events.append(('!','NAME REPAIRS',f'{len(name_changes)} names shortened','yellow'))
            for change in name_changes[:50]:
                self.events.append(('↻',f"{change['entry']}: {change['old_name']} -> {change['new_name']}",'','yellow'))
            if len(name_changes)>50:
                self.events.append(('…','NAME REPAIRS',f'{len(name_changes)-50} more in validation_report.json','yellow'))
        if errors:
            self.events.append(('✗','VALIDATION FAILED',f'{len(errors)} errors','bold red'))
        else:
            self.events.append(('✓','VALIDATION PASSED','All generator checks passed','bold green'))
        self._refresh()

    def complete(self,report,elapsed,output_dir):
        if self.live:
            self.live.update(self._render())
            self.live.stop(); self.live=None
        q=report.get('quality_distribution',report.get('quality_counts',{})); f=report.get('feature_counts',{})
        grid=Table.grid(padding=(0,2))
        grid.add_column(style='bold'); grid.add_column(justify='right')
        grid.add_row('Items generated',f"{report.get('item_count',report.get('total_items',0)):,}")
        for quality,style in (('Uncommon','green'),('Rare','blue'),('Epic','magenta'),('Legendary','yellow')):
            if quality in q: grid.add_row(Text(quality,style=style),f"{q.get(quality,0):,}")
        grid.add_row('Item sets',f"{f.get('sets',0):,}")
        grid.add_row('Special effects',f"{f.get('spell-effects',0):,}")
        grid.add_row('Chance-on-hit procs',f"{f.get('chance-on-hit',0):,}")
        grid.add_row('On-use abilities',f"{f.get('on-use',0):,}")
        grid.add_row('Socket bonuses',f"{f.get('socket-bonuses',0):,}")
        grid.add_row('Disenchantable',f"{f.get('disenchant',0):,}")
        grid.add_row('Name repairs',f"{report.get('name_repair_count',0):,}")
        grid.add_row('Validation',Text('✓ PASSED' if report.get('validation_errors',0)==0 else '✗ FAILED',style='bold green' if report.get('validation_errors',0)==0 else 'bold red'))
        grid.add_row('Time',_format_elapsed(elapsed))
        grid.add_row('Output',str(output_dir))
        self.console.print(Panel(grid,title='[bold yellow]⚒ GENERATION COMPLETE[/bold yellow]',border_style='bright_blue',box=rich_box.DOUBLE))

    def error(self,message):
        if self.live:
            self.live.stop(); self.live=None
        self.console.print(Panel(str(message),title='[bold red]GENERATION FAILED[/bold red]',border_style='red'))

    def close(self):
        if self.live:
            self.live.stop(); self.live=None

    def _refresh(self,throttled=False):
        if not self.live: return
        now=time.monotonic()
        if throttled:
            last=getattr(self,'_last_refresh',0.0)
            if now-last<0.035 and self.phase_completed!=self.phase_total: return
        self._last_refresh=now
        self.live.update(self._render(),refresh=True)

    def _render(self):
        header=Panel(Text('⚒  WotLK ITEM FORGE\nAzerothCore • WotLK 3.3.5a',justify='center',style='bold bright_cyan'),
                     border_style='bright_blue',box=rich_box.DOUBLE)
        pieces=[header]
        if self.runtime:
            cfg=Table.grid(padding=(0,2)); cfg.add_column(style='bold cyan'); cfg.add_column()
            features=' • '.join(_feature_display_names(self.runtime.get('disabled_features',()))) or 'None'
            cfg.add_row('Seed',f"{self.runtime['seed']} ({self.runtime['source']})")
            cfg.add_row('Items',f"{self.runtime['number']:,}")
            cfg.add_row('Classes',', '.join(self.runtime['classes']))
            cfg.add_row('Features',features)
            if self.runtime.get('default_encounter_profile_count'):
                cfg.add_row('Loot placement',f"world + dungeon/raid ({self.runtime['default_encounter_profile_count']} profiles)")
            cfg.add_row('Output',str(self.runtime['output_dir']))
            pieces.append(Panel(cfg,title='[bold]Forge Configuration[/bold]',border_style='cyan'))
        elif self.sources:
            src=Table.grid(padding=(0,1)); src.add_column(); src.add_column()
            for label,name,ok in self.sources[-9:]:
                src.add_row(Text('✓' if ok else '✗',style='green' if ok else 'red'),f'{label}: {name}')
            pieces.append(Panel(src,title='[bold]Source Check[/bold]',border_style='cyan'))

        if self._phase:
            phase_table=Table.grid(expand=True,padding=(0,1)); phase_table.add_column(ratio=1)
            if self.animations and self.phase_completed < self.phase_total if self.phase_total else self.animations:
                phase_title=Spinner('dots',text=Text(self._phase,style='bold yellow'),style='bright_cyan')
            else:
                phase_title=Text(self._phase,style='bold yellow')
            phase_table.add_row(phase_title)
            if self.phase_total:
                bar=ProgressBar(total=max(1,self.phase_total),completed=min(self.phase_completed,self.phase_total),width=None,style='grey37',complete_style='bright_cyan',finished_style='green')
                pct=int(100*self.phase_completed/max(1,self.phase_total))
                phase_table.add_row(Group(bar,Text(f'{pct:3d}%   {self.phase_completed:,} / {self.phase_total:,}',style='dim')))
            if self.current: phase_table.add_row(Text(f'Current: {self.current}',style='white'))
            elapsed=time.monotonic()-self.phase_started
            phase_table.add_row(Text(f'Elapsed: {_format_elapsed(elapsed)}',style='dim'))
            pieces.append(Panel(phase_table,title='[bold]Current Work[/bold]',border_style='yellow'))

        if self.class_totals and self._phase in ('Generating item skeletons','Finalizing generated items'):
            t=Table(box=None,expand=True,padding=(0,1)); t.add_column('Class',style='bold'); t.add_column('Progress',ratio=1); t.add_column('',justify='right')
            for name,total in self.class_totals.items():
                if total<=0: continue
                done=self.class_progress.get(name,0)
                t.add_row(name,ProgressBar(total=total,completed=min(done,total),width=None,complete_style='cyan',finished_style='green'),f'{done:,}/{total:,}')
            pieces.append(Panel(t,title='[bold]Class Progress[/bold]',border_style='blue'))

        if self.events:
            ev=Table.grid(padding=(0,1)); ev.add_column(width=2); ev.add_column(ratio=1)
            for icon,title,detail,style in self.events:
                text=Text(title,style=style)
                if detail: text.append(f'  {detail}',style='dim')
                ev.add_row(Text(icon,style=style),text)
            pieces.append(Panel(ev,title='[bold]Recent Discoveries[/bold]',border_style='magenta'))
        return Group(*pieces)


def create_terminal_ui(args,stream=None,is_tty=None,rich_available=None):
    if getattr(args,'quiet',False):
        return QuietTerminalUI(stream=stream)
    mode=resolve_ui_mode(getattr(args,'ui','auto'),is_tty=is_tty,rich_available=rich_available)
    kwargs={'stream':stream,'animations':not getattr(args,'no_animations',False),'show_items':getattr(args,'show_items',False)}
    if mode=='fancy' and RICH_AVAILABLE:
        return FancyTerminalUI(**kwargs)
    return PlainTerminalUI(**kwargs)

def _default_item_dbc_sources():
    sources=[DEFAULT_ITEM_DBC_SOURCE]
    if DEFAULT_ITEM_DBC_CUSTOM_SOURCE.is_file():
        sources.append(DEFAULT_ITEM_DBC_CUSTOM_SOURCE)
    return sources

def _portable_source_path(path):
    """Return a reproducible source label without leaking host directories."""
    path=Path(path).expanduser()
    try:
        return path.resolve().relative_to(ROOT.resolve()).as_posix()
    except (ValueError,OSError):
        return path.name

def _copy_server_itemset(client_itemset_path,output_root):
    client_itemset_path=Path(client_itemset_path)
    server_path=Path(output_root)/'server'/'dbc'/'ItemSet.dbc'
    server_path.parent.mkdir(parents=True,exist_ok=True)
    shutil.copy2(client_itemset_path,server_path)
    return server_path
GENERATED_LOOT_POOL_BASE = 3_000_000
GENERATED_ENCOUNTER_POOL_BASE = 3_100_000
GENERATED_LOOT_ATTACHMENT_ITEM_BASE = 2_000_000_000
LOOT_BRACKETS = [
    ('01-19', 1, 19), ('20-39', 20, 39), ('40-59', 40, 59),
    ('60-69', 60, 69), ('70-79', 70, 79), ('80', 80, 80),
]
ACTIVE_CLASSES = None
TARGET_ITEM_COUNT = None
CLASS_ITEM_COUNTS = None

CLASSES = [
    ('Warrior',1,200000),('Paladin',2,220000),('Hunter',4,240000),('Rogue',8,260000),
    ('Priest',16,280000),('Death Knight',32,300000),('Shaman',64,320000),
    ('Mage',128,340000),('Warlock',256,360000),('Druid',1024,380000)
]

CLASS_ENTRY_START = {cname:start for cname,_,start in CLASSES}

def entry_for_class(cname, local_index):
    if not (0 <= local_index < MAX_ITEMS_PER_CLASS):
        raise ValueError(f'local item index out of range for {cname}: {local_index}')
    return CLASS_ENTRY_START[cname] + local_index
ROLE_WEIGHTS = {
    'Warrior': [('strength_dps',60),('tank',40)],
    'Paladin': [('strength_dps',45),('tank',30),('healer',25)],
    'Hunter': [('hunter',100)], 'Rogue': [('agility_dps',100)],
    'Priest': [('caster_dps',55),('healer',45)],
    'Death Knight': [('strength_dps',60),('tank',40)],
    'Shaman': [('agility_dps',40),('caster_dps',30),('healer',30)],
    'Mage': [('caster_dps',100)], 'Warlock': [('caster_dps',100)],
    'Druid': [('agility_dps',30),('caster_dps',25),('healer',25),('tank',20)],
}
SLOT_BASE = [('head',8),('neck',6),('shoulder',8),('back',6),('chest',10),('wrists',6),
             ('hands',8),('waist',8),('legs',10),('feet',8),('finger',7),('trinket',5),('weapon',10)]
STAT_ID = {'agi':3,'str':4,'int':5,'spirit':6,'stam':7,'def':12,'dodge':13,'parry':14,'block':15,
           'hit':31,'crit':32,'resil':35,'haste':36,'expertise':37,'ap':38,'rap':39,'mp5':43,
           'arp':44,'sp':45,'spellpen':47,'blockvalue':48}
STAT_COST = {'ap':0.5,'rap':0.5,'sp':0.8,'mp5':2.5,'blockvalue':0.65}
QUALITY_POWER={2:0.82,3:0.92,4:1.0,5:1.12}
QUALITY_NAME={2:'Uncommon',3:'Rare',4:'Epic',5:'Legendary'}
SLOT_BUDGET={'head':1.00,'neck':0.70,'shoulder':0.80,'back':0.65,'chest':1.15,'wrists':0.60,
             'hands':0.80,'waist':0.80,'legs':1.10,'feet':0.80,'finger':0.70,'trinket':0.85,
             'one_hand':0.75,'two_hand':1.10,'ranged':0.90,'shield':0.90,'relic':0.50}
INV={'head':1,'neck':2,'shoulder':3,'chest':5,'waist':6,'legs':7,'feet':8,'wrists':9,'hands':10,
     'finger':11,'trinket':12,'one_hand':13,'shield':14,'ranged':15,'back':16,'two_hand':17,
     'robe':20,'main_hand':21,'off_hand_weapon':22,'held_offhand':23,'thrown':25,'ranged_right':26,'relic':28}

# Curated display catalog: every (entry, displayid) pair below was read from the official
# AzerothCore WotLK item_template base table during construction of this pack.
# Format: entry, displayid, reference item level, reference quality.
A = {}
def add(key,*rows): A.setdefault(key,[]).extend(rows)
# Cloth armor
add(('armor',1,1),(7996,16548,20,1),(27488,44409,115,3))
add(('armor',1,3),(11310,5116,47,3),(41513,53090,134,2),(39719,55324,213,4))
add(('armor',1,20),(2572,12687,10,2),(2585,12669,21,2),(41515,53084,134,2),(41525,53084,150,3))
add(('armor',1,9),(3607,14161,10,1),(18337,30693,59,2),(41512,53082,134,2),(41528,53082,146,3))
add(('armor',1,10),(41516,55367,187,3))
add(('armor',1,6),(3606,14456,10,1),(4436,9912,21,2),(18327,30688,59,3))
add(('armor',1,7),(3834,16839,8,1),(27948,42448,115,3),(37189,52328,200,3),(39720,54703,213,4))
add(('armor',1,8),(2583,13524,19,2),(25957,43192,97,3),(27919,43003,112,3))
# Leather
add(('armor',2,1),(5753,8753,31,2),(22407,42208,61,3),(38437,52906,150,2))
add(('armor',2,3),(38402,49246,142,2))
add(('armor',2,5),(2300,9502,12,2),(2311,17233,13,2),(2314,9531,24,3),(4455,14261,33,2),(38400,52902,142,2),(38592,52938,175,3))
add(('armor',2,9),(18710,31159,50,3),(27483,42965,115,3),(38433,49256,150,2))
add(('armor',2,10),(2312,5406,15,2),(4239,9503,13,2),(4247,2362,29,2),(38403,49253,146,2))
add(('armor',2,6),(4237,9501,10,1),(4246,9513,16,2),(4456,17231,33,2),(38405,52584,146,2),(40205,54792,213,4))
add(('armor',2,7),(2303,9500,10,1),(4242,9505,15,2),(10410,28385,23,3),(38401,49794,146,2))
add(('armor',2,8),(2302,4713,8,1),(2307,17163,18,2),(2315,9530,20,2),(10411,27949,23,3),(18716,31166,61,3),(27914,42972,112,3),(38404,52901,142,2))
# Mail
add(('armor',3,1),(3836,25658,34,2),(11729,28826,57,3),(25955,45175,97,3),(37188,59543,200,3),(38439,51293,150,2),(38440,57541,150,2))
add(('armor',3,3),(3480,23531,22,2),(3840,9422,32,2),(4443,11327,36,2),(38424,52151,142,2))
add(('armor',3,5),(3844,13088,36,3),(3845,9425,40,2),(4448,4723,27,2),(7914,16080,32,2),(7963,16184,40,2),(8367,16729,51,3),(22985,33322,15,2),(27912,42944,115,3),(38414,57751,138,2),(44437,55018,171,3))
add(('armor',3,9),(3835,9417,33,2),(18711,31160,50,3),(25959,39485,96,2),(38435,56687,150,2),(38436,57750,150,2),(40209,57075,213,4))
add(('armor',3,10),(3483,9406,27,2),(3485,9414,30,2),(4465,6844,32,2),(11730,28723,57,3),(38415,52951,142,2),(39718,54622,213,4))
add(('armor',3,6),(5750,8749,23,2),(24388,43159,88,3),(38412,55193,138,2))
add(('armor',3,7),(3842,9415,31,2),(7920,3409,42,2),(7929,23538,42,2),(10423,19201,31,2),(11728,21694,57,3),(38416,51213,142,2),(44436,56673,167,3))
add(('armor',3,8),(3482,9404,26,2),(3484,9412,29,2),(3846,23537,37,2),(3847,9426,40,2),(4464,7002,32,2),(11731,28666,57,3),(25951,22680,99,2),(27915,42894,112,3),(38413,52950,146,2),(44438,56675,175,3))
# Plate
add(('armor',4,1),(7922,16093,43,3),(7934,16115,47,2),(7937,16119,49,2),(11746,21717,56,3),(18718,31167,63,3),(41344,52304,187,3))
add(('armor',4,3),(7918,16089,45,2),(7928,16106,45,2),(41351,51604,187,3))
add(('armor',4,5),(7930,16109,46,2),(7935,16117,48,2),(7939,24393,49,3),(41353,50991,187,3),(40203,54767,213,4),(40210,54768,213,4))
add(('armor',4,9),(18712,31161,50,3),(25956,43141,97,3),(25958,27420,96,2),(27489,42851,115,3),(27918,42847,112,3),(41354,51710,187,3))
add(('armor',4,10),(7919,16091,45,2),(7927,16105,45,2),(7938,16124,45,3),(11745,28740,56,3),(24387,43134,88,3),(41349,53110,187,3))
add(('armor',4,6),(27985,43042,115,3),(41352,53005,187,3),(40688,54051,200,4),(40689,54050,200,4))
add(('armor',4,7),(7921,16092,45,2),(7926,16103,45,2),(27487,42839,115,3),(41345,52996,187,3),(41347,53003,187,3),(37193,53810,200,4),(40204,51008,213,4))
add(('armor',4,8),(7933,16113,47,2),(7936,16118,49,2),(41348,53004,187,3),(39717,55393,213,4),(40206,55394,213,4))
# Cloak, jewelry, trinkets
add(('misc',1,16),(2310,23025,13,2),(2580,23133,12,2),(3833,23089,8,1),(5751,23078,25,2),(11311,28731,46,3),(18328,30689,59,3),(27485,15163,115,3),(27946,43099,115,3),(27981,31351,115,3),(27988,43100,112,3),(28371,43115,115,3),(28373,23119,115,3),(38441,56696,159,3),(44429,27088,156,4))
add(('misc',0,2),(5754,7093,31,2),(22403,9858,61,3),(22981,35373,83,4),(24385,31899,88,3),(40679,35437,200,4),(40680,35373,200,4),(40681,35359,200,4))
add(('misc',0,11),(5743,9842,40,2),(22979,6011,21,2),(37186,33808,200,3),(37192,49005,200,4),(37195,39122,200,3),(40717,33728,213,4),(40718,38541,213,4),(40719,44358,213,4),(40720,44086,213,4))
add(('misc',0,12),(11302,6515,52,3),(40682,53630,200,4),(40683,54045,200,4),(40684,29947,200,4),(40685,54046,200,4))
# Shields
add(('shield',6,14),(4444,18694,24,2),(4652,18789,45,2),(39716,56656,213,4))
# Relics
add(('relic',7,28),(22400,34961,57,3),(22401,34960,62,3),(22402,34959,78,4),(23006,34959,83,4),(23201,34960,65,3),(23203,34961,65,3),(24386,36578,88,3),(27484,5563,115,3),(27917,34961,112,3),(27949,34961,91,3))
add(('relic',8,28),(22397,34955,57,3),(22398,34954,62,3),(22399,34953,78,4),(23004,34953,83,4),(23197,34954,65,3),(23198,34955,65,3),(28372,43117,115,3),(40711,54481,200,4),(40712,54483,200,4),(40713,54484,200,4))
add(('relic',9,28),(22395,34957,57,3),(22396,34956,78,4),(23005,34956,83,4),(23199,34957,65,3),(23200,34956,65,3),(27947,25246,91,3),(40709,34956,200,4),(40710,34958,200,4))
add(('relic',10,28),(39208,51913,70,3),(40207,51913,213,4),(40714,51913,200,4),(40715,51913,200,4))

# Weapon appearance catalog and DPS anchors. Damage anchors are derived only from verified stock rows.
W = {}
def wadd(kind,*rows): W.setdefault(kind,[]).extend(rows)
# entry, display, ilvl, ref quality, ref delay (ms), min dmg, max dmg, school
wadd('1h_sword',(2131,22075,3,1,2600,2,4,0),(7943,16128,45,2,2600,48,90,0),(25952,39228,97,3,1500,61,114,0))
wadd('2h_sword',(3853,7324,36,2,2800,55,83,0),(28367,41789,115,3,3500,261,392,0))
wadd('1h_axe',(2134,22101,4,1,2000,2,4,0),(7941,16126,42,2,2700,45,85,0),(4445,19398,23,2,2300,18,35,0))
wadd('2h_axe',(3855,8528,37,2,3500,71,108,0),(27986,39958,115,3,3400,253,381,0))
wadd('1h_mace',(2492,12992,7,1,1800,3,7,0),(5757,8803,20,2,2600,18,34,0),(7945,5223,46,2,2400,46,86,0),(27980,41871,115,3,2000,100,187,0))
wadd('2h_mace',(5761,19544,5,1,3100,6,10,0),(41257,52966,200,4,3400,507,761,0))
wadd('polearm',(40208,54772,213,4,3600,586,880,0))
wadd('dagger',(4449,20439,27,2,1600,15,29,0),(5756,20591,37,3,1400,24,46,0),(7947,16130,51,2,1500,32,59,0),(27913,43097,115,3,1900,109,164,0),(39714,54757,213,4,1400,153,285,0))
wadd('staff',(35,472,2,1,2900,3,5,0),(4437,20390,20,2,3400,35,54,0),(22406,20384,61,3,2100,87,132,0),(25950,39226,97,3,2100,92,156,0),(44423,60816,245,4,2000,243,448,0),(44424,60804,245,4,2000,243,448,0))
wadd('fist',(11743,21714,55,3,1400,35,66,0),(11744,21715,56,3,1500,38,72,0))
wadd('bow',(25953,43202,97,3,2700,120,181,0),(27987,41791,112,3,3000,135,252,0))
wadd('gun',(24389,41427,88,3,3000,110,205,0))
wadd('crossbow',(24381,39059,91,3,2900,124,187,0))
wadd('wand',(18338,21016,59,3,1600,65,122,6),(23009,35262,83,4,1500,119,222,5),(28783,43915,125,4,1500,177,330,6),(39712,54697,213,4,1800,362,674,5),(44214,9063,187,3,1600,247,459,6))

WEAPON_META={
 '1h_sword':(7,13,'one_hand'), '2h_sword':(8,17,'two_hand'), '1h_axe':(0,13,'one_hand'), '2h_axe':(1,17,'two_hand'),
 '1h_mace':(4,13,'one_hand'),'2h_mace':(5,17,'two_hand'),'polearm':(6,17,'two_hand'),'dagger':(15,13,'one_hand'),
 'staff':(10,17,'two_hand'),'fist':(13,13,'one_hand'),'bow':(2,15,'ranged'),'gun':(3,26,'ranged'),
 'crossbow':(18,26,'ranged'),'wand':(19,26,'ranged')
}

FALLBACK_A = {key:list(rows) for key,rows in A.items()}
FALLBACK_W = {key:list(rows) for key,rows in W.items()}

THEMES = [
    'frost','scourge','titan','dragon','shadow','holy','arcane','nature',
    'dwarven','vrykul','nerubian','blood','argent','ebon','scarlet',
    'northrend','icecrown','ulduar','stormpeak','dragonblight','borean',
    'howling','grizzly','sholazar','zuldrak','wintergrasp','dalaran',
    'nexus','utgarde','gundrak','drakkari','frostborn','iron',
    'saronite','runic','plague','undead','crypt','bone','death',
    'spirit','storm','lightning','fire','ember','flame','earth',
    'stone','wild','moon','sun','star','twilight','dawn','dusk',
    'night','void','fel','demonic','abyssal','celestial','astral',
    'emerald','verdant','thorn','beast','wolf','bear','eagle','raven',
    'serpent','wyrm','drake','phoenix','lion','boar','mammoth','yak',
    'spider','scarab','mantid','troll','orcish','human','gnomish',
    'tauren','forsaken','kaldorei','sindorei','draenei','highborne',
    'stormwind','ironforge','orgrimmar','undercity','silvermoon',
    'exodar','darnassian','thunderbluff','gilnean','arathian',
    'lordaeron','quelthalas','khazmodan','alterac','stromgarde',
    'frostwolf','warsong','silverhand','kirintor','violet','sunreaver',
    'windrunner','wildhammer','bronzebeard','darkiron','earthen',
    'mechagnome','keeper','watcher','valkyr','runeblade','deathknight',
    'paladin','ranger','warden','shamanic','druidic','necromantic',
    'warlock','mage','priestly','berserker','gladiator','champion',
    'guardian','sentinel','crusader','inquisitor','templar','mystic',
    'prophet','oracle','seer','witch','ritual','ancestral','forgotten',
    'ancient','lost','cursed','haunted','hallowed','sacred','primeval',
    'primordial','relic','ruin','citadel','fortress','vault','temple',
    'sanctum','catacomb','barrow','tomb','sepulcher','forge','anvil',
    'mountain','glacier','tundra','wastes','fjord','forest','jungle',
    'swamp','desert','ocean','deep','sky','thunder','blizzard'
]

ADJ = [
    'Ashen','Runebound','Frostworn','Gilded','Grim','Silent','Ancient',
    'Hallowed','Blackened','Rimebound','Titanforged','Stormwrought',
    'Scarlet','Hollow','Sable','Ironbound','Moonlit','Dread','Wyrmhide',
    'Glacial','Stalwart','Shattered','Veiled','Radiant','Umbral','Rugged',
    'Tempered','Vengeful','Watchful','Serrated','Frozen','Duskwoven',
    'Sunblessed','Oathbound','Wild','Ebon','Crimson','Ivory','Azure',
    'Earthen','Runed','Gloomed','Savage','Haunted','Splintered',
    'Starforged','Mistbound','Boneclad','Winterborn','Emberwrought',
    'Stormbound','Thorned','Tarnished','Primal','Fel','Cryptborn',
    'Drakeforged','Saronite','Nerubian','Vrykul','Dalaran','Twilight',
    'Dawnforged','Kingsworn','Northwind','Icebound','Deathless',
    'Skyforged','Deepdelver','Stonehewn','Nightwoven','Brightsteel',
    'Coldbound','Warden','Ravenous','Soulbound','Wyrmbound','Ironclad',
    'Duskbound','Snowforged',
    'Adamant','Aged','Ancestral','Argent','Armored','Astral','Austere',
    'Baleful','Baneful','Barbed','Battleworn','Beastmarked','Blacksteel',
    'Blazing','Blessed','Blighted','Bloodied','Bloodforged','Bloodsoaked',
    'Bloodstained','Bonebound','Boneforged','Brassbound','Brazen',
    'Bright','Brilliant','Broken','Bronzed','Brutal','Burial','Burnished',
    'Cabalistic','Carved','Celestial','Charred','Chilled','Clouded',
    'Coldforged','Colossal','Consecrated','Corroded','Corrupted','Cracked',
    'Cruel','Cursed','Darkened','Darkforged','Darksteel','Dawnlit',
    'Deathforged','Deathmarked','Deepforged','Desecrated','Dire',
    'Dragonbound','Dragonforged','Dragonmarked','Drakescale','Dreadforged',
    'Dreambound','Dreamwoven','Dusklit','Earthbound','Earthforged',
    'Emberforged','Enchanted','Engraved','Eternal','Everfrost',
    'Faded','Fanged','Feral','Fireforged','Flamebound','Flameforged',
    'Flawless','Forsaken','Frostbitten','Frostbound','Frostforged',
    'Frostmarked','Frostscarred','Frostveined','Ghostly','Glittering',
    'Goldbound','Golden','Gravebound','Graveforged','Graven','Gray',
    'Greenwood','Hardened','Harsh','Heavenforged','Heavy','Hellforged',
    'Hexed','Highborne','Hoarfrost','Holy','Howling','Iceforged',
    'Icetouched','Infused','Ironforged','Jagged','Jeweled','Kingsguard',
    'Lightbound','Lightforged','Lightwoven','Living','Luminous',
    'Magebound','Moonbound','Moonforged','Moonwoven','Mournful',
    'Mystic','Nightbound','Nightforged','Nightmare','Nightshrouded',
    'Northborn','Northforged','Oathforged','Obsidian','Ornate',
    'Pale','Plaguebound','Plagueforged','Plaguetouched','Polished',
    'Primeval','Profane','Purified','Ravenbound','Razor-edged',
    'Reinforced','Relentless','Relicbound','Rimeforged','Ritual',
    'Royal','Rune-carved','Rune-etched','Runeforged','Runemarked',
    'Sacred','Sanctified','Scourgebound','Scourged','Shadowbound',
    'Shadowforged','Shadowmarked','Shadowwoven','Silvered','Silverforged',
    'Skullbound','Soulforged','Soulmarked','Spectral','Spellbound',
    'Spellforged','Spiritbound','Spiritforged','Starbound','Starlit',
    'Steelbound','Steelforged','Stonebound','Stoneforged','Stormforged',
    'Stormmarked','Stormscarred','Sunbound','Sunforged','Sunlit',
    'Thunderforged','Thunderous','Titanbound','Titanic','Tombbound',
    'Twilight-forged','Unbroken','Unhallowed','Unholy','Unyielding',
    'Valiant','Verdant','Voidbound','Voidforged','Warborn','Warforged',
    'Warmarked','Warscarred','Whispering','Whitegold','Wildforged',
    'Windbound','Windforged','Winterforged','Winterworn','Witchbound',
    'Witchforged','Wolfbound','Wolfhide','Wolfsworn','Worldforged',
    'Wyrmforged','Zealous',
    'Arctic','Bitter','Bleak','Blighted','Borean','Brittle','Cerulean',
    'Chillborn','Coal-black','Coldhearted','Deepfrost','Frost-rimed',
    'Glasslike','Hoary','Icy','Pale-blue','Permafrost','Rime-coated',
    'Snowbound','Snowy','Whitefrost','Wintertouched',
    'Arcane','Arcanized','Dreaming','Ethereal','Gleaming','Illusory',
    'Manaforged','Manawoven','Mystwoven','Runewoven','Sorcerous',
    'Spellscarred','Starwoven','Violet','Warped',
    'Bloodbound','Bloodmarked','Carrion','Corpsebound','Deathbound',
    'Deathly','Graveborn','Grimdark','Necrotic','Plagueborn',
    'Rotting','Scourgeforged','Sepulchral','Skullforged','Tombforged',
    'Undying','Unquiet',
    'Bearhide','Beastbound','Briarbound','Briarwoven','Clawmarked',
    'Earthwoven','Feathered','Fernwoven','Leafbound','Leafwoven',
    'Mossbound','Rootbound','Rootwoven','Thornbound','Thornwoven',
    'Wildbound','Wildwoven','Wolfmarked',
    'Crusader','Devout','Divine','Faithful','Lightblessed','Prayerbound',
    'Sainted','Silverblessed','Sunhallowed','Virtuous',
    'Berserker','Conqueror','Gladiatorial','Heroic','Marauding',
    'Merciless','Raider','Siegebound','Soldierly','Veteran','Warlord',
    'Warmaster','Warrior-forged',
    'Dwarven','Earthen-forged','Forgeblessed','Hammered','Ironthane',
    'Mountainborn','Runic','Stonecarved','Stoneward','Titan-carved',
    'Draconic','Drakebound','Dragonhide','Dragonsteel','Scale-bound',
    'Scalebound','Wyrmcarved','Wyrmscale',
    'Forgotten','Forsworn','Lost','Nameless','Old','Timeworn',
    'Weathered','Worldworn','Age-darkened','Dustbound','Dusty',
    'Brutish','Fierce','Ferocious','Hateful','Merciless','Pitiless',
    'Ruthless','Vicious','Wrathful','Furious','Murderous','Defiant',
    'Calm','Resolute','Solemn','Steadfast','Stoic','Unwavering',
    'Vigilant','Watchful','Patient','Enduring','Faithful',
    'Doomed','Doomforged','Dreadbound','Fearsome','Griefbound',
    'Mournbound','Ominous','Sinister','Sorrowful','Terrible',
    'Woe-bound','Woeful',
    'Brightmoon','Coldfire','Darkmoon','Dawnsteel','Duskrun',
    'Embersteel','Froststeel','Ghoststeel','Goldsteel','Moonsteel',
    'Nightsteel','Runesteel','Shadowsteel','Silversteel','Starsteel',
    'Stormsteel','Sunsteel','Thundersteel','Voidsteel','Wintersteel'
]
SUFFIX = [
    'Frozen Watch','Hollow King','North Wind','Last Vigil','Fallen Star',
    'Silent Crypt','Broken Crown','Winter Court','Old Gods','Storm Peaks',
    'Dragon Wastes','Ashen Oath','Raven Queen','Titan Vault','Dead March',
    'Crimson Dawn','Dusk Watch','Cold Hearth','Deep Forge','Moon Guard',
    'Scarlet Keep','Black Ice','Lost Vanguard','Iron Council','Shadow Vault',
    'Ancient Grove','Frostborn','Unquiet Dead','Sable Moon','Bone Wastes',
    'High Citadel','Runed Path','Final Watch','Frozen Throne','Twilight Reach',
    'Wild Hunt','Star Caller','Blood Moon','Silver Hand','Drowned Hall',
    'Storm Crown','Hallowed Flame','Emerald Dream','Dark Rider','Pale Winter',
    'Broken Spear','Long Night','Rimefang','Northwatch','Grim Host',
    'Deep Roads','Wyrmrest','Blue Dragon','Red Dragon','Black Dragon',
    'Bronze Dragon','Green Dragon','Forgotten Depths','Stone Fathers',
    'Frost Giant','Hearthguard','Icecrown','Howling Fjord','Borean Expanse',
    'Grizzly Hills','Dragonblight','Sholazar','Zul Drak','Wintergrasp',
    'Ulduar','Dalaran','Argent Watch','Ebon Hold','Nexus','Oculus',
    'Violet Hold','Gundrak','Azjol Nerub','Utgarde','Drak Tharon',
    'Old Kingdom','Frozen Sea','Stormcaller','Runekeeper','Soul Reaper',
    'Dread Wyrm','Bone Lord','Moonwarden','Earthshaper','Wildheart',
    'Spellweaver','Shadowbinder','Bloodguard','Frostguard','Dawnwatch',
    'Nightwatch','Crypt Watch',
    'Ancient Watch','Argent Dawn','Argent Vanguard','Ashen March',
    'Ashen Vale','Astral Gate','Autumn Wind','Azure Flame','Azure Moon',
    'Black Anvil','Black Citadel','Black Forge','Black Moon','Blackened Sky',
    'Bleak Shore','Blighted Land','Blood Crown','Blood Oath','Blood Price',
    'Blood Tide','Blood Watch','Blue Flame','Bone Crown','Bone Gate',
    'Bone March','Bone Throne','Broken Banner','Broken Blade','Broken Gate',
    'Broken Hall','Broken Oath','Broken Shield','Burning Crown',
    'Burning Sky','Burning Star','Celestial Gate','Cold Flame',
    'Cold Moon','Cold Watch','Crimson Crown','Crimson Flame','Crimson Moon',
    'Crimson Watch','Dark Crown','Dark Forge','Dark Moon','Dark Oath',
    'Dark Star','Darkened Sun','Dawn Guard','Dawn Oath','Dawn Star',
    'Dawn Vanguard','Dead King','Dead Watch','Death Gate','Death March',
    'Death Oath','Death Watch','Deep Anvil','Deep Earth','Deep Hall',
    'Deep Mountain','Deep Vault','Dragon Crown','Dragon Flame',
    'Dragon Forge','Dragon Guard','Dragon Oath','Dragon Queen','Dragon Throne',
    'Dread Crown','Dread Host','Dread March','Dread Watch','Drowned King',
    'Dying Light','Ebon Blade','Ebon Crown','Ebon Flame','Ebon March',
    'Ebon Watch','Emerald Grove','Emerald Moon','Emerald Star',
    'Endless Night','Endless Vigil','Eternal Flame','Eternal Watch',
    'Fallen Crown','Fallen King','Fallen Lord','Fallen Watch',
    'Far North','Final Dawn','Final Oath','Final Stand','First Flame',
    'First King','Forgotten King','Forgotten Oath','Forgotten Watch',
    'Frozen Crown','Frozen Forge','Frozen Gate','Frozen Heart',
    'Frozen King','Frozen Moon','Frozen North','Frozen Oath','Frozen Star',
    'Frost Crown','Frost Forge','Frost King','Frost Moon','Frost Oath',
    'Frost Queen','Frost Watch','Ghost King','Ghost Moon','Ghost Watch',
    'Gilded Crown','Golden Dawn','Golden Flame','Golden King','Golden Moon',
    'Grave King','Grave Watch','Great Forge','Great Hunt','Great North',
    'Green Flame','Grim Crown','Grim Dawn','Grim King','Grim March',
    'Grim Oath','Grim Watch','Hallowed Crown','Hallowed Ground',
    'Hallowed Oath','Hallowed Watch','Hidden Forge','Hidden King',
    'Hidden Path','Hidden Vault','High King','High Watch','Holy Flame',
    'Holy Oath','Howling North','Howling Wind','Ice Crown','Ice Forge',
    'Ice King','Ice Moon','Ice Queen','Iron Banner','Iron Crown',
    'Iron Forge','Iron Gate','Iron King','Iron March','Iron Oath',
    'Iron Watch','Ivory Crown','Last Dawn','Last King','Last Light',
    'Last Oath','Last Stand','Last Watch','Light Crown','Light Eternal',
    'Light Watch','Lost Crown','Lost King','Lost Oath','Lost Watch',
    'Midnight Crown','Midnight Flame','Midnight Moon','Midnight Watch',
    'Moon Crown','Moon Flame','Moon Oath','Moon Watch','Northern Crown',
    'Northern Forge','Northern King','Northern Light','Northern Watch',
    'Pale Crown','Pale Flame','Pale King','Pale Moon','Pale Watch',
    'Red Dawn','Red Dragonflight','Red Moon','Rime Crown','Rime Forge',
    'Rime King','Rime Watch','Rune Crown','Rune Forge','Rune King',
    'Rune Watch','Sacred Flame','Sacred Oath','Sable Crown','Sable Watch',
    'Scarlet Dawn','Scarlet Flame','Scarlet Oath','Scarlet Watch',
    'Shadow Crown','Shadow Forge','Shadow King','Shadow Moon',
    'Shadow Oath','Shadow Watch','Shattered Crown','Shattered Gate',
    'Shattered Oath','Silent Crown','Silent King','Silent Moon',
    'Silent Watch','Silver Crown','Silver Dawn','Silver Flame',
    'Silver Moon','Silver Oath','Silver Watch','Sky Crown','Sky Forge',
    'Sky King','Sky Watch','Soul Crown','Soul Forge','Soul King',
    'Soul Watch','Star Crown','Star Forge','Star King','Star Watch',
    'Stone Crown','Stone Forge','Stone King','Stone Watch','Storm Forge',
    'Storm King','Storm Oath','Storm Queen','Storm Watch','Sun Crown',
    'Sun Flame','Sun King','Sun Oath','Sun Watch','Thunder Crown',
    'Thunder Forge','Thunder King','Thunder Watch','Titan Crown',
    'Titan Forge','Titan King','Titan Watch','Twilight Crown',
    'Twilight Flame','Twilight Oath','Twilight Watch','Unbroken Oath',
    'Unending Watch','Unquiet King','Violet Crown','Violet Flame',
    'Violet Watch','Void Crown','Void Flame','Void King','Void Watch',
    'War Crown','War Forge','War King','War Oath','War Watch',
    'White Crown','White Flame','White Moon','Wild Crown','Wild King',
    'Wild Moon','Wild Watch','Wind Crown','Wind King','Wind Watch',
    'Winter Crown','Winter Forge','Winter King','Winter Moon',
    'Winter Oath','Winter Watch','Wyrm Crown','Wyrm Forge','Wyrm King',
    'Wyrm Oath','Wyrm Watch',
    'Argent Crusade','Ebon Vanguard','Violet Citadel','Kirin Tor',
    'Sunreaver Host','Silver Covenant','Frostwolf Clan','Warsong Clan',
    'Wildhammer Clan','Bronzebeard Clan','Dark Iron Clan',
    'Scarlet Crusade','Scarlet Monastery','Scarlet Bastion',
    'Stormwind Guard','Ironforge Guard','Orgrimmar Guard',
    'Dalaran Watch','Lordaeron Guard','Quel Thalas','Khaz Modan',
    'Arathi Highlands','Alterac Mountains','Stormwind Keep',
    'Ironforge Mountain','Undercity Depths','Silvermoon Spires',
    'Thunder Bluff','Exodar Crystal','Tirisfal Glades','Eastern Plaguelands',
    'Western Plaguelands','Stratholme','Scholomance','Blackrock Mountain',
    'Burning Steppes','Searing Gorge','Deadwind Pass','Dark Portal',
    'Hellfire Citadel','Shadowmoon Valley','Netherstorm','Blade Edge',
    'Nagrand','Terokkar','Zangarmarsh','Sunwell','Tempest Keep',
    'Black Temple','Karazhan','Mount Hyjal',
    'Borean Tundra','Coldarra','Amber Ledge','Warsong Hold',
    'Valiance Keep','Nesingwary Camp','Kaskala','Taunka Village',
    'Westguard Keep','Valgarde','New Agamand','Gjalerbron','Skorn',
    'Utgarde Keep','Utgarde Pinnacle','Kamagua','Wyrmskull',
    'Amberpine Lodge','Conquest Hold','Venture Bay','Drak Tharon Keep',
    'Grizzlemaw','Thor Modan','Voldrune','Light Breach','Ebon Watch',
    'Zim Torga','Altar of Sseratus','Gundrak Temple','Amphitheater',
    'Makers Terrace','Makers Overlook','River Heart','Frenzyheart Hill',
    'Rainspeaker Canopy','Avalanche','K3','Brunnhildar Village',
    'Sons of Hodir','Temple of Storms','Engine of Makers',
    'Halls of Stone','Halls of Lightning','Mimiron Forge','Freya Garden',
    'Thorim Arena','Hodir Hall','Yogg Prison','Titan Archive',
    'Argent Tournament','Crusaders Coliseum','Shadow Vault',
    'Death Rise','Onslaught Harbor','Sindragosa Fall','Corpse Scar',
    'Icecrown Citadel','Frozen Halls','Pit of Saron','Forge of Souls',
    'Halls of Reflection','Wrathgate','Wintergarde','Naxxramas',
    'Obsidian Sanctum','Ruby Sanctum','Eye of Eternity',
    'Blue Flight','Bronze Flight','Green Flight','Red Flight',
    'Black Flight','Infinite Flight','Dragon Queen','Dragon Aspect',
    'Wyrm Queen','Wyrm King','Drake Rider','Dragon Rider',
    'Scale Lord','Scale Queen','Wyrm Lord',
    'Ancient Earth','Ancient Flame','Ancient Frost','Ancient Night',
    'Ancient Storm','Ancient Titan','Ancient Watcher','Earthen King',
    'Earthen Watch','Iron Dwarf','Iron Giant','Stone Giant',
    'Titan Keeper','Titan Watcher','Prime Design','Makers Hand',
    'Makers Will','Makers Forge','Makers Vault',
    'Plague Lord','Plague Wing','Construct Wing','Military Wing',
    'Spider Wing','Frozen Heart','Death Knight','Death Lord',
    'Lich King','Crypt Lord','Bone Lord','Grave Lord','Scourge Lord',
    'Scourge Host','Scourge March','Scourge Watch','Plague Watch',
    'Damned Host','Restless Dead','Walking Dead','Nameless Dead',
    'Forgotten Dead','Frozen Dead',
    'Bear Spirit','Wolf Spirit','Eagle Spirit','Raven Spirit',
    'Serpent Spirit','Dragon Spirit','Earth Spirit','Fire Spirit',
    'Water Spirit','Wind Spirit','Storm Spirit','Ancestor Spirit',
    'Ancient Spirit','Wild Spirit','Moon Spirit','Sun Spirit',
    'Emerald Wilds','Emerald Grove','Emerald Path','Emerald Watch',
    'Ancient Oak','Ancient Thorn','Great Bear','Great Wolf',
    'Great Eagle','Wild Grove','Wild Path','Wild Heart',
    'Moon Grove','Moon Path','Moonwell','Star Grove',
    'Arcane Eye','Arcane Gate','Arcane Moon','Arcane Star',
    'Arcane Watch','Mana Forge','Mana Tide','Mana Wyrm',
    'Violet Eye','Violet Gate','Violet Star','Spellweaver',
    'Mage Lord','Mage Tower','Mystic Eye','Mystic Gate',
    'Astral Crown','Astral Gate','Astral Watch',
    'Light Dawn','Light Oath','Light Guard','Sacred Dawn',
    'Sacred Watch','Holy Crown','Holy Guard','Holy Watch',
    'Silver Light','Golden Light','Dawn Light','Divine Watch',
    'Crusader Oath','Crusader Watch','Paladin Oath',
    'Black Harvest','Black Ritual','Dark Ritual','Blood Ritual',
    'Bone Ritual','Fel Ritual','Shadow Ritual','Void Ritual',
    'Demon Lord','Demon Watch','Abyssal Flame','Abyssal Gate',
    'Burning Shadow','Burning Blood','Fel Flame','Fel Watch',
    'First Watch','Second Dawn','Final March','Endless March',
    'Endless Road','Endless Path','Long Road','Lost Road',
    'Silent Road','Forgotten Road','North Road','Frozen Road',
    'Kings Road','Old Road','Hidden Road','Broken Road',
    'Ancient Banner','Broken Banner','Crimson Banner','Ebon Banner',
    'Frozen Banner','Golden Banner','Iron Banner','Scarlet Banner',
    'Silver Banner','Storm Banner','War Banner','White Banner',
    'Ancient Pact','Ashen Pact','Blood Pact','Broken Pact',
    'Dragon Pact','Ebon Pact','Frozen Pact','Iron Pact','Moon Pact',
    'Shadow Pact','Silver Pact','Storm Pact','Titan Pact','Wild Pact',
    'Ancient Promise','Blood Promise','Broken Promise','Dying Promise',
    'Final Promise','Frozen Promise','Kings Promise','Last Promise',
    'Lost Promise','Silver Promise','Warriors Promise',
    'Ancient Memory','Bitter Memory','Blood Memory','Cold Memory',
    'Dead Memory','Distant Memory','Forgotten Memory','Frozen Memory',
    'Last Memory','Lost Memory','Old Memory','Winter Memory'
]
OWNER = [
    'Vanguard','Watchkeeper','Runesmith','Wyrmguard','Gravewarden',
    'Frostcaller','Stormcaller','Highborn','Wayfarer','Pathfinder',
    'Deathguard','Lightwarden','Spellbinder','Moonwarden','Earthwarden',
    'Ironthane','Shieldbearer','Cryptkeeper','Dawnkeeper','Nightwatcher',
    'Dragonstalker','Rimewalker','Boneguard','Starcaller','Ashen Lord',
    'Winter King','Pale Lady','Runemaster','Battlemage','Wildkeeper',
    'Soulwarden','Grim Warden','Northman','Titan Keeper','Violet Mage',
    'Argent Defender','Ebon Knight','Ice Witch','Blood Prince','Stonefather',

    'Ancestor','Anvilkeeper','Arcanist','Archmage','Armorsmith',
    'Ashcaller','Ashkeeper','Ashwarden','Battlelord','Battlemaiden',
    'Battlesage','Bearwarden','Blackguard','Blacksmith','Bladeguard',
    'Blademaster','Bloodcaller','Bloodguard','Bloodkeeper','Bloodknight',
    'Bloodmage','Bloodwarden','Bonecaller','Bonekeeper','Bonewarden',
    'Brightwarden','Crusader','Cryptlord','Darkcaller','Darkkeeper',
    'Darkrider','Darkwarden','Dawncaller','Dawnwarden','Deathcaller',
    'Deathkeeper','Deathknight','Deathlord','Deathwarden','Deepwarden',
    'Dragoncaller','Dragonkeeper','Dragonlord','Dragonwarden',
    'Drakecaller','Drakekeeper','Drakelord','Drakewarden','Dreamcaller',
    'Dreamkeeper','Dreamwarden','Duskcaller','Duskkeeper','Duskwarden',
    'Earthcaller','Earthkeeper','Embercaller','Emberkeeper','Emberwarden',
    'Farseer','Firecaller','Firekeeper','Firewarden','Flamecaller',
    'Flamekeeper','Flamewarden','Forgekeeper','Forgemaster','Frostguard',
    'Frostkeeper','Frostlord','Frostmage','Frostwarden','Ghostcaller',
    'Ghostkeeper','Ghostwarden','Gravecaller','Gravekeeper','Gravelord',
    'Grimkeeper','Grimlord','Hammerlord','Hearthkeeper','Hearthwarden',
    'Highguard','Highkeeper','Highlord','Icecaller','Icekeeper','Icewarden',
    'Ironcaller','Ironkeeper','Ironlord','Ironwarden','Kingsguard',
    'Kingskeeper','Lightcaller','Lightkeeper','Lightlord','Magekeeper',
    'Mooncaller','Moonkeeper','Moonlord','Nightcaller','Nightkeeper',
    'Nightlord','Northguard','Northkeeper','Northwarden','Oathkeeper',
    'Oathwarden','Plaguecaller','Plaguekeeper','Plaguelord','Plaguewarden',
    'Rangemaster','Ravenkeeper','Ravenlord','Ravenwarden','Rimecaller',
    'Rimekeeper','Rimelord','Rimewarden','Runecaller','Runeguard',
    'Runekeeper','Runelord','Runewarden','Seer','Shadowcaller',
    'Shadowguard','Shadowkeeper','Shadowlord','Shadowmage','Shadowwarden',
    'Shieldguard','Shieldmaster','Silverguard','Silverkeeper',
    'Silverwarden','Skullkeeper','Skullwarden','Soulcaller','Soulkeeper',
    'Soullord','Spiritcaller','Spiritkeeper','Spiritwarden','Starcaller',
    'Stargazer','Starkeeper','Starwarden','Stonecaller','Stoneguard',
    'Stonekeeper','Stonelord','Stonewarden','Stormguard','Stormkeeper',
    'Stormlord','Stormwarden','Sunkeeper','Sunwarden','Thunderkeeper',
    'Thunderlord','Thunderwarden','Titanforger','Titanguard','Titanwarden',
    'Tombkeeper','Tombwarden','Twilightcaller','Twilightkeeper',
    'Twilightwarden','Voidcaller','Voidkeeper','Voidlord','Voidwarden',
    'Warcaller','Warchief','Warden','Warguard','Warlord','Warmaster',
    'Warpriest','Warsage','Warwarden','Wildcaller','Wildguard',
    'Wildlord','Wildwarden','Windcaller','Windkeeper','Windlord',
    'Windwarden','Wintercaller','Winterguard','Winterkeeper',
    'Winterlord','Winterwarden','Witchcaller','Witchkeeper',
    'Witchlord','Wolfcaller','Wolfguard','Wolfkeeper','Wolfwarden',
    'Worldkeeper','Worldwarden','Wyrmcaller','Wyrmkeeper','Wyrmlord',
    'Wyrmwarden',

    'Argent Champion','Argent Crusader','Argent Knight','Argent Marshal',
    'Argent Templar','Ebon Champion','Ebon Crusader','Ebon Marshal',
    'Ebon Warden','Scarlet Champion','Scarlet Inquisitor',
    'Scarlet Marshal','Scarlet Templar','Violet Guardian',
    'Violet Keeper','Violet Warden',

    'Ancient King','Ancient Queen','Ashen King','Ashen Queen',
    'Blood King','Blood Queen','Dragon King','Dragon Queen',
    'Frost King','Frost Queen','Iron King','Iron Queen',
    'Moon King','Moon Queen','Rune King','Rune Queen',
    'Shadow King','Shadow Queen','Silver King','Silver Queen',
    'Storm King','Storm Queen','Sun King','Sun Queen',
    'Titan King','Titan Queen','Wyrm King','Wyrm Queen',

    'First Warden','Last Warden','Old Warden','Lost Warden',
    'Forgotten Warden','Nameless Warden','Silent Warden',
    'Frozen Warden','Ancient Warden','Broken Warden',

    'First Knight','Last Knight','Old Knight','Lost Knight',
    'Forgotten Knight','Silent Knight','Frozen Knight','Ancient Knight',

    'First Keeper','Last Keeper','Old Keeper','Lost Keeper',
    'Forgotten Keeper','Silent Keeper','Frozen Keeper','Ancient Keeper',

    'First King','Last King','Old King','Lost King','Forgotten King',
    'Silent King','Frozen King','Ancient King',

    'First Queen','Last Queen','Old Queen','Lost Queen','Forgotten Queen',
    'Silent Queen','Frozen Queen','Ancient Queen'
]
PROPER_A = [
    'Dread','Frost','Rime','Soul','Blood','Night','Star','Storm','Ash','Rune',
    'Ice','Bone','Moon','Dawn','Grim','Wyrm','Shadow','Iron','Stone','Winter',
    'Dragon','Crypt','Sky','Wild','Black','White','Silver','Gold','Ember',
    'Thunder','Void','Light','Earth','Death','Mist','North','Deep','Hollow',
    'Pale','Scarlet',

    'Argent','Azure','Bright','Bronze','Crimson','Dark','Dusk','Ebon',
    'Emerald','Fel','Fire','Flame','Ghost','Grave','Green','Holy','Ivory',
    'Obsidian','Red','Sable','Sun','Twilight','Violet','Wind',

    'Ancient','Broken','Cold','Doom','Dream','Eternal','Fallen','Forgotten',
    'Frozen','Hallowed','Hidden','Last','Lost','Prime','Primal','Sacred',
    'Shattered','Silent','Titan','Unbroken','Unholy','Unquiet',

    'Bear','Boar','Drake','Eagle','Falcon','Lion','Raven','Serpent',
    'Spider','Wolf',

    'Blade','Crown','Forge','Hammer','Oath','Shield','Skull','Spear',
    'Steel','Thorn',

    'Arcane','Astral','Celestial','Mystic','Spirit','Spell','Mana',
    'Plague','Scourge','Necro','Demon','Abyss','Nether',

    'North','South','East','West','High','Low','Far','Deep','Long',
    'Grey','Gray','Bright','Bleak','Bitter','Dire','Fierce','Savage',

    'Sunfire','Moonfire','Coldfire','Darkfire','Starfire','Soulfire',
    'Bloodfire','Ghostfire','Frostfire','Wildfire',

    'Earthshard','Stormshard','Soulshard','Voidshard','Icefang',
    'Bloodfang','Nightfang','Starfang','Wolfheart','Lionheart'
]
PROPER_B = [
    'fang','song','reaver','caller','breaker','watch','edge','guard','bane',
    'heart','spire','claw','bite','ward','oath','brand','whisper','howl',
    'strike','fall','shard','grip','veil','crown','doom','keeper','march',
    'wrath','vigil','reach','thorn','gaze','lament','wake','echo','talon',
    'fury','promise','rebuke','memory',

    'blade','blood','bolt','brand','breath','bringerless','carver','cleaver',
    'cry','dancer','dawn','death','dream','fire','flame','forge','frost',
    'glaive','grasp','hammer','hand','hide','horn','hunter','keeper',
    'light','lord','maw','moon','night','oath','piercer','rage','rend',
    'rider','ripper','roar','scar','scream','shade','shadow','shield',
    'singer','skull','slayer','sorrow','spear','spell','spirit','star',
    'steel','storm','sun','thirst','tongue','tooth','vengeance','voice',
    'walker','warden','wind','wing','winter','wolf','wound','wyrm',

    'ash','bloom','branch','briar','ember','feather','leaf','root','seed',
    'vine',

    'chain','crush','guard','helm','mail','plate','wall',

    'curse','hex','ritual','sigil','rune','glyph','mark','seal',

    'dusk','gloom','grave','mist','rime','snow','thunder','twilight',
    'void',

    'banner','covenant','creed','decree','legacy','pact','pledge',
    'vow','will',

    'chill','cold','freeze','glacier','hail','ice','storm','snowfall',

    'beacon','flare','glow','ray','shine','spark','starfall',

    'doom','fate','judgment','reckoning','ruin','torment','woe',

    'anchor','anvil','forge','hammer','stone','vault',

    'arrow','bolt','shot','string','quarrel',

    'clutch','fist','knuckle','punch','talon',

    'dirge','hymn','requiem','song','verse','whisper'
]
BASE_BY_SLOT = {
    'head': [
        'Helm','Cowl','Crown','Hood','Faceguard','Circlet','Greathelm',
        'Warhelm','Visor','Mask','Headguard','Coif','Cap','Headdress',
        'Diadem','Skullcap','Headpiece','Casque','Browguard','Crest',
        'Headplate','War Hood','Battlehelm','Deathmask','Tiara'
    ],

    'neck': [
        'Pendant','Choker','Amulet','Gorget','Necklace','Chain','Torc',
        'Locket','Collar','Medallion','Talisman','Charm','Beads',
        'Neckguard','Clasp','Charmstone','Torque','Neckchain','Brooch',
        'Pendant Chain'
    ],

    'shoulder': [
        'Pauldrons','Mantle','Spaulders','Shoulderguards','Shoulderpads',
        'Epaulets','Shoulderplates','Shoulder Guards','War Pauldrons',
        'Battle Mantle','Shoulder Armor','Great Pauldrons','Armplates',
        'Shoulderwraps','Shoulder Cape','Mantleplates','Wings',
        'War Mantle','Great Spaulders','Shoulderward'
    ],

    'back': [
        'Cloak','Cape','Shroud','Drape','Mantle','Wrap','Veil',
        'Greatcloak','Warcloak','Shawl','Capelet','Great Cape',
        'Battlecloak','Longcloak','Nightcloak','Traveling Cloak',
        'Shoulder Drape','Backcloth','Warder Cloak','Royal Cloak'
    ],

    'chest': [
        'Breastplate','Chestguard','Tunic','Hauberk','Robe','Vestments',
        'Jerkin','Chestpiece','Carapace','Cuirass','Armor','Mail',
        'Coat','Raiment','Regalia','Plate','Chainmail','Battleplate',
        'Warplate','Chestplate','Greatcoat','Surcoat','Harness',
        'Battle Harness','War Tunic','Robes','Battle Robes','Vest',
        'Chestwrap','Great Hauberk'
    ],

    'wrists': [
        'Bracers','Wristguards','Bindings','Vambraces','Cuffs','Armbands',
        'Wristwraps','Manacles','Wristplates','Wristbands','Bracelets',
        'Armguards','Forearm Guards','Wrist Armor','Battle Bracers',
        'Runebands','Warbracers','Wrist Chains','Armlets','Wristward'
    ],

    'hands': [
        'Gauntlets','Gloves','Handguards','Grips','Fists','Handwraps',
        'Graspers','Clutches','Mitts','Knuckles','Handplates',
        'Battle Gloves','War Gloves','Great Gauntlets','Claws',
        'Hand Armor','Grasp','Wargrips','Fingerguards','Handward'
    ],

    'waist': [
        'Girdle','Belt','Waistguard','Cord','Sash','Chain','Cinch',
        'Waistband','Buckle','Strap','Binding','Warbelt','Greatbelt',
        'Battle Girdle','Waistplate','Waistwrap','War Girdle',
        'Battle Belt','Hipguard','Waistchain'
    ],

    'legs': [
        'Legplates','Legguards','Leggings','Trousers','Kilt','Pants',
        'Breeches','Chausses','Legwraps','Leg Armor','Battle Leggings',
        'War Leggings','Greaves','Legplates','Legmail','Leggings',
        'Legguards','Battleplate Legguards','War Trousers','Legward',
        'Skirt','War Kilt','Battle Kilt','Leg Harness'
    ],

    'feet': [
        'Sabatons','Boots','Greaves','Treads','Footguards','Sollerets',
        'Stompers','Walkers','Footwraps','Sandals','Warboots','Striders',
        'Battle Boots','Greatboots','Footplates','War Treads',
        'Battle Treads','Shoes','Stalkers','Footward','Marching Boots',
        'Iron Boots','Riding Boots','War Greaves'
    ],

    'finger': [
        'Band','Signet','Ring','Seal','Loop','Hoop','Circle','Coil',
        'Promise','Mark','Ringlet','Fingerband','Oathring','Runering',
        'Signet Ring','Seal Ring','Warband','Gemmed Band','Royal Band',
        'Rune Band'
    ],

    'trinket': [
        'Talisman','Charm','Medallion','Token','Icon','Emblem','Figurine',
        'Keepsake','Badge','Insignia','Shard','Stone','Lens','Compass',
        'Hourglass','Coin','Seal','Charmstone','Runestone','Crystal',
        'Orb','Idol','Totem','Relic','Fetish','Effigy','Mirror',
        'Phylactery','Vial','Flask','Horn','Bell','Key','Tablet',
        'Scarab','Eye','Heart','Skull','Bone','Feather','Scale'
    ],

    'shield': [
        'Bulwark','Shield','Aegis','Buckler','Barrier','Guard','Defender',
        'Wall','Tower Shield','Ward','Protector','Targe','Warshield',
        'Greatshield','Battle Shield','Wallshield','Shieldwall',
        'Rampart','Barricade','Pavise','Battlewall','Great Aegis'
    ],

    'relic': [
        'Relic','Idol','Totem','Libram','Sigil','Runestone','Tablet',
        'Icon','Effigy','Symbol','Inscription','Rune','Fetish',
        'Sacred Relic','Ancient Relic','War Relic','Spirit Relic',
        'Runed Relic','Stone Relic','Carved Relic','Ritual Relic'
    ]
}

ARMOR_BASE_BY_SUBCLASS = {
    1: {  # Cloth
        'head':['Hood','Cowl','Circlet','Cap','Headdress','Diadem','Skullcap','Tiara'],
        'shoulder':['Mantle','Shoulderwraps','Epaulets','Shoulderpads','Shoulder Cape'],
        'chest':['Robe','Robes','Vestments','Raiment','Tunic','Regalia','Chestwrap','Vest'],
        'wrists':['Bindings','Cuffs','Wristwraps','Armbands','Bracelets','Runebands'],
        'hands':['Gloves','Handwraps','Mitts','Grips','Graspers'],
        'waist':['Cord','Sash','Cinch','Waistwrap','Binding','Waistband'],
        'legs':['Leggings','Trousers','Pants','Breeches','Legwraps','Skirt','Kilt'],
        'feet':['Boots','Footwraps','Sandals','Shoes','Treads','Walkers'],
    },
    2: {  # Leather
        'head':['Helm','Mask','Headguard','Cap','Cowl','Headdress','Deathmask'],
        'shoulder':['Shoulderguards','Shoulderpads','Spaulders','Shoulderwraps','Mantle'],
        'chest':['Jerkin','Tunic','Harness','Vest','Chestguard','Chestpiece','Carapace'],
        'wrists':['Bracers','Wristguards','Bindings','Wristbands','Armguards'],
        'hands':['Gloves','Grips','Handguards','Clutches','Claws','Wargrips'],
        'waist':['Belt','Waistguard','Girdle','Strap','Waistband','Cinch'],
        'legs':['Leggings','Legguards','Trousers','Pants','Breeches','Legwraps'],
        'feet':['Boots','Treads','Footguards','Stalkers','Striders','Walkers'],
    },
    3: {  # Mail
        'head':['Helm','Coif','Headguard','Warhelm','Faceguard','Casque'],
        'shoulder':['Spaulders','Shoulderguards','Shoulder Guards','War Mantle','Epaulets'],
        'chest':['Hauberk','Chainmail','Mail','Chestguard','Harness','Surcoat','Great Hauberk'],
        'wrists':['Bracers','Wristguards','Vambraces','Wrist Chains','Armguards'],
        'hands':['Gauntlets','Gloves','Handguards','Grips','Wargrips'],
        'waist':['Belt','Girdle','Waistguard','Waistchain','Warbelt'],
        'legs':['Legguards','Leggings','Legmail','Chausses','War Leggings'],
        'feet':['Boots','Greaves','Treads','Footguards','Warboots'],
    },
    4: {  # Plate
        'head':['Helm','Greathelm','Warhelm','Faceguard','Visor','Headplate','Battlehelm'],
        'shoulder':['Pauldrons','Shoulderplates','Armplates','Great Pauldrons','War Pauldrons'],
        'chest':['Breastplate','Cuirass','Battleplate','Warplate','Chestplate','Carapace'],
        'wrists':['Bracers','Vambraces','Wristplates','Armguards','Warbracers'],
        'hands':['Gauntlets','Handplates','Great Gauntlets','Handguards','Wargrips'],
        'waist':['Girdle','Waistguard','Waistplate','Warbelt','Battle Girdle'],
        'legs':['Legplates','Legguards','Greaves','Battleplate Legguards','War Leggings'],
        'feet':['Sabatons','Greaves','Sollerets','Footplates','War Greaves','Iron Boots'],
    },
}

def base_pool_for_item(slot, weapon_kind=None, armor_subclass=None):
    if weapon_kind:
        return BASE_BY_WEAPON[weapon_kind]
    if armor_subclass in ARMOR_BASE_BY_SUBCLASS and slot in ARMOR_BASE_BY_SUBCLASS[armor_subclass]:
        return ARMOR_BASE_BY_SUBCLASS[armor_subclass][slot]
    return BASE_BY_SLOT[slot]

BASE_BY_WEAPON = {
    '1h_sword': [
        'Blade','Longsword','Saber','Scimitar','Broadsword','Falchion',
        'Shortsword','Runeblade','Warblade','Edge','Brand','Spellblade',
        'Reaver','Slasher','Cutlass','Warsword','Battleblade',
        'Runesword','Knightblade','Kingsblade','Steelblade','Sword',
        'War Sword','Rider Blade'
    ],

    '2h_sword': [
        'Greatsword','Claymore','Warblade','Greatblade','Zweihander',
        'Runeblade','War Sword','Great Warblade','Longblade',
        'Execution Blade','Battle Greatsword','Runesword','Kingsblade',
        'Colossal Blade','Highblade','Great Claymore','War Cleaver',
        'Titanblade','Great Runeblade','Champion Blade'
    ],

    '1h_axe': [
        'Axe','Hatchet','Cleaver','Handaxe','Chopper','Tomahawk',
        'Battle Axe','War Axe','Bearded Axe','Hand Cleaver',
        'Runic Axe','Raider Axe','Skull Axe','War Hatchet',
        'Headsman Axe','Fang Axe','Runeaxe','Broad Axe','Iron Axe',
        'Battle Hatchet'
    ],

    '2h_axe': [
        'Greataxe','War Axe','Decapitator','Battleaxe','Executioner',
        'Great Cleaver','Reaver','Headsman','Bearded Axe','War Cleaver',
        'Great Battleaxe','Runic Greataxe','Titan Axe','Skullsplitter',
        'Great Chopper','Execution Axe','Raider Greataxe','War Reaver',
        'Grand Axe','Great Runeaxe'
    ],

    '1h_mace': [
        'Mace','Hammer','Warhammer','Cudgel','Mallet','Scepter',
        'Morningstar','Flanged Mace','Crusher','Battle Mace',
        'War Mace','Runehammer','Stonehammer','Skullcrusher',
        'Clublike Mace','Iron Mace','Battlehammer','Hand Hammer',
        'Maul','Knobbed Mace'
    ],

    '2h_mace': [
        'Maul','Sledge','Great Hammer','War Maul','Earthshaker',
        'Crusher','Grand Mace','Stonehammer','Runemaul','Battle Hammer',
        'Great Maul','Titan Hammer','Great Warhammer','Skullcrusher',
        'Bonecrusher','Siege Hammer','Forgehammer','Thunder Hammer',
        'Grand Warhammer','Colossal Maul'
    ],

    'polearm': [
        'Glaive','Halberd','Spear','Pike','Lance','Partisan','Trident',
        'War Spear','Ranseur','Harpoon','Longspear','Voulge','Scythe',
        'Battle Glaive','War Halberd','Runespear','Dragon Spear',
        'Great Lance','War Pike','Poleblade','Long Glaive','War Scythe'
    ],

    'dagger': [
        'Dagger','Dirk','Shiv','Knife','Stiletto','Blade','Shanker',
        'Pricker','Ritual Knife','Tooth','Fang','Spike','Kris','Bodkin',
        'Poniard','Rondel','Skinner','Carver','Assassin Blade',
        'War Dagger','Rune Dagger','Spellknife','Shadowblade','Piercer'
    ],

    'staff': [
        'Staff','Stave','Spire','Quarterstaff','Warstaff','Runestaff',
        'Walking Staff','Greatstaff','Crook','Rod','Branch','Pillar',
        'Mage Staff','Battle Staff','Spellstaff','Spirit Staff',
        'Runed Staff','Longstaff','Archmage Staff','Seer Staff',
        'Druid Staff','Shaman Staff','Great Stave','Spell Stave'
    ],

    'fist': [
        'Claw','Fist','Knuckle','Talon','Cestus','Handblade',
        'Punchblade','Clawblade','Knuckles','Gauntlet','Jaw','Scratcher',
        'War Claw','Battle Fist','Hand Claw','Fang','Ripper',
        'Steel Fist','Iron Claw','Bladefist','War Talon','Battle Claw'
    ],

    'bow': [
        'Longbow','Recurve','Warbow','Shortbow','Greatbow','Composite Bow',
        'Hornbow','Longshot','Hunting Bow','Battle Bow','War Bow',
        'Ranger Bow','Runebow','Bone Bow','Dragonbow','Great Warbow',
        'Siegebow','Long Recurve','Hunter Bow','Scout Bow','Warden Bow'
    ],

    'gun': [
        'Rifle','Musket','Hand Cannon','Blunderbuss','Long Rifle',
        'Scattergun','Carbine','Firearm','Thunderstick','Boomstick',
        'War Rifle','Hunting Rifle','Battle Rifle','Long Gun',
        'Repeating Rifle','Great Rifle','Marksman Rifle','Dwarven Rifle',
        'Iron Rifle','Siege Gun','Runegun','War Musket'
    ],

    'crossbow': [
        'Crossbow','Arbalest','Repeater','Heavy Crossbow','Siege Crossbow',
        'Bolt Thrower','Windlass','War Crossbow','Sniper Crossbow',
        'Crankbow','Great Crossbow','Battle Crossbow','Hunter Crossbow',
        'Repeating Crossbow','Bone Crossbow','Runed Crossbow',
        'Steel Crossbow','Long Crossbow','Marksman Crossbow','War Arbalest'
    ],

    'wand': [
        'Wand','Rod','Scepter','Spellwand','Focus','Channeling Rod',
        'Runewand','Arcane Rod','Hexing Rod','Conduit','Spellrod',
        'Runed Wand','Mage Wand','Mystic Wand','Spirit Wand',
        'Bone Wand','Crystal Wand','Star Wand','Moon Wand','Ritual Wand',
        'Sorcerer Rod','Runic Rod','Spell Scepter','Arcane Scepter'
    ]
}

FLAVOR = [
    'It carries the chill of the northern wastes.',
    'Runes along its edge are cold to the touch.',
    'Its maker left no name behind.',
    'The metal hums softly beneath an open sky.',
    'A relic of a war no bard remembers.',
    'Frost clings to it even beside a warm hearth.',
    'The workmanship bears the marks of an old northern forge.',
    'Its surface is scarred by years of hard fighting.',
    'A faint blue light lingers within the metal.',
    'The runes have been worn smooth by countless hands.',
    'Something about it recalls distant thunder.',
    'A cold wind seems to follow in its wake.',

    'Tiny runes pulse beneath its weathered surface.',
    'No hammer marks can be found anywhere upon it.',
    'Its surface remains strangely warm despite the cold.',
    'A thin layer of frost returns whenever it is wiped away.',
    'The metal bears scars from battles long forgotten.',
    'A faint ringing can be heard when moonlight strikes it.',
    'Its edges have been polished by decades of use.',
    'A nearly forgotten crest remains visible beneath the scratches.',
    'The craftsmanship suggests a forge far older than its owner.',
    'A scent of smoke and pine clings stubbornly to it.',
    'Its runes glow briefly whenever thunder rolls nearby.',
    'A faint shimmer passes across its surface at dusk.',
    'The metal seems heavier than its size would suggest.',
    'The metal seems lighter than its size would suggest.',
    'A chill runs through the hand of anyone who first touches it.',
    'Its surface reflects stars that are not visible overhead.',
    'Fine silver threads form ancient patterns across its surface.',
    'The craftsmanship is unmistakably northern.',
    'The markings resemble those found in forgotten titan ruins.',
    'A fragment of an old oath has been carved into its surface.',
    'Time has worn most of its inscription beyond recognition.',
    'Someone carefully scratched a tally of victories into it.',
    'A shallow gouge marks where a killing blow once landed.',
    'Its original owner appears to have removed every identifying mark.',
    'The leather still smells faintly of cedar and smoke.',
    'Faint claw marks run along one side.',
    'Its metalwork bears the unmistakable touch of a master smith.',
    'The final rune remains unfinished.',
    'A single black feather is tied to it with faded cord.',
    'A tiny silver bell hangs from a worn leather thong.',
    'Its surface is covered in nearly invisible prayer marks.',
    'A faded battlefield blessing remains etched into the metal.',
    'A dark stain refuses every attempt to polish it away.',
    'The metal glitters as though dusted with fresh snow.',
    'The runes become clearer beneath starlight.',
    'A faint heartbeat seems to echo from somewhere within.',
    'The leather has been repaired many times by different hands.',
    'Its clasp bears the symbol of a long-dead household.',
    'A tiny maker mark is hidden beneath one edge.',
    'Someone has carefully filed away the maker mark.',
    'Its surface is unnaturally smooth.',
    'A thin crack runs through the oldest rune.',
    'The metal produces a low note when struck.',
    'The engraving depicts mountains beneath a winter moon.',
    'Its engraving shows a dragon circling a distant tower.',
    'Its engraving shows warriors marching beneath falling snow.',
    'Its engraving depicts an ancient tree surrounded by stars.',
    'Its engraving shows a lone rider crossing a frozen plain.',
    'Its engraving depicts a hammer resting upon an anvil.',
    'Its engraving depicts a raven perched upon a broken crown.',
    'Its engraving depicts a wolf beneath the northern lights.',
    'Its engraving depicts an eye surrounded by runes.',
    'Its engraving depicts a shattered fortress beneath a dark moon.',
    'Its engraving depicts a ship lost among frozen waves.',
    'Its engraving depicts a serpent wrapped around a spear.',
    'Its engraving depicts a bear standing before a mountain.',
    'Its engraving depicts a dragon sleeping beneath the earth.',
    'Its engraving depicts seven stars surrounding a single flame.',

    'The runes whisper softly when no one else is nearby.',
    'A faint whisper follows anyone who carries it for too long.',
    'It occasionally feels as though someone else is holding it.',
    'Its shadow does not always fall in the expected direction.',
    'The air around it smells briefly of fresh snow.',
    'The air around it smells briefly of rain.',
    'The air around it smells faintly of old parchment.',
    'The air around it smells faintly of burning cedar.',
    'The air around it carries the scent of a distant forge.',
    'The air grows noticeably colder when it is drawn.',
    'Nearby candle flames bend slightly toward it.',
    'Nearby candle flames briefly turn pale blue.',
    'Dust never seems to settle upon its surface.',
    'Snow melts slowly when it lands upon the metal.',
    'Snow refuses to melt upon the metal.',
    'Small sparks occasionally dance across its runes.',
    'A dim golden glow appears along its edges at sunrise.',
    'A dim violet glow appears along its edges at midnight.',
    'Its runes glow faintly during storms.',
    'Its runes glow faintly beneath a full moon.',
    'Its runes glow faintly near ancient ruins.',
    'Its runes briefly flare when battle begins.',
    'Its surface grows warm when danger is near.',
    'Its surface grows cold when danger is near.',

    'The inscription reads, "Stand until the last."',
    'The inscription reads, "The north remembers."',
    'The inscription reads, "No oath dies willingly."',
    'The inscription reads, "Steel outlives kings."',
    'The inscription reads, "Carry the flame forward."',
    'The inscription reads, "Watch the dark places."',
    'The inscription reads, "Hold fast against winter."',
    'The inscription reads, "The mountain does not kneel."',
    'The inscription reads, "Remember those who stood before."',
    'The inscription reads, "Fear no road beneath the stars."',
    'The inscription reads, "Let the storm answer."',
    'The inscription reads, "By stone and steel."',
    'The inscription reads, "Until the final watch."',
    'The inscription reads, "For those who never returned."',
    'The inscription reads, "Guard what remains."',
    'The inscription reads, "No crown lasts forever."',
    'The inscription reads, "The dead keep their promises."',
    'The inscription reads, "Walk where others falter."',
    'The inscription reads, "The forge remembers every blow."',
    'The inscription reads, "Winter tests all things."',

    'A name has been scratched out beneath the inscription.',
    'Several names have been carved along the inner edge.',
    'The oldest name carved into it can no longer be read.',
    'Someone added a second inscription many years after the first.',
    'A childlike carving has been hidden beneath the grip.',
    'Its owner once marked every campaign with a small notch.',
    'A final notch appears deeper than all the others.',
    'One rune has been deliberately carved backward.',
    'The central rune appears newer than the others.',
    'The oldest repairs are almost works of art themselves.',

    'It was clearly made to survive more than one lifetime.',
    'Whoever forged it expected war to last a very long time.',
    'Whoever carried it before did not surrender it willingly.',
    'Its previous owner took exceptional care of it.',
    'Its previous owner cared little for appearances.',
    'It appears to have crossed half the world before reaching you.',
    'It has survived fire, frost, and something far worse.',
    'Its history is written more clearly in scars than in runes.',
    'Despite its age, every moving piece still works perfectly.',
    'Despite countless repairs, the original craftsmanship still shows.',

    'The metal is flecked with tiny blue crystals.',
    'The metal is flecked with tiny red crystals.',
    'The metal is flecked with tiny golden crystals.',
    'Fine veins of silver run naturally through the material.',
    'Fine veins of black metal run beneath its surface.',
    'A pale gem rests within a simple iron setting.',
    'A dark gem seems to swallow the light around it.',
    'A cloudy crystal has been carefully set into its center.',
    'A tiny piece of amber has been worked into the handle.',
    'A smooth river stone has been mounted where a jewel should be.',
    'Several tiny teeth have been worked into the decoration.',
    'A strip of faded red cloth is wrapped around the grip.',
    'A strip of faded blue cloth is wrapped around the grip.',
    'A strip of faded white cloth is wrapped around the grip.',
    'A braided leather cord has been tied around it for luck.',
    'A weathered prayer ribbon hangs from one edge.',

    'A raven feather has been pressed beneath the binding.',
    'A wolf tooth hangs from a short leather cord.',
    'A bear claw has been worked into the decoration.',
    'A polished dragon scale forms part of its ornamentation.',
    'A tiny carved serpent coils around the central setting.',
    'A stylized eagle is worked into the metal.',
    'A snarling wolf decorates the oldest plate.',
    'A sleeping dragon is carved beneath the guard.',
    'A crowned raven appears upon the clasp.',
    'A mountain goat is carved into the pommel.',

    'Old blood remains trapped deep within the engraving.',
    'The blade has been sharpened so many times that its shape has changed.',
    'The grip has molded itself to the hand of a long-dead warrior.',
    'Several repairs use metal from completely different eras.',
    'One plate appears to have been replaced with titan-forged metal.',
    'The leather straps are newer than the rest of the item.',
    'The gemstone setting is clearly older than the item surrounding it.',
    'Its oldest component may predate the kingdom that discovered it.',
    'The inner surface carries marks invisible while it is worn.',
    'The final craftsman left a tiny hammer mark inside the clasp.',

    'A forgotten prayer seems to linger within it.',
    'The faint warmth of a campfire seems trapped inside.',
    'The silence around it feels deeper than ordinary silence.',
    'For a moment, holding it feels like standing beneath a winter sky.',
    'For a moment, holding it feels like hearing distant war drums.',
    'For a moment, holding it feels like standing inside an ancient forge.',
    'For a moment, holding it feels like walking beneath towering pines.',
    'For a moment, holding it feels like watching snow fall over a battlefield.',
    'For a moment, holding it feels like remembering a place you have never seen.',
    'Whatever story this relic once told, only fragments remain.'
]

def _seed_arg(value):
    value=str(value).strip()
    if not value or not value.isdigit():
        raise argparse.ArgumentTypeError('seed must contain digits only')
    return value

def _number_arg(value):
    try:
        value=int(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('number must be a positive integer') from exc
    if value < 1:
        raise argparse.ArgumentTypeError('number must be at least 1')
    if value > MAX_TOTAL_ITEMS:
        raise argparse.ArgumentTypeError(f'number cannot exceed {MAX_TOTAL_ITEMS}')
    return value

def _loot_chance_arg(value):
    try:
        chance=float(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('loot chance must be a number between 0 and 100') from exc
    if not math.isfinite(chance) or not 0 < chance <= 100:
        raise argparse.ArgumentTypeError('loot chance must be greater than 0 and at most 100')
    return chance

def _percent_arg(value):
    try:
        percent=float(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('value must be a number between 0 and 100') from exc
    if not math.isfinite(percent) or not 0 <= percent <= 100:
        raise argparse.ArgumentTypeError('value must be between 0 and 100')
    return percent

def _multiplier_arg(value):
    try:
        multiplier=float(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('multiplier must be a finite non-negative number') from exc
    if not math.isfinite(multiplier) or multiplier < 0:
        raise argparse.ArgumentTypeError('multiplier must be a finite non-negative number')
    return multiplier

def _positive_int_arg(value):
    try:
        number=int(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('value must be a positive integer') from exc
    if number < 1:
        raise argparse.ArgumentTypeError('value must be a positive integer')
    return number

def _nonnegative_int_arg(value):
    try:
        number=int(value)
    except (TypeError,ValueError) as exc:
        raise argparse.ArgumentTypeError('value must be a non-negative integer') from exc
    if number < 0:
        raise argparse.ArgumentTypeError('value must be a non-negative integer')
    return number

def _expand_disabled_features(groups):
    disabled=set()
    for group in groups or []:
        for raw_name in group:
            name=str(raw_name).strip().lower()
            if name in DISABLE_ALIASES:
                disabled.update(DISABLE_ALIASES[name])
            elif name in NEW_FEATURES:
                disabled.add(name)
            else:
                valid=', '.join((*NEW_FEATURES, *DISABLE_ALIASES))
                raise argparse.ArgumentTypeError(f'unknown feature {raw_name!r}; choose from: {valid}')
    return sorted(disabled)

CLASS_ALIASES = {
    'warrior':'Warrior','paladin':'Paladin','hunter':'Hunter','rogue':'Rogue',
    'priest':'Priest','deathknight':'Death Knight','dk':'Death Knight',
    'shaman':'Shaman','mage':'Mage','warlock':'Warlock','druid':'Druid'
}

def _class_arg(value):
    raw=str(value).strip().lower()
    key=''.join(ch for ch in raw if ch.isalnum())
    if key not in CLASS_ALIASES:
        valid=', '.join(c[0].lower() for c in CLASSES)
        raise argparse.ArgumentTypeError(f'unknown class {value!r}; choose one of: {valid}')
    return CLASS_ALIASES[key]

def parse_args(argv=None):
    parser=argparse.ArgumentParser(description='Generate randomized AzerothCore WotLK items.')
    parser.add_argument('--seed',type=_seed_arg,help='Use this exact numeric seed instead of generating one automatically.')
    parser.add_argument('--number',type=_number_arg,help=f'Generate exactly this many items (max {MAX_TOTAL_ITEMS:,} total; max {MAX_ITEMS_PER_CLASS:,} per class).')
    parser.add_argument('--class',dest='class_name',type=_class_arg,help='Generate items for only this class (case-insensitive).')
    parser.add_argument('--content-manifest',type=Path,default=None,metavar='PATH',help='JSON manifest for targeted recipes, dungeon/raid loot, and quest rewards.')
    parser.add_argument('--quest-template-source',type=Path,default=None,metavar='PATH',help='quest_template.sql used to validate and preserve mapped quest rewards.')
    parser.add_argument('--loot-chance',type=_loot_chance_arg,default=2.0,metavar='PERCENT',help='Independent generated-item roll on each existing world-loot reference (default: 2).')
    parser.add_argument('--world-loot-source',type=Path,default=DEFAULT_WORLD_LOOT_SOURCE,metavar='PATH',help=f'creature_loot_template.sql to map world-loot levels (default: {DEFAULT_WORLD_LOOT_SOURCE}).')
    parser.add_argument('--reference-loot-source',type=Path,default=DEFAULT_REFERENCE_LOOT_SOURCE,metavar='PATH',help=f'reference_loot_template.sql used to verify shared references (default: {DEFAULT_REFERENCE_LOOT_SOURCE}).')
    parser.add_argument('--gameobject-source',type=Path,default=None,metavar='PATH',help='Optional gameobject.sql source for verifiable chest/cache encounter targets.')
    parser.add_argument('--gameobject-template-source',type=Path,default=None,metavar='PATH',help='Optional gameobject_template.sql source for encounter target loot IDs.')
    parser.add_argument('--gameobject-loot-source',type=Path,default=None,metavar='PATH',help='Optional gameobject_loot_template.sql source for encounter target validation.')
    parser.add_argument('--azerothcore-source-root',type=Path,default=None,metavar='PATH',help='Optional AzerothCore source root containing discoverable encounter SQL sources.')
    parser.add_argument('--item-template-source',type=Path,default=DEFAULT_ITEM_TEMPLATE_SOURCE,metavar='PATH',help=f'item_template.sql used to harvest the full stock appearance catalog (default: {DEFAULT_ITEM_TEMPLATE_SOURCE}).')
    parser.add_argument('--item-dbc-source',dest='item_dbc_sources',type=Path,action='append',default=None,metavar='PATH',help=f'Complete or additive WotLK Item.dbc source; repeat for every client DBC baseline (default: {DEFAULT_ITEM_DBC_SOURCE}, {DEFAULT_ITEM_DBC_CUSTOM_SOURCE}).')
    parser.add_argument('--item-dbc-overwrite',action='store_true',help='Replace conflicting generated-ID rows in --item-dbc-source instead of failing.')
    parser.add_argument('--item-set-dbc-source',type=Path,default=DEFAULT_ITEM_SET_DBC_SOURCE,metavar='PATH',help=f'WotLK ItemSet.dbc baseline (default: {DEFAULT_ITEM_SET_DBC_SOURCE}).')
    parser.add_argument('--spell-dbc-source',type=Path,default=DEFAULT_SPELL_DBC_SOURCE,metavar='PATH',help=f'WotLK Spell.dbc used to validate effect packages (default: {DEFAULT_SPELL_DBC_SOURCE}).')
    parser.add_argument('--spell-enchantment-dbc-source',type=Path,default=DEFAULT_SPELL_ENCHANTMENT_DBC_SOURCE,metavar='PATH',help=f'WotLK SpellItemEnchantment.dbc used to resolve socket bonuses (default: {DEFAULT_SPELL_ENCHANTMENT_DBC_SOURCE}).')
    parser.add_argument('--disenchant-source',type=Path,default=DEFAULT_DISENCHANT_SOURCE,metavar='PATH',help=f'disenchant_loot_template.sql used to validate DisenchantID values (default: {DEFAULT_DISENCHANT_SOURCE}).')
    parser.add_argument('--spell-proc-source',type=Path,default=DEFAULT_SPELL_PROC_SOURCE,metavar='PATH',help=f'spell_proc.sql used to audit proc conditions (default: {DEFAULT_SPELL_PROC_SOURCE}).')
    parser.add_argument('--spell-script-names-source',type=Path,default=DEFAULT_SPELL_SCRIPT_NAMES_SOURCE,metavar='PATH',help=f'spell_script_names.sql used to audit scripted spells (default: {DEFAULT_SPELL_SCRIPT_NAMES_SOURCE}).')
    parser.add_argument('--disable',dest='disable_groups',action='append',nargs='+',default=[],metavar='FEATURE',help=f'Disable one or more new features: {", ".join(NEW_FEATURES)}; aliases: effects, all-new.')
    parser.add_argument('--set-rate',type=_percent_arg,default=0.20,metavar='PERCENT',help='Percentage of generated items reserved as generated set members; five pieces by default (default: 0.20).')
    parser.add_argument('--set-min-level',type=_nonnegative_int_arg,default=20,metavar='LEVEL',help='Minimum required level for generated set pieces (default: 20).')
    parser.add_argument('--set-size',type=_positive_int_arg,default=5,metavar='COUNT',help='Generated set piece count; five is the WotLK default (default: 5).')
    parser.add_argument('--spell-effect-rate-multiplier',type=_multiplier_arg,default=1.0,metavar='MULTIPLIER',help='Multiplier for stock On Equip spell-effect frequency (default: 1.0).')
    parser.add_argument('--proc-rate-multiplier',type=_multiplier_arg,default=1.0,metavar='MULTIPLIER',help='Multiplier for stock Chance on Hit frequency (default: 1.0).')
    parser.add_argument('--on-use-rate-multiplier',type=_multiplier_arg,default=1.0,metavar='MULTIPLIER',help='Multiplier for stock On Use frequency (default: 1.0).')
    parser.add_argument('--effect-ilvl-window',type=_nonnegative_int_arg,default=15,metavar='ILVL',help='Maximum stock effect item-level distance; leveling items are additionally capped to 5/10/15 ilvl windows for WotLK-like progression (default: 15).')
    parser.add_argument('--socket-bonus-rate',type=_percent_arg,default=100.0,metavar='PERCENT',help='Percentage of eligible socketed items receiving a stock socket bonus (default: 100).')
    parser.add_argument('--disenchant-rate',type=_percent_arg,default=100.0,metavar='PERCENT',help='Percentage of eligible items receiving validated stock disenchant data (default: 100).')
    parser.add_argument('--max-special-effects',type=_nonnegative_int_arg,default=1,metavar='COUNT',help='Maximum independent spell-effect packages per item (default: 1).')
    parser.add_argument('--ui',choices=UI_MODES,default='auto',help='Terminal display mode: auto, fancy, or plain (default: auto).')
    parser.add_argument('--no-animations',action='store_true',help='Keep the styled UI but disable animated spinners/refresh effects.')
    parser.add_argument('--show-items',action='store_true',help='Expand the live discovery feed with additional interesting generated items.')
    parser.add_argument('--quiet',action='store_true',help='Suppress progress output; print only errors and the final completion line.')
    args=parser.parse_args(argv)
    args.disabled_features=_expand_disabled_features(args.disable_groups)
    return args

def get_or_create_user_guid(path=None):
    path=Path(path) if path is not None else USER_GUID_FILE
    if path.exists():
        raw=path.read_text(encoding='utf-8').strip()
        try:
            return str(uuid.UUID(raw))
        except ValueError as exc:
            raise RuntimeError(f'Invalid generator GUID file: {path}') from exc
    guid=str(uuid.uuid4())
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(guid+'\n',encoding='utf-8')
    return guid

def derive_auto_seed(user_guid,now=None):
    now=now if now is not None else datetime.now().astimezone()
    date_value=int(now.strftime('%Y%m%d'))
    time_value=int(now.strftime('%H%M%S%f'))
    payload=f'{user_guid}|{date_value}|{time_value}'.encode('utf-8')
    value=int.from_bytes(hashlib.blake2b(payload,digest_size=8).digest(),'big') % 10_000_000_000
    return f'{value:010d}'

def configure_runtime(argv=None,now=None,guid_path=None,args=None,ui=None):
    global SEED, OUT, SQLDIR, LOOT_CHANCE, WORLD_LOOT_SOURCE, REFERENCE_LOOT_SOURCE, ITEM_TEMPLATE_SOURCE, ITEM_DBC_SOURCES, ITEM_DBC_OVERWRITE
    global ITEM_SET_DBC_SOURCE, SPELL_DBC_SOURCE, SPELL_ENCHANTMENT_DBC_SOURCE, DISENCHANT_SOURCE, SPELL_PROC_SOURCE, SPELL_SCRIPT_NAMES_SOURCE
    global DISABLED_FEATURES, FEATURE_CATALOG, SET_RATE, SET_MIN_LEVEL, SET_SIZE, SPELL_EFFECT_RATE_MULTIPLIER, PROC_RATE_MULTIPLIER
    global ON_USE_RATE_MULTIPLIER, EFFECT_ILVL_WINDOW, SOCKET_BONUS_RATE, DISENCHANT_RATE, MAX_SPECIAL_EFFECTS, REFERENCE_CATALOG_AUDIT
    global ACTIVE_CLASSES, TARGET_ITEM_COUNT, CLASS_ITEM_COUNTS, A, W, CONTENT_MANIFEST, TARGETED_PLAN, QUEST_TEMPLATE_SOURCE, QUEST_REWARD_ROWS, ENCOUNTER_SOURCE_CATALOG, DEFAULT_ENCOUNTER_MANIFEST, ENCOUNTER_SOURCE_PATHS, GAMEOBJECT_SOURCE_PATHS
    args=parse_args(argv) if args is None else args
    content_manifest=load_content_manifest(args.content_manifest) if args.content_manifest else None
    if content_manifest is not None and (args.number is not None or args.class_name is not None):
        raise ValueError('--number and --class cannot be combined with --content-manifest; put counts and classes in the manifest')
    quest_template_source=Path(args.quest_template_source).expanduser().resolve() if args.quest_template_source else None
    world_loot_source=Path(args.world_loot_source).expanduser().resolve()
    reference_loot_source=Path(args.reference_loot_source).expanduser().resolve()
    item_template_source=Path(args.item_template_source).expanduser().resolve()
    quest_targets=content_manifest.get('quest_targets',()) if content_manifest else ()
    if quest_targets and quest_template_source is None:
        raise ValueError('--quest-template-source is required when the content manifest contains quest_targets')
    quest_reward_rows=load_quest_reward_slots(quest_template_source,{int(target['quest_id']) for target in quest_targets}) if quest_targets else {}
    encounter_source_catalog=None
    default_encounter_manifest=None
    encounter_source_paths=None
    gameobject_source_paths=None
    requested_gameobject_paths=(args.gameobject_source,args.gameobject_template_source,args.gameobject_loot_source)
    source_root=Path(args.azerothcore_source_root).expanduser().resolve() if args.azerothcore_source_root else DATA_DIR
    gameobject_source_paths=resolve_optional_gameobject_sources(requested_gameobject_paths, data_dir=source_root)
    if content_manifest is None or any(profile.get('map_id') is not None for profile in content_manifest.get('profiles',())):
        encounter_paths=(DEFAULT_MAP_DBC_SOURCE,DEFAULT_MAP_DIFFICULTY_DBC_SOURCE,DEFAULT_DUNGEON_MAP_DBC_SOURCE,
                         DEFAULT_CREATURE_SOURCE,DEFAULT_CREATURE_TEMPLATE_SOURCE,DEFAULT_INSTANCE_ENCOUNTERS_SOURCE,
                         world_loot_source,reference_loot_source)
        missing=[str(path) for path in encounter_paths if not Path(path).is_file()]
        if gameobject_source_paths:
            missing.extend(str(path) for path in gameobject_source_paths if not path.is_file())
        if missing: raise FileNotFoundError('targeted encounter source file(s) not found: '+', '.join(missing))
        encounter_source_catalog=load_encounter_source_catalog(
            *encounter_paths,
            item_template_path=item_template_source,
            gameobject_path=gameobject_source_paths[0] if gameobject_source_paths else None,
            gameobject_template_path=gameobject_source_paths[1] if gameobject_source_paths else None,
            gameobject_loot_path=gameobject_source_paths[2] if gameobject_source_paths else None,
        )
        encounter_source_paths=encounter_paths[:6]
        encounter_source_catalog.setdefault('source_audit',{})['azerothcore_source_root']=str(source_root)
        script_root=source_root if args.azerothcore_source_root else None
        script_mappings,script_status=discover_script_reward_mappings(script_root,encounter_source_catalog)
        encounter_source_catalog['script_reward_mappings']=script_mappings
        encounter_source_catalog['source_audit']['script_reward_mapping']=script_status
        if content_manifest is None:
            default_encounter_manifest=build_default_encounter_manifest(encounter_source_catalog,args.loot_chance)
        else:
            validate_targeted_source_membership(content_manifest,encounter_source_catalog)
    item_dbc_sources=[Path(path).expanduser().resolve() for path in (args.item_dbc_sources or _default_item_dbc_sources())]
    item_set_dbc_source=Path(args.item_set_dbc_source).expanduser().resolve()
    spell_dbc_source=Path(args.spell_dbc_source).expanduser().resolve()
    spell_enchantment_dbc_source=Path(args.spell_enchantment_dbc_source).expanduser().resolve()
    disenchant_source=Path(args.disenchant_source).expanduser().resolve()
    spell_proc_source=Path(args.spell_proc_source).expanduser().resolve()
    spell_script_names_source=Path(args.spell_script_names_source).expanduser().resolve()
    source_total=10+(len(encounter_source_paths) if encounter_source_paths else 0)
    if ui:
        ui.phase('Inspecting AzerothCore sources',total=source_total,detail='Verifying SQL and DBC inputs')
    source_check_count=0
    for label,path in (('world-loot source',world_loot_source),('reference-loot source',reference_loot_source),('item-template source',item_template_source)):
        if not path.is_file():
            if ui: ui.source_check(label,path,False)
            raise FileNotFoundError(f'{label} not found: {path}')
        source_check_count+=1
        if ui:
            ui.source_check(label,path,True); ui.progress(source_check_count,source_total,current=Path(path).name)
    for item_dbc_source in item_dbc_sources:
        if not item_dbc_source.is_file():
            if ui: ui.source_check('item-dbc source',item_dbc_source,False)
            raise FileNotFoundError(f'item-dbc source not found: {item_dbc_source}')
    # Multiple Item.dbc baselines count as one logical source check in the dashboard.
    source_check_count+=1
    if ui:
        ui.source_check('Item.dbc baseline(s)',', '.join(path.name for path in item_dbc_sources),True); ui.progress(source_check_count,source_total,current='Item.dbc baseline(s)')
    for label,path in (
            ('item-set DBC source',item_set_dbc_source),('spell DBC source',spell_dbc_source),
            ('spell-enchantment DBC source',spell_enchantment_dbc_source),('disenchant source',disenchant_source),
            ('spell-proc source',spell_proc_source)):
        if not path.is_file():
            if ui: ui.source_check(label,path,False)
            raise FileNotFoundError(f'{label} not found: {path}')
        source_check_count+=1
        if ui:
            ui.source_check(label,path,True); ui.progress(source_check_count,source_total,current=Path(path).name)
    if not spell_script_names_source.is_file():
        if ui: ui.source_check('spell-script-names source',spell_script_names_source,False)
        raise FileNotFoundError(f'spell-script-names source not found: {spell_script_names_source}')
    source_check_count+=1
    if ui:
        ui.source_check('spell-script-names source',spell_script_names_source,True); ui.progress(source_check_count,source_total,current=spell_script_names_source.name)
    if encounter_source_paths:
        for label,path in (
                ('dungeon/raid Map.dbc',encounter_source_paths[0]),
                ('dungeon/raid MapDifficulty.dbc',encounter_source_paths[1]),
                ('dungeon/raid DungeonMap.dbc',encounter_source_paths[2]),
                ('dungeon/raid creature source',encounter_source_paths[3]),
                ('dungeon/raid creature-template source',encounter_source_paths[4]),
                ('dungeon/raid instance-encounters source',encounter_source_paths[5])):
            source_check_count+=1
            if ui:
                ui.source_check(label,path,True); ui.progress(source_check_count,source_total,current=path.name)
    if ui:
        ui.phase_done('Inspecting AzerothCore sources')
        ui.phase('Harvesting stock WotLK data',total=2,detail='Appearances, spells, effects, sets, sockets, and disenchant tables')
        ui.status('Harvesting stock item appearances and weapon anchors')
    harvested_a,harvested_w,catalog_audit=harvest_reference_catalog(item_template_source)
    if catalog_audit['errors']:
        details='\n'.join(f' - {error}' for error in catalog_audit['errors'][:20])
        raise ValueError(f'item-template appearance harvest failed ({len(catalog_audit["errors"])} errors):\n{details}')
    A=harvested_a; W=harvested_w
    if ui: ui.progress(1,2,current='Stock appearance catalog ready')
    if args.seed is not None:
        seed=args.seed
        source='command-line'
    else:
        user_guid=get_or_create_user_guid(guid_path)
        seed=derive_auto_seed(user_guid,now)
        source='automatic'

    SEED=seed
    targeted_plan=None
    if content_manifest is not None:
        targeted_plan=build_generation_plan(content_manifest,CLASSES)
        counts=Counter(row['class_name'] for row in targeted_plan)
        selected=[row for row in CLASSES if counts.get(row[0],0)>0]
        number=len(targeted_plan)
    elif args.class_name is not None:
        selected=[row for row in CLASSES if row[0]==args.class_name]
        number=args.number if args.number is not None else DEFAULT_ITEMS_PER_CLASS
        if number > MAX_ITEMS_PER_CLASS:
            raise ValueError(f'--number cannot exceed {MAX_ITEMS_PER_CLASS} when --class is used')
        counts={args.class_name:number}
    else:
        selected=list(CLASSES)
        number=args.number if args.number is not None else DEFAULT_TOTAL_ITEMS
        if number > MAX_TOTAL_ITEMS:
            raise ValueError(f'--number cannot exceed {MAX_TOTAL_ITEMS}')
        base,remainder=divmod(number,len(CLASSES))
        if base > MAX_ITEMS_PER_CLASS or (base == MAX_ITEMS_PER_CLASS and remainder):
            raise ValueError(f'--number would exceed the per-class cap of {MAX_ITEMS_PER_CLASS}')
        counts={cname:base+(1 if i<remainder else 0) for i,(cname,_,_) in enumerate(CLASSES)}
        selected=[row for row in selected if counts[row[0]]>0]

    LOOT_CHANCE=args.loot_chance
    WORLD_LOOT_SOURCE=world_loot_source
    REFERENCE_LOOT_SOURCE=reference_loot_source
    ITEM_TEMPLATE_SOURCE=item_template_source
    ITEM_DBC_SOURCES=item_dbc_sources
    ITEM_DBC_OVERWRITE=args.item_dbc_overwrite
    ITEM_SET_DBC_SOURCE=item_set_dbc_source
    SPELL_DBC_SOURCE=spell_dbc_source
    SPELL_ENCHANTMENT_DBC_SOURCE=spell_enchantment_dbc_source
    DISENCHANT_SOURCE=disenchant_source
    SPELL_PROC_SOURCE=spell_proc_source
    SPELL_SCRIPT_NAMES_SOURCE=spell_script_names_source
    DISABLED_FEATURES=set(args.disabled_features)
    SET_RATE=args.set_rate
    SET_MIN_LEVEL=args.set_min_level
    SET_SIZE=args.set_size
    SPELL_EFFECT_RATE_MULTIPLIER=args.spell_effect_rate_multiplier
    PROC_RATE_MULTIPLIER=args.proc_rate_multiplier
    ON_USE_RATE_MULTIPLIER=args.on_use_rate_multiplier
    EFFECT_ILVL_WINDOW=args.effect_ilvl_window
    SOCKET_BONUS_RATE=args.socket_bonus_rate
    DISENCHANT_RATE=args.disenchant_rate
    MAX_SPECIAL_EFFECTS=args.max_special_effects
    if ui: ui.status('Loading spell, proc, set, socket, and disenchant catalogs')
    FEATURE_CATALOG=load_feature_catalogs(
        item_template_source,item_set_dbc_source,spell_dbc_source,spell_enchantment_dbc_source,
        disenchant_source,spell_proc_source,spell_script_names_source,
    ) if DISABLED_FEATURES != set(NEW_FEATURES) else empty_feature_catalog()
    if ui:
        ui.progress(2,2,current='Feature catalogs ready')
        ui.phase_done('Harvesting stock WotLK data')
    REFERENCE_CATALOG_AUDIT=catalog_audit
    CONTENT_MANIFEST=content_manifest
    TARGETED_PLAN=targeted_plan
    QUEST_TEMPLATE_SOURCE=quest_template_source
    QUEST_REWARD_ROWS=quest_reward_rows
    ENCOUNTER_SOURCE_CATALOG=encounter_source_catalog
    DEFAULT_ENCOUNTER_MANIFEST=default_encounter_manifest
    ENCOUNTER_SOURCE_PATHS=encounter_source_paths
    GAMEOBJECT_SOURCE_PATHS=gameobject_source_paths
    ACTIVE_CLASSES=selected
    TARGET_ITEM_COUNT=number
    CLASS_ITEM_COUNTS=counts
    OUT=ROOT / f'generated-{SEED}'
    SQLDIR=OUT / 'sql'
    return {
        'seed':SEED,'source':source,'output_dir':OUT,'number':TARGET_ITEM_COUNT,
        'class_name':args.class_name,'classes':[row[0] for row in ACTIVE_CLASSES],
        'content_manifest':CONTENT_MANIFEST,
        'quest_template_source':QUEST_TEMPLATE_SOURCE,
        'encounter_source_catalog':ENCOUNTER_SOURCE_CATALOG,
        'default_encounter_profile_count':0 if DEFAULT_ENCOUNTER_MANIFEST is None else len(DEFAULT_ENCOUNTER_MANIFEST['profiles']),
        'encounter_source_paths':ENCOUNTER_SOURCE_PATHS,
        'gameobject_source_paths':GAMEOBJECT_SOURCE_PATHS,
        'azerothcore_source_root':source_root,
        'class_counts':dict(CLASS_ITEM_COUNTS),'loot_chance':LOOT_CHANCE,
        'world_loot_source':WORLD_LOOT_SOURCE,'reference_loot_source':REFERENCE_LOOT_SOURCE,
        'item_template_source':ITEM_TEMPLATE_SOURCE,'item_dbc_sources':ITEM_DBC_SOURCES,
        'item_dbc_overwrite':ITEM_DBC_OVERWRITE,'reference_catalog_audit':REFERENCE_CATALOG_AUDIT,
        'item_set_dbc_source':ITEM_SET_DBC_SOURCE,'spell_dbc_source':SPELL_DBC_SOURCE,
        'spell_enchantment_dbc_source':SPELL_ENCHANTMENT_DBC_SOURCE,'disenchant_source':DISENCHANT_SOURCE,
        'spell_proc_source':SPELL_PROC_SOURCE,'spell_script_names_source':SPELL_SCRIPT_NAMES_SOURCE,
        'disabled_features':set(DISABLED_FEATURES),'set_rate':SET_RATE,'set_min_level':SET_MIN_LEVEL,
        'set_size':SET_SIZE,'spell_effect_rate_multiplier':SPELL_EFFECT_RATE_MULTIPLIER,
        'proc_rate_multiplier':PROC_RATE_MULTIPLIER,'on_use_rate_multiplier':ON_USE_RATE_MULTIPLIER,
        'effect_ilvl_window':EFFECT_ILVL_WINDOW,'socket_bonus_rate':SOCKET_BONUS_RATE,
        'disenchant_rate':DISENCHANT_RATE,'max_special_effects':MAX_SPECIAL_EFFECTS,
    }

DBC_HEADER=struct.Struct('<4s4I')
DBC_MAGIC=b'WDBC'
ITEM_SET_FIELD_COUNT=53
ITEM_SET_RECORD_SIZE=ITEM_SET_FIELD_COUNT*4

class ItemSetRow(tuple):
    def __new__(cls, values, name=''):
        row=super().__new__(cls, tuple(int(value) for value in values))
        row.name=str(name)
        return row

def _read_wdbc_records(path,expected_field_count=None,label='DBC'):
    path=Path(path).expanduser().resolve()
    data=path.read_bytes()
    if len(data)<DBC_HEADER.size:
        raise ValueError(f'{label} is shorter than its header: {path}')
    magic,record_count,field_count,record_size,string_block_size=DBC_HEADER.unpack_from(data)
    if magic!=DBC_MAGIC:
        raise ValueError(f'unsupported {label} magic {magic!r}: {path}')
    if expected_field_count is not None and field_count!=expected_field_count:
        raise ValueError(f'{label} field count is {field_count}, expected {expected_field_count}: {path}')
    if record_size!=field_count*4:
        raise ValueError(f'{label} record size is {record_size}, expected {field_count*4}: {path}')
    expected_size=DBC_HEADER.size+record_count*record_size+string_block_size
    if len(data)!=expected_size:
        raise ValueError(f'{label} size is {len(data)}, expected {expected_size}: {path}')
    rows={}
    offset=DBC_HEADER.size
    for _ in range(record_count):
        row=struct.unpack_from(f'<{field_count}I',data,offset)
        offset+=record_size
        if row[0] in rows:
            raise ValueError(f'{label} contains duplicate entry {row[0]}: {path}')
        rows[row[0]]=row
    return rows,data[offset:],field_count,record_size

def _read_item_set_dbc(path):
    rows,string_block,field_count,record_size=_read_wdbc_records(path,ITEM_SET_FIELD_COUNT,'ItemSet.dbc')
    if record_size!=ITEM_SET_RECORD_SIZE:
        raise ValueError(f'ItemSet.dbc record size is {record_size}, expected {ITEM_SET_RECORD_SIZE}: {path}')
    return rows,string_block

def _dbc_string(string_block,offset):
    if not offset or offset>=len(string_block):
        return ''
    end=string_block.find(b'\0',offset)
    if end<0:
        end=len(string_block)
    return string_block[offset:end].decode('utf-8','replace')

def item_set_row(set_id,name,item_ids,bonuses):
    item_ids=list(item_ids)
    if len(item_ids)>10:
        raise ValueError('ItemSet.dbc supports at most 10 item IDs in this AzerothCore layout')
    row=[0]*ITEM_SET_FIELD_COUNT
    row[0]=int(set_id)
    for index,item_id in enumerate(item_ids):
        row[18+index]=int(item_id)
    for index,(threshold,spell_id) in enumerate(bonuses):
        if index>=8:
            break
        row[35+index]=int(spell_id)
        row[43+index]=int(threshold)
    return ItemSetRow(row,name)

def merge_item_sets(source_path,generated_rows,output_path,overwrite=False):
    source_path=Path(source_path).expanduser().resolve()
    output_path=Path(output_path).expanduser().resolve()
    if output_path==source_path:
        raise ValueError('ItemSet.dbc output must not replace its source file')
    existing,string_block=_read_item_set_dbc(source_path)
    generated={}
    strings=bytearray(string_block)
    if not strings:
        strings.extend(b'\0')
    for raw_row in generated_rows:
        row=tuple(int(value) for value in raw_row)
        if len(row)!=ITEM_SET_FIELD_COUNT:
            raise ValueError(f'ItemSet.dbc row must contain {ITEM_SET_FIELD_COUNT} fields')
        if row[0] in generated:
            raise ValueError(f'generated ItemSet.dbc rows contain duplicate entry {row[0]}')
        name=getattr(raw_row,'name','')
        values=list(row)
        if name:
            offset=len(strings)
            strings.extend(str(name).encode('utf-8')+b'\0')
            for locale_index in range(1,17):
                values[locale_index]=offset
        generated[values[0]]=tuple(values)
    conflicts=sorted(entry for entry,row in generated.items() if entry in existing and existing[entry]!=row)
    if conflicts and not overwrite:
        sample=', '.join(map(str,conflicts[:20]))
        suffix='...' if len(conflicts)>20 else ''
        raise ValueError(f'ItemSet.dbc contains conflicting generated entries ({len(conflicts)}): {sample}{suffix}')
    merged=dict(existing)
    merged.update(generated)
    payload=b''.join(struct.pack(f'<{ITEM_SET_FIELD_COUNT}I',*merged[entry]) for entry in sorted(merged))
    output_path.parent.mkdir(parents=True,exist_ok=True)
    output_path.write_bytes(DBC_HEADER.pack(DBC_MAGIC,len(merged),ITEM_SET_FIELD_COUNT,ITEM_SET_RECORD_SIZE,len(strings))+payload+bytes(strings))
    return {
        'source_path':str(source_path),'source_row_count':len(existing),'generated_row_count':len(generated),
        'merged_row_count':len(merged),'overwritten_row_count':len(conflicts),'string_block_size':len(strings),
        'output':str(output_path),
    }

def empty_feature_catalog():
    return {
        'spells':{},'enchantments':{},'item_sets':{},'item_set_strings':b'',
        'effect_packages':[],'socket_bonuses':[],'disenchant_pairs':[],'stock_items':{},
        'proc_spells':set(),'script_spells':set(),'disenchant_ids':set(),
        'effect_index':defaultdict(list),'socket_index':defaultdict(list),'disenchant_index':defaultdict(list),'set_templates':[],
        'audit':{'effect_packages':0,'script_excluded':0,'proc_overrides':0,'socket_bonuses':0,'disenchant_pairs':0},
    }

ITEM_TEMPLATE_SPELL_BASE=65
ITEM_TEMPLATE_SPELL_WIDTH=7
ITEM_TEMPLATE_ITEMSET_INDEX=112
ITEM_TEMPLATE_SOCKET_COLOR_INDEX=118
ITEM_TEMPLATE_SOCKET_BONUS_INDEX=124
ITEM_TEMPLATE_REQUIRED_DISENCHANT_INDEX=126
ITEM_TEMPLATE_DISENCHANT_INDEX=132
SET_SLOT_INVENTORY_TYPES={'head':1,'shoulder':3,'chest':5,'hands':10,'legs':7}

def _sql_int(value,default=0):
    text=str(value).strip().strip('`')
    if text.upper() in ('NULL',''):
        return default
    try:
        return int(float(text))
    except (TypeError,ValueError):
        return default

def _sql_float(value,default=0.0):
    text=str(value).strip().strip('`')
    if text.upper() in ('NULL',''):
        return default
    try:
        return float(text)
    except (TypeError,ValueError):
        return default

def _load_sql_entry_rows(path):
    rows=[]
    with Path(path).open(encoding='utf-8') as source:
        for line in source:
            if not REFERENCE_ENTRY_RE.match(line):
                continue
            values=_split_sql_tuple(line)
            if values is not None:
                rows.append(values)
    return rows

def _scan_sql_tuples(text):
    rows=[]; start=None; depth=0; quoted=False; index=0
    while index<len(text):
        char=text[index]
        if quoted:
            if char=='\\': index+=2; continue
            if char=="'":
                if index+1<len(text) and text[index+1]=="'": index+=2; continue
                quoted=False
        elif char=="'": quoted=True
        elif char=='(':
            if depth==0: start=index
            depth+=1
        elif char==')' and depth:
            depth-=1
            if depth==0 and start is not None:
                values=_split_sql_tuple(text[start:index+1])
                if values is not None: rows.append(values)
                start=None
        index+=1
    return rows

def _load_sql_table_rows(path):
    path=Path(path)
    columns=[]; rows=[]; in_schema=False
    with path.open(encoding='utf-8') as source:
        for line in source:
            if re.search(r'CREATE\s+TABLE',line,re.IGNORECASE): in_schema=True
            elif in_schema and line.lstrip().startswith('`'):
                columns.append(line.split('`')[1])
            elif in_schema and 'ENGINE=' in line.upper():
                in_schema=False
            if line.lstrip().startswith('('):
                values=_split_sql_tuple(line)
                if values is not None: rows.append(values)
    if not rows:
        text=path.read_text(encoding='utf-8')
        match=re.search(r'INSERT\s+INTO.*?\bVALUES\b',text,re.IGNORECASE|re.DOTALL)
        if match: rows=_scan_sql_tuples(text[match.end():])
    if not columns or not rows: raise ValueError(f'could not read SQL table rows from {path}')
    if any(len(row)!=len(columns) for row in rows):
        mismatched=next(len(row) for row in rows if len(row)!=len(columns))
        raise ValueError(f'SQL table {path} row has {mismatched} values; schema has {len(columns)} columns')
    return columns,rows

def _sql_column_indexes(columns):
    return {str(name).strip('`').lower():index for index,name in enumerate(columns)}

def _sql_row_value(row,indexes,*names,default=None):
    for name in names:
        index=indexes.get(str(name).lower())
        if index is not None and index<len(row):
            return row[index]
    return default

def _dungeon_map_id(dungeon_maps,lfg_dungeon):
    row=dungeon_maps.get(int(lfg_dungeon))
    if isinstance(row,dict):
        return _sql_int(row.get('map_id'),None)
    if isinstance(row,(tuple,list)) and len(row)>1:
        return _sql_int(row[1],None)
    return None

def load_encounter_source_catalog(map_path,map_difficulty_path,dungeon_map_path,creature_path,creature_template_path,instance_encounters_path,creature_loot_path,reference_loot_path,*,item_template_path=None,gameobject_path=None,gameobject_template_path=None,gameobject_loot_path=None):
    if any(path is not None for path in (gameobject_path,gameobject_template_path,gameobject_loot_path)) and not all(path is not None for path in (gameobject_path,gameobject_template_path,gameobject_loot_path)):
        raise ValueError('gameobject source paths must be supplied together')
    map_rows,map_strings,_,_=_read_wdbc_records(map_path,label='Map.dbc')
    difficulty_rows,_,_,_=_read_wdbc_records(map_difficulty_path,label='MapDifficulty.dbc')
    dungeon_rows,_,_,_=_read_wdbc_records(dungeon_map_path,label='DungeonMap.dbc')
    maps={entry:{'id':entry,'directory':_dbc_string(map_strings,row[1]),'map_type':row[2],'instance_type':row[3],
                 'expansion':_sql_int(row[63],None) if len(row)>63 else None} for entry,row in map_rows.items()}
    difficulties={(row[1],row[2]):{'id':row[0],'map_id':row[1],'difficulty_id':row[2],'max_players':row[21],'item_level':row[22]} for row in difficulty_rows.values() if len(row)>=23}
    template_columns,template_rows=_load_sql_table_rows(creature_template_path); template_index=_sql_column_indexes(template_columns)
    creature_templates={_sql_int(row[template_index['entry']]):{'entry':_sql_int(row[template_index['entry']]),'name':str(row[template_index['name']]).strip("'").replace("''","'"),'lootid':_sql_int(row[template_index['lootid']]),
                        'difficulty_entries':tuple(_sql_int(row[template_index[f'difficulty_entry_{index}']],0) for index in (1,2,3)),
                        'minlevel':_sql_int(row[template_index['minlevel']],1) if 'minlevel' in template_index else 1,
                        'maxlevel':_sql_int(row[template_index['maxlevel']],80) if 'maxlevel' in template_index else 80} for row in template_rows}
    creature_columns,creature_rows=_load_sql_table_rows(creature_path); creature_index=_sql_column_indexes(creature_columns)
    creature_maps=defaultdict(set)
    for row in creature_rows: creature_maps[_sql_int(row[creature_index['id']])].add(_sql_int(row[creature_index['map']]))
    encounter_columns,encounter_rows=_load_sql_table_rows(instance_encounters_path); encounter_index=_sql_column_indexes(encounter_columns)
    encounters={_sql_int(row[encounter_index['entry']]):{'credit_type':_sql_int(row[encounter_index['credittype']]),'credit_entry':_sql_int(row[encounter_index['creditentry']]),'last_encounter_dungeon':_sql_int(row[encounter_index['lastencounterdungeon']]),'comment':str(row[encounter_index['comment']]).strip("'").replace("''","'")} for row in encounter_rows}
    creature_loot_columns,creature_loot_rows=_load_sql_table_rows(creature_loot_path)
    reference_loot_columns,reference_loot_rows=_load_sql_table_rows(reference_loot_path)

    stock_items={}
    if item_template_path is not None:
        for fields in _load_sql_entry_rows(item_template_path):
            meta=_stock_item_metadata(fields)
            if meta is not None: stock_items[meta['entry']]=meta

    gameobject_templates={}; gameobject_spawns=[]; gameobject_maps=defaultdict(set); gameobject_loot_columns=[]; gameobject_loot_rows=[]
    if gameobject_path is not None:
        gameobject_template_columns,gameobject_template_rows=_load_sql_table_rows(gameobject_template_path)
        gameobject_template_index=_sql_column_indexes(gameobject_template_columns)
        for row in gameobject_template_rows:
            entry=_sql_int(_sql_row_value(row,gameobject_template_index,'entry'),-1)
            if entry<0: continue
            gameobject_templates[entry]={'entry':entry,
                                         'name':str(_sql_row_value(row,gameobject_template_index,'name') or '').strip("'").replace("''", "'"),
                                         'type':_sql_int(_sql_row_value(row,gameobject_template_index,'type')),
                                         'lootid':_sql_int(_sql_row_value(row,gameobject_template_index,'data1'))}
        gameobject_columns,gameobject_rows=_load_sql_table_rows(gameobject_path)
        gameobject_index=_sql_column_indexes(gameobject_columns)
        for row in gameobject_rows:
            entry=_sql_int(_sql_row_value(row,gameobject_index,'id','entry'),-1)
            map_id=_sql_int(_sql_row_value(row,gameobject_index,'map','mapid'),-1)
            if entry>=0 and map_id>=0:
                gameobject_maps[entry].add(map_id)
                gameobject_spawns.append({'guid':_sql_int(_sql_row_value(row,gameobject_index,'guid')),
                                          'id':entry, 'map':map_id,
                                          'spawn_mask':_sql_int(_sql_row_value(row,gameobject_index,'spawnmask','spawn_mask'),1)})
        gameobject_loot_columns,gameobject_loot_rows=_load_sql_table_rows(gameobject_loot_path)

    return {'maps':maps,'map_difficulties':difficulties,'dungeon_maps':dungeon_rows,'creature_templates':creature_templates,
            'creature_maps':creature_maps,'instance_encounters':encounters,
            'creature_loot_columns':creature_loot_columns,'creature_loot_rows':creature_loot_rows,
            'reference_loot_columns':reference_loot_columns,'reference_loot_rows':reference_loot_rows,
            'creature_loot_entries':{_sql_int(row[0]) for row in creature_loot_rows},
            'reference_loot_entries':{_sql_int(row[0]) for row in reference_loot_rows},
            'gameobject_templates':gameobject_templates,'gameobject_spawns':gameobject_spawns,'gameobject_maps':gameobject_maps,
            'supported_gameobject_entries':{entry for entry, template in gameobject_templates.items()
                                            if template.get('type') == 3 and template.get('lootid', 0) > 0},
            'gameobject_loot_columns':gameobject_loot_columns,'gameobject_loot_rows':gameobject_loot_rows,
            'gameobject_loot_entries':{_sql_int(row[0]) for row in gameobject_loot_rows},
            'stock_items':stock_items,
            'source_audit':{'gameobject_source_paths':[str(path) for path in (gameobject_path,gameobject_template_path,gameobject_loot_path) if path is not None],
                            'map_count':len(maps),'map_difficulty_count':len(difficulties),
                            'creature_template_count':len(creature_templates),'spawn_creature_count':len(creature_maps),
                            'difficulty_template_count':sum(any(template.get('difficulty_entries',())) for template in creature_templates.values()),
                            'instance_encounter_count':len(encounters),'gameobject_template_count':len(gameobject_templates),
                            'gameobject_count':len(gameobject_maps),'stock_item_count':len(stock_items),
                            'reference_consumer_count':0,'reference_consumer_map_count':0,
                            'reference_consumer_profile_count':0,
                            'reference_provenance_count':0,
                            'gameobject_support':'exercised' if gameobject_path is not None else 'not_exercised',
                            'script_reward_mapping':'not_exercised'}}

def loot_mode_for_difficulty(map_type=None,difficulty_id=None):
    if map_type is not None and int(map_type) not in (1,2):
        raise ValueError(f'loot modes only support dungeon or raid maps: {map_type}')
    difficulty=0 if difficulty_id is None else int(difficulty_id)
    if not 0<=difficulty<=15:
        raise ValueError(f'unsupported map difficulty for loot mode: {difficulty}')
    return 1<<difficulty

def _item_level_bounds_for_required_level(required_level):
    required_level=max(1,min(80,int(required_level)))
    if required_level<58: return required_level+1,required_level+8
    if required_level<68:
        base=80+(required_level-58)*3.8
        return int(base),int(base+5.999999)
    if required_level<75:
        base=112+(required_level-68)*7
        return int(base),int(base+8.999999)
    if required_level<80:
        base=160+(required_level-75)*7
        return int(base),int(base+10.999999)
    return 187,284

def _item_level_band_for_creatures(creature_templates):
    ranges=[]
    for template in creature_templates:
        minimum=template.get('minlevel'); maximum=template.get('maxlevel')
        if minimum is None and maximum is None: continue
        minimum=max(1,min(80,int(minimum or 1))); maximum=max(minimum,min(80,int(maximum or minimum)))
        ranges.append((_item_level_bounds_for_required_level(minimum)[0],_item_level_bounds_for_required_level(maximum)[1]))
    if not ranges: return 1,284
    return min(row[0] for row in ranges),max(row[1] for row in ranges)

def _difficulty_label(map_row,difficulty_id,max_players=None):
    difficulty_id=int(difficulty_id)
    if map_row.get('map_type')==1:
        return 'normal' if difficulty_id==0 else 'heroic' if difficulty_id==1 else f'dungeon_{difficulty_id}'
    players=int(max_players or 0)
    size=str(players) if players else 'unknown'
    mode='heroic' if difficulty_id>=2 else 'normal'
    return f'raid_{size}_{mode}'

def rebuild_encounter_prerequisites(encounters):
    previous=None
    for encounter in encounters:
        encounter.pop('requires',None)
        if encounter.get('kind')!='boss': continue
        if previous: encounter['requires']=[previous]
        previous=encounter['id']
    return encounters

def resolve_creature_template_for_difficulty(catalog,base_entry,difficulty_id):
    base=catalog.get('creature_templates',{}).get(int(base_entry))
    if base is None: return None,None,'missing_base_template'
    difficulty_id=int(difficulty_id or 0)
    if difficulty_id<=0: return base,int(base_entry),'base'
    entries=tuple(base.get('difficulty_entries',()))
    variant=entries[difficulty_id-1] if difficulty_id-1<len(entries) else 0
    if not variant: return base,int(base_entry),'base_shared'
    template=catalog.get('creature_templates',{}).get(int(variant))
    if template is None: return None,int(variant),f'missing_difficulty_entry_{difficulty_id}'
    return template,int(variant),f'difficulty_entry_{difficulty_id}'

def gameobject_support_state(catalog):
    audit=catalog.get('source_audit',{})
    return 'exercised' if audit.get('gameobject_source_paths') or catalog.get('gameobject_templates') else 'not_exercised'

def discover_gameobject_reward_targets(catalog, map_id=None, difficulty_id=None):
    """Return the auditable static reward-object candidates, fail-closed."""
    rows=[]
    requested_map=None if map_id is None else int(map_id)
    requested_difficulty='' if difficulty_id is None else int(difficulty_id)
    encounters=catalog.get('instance_encounters',{})
    dungeon_maps=catalog.get('dungeon_maps',{})
    for spawn in catalog.get('gameobject_spawns',()):
        entry=int(spawn.get('id',0)); template=catalog.get('gameobject_templates',{}).get(entry)
        if not template or int(template.get('type',0))!=3: continue
        loot_entry=int(template.get('lootid') or 0)
        if loot_entry<=0 or loot_entry not in catalog.get('gameobject_loot_entries',set()): continue
        spawn_map=int(spawn.get('map',-1))
        if requested_map is not None and spawn_map!=requested_map: continue
        matches=[]
        for encounter_entry, encounter in encounters.items():
            if int(encounter.get('credit_type',0))!=1 or int(encounter.get('credit_entry',-1))!=entry: continue
            resolved=_dungeon_map_id(dungeon_maps,encounter.get('last_encounter_dungeon',0))
            if resolved==spawn_map: matches.append((int(encounter_entry),encounter))
        script_matches=[mapping for mapping in catalog.get('script_reward_mappings',())
                        if int(mapping.get('gameobject_entry',-1))==entry]
        source_path=';'.join(catalog.get('source_audit',{}).get('gameobject_source_paths') or ())
        base={'profile_id':f'map_{spawn_map}_difficulty_{requested_difficulty}' if requested_map is not None else '',
              'map_id':spawn_map,'difficulty_id':requested_difficulty,'gameobject_entry':entry,
              'gameobject_name':template.get('name',''),'loot_entry':loot_entry,
              'spawn_guid':int(spawn.get('guid',0)),'spawn_mask':int(spawn.get('spawn_mask',1)),
              'direct_item_count':0,'reference_item_count':0,'association_source':source_path}
        if matches:
            for encounter_entry,encounter in matches:
                row=dict(base)
                row.update({'encounter_id':f'boss_{encounter_entry:06d}',
                            'encounter_name':encounter.get('comment',''),
                            'association_method':'explicit_instance_mapping',
                            'association_source':source_path,
                            'valid':True,'invalid_reason':''})
                rows.append(row)
            for script in script_matches:
                identifier=re.sub(r'[^A-Za-z0-9_]+','_',str(script.get('encounter_identifier') or 'reward'))
                row=dict(base)
                row.update({'encounter_id':f'script_{identifier}',
                            'encounter_name':script.get('encounter_identifier',''),
                            'association_method':'script_summon','valid':True,
                            'association_source':';'.join(filter(None,(source_path,script.get('source_path','')))),
                            'difficulty_condition':script.get('difficulty_condition',''),
                            'evidence_type':script.get('evidence_type','')})
                rows.append(row)
            continue
        if script_matches:
            for script in script_matches:
                identifier=re.sub(r'[^A-Za-z0-9_]+','_',str(script.get('encounter_identifier') or 'reward'))
                row=dict(base)
                row.update({'encounter_id':f'script_{identifier}',
                            'encounter_name':script.get('encounter_identifier',''),
                            'association_method':'script_summon','valid':True,
                            'association_source':';'.join(filter(None,(source_path,script.get('source_path','')))),
                            'difficulty_condition':script.get('difficulty_condition',''),
                            'evidence_type':script.get('evidence_type','')})
                rows.append(row)
            continue
        else:
            base.update({'encounter_id':'','encounter_name':'','association_method':'static_spawn',
                         'valid':False,'invalid_reason':'static map/spawn has no boss association'})
        rows.append(base)
    return rows

def discover_script_reward_mappings(source_root, catalog):
    """Find explicit completion-path summons; file-level symbol co-occurrence is insufficient."""
    if source_root is None: return [], 'not_exercised'
    root=Path(source_root)
    scan_root=root/'src'/'server'/'scripts' if (root/'src'/'server'/'scripts').is_dir() else root
    files=[path for path in scan_root.rglob('*') if path.is_file() and path.suffix.lower() in {'.cpp','.h','.hpp','.cc','.c'}]
    constants={}
    templates=catalog.get('gameobject_templates',{})
    text_by_file=[]
    for path in files:
        text=path.read_text(encoding='utf-8',errors='ignore'); text_by_file.append((path,text))
        for name,value in re.findall(r'\b(GO_[A-Za-z0-9_]+)\s*=\s*(\d+)',text): constants[name]=int(value)
        for name,value in re.findall(r'\b(?:const(?:ant)?\s+)?(?:uint\w*|int)\s+(GO_[A-Za-z0-9_]+)\s*=\s*(\d+)',text):
            constants[name]=int(value)
    mappings=[]
    for path,text in text_by_file:
        for match in re.finditer(r'\b(?:SummonGameObject|SummonGameobject|summonGameObject)\s*\(\s*([^,)]+)',text):
            prefix=text[:match.start()]
            openings=[candidate for candidate in re.finditer(r'([A-Za-z_]\w*(?:::\w+)*)\s*\([^{};]*\)\s*\{',prefix)
                      if candidate.group(1) not in {'if','for','while','switch','catch'}]
            if not openings: continue
            function=openings[-1]; opening=text.find('{',function.start(),function.end())
            depth=0; end=None
            for index in range(opening,len(text)):
                if text[index]=='{': depth+=1
                elif text[index]=='}':
                    depth-=1
                    if depth==0: end=index; break
            if end is None or not opening<match.start()<end: continue
            block=text[opening+1:match.start()]
            control_conditions=list(re.finditer(r'\bif\s*\(([^{}]*)\)',block,re.S))
            if control_conditions:
                if not re.search(r'\bDONE\b',control_conditions[-1].group(1)):
                    if not re.search(r'SetBossState\s*\([^;{}]*\bDONE\b',block): continue
            elif not re.search(r'(?:SetBossState\s*\([^;{}]*\bDONE\b|\bstate\s*==\s*DONE\b|\bDONE\b\s*==\s*state)',block):
                continue
            token=match.group(1).strip(); entry=constants.get(token)
            if entry is None and token.isdigit(): entry=int(token)
            template=templates.get(entry,{}) if entry is not None else {}
            if entry is None or int(template.get('type',0))!=3 or int(template.get('lootid') or 0) not in catalog.get('gameobject_loot_entries',set()): continue
            condition=''
            visible_lines=[line.strip() for line in block.splitlines()
                           if 'difficulty' in line.lower() and ('if' in line or '==' in line)]
            if visible_lines: condition=visible_lines[-1]
            mappings.append({'source_path':str(path.relative_to(root) if path.is_relative_to(root) else path),
                             'encounter_identifier':function.group(1),'gameobject_entry':entry,
                             'difficulty_condition':condition,'evidence_type':'SummonGameObject completion path'})
    return mappings, 'exercised'

def _merge_stock_evidence(evidences,source_kind='profile_aggregate',encounter_kind='profile'):
    usable=[evidence for evidence in evidences if evidence and evidence.get('item_level_min') is not None]
    if not usable:
        return infer_safe_band((),source_kind,encounter_kind) | {
            'required_levels':(), 'qualities':(), 'item_count':0,
            'direct_item_count':0, 'reference_item_count':0,
            'rejected_reference_count':sum(e.get('rejected_reference_count',0) for e in evidences),
            'reference_provenance':[row for evidence in evidences for row in evidence.get('reference_provenance',())],
            '_stock_item_records':tuple(row for evidence in evidences for row in evidence.get('_stock_item_records',())),
            '_candidate_item_records':tuple(row for evidence in evidences for row in evidence.get('_candidate_item_records',())),
            'quality_counts':{}, 'dominant_quality':None,
            'candidate_clusters':[], 'required_clusters':[],
            'rejections':[row for evidence in evidences for row in evidence.get('rejections',())],
            'required_level_min':None,'required_level_max':None,
        }
    candidate_records=[row for evidence in usable for row in evidence.get('_candidate_item_records',())]
    levels=[row.get('item_level') for row in candidate_records] or [level for evidence in usable for level in evidence.get('retained_item_levels',())]
    required=[level for evidence in usable for level in evidence.get('required_levels',())]
    candidate_required=[row.get('required_level') for row in candidate_records if int(row.get('required_level',0))>0]
    prefer_high=encounter_kind.startswith('raid')
    required_clusters=progression_clusters(candidate_required or required,3,prefer_high=prefer_high)
    required=_dominant_progression_cluster(required,3,prefer_high=prefer_high)
    qualities=sorted({quality for evidence in usable for quality in evidence.get('qualities',())})
    quality_counts=defaultdict(int)
    for evidence in usable:
        for quality,count in evidence.get('quality_counts',{}).items():
            quality_counts[int(quality)]+=int(count)
    band=infer_safe_band(levels,source_kind,encounter_kind,prefer_high=prefer_high)
    band.update({'required_levels':tuple(sorted(required)),'qualities':tuple(qualities),
                 'item_count':sum(evidence.get('item_count',0) for evidence in usable),
                 'direct_item_count':sum(evidence.get('direct_item_count',0) for evidence in usable),
                 'reference_item_count':sum(evidence.get('reference_item_count',0) for evidence in usable),
                 'rejected_reference_count':sum(evidence.get('rejected_reference_count',0) for evidence in evidences),
                 'reference_provenance':[row for evidence in evidences for row in evidence.get('reference_provenance',())],
                 'quality_counts':dict(sorted(quality_counts.items())),
                 'dominant_quality':max(quality_counts,key=lambda quality:(quality_counts[quality],quality)) if quality_counts else None,
                 'candidate_clusters':band.get('candidate_clusters',()),
                 'required_clusters':required_clusters,
                 '_stock_item_records':tuple(row for evidence in evidences for row in evidence.get('_stock_item_records',())),
                 '_candidate_item_records':tuple(row for evidence in evidences for row in evidence.get('_candidate_item_records',())),
                 'rejections':[row for evidence in evidences for row in evidence.get('rejections',())],
                 'required_level_min':min(required) if required else None,
                 'required_level_max':max(required) if required else None})
    return band

def build_default_encounter_manifest(catalog,additional_drop_chance=2.0):
    profiles=[]; coverage=[]
    catalog['gameobject_reward_targets']=discover_gameobject_reward_targets(catalog)
    source_evidence_enabled='stock_items' in catalog and 'creature_loot_rows' in catalog
    dungeon_or_raid_maps={map_id:row for map_id,row in catalog['maps'].items()
                          if row.get('map_type') in (1,2)}
    boss_entries=defaultdict(list)
    for encounter_entry,encounter in sorted(catalog['instance_encounters'].items()):
        credit_type=int(encounter.get('credit_type',0)); credit_entry=int(encounter['credit_entry'])
        if credit_type==0:
            template=catalog['creature_templates'].get(credit_entry)
            if not template: continue
            target_type='creature'; target_entry=credit_entry
            candidate_maps=set(catalog['creature_maps'].get(credit_entry,set()))
        elif credit_type==1:
            audit_id=f'boss_{int(encounter_entry):06d}'
            audit_rows=[row for row in catalog.get('gameobject_reward_targets',())
                        if row.get('encounter_id')==audit_id and row.get('valid')]
            if not audit_rows: continue
            target_type='gameobject'; target_entry=credit_entry
            candidate_maps={int(row['map_id']) for row in audit_rows}
        else:
            continue
        if credit_type==0 and not candidate_maps and encounter.get('last_encounter_dungeon'):
            mapped=_dungeon_map_id(catalog.get('dungeon_maps',{}),encounter['last_encounter_dungeon'])
            if mapped is not None: candidate_maps.add(mapped)
        for map_id in sorted(candidate_maps):
            if map_id in dungeon_or_raid_maps:
                boss_entries[map_id].append((int(encounter_entry),target_type,target_entry))
    for row in catalog.get('gameobject_reward_targets',()):
        if not row.get('valid') or row.get('association_method') not in ('script_summon','explicit_instance_mapping'):
            continue
        map_id=int(row['map_id'])
        if map_id in dungeon_or_raid_maps:
            key=row['encounter_id']
            boss_entries[map_id].append((key,'gameobject',int(row['gameobject_entry'])))

    for map_id,map_row in sorted(dungeon_or_raid_maps.items()):
        difficulty_ids=sorted(difficulty_id for current_map,difficulty_id in catalog['map_difficulties'] if current_map==map_id)
        if not difficulty_ids: difficulty_ids=[0]
        for difficulty_id in difficulty_ids:
            loot_by_entry={}
            for creature_entry,maps in catalog['creature_maps'].items():
                if map_id not in maps: continue
                template,effective_entry,resolution=resolve_creature_template_for_difficulty(catalog,creature_entry,difficulty_id)
                if not template: continue
                loot_entry=int(template.get('lootid') or creature_entry)
                if loot_entry in catalog['creature_loot_entries']:
                    loot_by_entry.setdefault(loot_entry,{'source_creature_entry':int(creature_entry),
                                                         'creature_entry':int(effective_entry),
                                                         'template':template,'resolution':resolution})
            bosses=[]; boss_loot=set()
            resolution_evidence=[]
            for encounter_entry,target_type,target_entry in boss_entries.get(map_id,()):
                if target_type=='creature':
                    template,effective_entry,resolution=resolve_creature_template_for_difficulty(catalog,target_entry,difficulty_id)
                    if template is None:
                        resolution_evidence.append({'encounter_entry':encounter_entry,'base_creature_entry':target_entry,
                                                    'effective_creature_entry':effective_entry,'resolution':resolution})
                        continue
                    loot_entry=int(template.get('lootid') or 0)
                    if loot_entry not in catalog['creature_loot_entries']:
                        resolution_evidence.append({'encounter_entry':encounter_entry,'base_creature_entry':target_entry,
                                                    'effective_creature_entry':effective_entry,'resolution':'missing_usable_loot'})
                        continue
                else:
                    template=catalog.get('gameobject_templates',{}).get(target_entry,{})
                    effective_entry=target_entry; resolution='gameobject_source'
                    loot_entry=int(template.get('lootid') or 0)
                    if loot_entry not in catalog.get('gameobject_loot_entries',set()): continue
                if target_type=='gameobject':
                    association_key=encounter_entry
                    if isinstance(association_key,str):
                        match=re.fullmatch(r'boss_(\d+)',association_key)
                        if match: association_key=int(match.group(1))
                    boss_key=(target_type,loot_entry,association_key)
                else:
                    boss_key=(target_type,loot_entry)
                if boss_key in boss_loot: continue
                boss_loot.add(boss_key)
                bosses.append({'encounter_entry':encounter_entry,'target_type':target_type,
                               'source_entry':target_entry,'effective_entry':effective_entry,
                               'loot_entry':loot_entry,'template':template,'resolution':resolution})
            trash=[{'type':'creature','entry':loot_entry,'creature_entry':record['creature_entry']}
                   for loot_entry,record in sorted(loot_by_entry.items())
                   if ('creature',loot_entry) not in boss_loot]
            for target in trash:
                record=loot_by_entry[target['entry']]
                target['source_creature_entry']=record['source_creature_entry']
                target['effective_creature_entry']=record['creature_entry']
                target['difficulty_resolution']=record['resolution']
                resolution_evidence.append({'target_type':'creature','source_creature_entry':record['source_creature_entry'],
                                            'effective_creature_entry':record['creature_entry'],'loot_entry':target['entry'],
                                            'resolution':record['resolution']})
            item_level_min,item_level_max=_item_level_band_for_creatures(
                record['template'] for record in loot_by_entry.values())
            loot_mode=loot_mode_for_difficulty(map_row.get('map_type'),difficulty_id)
            encounter_specs=[]
            if trash: encounter_specs.append(('trash','trash',1,trash,()))
            previous=None
            for boss in bosses:
                encounter_entry=boss['encounter_entry']; target_type=boss['target_type']; loot_entry=boss['loot_entry']
                encounter_id=encounter_entry if isinstance(encounter_entry,str) else f'boss_{encounter_entry:06d}'
                target={'type':target_type,'entry':loot_entry}
                if target_type=='creature':
                    target['creature_entry']=boss['effective_entry']
                    target['effective_creature_entry']=boss['effective_entry']
                    target['source_creature_entry']=boss['source_entry']
                else:
                    target['gameobject_entry']=boss['effective_entry']
                target['difficulty_resolution']=boss['resolution']
                resolution_evidence.append({'target_type':target_type,'source_entry':boss['source_entry'],
                                            'effective_entry':boss['effective_entry'],'loot_entry':loot_entry,
                                            'resolution':boss['resolution']})
                encounter_specs.append((encounter_id,'boss',3,
                                        [target],
                                        (previous,) if previous else ()))
                previous=encounter_id

            encounters=[]; profile_evidence=None; profile_exclusion_reason=''
            if source_evidence_enabled:
                for encounter_id,kind,weight,targets,requires in encounter_specs:
                    target_evidence=[]
                    for target in targets:
                        context={'map_id':map_id,'difficulty_id':difficulty_id,'loot_mode':loot_mode}
                        context['difficulty_template_source']=str(target.get('difficulty_resolution','')).startswith('difficulty_entry_')
                        if target.get('type')=='creature':
                            template=catalog.get('creature_templates',{}).get(int(target.get('effective_creature_entry',target.get('creature_entry',target.get('entry',0)))),{})
                            context['creature_level_min']=template.get('minlevel')
                            context['creature_level_max']=template.get('maxlevel')
                        target_evidence.append((target,collect_target_stock_evidence(catalog,context,target)))
                    valid_targets=[target for target,evidence in target_evidence if evidence.get('valid')]
                    evidences=[evidence for target,evidence in target_evidence if evidence.get('valid')]
                    if not evidences: continue
                    source_kind='direct' if any(evidence.get('band_source')=='direct' for evidence in evidences) else 'encounter_reference'
                    evidence=_merge_stock_evidence(evidences,source_kind,kind)
                    encounter={'id':encounter_id,'kind':kind,'weight':weight,
                               'targets':valid_targets,'evidence':evidence}
                    if evidence.get('item_level_min') is not None:
                        encounter['item_level']=[evidence['item_level_min'],evidence['item_level_max']]
                        encounter['required_level_min']=evidence.get('required_level_min')
                        encounter['required_level_max']=evidence.get('required_level_max')
                    if requires and not source_evidence_enabled: encounter['requires']=list(requires)
                    encounters.append(encounter)
                rebuild_encounter_prerequisites(encounters)
                boss_encounters=[encounter for encounter in encounters if encounter.get('kind')=='boss']
                if map_row.get('map_type')==2 and not boss_encounters:
                    encounters=[]; profile_exclusion_reason='raid has no usable boss or reward evidence'
                else:
                    profile_sources=[encounter.get('evidence') for encounter in (boss_encounters if map_row.get('map_type')==2 else encounters)]
                    profile_kind='direct' if any(evidence.get('band_source')=='direct' for evidence in profile_sources) else 'encounter_reference' if any(evidence.get('band_source')=='encounter_reference' for evidence in profile_sources) else 'profile_aggregate'
                    profile_evidence=_merge_stock_evidence(profile_sources,profile_kind,'raid_profile' if map_row.get('map_type')==2 else 'profile')
                    if profile_evidence.get('item_level_min') is None:
                        encounters=[]; profile_exclusion_reason='no usable stock equipment loot'
                    else:
                        active_item_min=profile_evidence.get('item_level_min'); active_item_max=profile_evidence.get('item_level_max')
                        active_req_min=profile_evidence.get('required_level_min'); active_req_max=profile_evidence.get('required_level_max')
                        retained=[]
                        for encounter in encounters:
                            evidence=encounter.get('evidence') or {}
                            if (evidence.get('item_level_min') is not None and evidence.get('item_level_min')>=active_item_min and evidence.get('item_level_max')<=active_item_max
                                    and evidence.get('required_level_min') is not None and active_req_min is not None
                                    and evidence.get('required_level_min')>=active_req_min and evidence.get('required_level_max')<=active_req_max):
                                retained.append(encounter)
                            else:
                                profile_evidence.setdefault('rejections',[]).append({'encounter':encounter.get('id'),'reason':'mixed progression cluster excluded'})
                                cluster=profile_evidence.get('progression_cluster')
                                if cluster:
                                    cluster['rejected']=tuple(sorted(set(cluster.get('rejected',())) | {
                                        value for value in (evidence.get('retained_item_levels') or evidence.get('item_levels') or ())
                                        if value<active_item_min or value>active_item_max
                                    }))
                        encounters=retained
                        if not encounters:
                            profile_evidence=None; profile_exclusion_reason='no encounters remain after progression cluster filtering'
                        else:
                            progression_cluster=profile_evidence.get('progression_cluster')
                            progression_rejections=profile_evidence.get('rejections',())
                            profile_sources=[encounter.get('evidence') for encounter in ([(e) for e in encounters if e.get('kind')=='boss'] if map_row.get('map_type')==2 else encounters)]
                            profile_evidence=_merge_stock_evidence(profile_sources,profile_kind,'raid_profile' if map_row.get('map_type')==2 else 'profile')
                            profile_evidence['progression_cluster']=progression_cluster
                            profile_evidence['rejections']=list(progression_rejections)+list(profile_evidence.get('rejections',()))
                            rebuild_encounter_prerequisites(encounters)
            else:
                if trash:
                    encounters.append({'id':'trash','kind':'trash','weight':1,'item_level':[item_level_min,item_level_max],'targets':trash})
                for encounter_id,kind,weight,targets,requires in encounter_specs:
                    if encounter_id=='trash': continue
                    encounter={'id':encounter_id,'kind':kind,'weight':weight,'item_level':[item_level_min,item_level_max],
                               'targets':targets}
                    if requires: encounter['requires']=list(requires)
                    encounters.append(encounter)
            gameobject_reward_unexercised=(gameobject_support_state(catalog)=='not_exercised' and any(
                int(row.get('credit_type',0))==1 and _dungeon_map_id(catalog.get('dungeon_maps',{}),row.get('last_encounter_dungeon',0))==map_id
                for row in catalog.get('instance_encounters',{}).values()))
            coverage_row={'map_id':map_id,'map_name':map_row.get('directory',str(map_id)),
                          'instance_type':map_row.get('instance_type'),'map_type':map_row.get('map_type'),
                          'expansion':map_row.get('expansion'),
                          'difficulty_id':difficulty_id,
                          'difficulty_label':_difficulty_label(map_row,difficulty_id,
                                                               catalog['map_difficulties'].get((map_id,difficulty_id),{}).get('max_players')),
                          'profile_created':bool(encounters),'boss_count':len(bosses),
                          'trash_target_count':len(trash),'stock_loot_item_count':0,
                          'stock_direct_item_count':0,'stock_reference_item_count':0,
                          'rejected_reference_count':0,
                          'difficulty_resolution':resolution_evidence,
                          'excluded_reason':profile_exclusion_reason or ('' if encounters else 'gameobject reward source not_exercised' if (gameobject_reward_unexercised or (gameobject_support_state(catalog)=='not_exercised' and not bosses and not trash)) else 'no encounter targets')}
            if source_evidence_enabled and profile_evidence is not None:
                coverage_row.update({'stock_loot_item_count':profile_evidence.get('item_count',0),
                                     'stock_direct_item_count':profile_evidence.get('direct_item_count',0),
                                     'stock_reference_item_count':profile_evidence.get('reference_item_count',0),
                                     'rejected_reference_count':profile_evidence.get('rejected_reference_count',0)})
                if not encounters and not coverage_row['excluded_reason']:
                    coverage_row['excluded_reason']='no usable stock equipment loot'
            coverage.append(coverage_row)
            if not encounters: continue
            profile_id=f'map_{map_id}_difficulty_{difficulty_id}'
            if source_evidence_enabled:
                item_level_min=profile_evidence['item_level_min']; item_level_max=profile_evidence['item_level_max']
            profiles.append({'id':profile_id,'instance':map_row.get('directory',profile_id),
                             'difficulty_id':difficulty_id,'map_id':map_id,'map_type':map_row.get('map_type'),
                             'map_name':map_row.get('directory',profile_id),'instance_type':map_row.get('instance_type'),
                             'expansion':map_row.get('expansion'),
                             'difficulty_label':coverage_row['difficulty_label'],'valid':True,'invalid_reason':'',
                             'loot_mode':loot_mode,'item_level_min':item_level_min,'item_level_max':item_level_max,
                             'required_level_min':profile_evidence.get('required_level_min') if profile_evidence else None,
                             'required_level_max':profile_evidence.get('required_level_max') if profile_evidence else None,
                             'qualities':profile_evidence.get('qualities',()) if profile_evidence else (),
                             'difficulty_resolution':resolution_evidence,
                             'evidence':profile_evidence,'additional_drop_chance':float(additional_drop_chance),
                             'encounters':encounters})
    profiles,difficulty_comparisons,sibling_conflicts=apply_sibling_progression_coherence(profiles)
    manifest={'version':1,'profiles':profiles,'coverage':coverage,'difficulty_comparisons':difficulty_comparisons,
              'sibling_conflicts':sibling_conflicts,
              'gameobject_reward_targets':catalog.get('gameobject_reward_targets',()),'recipes':[],'quest_targets':[],
              'source_audit':dict(catalog.get('source_audit',{}))}
    validate_content_manifest(manifest)
    validate_targeted_source_membership(manifest,catalog)
    return manifest

def _clear_encounter_metadata(item):
    for key in ('content_profile','content_target','target_kind','placement_score','placement_reason','placement_band_source'):
        item.pop(key,None)

def _encounter_source_evidence(profile,encounter):
    return encounter.get('evidence') or profile.get('evidence') or {}

def encounter_item_eligibility(item,profile,encounter,resolved=None):
    resolved=resolved or resolve_encounter_order(profile)
    if not encounter.get('targets'): return False
    lo,hi=encounter_item_level_band(profile,encounter,resolved)
    item_level=int(item.get('ItemLevel',item.get('item_level',0)))
    if not lo<=item_level<=hi: return False
    evidence=_encounter_source_evidence(profile,encounter)
    req_min=encounter.get('required_level_min',evidence.get('required_level_min',profile.get('required_level_min')))
    req_max=encounter.get('required_level_max',evidence.get('required_level_max',profile.get('required_level_max')))
    required=item.get('RequiredLevel',item.get('required_level'))
    if req_min is not None or req_max is not None:
        if required is None or req_min is None or req_max is None or not int(req_min)<=int(required)<=int(req_max): return False
    qualities=evidence.get('qualities') or profile.get('qualities',())
    quality=int(item.get('Quality',item.get('quality',0)))
    if qualities and quality>max(qualities): return False
    if encounter.get('kind')=='trash' and quality>=5: return False
    if encounter.get('kind')=='trash' and quality>=4 and (not qualities or max(qualities)<4): return False
    return True

def encounter_placement_score(item,profile,encounter,resolved=None):
    resolved=resolved or resolve_encounter_order(profile)
    lo,hi=encounter_item_level_band(profile,encounter,resolved)
    evidence=_encounter_source_evidence(profile,encounter)
    center=evidence.get('band_center',(lo+hi)/2)
    required=int(item.get('RequiredLevel',item.get('required_level',0)))
    req_min=encounter.get('required_level_min',evidence.get('required_level_min',profile.get('required_level_min',required)))
    req_max=encounter.get('required_level_max',evidence.get('required_level_max',profile.get('required_level_max',required)))
    req_center=((req_min or required)+(req_max or required))/2
    source_rank={'direct':0,'encounter_reference':1,'profile_aggregate':2,'nearby_fallback':3}.get(evidence.get('band_source'),4)
    destination_rank=0 if profile.get('map_type')==2 and required>=80 else 1
    return (hi-lo,abs(int(item.get('ItemLevel',item.get('item_level',0)))-center),
            (req_max or required)-(req_min or required),abs(required-req_center),
            source_rank,destination_rank,0 if encounter.get('kind')=='boss' else 1,
            int(encounter.get('rank',0)),h64(SEED,item.get('entry'),profile.get('id'),
                                             profile.get('difficulty_id'),encounter.get('id'),'placement'))

def _eligible_encounters(item,profile,only_bosses=False):
    resolved=resolve_encounter_order(profile)
    rows=[]
    for encounter in resolved:
        if only_bosses and encounter.get('kind')!='boss': continue
        if encounter_item_eligibility(item,profile,encounter,resolved):
            rows.append((encounter,encounter_placement_score(item,profile,encounter,resolved)))
    return rows

def choose_encounter_profile(item,profiles):
    candidates=[]
    for profile in sorted(profiles,key=lambda row:str(row.get('id',''))):
        choices=_eligible_encounters(item,profile)
        if not choices: continue
        encounter,score=min(choices,key=lambda row:row[1])
        candidates.append((score,profile['id'],profile,encounter))
    if not candidates: return None
    score,_,profile,encounter=min(candidates,key=lambda row:(row[0],row[1]))
    return {'profile':profile,'encounter':encounter,'score':score}

def _assign_encounter_metadata(item,profile,encounter,score,reason='source evidence'):
    evidence=_encounter_source_evidence(profile,encounter)
    item['content_profile']=profile['id']; item['content_target']=encounter['id']
    item['target_kind']='raid' if profile.get('map_type')==2 else 'dungeon'
    item['placement_score']=score; item['placement_reason']=reason
    item['placement_band_source']=evidence.get('band_source','explicit')
    if item.get('set_id') or item.get('itemset'):
        item['set_atomic_profile']=profile['id']

def assign_default_encounter_items(items,manifest):
    profiles=[profile for profile in manifest.get('profiles',())
              if profile.get('valid',True) and any(encounter.get('targets') for encounter in profile.get('encounters',()))]
    if not items or not profiles: return items
    groups=defaultdict(list); ordinary=[]
    for item in items:
        set_id=item.get('set_id') or item.get('itemset')
        if set_id: groups[int(set_id)].append(item)
        else: ordinary.append(item)

    for set_id,members in sorted(groups.items()):
        options=[]
        for profile in profiles:
            choices=[_eligible_encounters(item,profile,only_bosses=True) for item in members]
            if not all(choices): continue
            best_score=max(min(score for _,score in rows) for rows in choices)
            options.append((best_score,profile['id'],profile,choices))
        if not options:
            for item in members: _clear_encounter_metadata(item)
            continue
        _,_,profile,choices=min(options,key=lambda row:(row[0],row[1]))
        resolved=resolve_encounter_order(profile)
        bosses=[encounter for encounter in resolved if encounter.get('kind')=='boss' and encounter.get('targets')]
        ordered_members=sorted(members,key=lambda item:(SET_SLOT_ORDER.index(item.get('slot')) if item.get('slot') in SET_SLOT_ORDER else 99,item.get('entry')))
        for index,item in enumerate(ordered_members):
            eligible={encounter['id']:(encounter,score) for encounter,score in choices[members.index(item)]}
            candidates=[encounter for encounter in bosses if encounter['id'] in eligible]
            if not candidates:
                for member in members: _clear_encounter_metadata(member)
                break
            desired=min(index,len(bosses)-1)
            encounter=min(candidates,key=lambda row:(abs(bosses.index(row)-desired),bosses.index(row),row['id']))
            _assign_encounter_metadata(item,profile,encounter,eligible[encounter['id']][1],f'atomic set {set_id}')

    for item in sorted(ordinary,key=lambda row:h64(SEED,row.get('entry'),'default_encounter_profile')):
        choice=choose_encounter_profile(item,profiles)
        if choice is None:
            _clear_encounter_metadata(item)
            continue
        _assign_encounter_metadata(item,choice['profile'],choice['encounter'],choice['score'])
    return items

def validate_targeted_source_membership(manifest,catalog):
    for profile in manifest.get('profiles',()):
        if profile.get('map_id') is None: continue
        map_id=int(profile['map_id']); difficulty_id=profile.get('difficulty_id')
        if map_id not in catalog['maps']: raise ValueError(f'profile {profile["id"]} references unknown map {map_id}')
        if difficulty_id is not None and (map_id,int(difficulty_id)) not in catalog['map_difficulties']:
            raise ValueError(f'profile {profile["id"]} references unknown map difficulty {map_id}:{difficulty_id}')
        for encounter in profile.get('encounters',()):
            for target in encounter.get('targets',()):
                target_type=target['type']; entry=int(target['entry'])
                if target_type=='reference':
                    if entry not in catalog['reference_loot_entries']: raise ValueError(f'unknown reference loot target {entry} in profile {profile["id"]}')
                    continue
                if target_type=='gameobject':
                    gameobject_entry=int(target.get('gameobject_entry',entry))
                    template=catalog.get('gameobject_templates',{}).get(gameobject_entry)
                    if template is None or entry not in catalog.get('gameobject_loot_entries',set()):
                        raise ValueError(f'gameobject loot target {entry} is missing gameobject or loot data')
                    mapped=map_id in catalog.get('gameobject_maps',{}).get(gameobject_entry,set())
                    scripted=any(
                        int(row.get('credit_type',0))==1
                        and int(row.get('credit_entry',-1))==gameobject_entry
                        and _dungeon_map_id(catalog.get('dungeon_maps',{}),row.get('last_encounter_dungeon',0))==map_id
                        for row in catalog['instance_encounters'].values()
                    )
                    if not mapped and not (encounter.get('kind')=='boss' and scripted):
                        raise ValueError(f'gameobject {gameobject_entry} is not present on map {map_id} for profile {profile["id"]}')
                    continue
                creature_entry=int(target.get('creature_entry',entry))
                source_creature_entry=int(target.get('source_creature_entry',creature_entry))
                if creature_entry not in catalog['creature_templates'] or entry not in catalog['creature_loot_entries']:
                    raise ValueError(f'creature loot target {entry} is missing creature or loot data')
                spawned=map_id in catalog['creature_maps'].get(source_creature_entry,set())
                scripted=any(
                    int(row.get('credit_entry',-1))==source_creature_entry
                    and _dungeon_map_id(catalog.get('dungeon_maps',{}),row.get('last_encounter_dungeon',0))==map_id
                    for row in catalog['instance_encounters'].values()
                )
                if not spawned and not (encounter.get('kind')=='boss' and scripted):
                    raise ValueError(f'creature {source_creature_entry} is not spawned on map {map_id} for profile {profile["id"]}')
                if encounter.get('kind')=='boss' and not any(row['credit_entry']==source_creature_entry for row in catalog['instance_encounters'].values()):
                    raise ValueError(f'boss target {source_creature_entry} is not present in instance_encounters.sql')

def _stock_equipment(meta):
    if not meta or int(meta.get('item_level',0))<=0 or int(meta.get('quality',0))<2:
        return False
    if int(meta.get('required_level',0))<=0 or int(meta.get('item_level',0))<int(meta.get('required_level',0)):
        return False
    item_class=int(meta.get('class',-1)); inventory_type=int(meta.get('inventory_type',0))
    if item_class==2:
        return inventory_type in {13,14,15,17,21,22,26,28}
    if item_class==4:
        return inventory_type in {1,2,3,5,6,7,8,9,10,11,12,13,14,16,20,28}
    return False

def progression_clusters(values,gap=15,prefer_high=False):
    ordered=tuple(sorted(int(value) for value in values))
    if not ordered: return ()
    clusters=[]; current=[ordered[0]]
    for value in ordered[1:]:
        if value-current[-1]>gap:
            clusters.append(tuple(current)); current=[value]
        else:
            current.append(value)
    clusters.append(tuple(current))
    rows=[{'values':tuple(cluster),'width':cluster[-1]-cluster[0],
           'center':sum(cluster)/len(cluster),'count':len(cluster)}
          for cluster in clusters]
    return tuple(rows)


def _dominant_progression_cluster(values,gap,prefer_high=False):
    clusters=progression_clusters(values,gap,prefer_high=prefer_high)
    if not clusters: return ()
    selected=max(clusters,key=lambda cluster:(cluster['count'],
                    cluster['values'][0],cluster['values'][-1])
                 if prefer_high else
                 (cluster['count'],-cluster['values'][0],-cluster['values'][-1]))
    return selected['values']

def infer_safe_band(values,source_kind='profile_aggregate',encounter_kind='boss',prefer_high=False):
    ordered=tuple(sorted(int(value) for value in values))
    if not ordered:
        return {'item_levels':(), 'retained_item_levels':(), 'rejected_item_levels':(),
                'item_level_min':None,'item_level_max':None,'band_center':None,
                'candidate_clusters':(),
                'band_source':source_kind,'valid':False,'invalid_reason':'no stock equipment evidence'}
    clusters=progression_clusters(ordered,15,prefer_high=prefer_high)
    retained=max(clusters,key=lambda cluster:(cluster['count'],cluster['values'][0],cluster['values'][-1])
                 if prefer_high else (cluster['count'],-cluster['values'][0],-cluster['values'][-1]))
    retained_set=list(retained['values'])
    rejected=list(ordered)
    for value in retained_set:
        rejected.remove(value)
    lo=min(retained_set); hi=max(retained_set)
    width=hi-lo
    hard_limit=30 if encounter_kind in ('profile','aggregate') else 20 if encounter_kind=='boss' else 25
    invalid_reason=''
    if source_kind in ('profile_aggregate','nearby_fallback') and width>hard_limit:
        invalid_reason=f'unsafe {encounter_kind} band width {width} > {hard_limit}'
    return {'item_levels':ordered,'retained_item_levels':tuple(retained_set),
            'rejected_item_levels':tuple(rejected),'item_level_min':lo,'item_level_max':hi,
            'band_center':sum(retained_set)/len(retained_set),'band_source':source_kind,
            'progression_cluster':{'retained':tuple(retained_set),'rejected':tuple(rejected),
                                   'method':'largest_gap_cluster','gap':15,'prefer_high':prefer_high},
            'candidate_clusters':clusters,
            'valid':not invalid_reason,'invalid_reason':invalid_reason}


def _profile_active_families(profile):
    for key in ('active_encounter_family','encounter_family','source_family'):
        value=profile.get(key)
        if value not in (None,'',()):
            values=value if isinstance(value,(list,tuple,set)) else (value,)
            return frozenset(str(item) for item in values)
    families=set()
    for encounter in profile.get('encounters',()):
        if encounter.get('kind')=='trash': continue
        for key in ('active_encounter_family','encounter_family','source_family'):
            value=encounter.get(key)
            if value not in (None,'',()):
                families.add(str(value)); break
        else:
            families.add(str(encounter.get('id','')))
    return frozenset(family for family in families if family)


def _profile_cluster_rows(profile,field='candidate_clusters'):
    evidence=profile.get('evidence') or {}
    rows=evidence.get(field) or ()
    normalized=[]
    for row in rows:
        if isinstance(row,dict):
            values=tuple(sorted(int(value) for value in row.get('values',())))
        else:
            values=tuple(sorted(int(value) for value in row))
        if values:
            normalized.append({'values':values,'width':values[-1]-values[0],
                               'center':sum(values)/len(values),'count':len(values)})
    if normalized: return tuple(normalized)
    cluster=evidence.get('progression_cluster') or {}
    values=tuple(sorted(int(value) for value in cluster.get('retained',())))
    if not values and profile.get('item_level_min') is not None:
        values=tuple(sorted({int(profile['item_level_min']),int(profile['item_level_max'])}))
    if not values: return ()
    return ({'values':values,'width':values[-1]-values[0],
             'center':sum(values)/len(values),'count':len(values)},)


def _required_cluster_for(profile,center=None):
    rows=_profile_cluster_rows(profile,'required_clusters')
    if not rows:
        minimum=profile.get('required_level_min'); maximum=profile.get('required_level_max')
        if minimum is None or maximum is None: return None
        values=tuple(sorted({int(minimum),int(maximum)}))
        return {'values':values,'width':values[-1]-values[0],
                'center':sum(values)/len(values),'count':len(values)}
    return min(rows,key=lambda row:(abs(row['center']-center),-row['count'])) if center is not None else max(rows,key=lambda row:(row['count'],row['center']))


def _recompute_evidence_cluster(evidence,cluster,required_cluster=None,encounter_kind='profile'):
    records=tuple(evidence.get('_candidate_item_records') or evidence.get('_stock_item_records',()))
    values=set(cluster.get('values',()))
    selected=[row for row in records if int(row.get('item_level',0)) in values]
    if not selected:
        return None
    source_kind=evidence.get('band_source','profile_aggregate')
    band=infer_safe_band([row['item_level'] for row in selected],source_kind,
                         encounter_kind,prefer_high=bool((evidence.get('progression_cluster') or {}).get('prefer_high',False)))
    required_values=set(required_cluster.get('values',())) if required_cluster else set()
    if required_values:
        matching=[row for row in selected if int(row.get('required_level',0)) in required_values]
        if matching: selected=matching
    required=tuple(sorted(int(row.get('required_level',0)) for row in selected if int(row.get('required_level',0))>0))
    required_rows=progression_clusters(required,3,prefer_high=bool((evidence.get('progression_cluster') or {}).get('prefer_high',False)))
    if required_rows:
        required_set=set(max(required_rows,key=lambda row:(row['count'],row['center']))['values'])
        selected=[row for row in selected if int(row.get('required_level',0)) in required_set]
        required=tuple(sorted(int(row.get('required_level',0)) for row in selected if int(row.get('required_level',0))>0))
        band=infer_safe_band([row['item_level'] for row in selected],source_kind,
                             encounter_kind,prefer_high=bool((evidence.get('progression_cluster') or {}).get('prefer_high',False)))
    quality_counts=defaultdict(int)
    for row in selected: quality_counts[int(row.get('quality',0))]+=1
    result=dict(band)
    result.update({'required_levels':required,'qualities':tuple(sorted({int(row.get('quality',0)) for row in selected if int(row.get('quality',0))>0})),
                   'quality_counts':dict(sorted(quality_counts.items())),
                   'dominant_quality':max(quality_counts,key=lambda quality:(quality_counts[quality],quality)) if quality_counts else None,
                   'item_count':len(selected),
                   'direct_item_count':sum(row.get('source_kind')=='direct' for row in selected),
                   'reference_item_count':sum(row.get('source_kind')=='reference' for row in selected),
                   'rejected_reference_count':evidence.get('rejected_reference_count',0),
                   '_stock_item_records':tuple(selected),
                   '_candidate_item_records':tuple(selected),
                   'reference_provenance':evidence.get('reference_provenance',()),
                   'rejections':list(evidence.get('rejections',())),
                   'required_level_min':min(required) if required else None,
                   'required_level_max':max(required) if required else None,
                   'required_clusters':required_rows,
                   'candidate_clusters':evidence.get('candidate_clusters',band.get('candidate_clusters',()))})
    return result


def _sibling_cluster_support(profile,cluster,sibling):
    if cluster['count']<3 or cluster['width']>30: return None
    sibling_clusters=_profile_cluster_rows(sibling)
    if not sibling_clusters: return None
    active=(sibling.get('evidence') or {}).get('progression_cluster',{})
    active_values=tuple(sorted(int(value) for value in active.get('retained',())))
    active_row=next((row for row in sibling_clusters if row['values']==active_values),None)
    active_row=active_row or max(sibling_clusters,key=lambda row:(row['count'],-row['width']))
    if active_row['count']<3: return None
    if abs(cluster['center']-active_row['center'])>max(15,cluster['width'],active_row['width']): return None
    sibling_required=_required_cluster_for(sibling)
    candidate_required_rows=_profile_cluster_rows(profile,'required_clusters')
    if sibling_required and candidate_required_rows:
        if min(abs(row['center']-sibling_required['center']) for row in candidate_required_rows)>15:
            return None
    return {'profile_id':sibling.get('id'),'reason':'shared active encounter family supports coherent alternate cluster',
            'cluster':cluster['values']}


def apply_sibling_progression_coherence(profiles):
    profiles=list(profiles or ())
    independent={profile.get('id'): (
        (profile.get('item_level_min'),profile.get('item_level_max')),
        (profile.get('required_level_min'),profile.get('required_level_max')))
                 for profile in profiles}
    groups=defaultdict(list)
    for profile in profiles:
        for family in _profile_active_families(profile):
            groups[(int(profile.get('map_id',-1)),family)].append(profile)
    for group in groups.values():
        for profile in group:
            candidates=_profile_cluster_rows(profile)
            profile_evidence=profile.get('evidence') or {}
            active_values=tuple(sorted(int(value) for value in
                (profile_evidence.get('progression_cluster',{}) or {}).get('retained',())))
            choices=[]
            for candidate in candidates:
                if candidate['values']==active_values: continue
                supporters=[]
                for sibling in group:
                    if sibling is profile: continue
                    support=_sibling_cluster_support(profile,candidate,sibling)
                    if support: supporters.append(support)
                if supporters:
                    choices.append((len(supporters),-min(abs(candidate['center']-
                        _profile_cluster_rows(sibling)[-1]['center']) for sibling in group if sibling is not profile),candidate,supporters))
            if not choices: continue
            _,_,chosen,supporters=max(choices,key=lambda row:(row[0],row[1]))
            required=_required_cluster_for(profile,chosen['center'])
            new_encounters=[]
            for encounter in profile.get('encounters',()):
                evidence=encounter.get('evidence')
                if evidence:
                    filtered=_recompute_evidence_cluster(evidence,chosen,required,encounter.get('kind','boss'))
                    if filtered is None and evidence.get('_stock_item_records'):
                        continue
                    if filtered is not None:
                        encounter['evidence']=filtered
                        encounter['item_level']=[filtered['item_level_min'],filtered['item_level_max']]
                        encounter['required_level_min']=filtered.get('required_level_min')
                        encounter['required_level_max']=filtered.get('required_level_max')
                new_encounters.append(encounter)
            profile['encounters']=new_encounters
            source_encounters=[encounter for encounter in new_encounters
                               if encounter.get('kind')!='trash'] if profile.get('map_type')==2 else new_encounters
            evidence_rows=[encounter.get('evidence') for encounter in source_encounters if encounter.get('evidence')]
            if evidence_rows:
                source_kind=profile_evidence.get('band_source','profile_aggregate')
                recomputed=_merge_stock_evidence(evidence_rows,source_kind,
                    'raid_profile' if profile.get('map_type')==2 else 'profile')
                original_candidates=profile_evidence.get('candidate_clusters',candidates)
                recomputed['candidate_clusters']=original_candidates
                recomputed['progression_cluster']={'retained':chosen['values'],
                    'rejected':tuple(sorted(set(value for row in original_candidates for value in row.get('values',()))-set(chosen['values']))),
                    'method':'sibling_supported_cluster','gap':15,
                    'prefer_high':bool((profile_evidence.get('progression_cluster') or {}).get('prefer_high',False))}
                recomputed['sibling_support']=list(profile_evidence.get('sibling_support',()))+supporters
                profile['evidence']=recomputed
                profile['item_level_min']=recomputed.get('item_level_min')
                profile['item_level_max']=recomputed.get('item_level_max')
                profile['required_level_min']=recomputed.get('required_level_min')
                profile['required_level_max']=recomputed.get('required_level_max')
                profile['qualities']=recomputed.get('qualities',())
            rebuild_encounter_prerequisites(profile.get('encounters',()))
    conflicts=[]
    comparisons=[]
    for group_key,group in groups.items():
        group=sorted(group,key=lambda row:int(row.get('difficulty_id',0)))
        for left_index,left in enumerate(group):
            for right in group[left_index+1:]:
                final_left=(left.get('item_level_min'),left.get('item_level_max'))
                final_right=(right.get('item_level_min'),right.get('item_level_max'))
                req_left=(left.get('required_level_min'),left.get('required_level_max'))
                req_right=(right.get('required_level_min'),right.get('required_level_max'))
                radical=(None not in final_left+final_right and abs(sum(final_left)/2-sum(final_right)/2)>45) or (None not in req_left+req_right and abs(sum(req_left)/2-sum(req_right)/2)>15)
                reason='sibling progression era conflict' if radical else 'independently filtered source evidence'
                if radical:
                    conflict={'reason':'sibling_progression_era_conflict','map_id':group_key[0],
                              'family':group_key[1],'profile_ids':[left.get('id'),right.get('id')]}
                    conflicts.append(conflict)
                    for profile in (left,right):
                        profile['evidence']=profile.get('evidence') or {}
                        profile['evidence'].setdefault('sibling_progression_era_conflict',[]).append(conflict)
                elif (left.get('evidence') or {}).get('sibling_support') or (right.get('evidence') or {}).get('sibling_support'):
                    reason='sibling-supported alternate progression cluster'
                comparisons.append({'map_id':group_key[0],'instance':left.get('instance',str(group_key[0])),
                    'difficulty_a':left.get('difficulty_id'),'difficulty_b':right.get('difficulty_id'),
                    'stock_item_count_a':(left.get('evidence') or {}).get('item_count',0),
                    'stock_item_count_b':(right.get('evidence') or {}).get('item_count',0),
                    'independent_band_a':list(independent.get(left.get('id'),((),()))[0]),
                    'independent_band_b':list(independent.get(right.get('id'),((),()))[0]),
                    'final_band_a':list(final_left),'final_band_b':list(final_right),
                    'band_a':list(final_left),'band_b':list(final_right),
                    'loot_mode_a':left.get('loot_mode'),'loot_mode_b':right.get('loot_mode'),
                    'identical':final_left==final_right and req_left==req_right,'reason':reason})
    comparisons.sort(key=lambda row:(int(row.get('map_id',-1)),int(row.get('difficulty_a',-1)),int(row.get('difficulty_b',-1))))
    return profiles,comparisons,conflicts

def _loot_mode_applies(row,columns_or_indexes,loot_mode,difficulty_template=False):
    indexes=columns_or_indexes if isinstance(columns_or_indexes,dict) else _sql_column_indexes(columns_or_indexes)
    value=_sql_row_value(row,indexes,'lootmode',default=1)
    mode=_sql_int(value,1)
    return bool((difficulty_template and mode==1) or (mode & int(loot_mode)))

def _reference_consumer_maps(catalog,reference_entry):
    cache=catalog.get('_reference_consumer_maps_all')
    if cache is None:
        cache=defaultdict(set)
        catalog['_reference_consumer_maps_all']=cache
        records=defaultdict(list)
        catalog['_reference_consumer_records']=records
        loot_contexts=defaultdict(list)
        loot_to_maps=defaultdict(set)

        def add_context(loot_id,target_type,parent_entry,effective_entry,maps,difficulty_specific,difficulty_id=None):
            loot_id=int(loot_id or 0)
            if loot_id<=0 or not maps: return
            context={'parent_target_type':target_type,
                     'parent_target_entry':int(parent_entry),
                     'effective_target_entry':int(effective_entry),
                     'parent_loot_id':loot_id,'map_ids':set(int(map_id) for map_id in maps),
                     'difficulty_specific':bool(difficulty_specific),
                     'difficulty_id':None if difficulty_id is None else int(difficulty_id)}
            if target_type=='creature':
                loot_to_maps[loot_id].update(context['map_ids'])
            key=(context['parent_target_type'],context['parent_target_entry'],
                 context['effective_target_entry'],context['parent_loot_id'],
                 tuple(sorted(context['map_ids'])),context['difficulty_specific'],
                 context['difficulty_id'])
            existing_keys={(existing['parent_target_type'],existing['parent_target_entry'],
                            existing['effective_target_entry'],existing['parent_loot_id'],
                            tuple(sorted(existing['map_ids'])),existing['difficulty_specific'],
                            existing['difficulty_id'])
                           for existing in loot_contexts[loot_id]}
            if key not in existing_keys:
                loot_contexts[loot_id].append(context)

        for base_entry,template in catalog.get('creature_templates',{}).items():
            maps=catalog.get('creature_maps',{}).get(int(base_entry),())
            add_context(template.get('lootid'), 'creature', base_entry, base_entry, maps, False)
            for difficulty_id,variant_entry in enumerate(template.get('difficulty_entries',()),1):
                variant=catalog.get('creature_templates',{}).get(int(variant_entry))
                if variant is not None:
                    add_context(variant.get('lootid'), 'creature', base_entry,
                                variant_entry, maps, True, difficulty_id)

        for entry,template in catalog.get('gameobject_templates',{}).items():
            if int(template.get('type',0))!=3: continue
            maps=catalog.get('gameobject_maps',{}).get(int(entry),())
            add_context(template.get('lootid'), 'gameobject', entry, entry, maps, False)

        for target_type in ('creature','gameobject'):
            columns=catalog.get(target_type+'_loot_columns',())
            indexes=_sql_column_indexes(columns)
            for row in catalog.get(target_type+'_loot_rows',()):
                reference=_sql_int(_sql_row_value(row,indexes,'reference'),0)
                parent_loot_id=_sql_int(_sql_row_value(row,indexes,'entry'),-1)
                if not reference or parent_loot_id<0: continue
                parent_loot_mode=_sql_int(_sql_row_value(row,indexes,'lootmode'),1)
                for context in loot_contexts.get(parent_loot_id,()):
                    record=dict(context)
                    record.update({'reference_id':reference,
                                   'parent_loot_mode':parent_loot_mode})
                    records[reference].append(record)
                    cache[reference].update(context['map_ids'])
        for reference,reference_records in records.items():
            unique=[]
            unique_keys=set()
            for record in reference_records:
                key=(record['parent_target_type'],record['parent_target_entry'],
                     record['effective_target_entry'],record['parent_loot_id'],
                     tuple(sorted(record['map_ids'])),record['difficulty_specific'],
                     record['difficulty_id'],record['parent_loot_mode'])
                if key not in unique_keys:
                    unique_keys.add(key)
                    unique.append(record)
            records[reference]=unique
        reference_columns=catalog.get('reference_loot_columns',())
        reference_indexes=_sql_column_indexes(reference_columns)
        changed=True
        while changed:
            changed=False
            for row in catalog.get('reference_loot_rows',()):
                parent_reference=_sql_int(_sql_row_value(row,reference_indexes,'entry'),-1)
                child_reference=_sql_int(_sql_row_value(row,reference_indexes,'reference'),0)
                if parent_reference<0 or not child_reference: continue
                parent_mode=_sql_int(_sql_row_value(row,reference_indexes,'lootmode'),1)
                for parent in tuple(records.get(parent_reference,())):
                    propagated=dict(parent)
                    propagated.update({'reference_id':child_reference,
                                       'parent_target_type':'reference',
                                       'parent_target_entry':parent_reference,
                                       'effective_target_entry':parent_reference,
                                       'parent_loot_id':parent_reference,
                                       'parent_loot_mode':parent_mode,
                                       'map_ids':set(parent.get('map_ids',()))})
                    key=(propagated['parent_target_type'],propagated['parent_target_entry'],
                         propagated['effective_target_entry'],propagated['parent_loot_id'],
                         tuple(sorted(propagated['map_ids'])),propagated['difficulty_specific'],
                         propagated['difficulty_id'],propagated['parent_loot_mode'])
                    existing_keys={(existing['parent_target_type'],existing['parent_target_entry'],
                                    existing['effective_target_entry'],existing['parent_loot_id'],
                                    tuple(sorted(existing['map_ids'])),existing['difficulty_specific'],
                                    existing['difficulty_id'],existing['parent_loot_mode'])
                                   for existing in records[child_reference]}
                    if key not in existing_keys:
                        records[child_reference].append(propagated)
                        cache[child_reference].update(propagated['map_ids'])
                        changed=True
        catalog['_creature_loot_to_maps']=loot_to_maps
        audit=catalog.setdefault('source_audit',{})
        audit['reference_consumer_count']=sum(len(rows) for rows in records.values())
        audit['reference_consumer_map_count']=sum(len(maps) for maps in cache.values())
        audit['reference_consumer_profile_count']=sum(
            len(_reference_consumer_profile_keys(catalog,rows)) for rows in records.values())
    return set(cache.get(int(reference_entry),()))

def _reference_consumer_records(catalog,reference_entry):
    _reference_consumer_maps(catalog,reference_entry)
    return catalog.get('_reference_consumer_records',{}).get(int(reference_entry),())

def _reference_consumer_profile_keys(catalog,records):
    keys=set()
    map_difficulties=catalog.get('map_difficulties',{})
    for record in records:
        for map_id in record.get('map_ids',()):
            difficulties=sorted(difficulty_id for current_map,difficulty_id in map_difficulties
                                if int(current_map)==int(map_id))
            if not difficulties:
                keys.add((int(map_id),None)); continue
            if record.get('difficulty_specific'):
                difficulty_id=record.get('difficulty_id')
                if difficulty_id in difficulties:
                    keys.add((int(map_id),int(difficulty_id)))
                continue
            for difficulty_id in difficulties:
                loot_mode=loot_mode_for_difficulty(None,difficulty_id)
                if record.get('parent_loot_mode',1)&loot_mode:
                    keys.add((int(map_id),int(difficulty_id)))
    return keys

def reference_provenance_rows(catalog):
    rows=[]
    seen=set()
    source_rows=catalog.get('_reference_provenance')
    if source_rows is None:
        source_rows=catalog.get('reference_provenance',())
    for row in source_rows:
        def int_or_empty(value):
            return '' if value in (None,'') else int(value)
        normalized={
            'reference_id':int(row.get('reference_id',0)),
            'parent_target_type':str(row.get('parent_target_type','')),
            'parent_target_entry':int(row.get('parent_target_entry',0)),
            'effective_target_entry':int(row.get('effective_target_entry',0)),
            'parent_loot_id':int(row.get('parent_loot_id',0)),
            'map_id':int_or_empty(row.get('map_id','')),
            'difficulty_id':int_or_empty(row.get('difficulty_id','')),
            'parent_loot_mode':int(row.get('parent_loot_mode',1)),
            'reference_loot_mode':int(row.get('reference_loot_mode',1)),
            'consumer_map_count':int(row.get('consumer_map_count',0)),
            'consumer_profile_count':int(row.get('consumer_profile_count',0)),
            'verified_parent':bool(row.get('verified_parent',False)),
        }
        key=tuple(normalized[field] for field in (
            'reference_id','parent_target_type','parent_target_entry',
            'effective_target_entry','parent_loot_id','map_id','difficulty_id',
            'parent_loot_mode','reference_loot_mode','consumer_map_count',
            'consumer_profile_count','verified_parent'))
        if key not in seen:
            seen.add(key); rows.append(normalized)
    fields=('reference_id','parent_target_type','parent_target_entry',
            'effective_target_entry','parent_loot_id','map_id','difficulty_id',
            'parent_loot_mode','reference_loot_mode','consumer_map_count',
            'consumer_profile_count','verified_parent')
    def sort_value(value):
        return (0,int(value)) if value not in ('',None) and not isinstance(value,bool) else (1,str(value))
    return sorted(rows,key=lambda row:tuple(
        sort_value(row[field]) if field!='parent_target_type' else (0,str(row[field]))
        for field in fields))
def _loot_rows_by_entry(catalog,target_type):
    target_type=str(target_type)
    cache=catalog.setdefault('_loot_rows_by_entry',{})
    if target_type in cache: return cache[target_type]
    prefix='gameobject_' if target_type=='gameobject' else 'reference_' if target_type=='reference' else 'creature_'
    columns=catalog.get(prefix+'loot_columns',()); rows=catalog.get(prefix+'loot_rows',())
    indexes=_sql_column_indexes(columns); entry_index=indexes.get('entry',0)
    by_entry=defaultdict(list)
    for row in rows: by_entry[_sql_int(row[entry_index],-1)].append(row)
    cache[target_type]=(columns,indexes,by_entry)
    return cache[target_type]

def collect_target_stock_evidence(catalog,profile_context,target):
    loot_mode=int(profile_context.get('loot_mode',loot_mode_for_difficulty(None,profile_context.get('difficulty_id',0))))
    cache=catalog.setdefault('_encounter_evidence_cache',{})
    cache_key=(profile_context.get('map_id'),profile_context.get('difficulty_id'),loot_mode,
               str(target.get('type','creature')),int(target.get('entry',0)),
               int(target.get('creature_entry',target.get('gameobject_entry',0)) or 0),
               int(target.get('effective_creature_entry',target.get('effective_entry',0)) or 0))
    if cache_key in cache: return cache[cache_key]
    target_type=str(target.get('type','creature'))
    columns,indexes,rows_by_entry=_loot_rows_by_entry(catalog,target_type)
    stock_items=catalog.get('stock_items',{})
    direct=[]; referenced=[]; rejections=[]; rejected_refs=set(); visited=set()
    provenance=[]
    profile_map=profile_context.get('map_id')

    def add_provenance(row):
        if row not in provenance: provenance.append(row)

    def target_parent_entry(current_target, current_type):
        if current_type=='creature':
            return _sql_int(current_target.get('creature_entry',current_target.get('entry',0)),0)
        if current_type=='gameobject':
            return _sql_int(current_target.get('gameobject_entry',current_target.get('entry',0)),0)
        return _sql_int(current_target.get('entry',0),0)

    def target_effective_entry(current_target, current_type):
        if current_type=='creature':
            return _sql_int(current_target.get('effective_creature_entry',current_target.get('creature_entry',current_target.get('entry',0))),0)
        if current_type=='gameobject':
            return _sql_int(current_target.get('gameobject_entry',current_target.get('entry',0)),0)
        return _sql_int(current_target.get('entry',0),0)

    root_parent_entry=target_parent_entry(target,target_type)
    root_effective_entry=target_effective_entry(target,target_type)
    _reference_consumer_maps(catalog,0)
    source_valid=bool(profile_map is not None and int(profile_map) in catalog.get('maps',{}))
    if catalog.get('map_difficulties') and profile_map is not None:
        source_valid=source_valid and (int(profile_map),int(profile_context.get('difficulty_id',0))) in catalog['map_difficulties']

    def verified_root_edge(reference,parent_entry):
        target_source_valid=source_valid
        if target_type=='creature':
            target_source_valid=target_source_valid and int(target.get('entry',0)) in catalog.get('creature_loot_entries',set())
        elif target_type=='gameobject':
            template=catalog.get('gameobject_templates',{}).get(root_parent_entry,{})
            target_source_valid=target_source_valid and int(template.get('type',0))==3
            target_source_valid=target_source_valid and int(template.get('lootid',0))==int(target.get('entry',0))
            target_source_valid=target_source_valid and int(target.get('entry',0)) in catalog.get('gameobject_loot_entries',set())
        records=[record for record in _reference_consumer_records(catalog,reference)
                 if record.get('parent_target_type')==target_type
                 and int(record.get('parent_loot_id',-1))==int(parent_entry)
                 and int(profile_map) in record.get('map_ids',set())
                 and (int(record.get('effective_target_entry',0)) in
                      {root_parent_entry,root_effective_entry} or
                      target_type=='gameobject')]
        difficulty_id=int(profile_context.get('difficulty_id',0))
        explicit_profile_target=bool(target.get('verified_profile_target') or
                                     profile_context.get('verified_profile_target'))
        for profile_target in catalog.get('gameobject_reward_targets',()):
            if (profile_target.get('valid') and
                    int(profile_target.get('map_id',-1))==int(profile_map) and
                    int(profile_target.get('gameobject_entry',-1))==root_parent_entry and
                    profile_target.get('difficulty_id','') in ('',difficulty_id)):
                explicit_profile_target=True
        if target_type=='gameobject':
            return bool(target_source_valid and records)
        return bool(target_source_valid and records and (explicit_profile_target or any(
            record.get('difficulty_specific') and
            int(record.get('difficulty_id',-1))==difficulty_id
            for record in records)))

    def collect(parent_entry,table_type=target_type,source_kind='direct',path_context=None):
        parent_entry=int(parent_entry)
        current_columns,current_indexes,current_rows=_loot_rows_by_entry(catalog,table_type)
        for row in current_rows.get(parent_entry,()):
            if not _loot_mode_applies(row,current_indexes,loot_mode,profile_context.get('difficulty_template_source',False)):
                continue
            item=_sql_int(_sql_row_value(row,current_indexes,'item'),0)
            reference=_sql_int(_sql_row_value(row,current_indexes,'reference'),0)
            if reference:
                reference_rows_by_entry=_loot_rows_by_entry(catalog,'reference')
                reference_columns,reference_indexes,reference_entries=reference_rows_by_entry
                applicable_reference_rows=[] if reference not in catalog.get('reference_loot_entries',set()) else [
                    reference_row for reference_row in reference_entries.get(reference,())
                    if _loot_mode_applies(reference_row,reference_indexes,loot_mode,profile_context.get('difficulty_template_source',False))]
                reference_mode=_sql_int(_sql_row_value(applicable_reference_rows[0],reference_indexes,'lootmode'),1) if applicable_reference_rows else 1
                consumers=_reference_consumer_maps(catalog,reference)
                consumer_records=_reference_consumer_records(catalog,reference)
                consumer_profiles=_reference_consumer_profile_keys(catalog,consumer_records)
                if path_context is not None:
                    verified=bool(path_context.get('verified_parent'))
                else:
                    verified=verified_root_edge(reference,parent_entry)
                consumer_map_count=len(consumers)
                consumer_profile_count=len(consumer_profiles)
                provenance_row={
                    'reference_id':reference,
                    'parent_target_type':table_type,
                    'parent_target_entry':root_parent_entry if path_context is None else int(path_context.get('parent_target_entry',reference)),
                    'effective_target_entry':root_effective_entry if path_context is None else int(path_context.get('effective_target_entry',reference)),
                    'parent_loot_id':parent_entry,
                    'map_id':profile_map if profile_map is not None else '',
                    'difficulty_id':profile_context.get('difficulty_id',''),
                    'parent_loot_mode':_sql_int(_sql_row_value(row,current_indexes,'lootmode'),1),
                    'reference_loot_mode':reference_mode,
                    'consumer_map_count':consumer_map_count,
                    'consumer_profile_count':consumer_profile_count,
                    'verified_parent':verified and bool(applicable_reference_rows),
                }
                add_provenance(provenance_row)
                if (not verified or not applicable_reference_rows or
                        (path_context is None and (profile_map is None or not consumers))):
                    if reference not in rejected_refs:
                        rejected_refs.add(reference)
                        rejections.append({'reference':reference,'reason':'shared or unresolved reference context'})
                    continue
                visit_key=(reference,profile_map,profile_context.get('difficulty_id'),
                           target_type,root_parent_entry)
                if visit_key in visited: continue
                visited.add(visit_key)
                collect(reference,'reference','reference',{
                    'parent_target_entry':reference,'effective_target_entry':reference,
                    'verified_parent':verified})
                continue
            meta=stock_items.get(item)
            if not _stock_equipment(meta):
                if item: rejections.append({'item':item,'reason':'not equippable stock gear'})
                continue
            (referenced if source_kind=='reference' else direct).append(meta)

    collect(target.get('entry',0),target_type,'direct')
    expected_min=profile_context.get('creature_level_min'); expected_max=profile_context.get('creature_level_max')
    if expected_min is not None and expected_max is not None:
        expected_min=max(1,int(expected_min)-5); expected_max=min(80,int(expected_max)+5)
        def context_ok(meta):
            required=int(meta.get('required_level',0))
            return expected_min<=required<=expected_max
        for row in direct+referenced:
            if not context_ok(row): rejections.append({'item':row.get('entry'),'reason':'RequiredLevel outside creature progression context'})
        direct=[row for row in direct if context_ok(row)]
        referenced=[row for row in referenced if context_ok(row)]
    selected=direct or referenced
    source_kind='direct' if direct else 'encounter_reference' if referenced else 'profile_aggregate'
    candidate_item_records=tuple({
        'entry':int(row.get('entry',0)),
        'item_level':int(row.get('item_level',0)),
        'required_level':int(row.get('required_level',0)),
        'quality':int(row.get('quality',0)),
        'source_kind':'reference' if row in referenced else 'direct',
    } for row in selected)
    band=infer_safe_band([row['item_level'] for row in selected],source_kind,target.get('kind','boss'))
    candidate_clusters=band.get('candidate_clusters',())
    retained=set(band.get('retained_item_levels',()))
    retained_items=[row for row in selected if row['item_level'] in retained]
    required_cluster=_dominant_progression_cluster(
        [row.get('required_level',0) for row in retained_items if int(row.get('required_level',0))>0],3)
    required_set=set(required_cluster)
    required_rejections=[row for row in retained_items if int(row.get('required_level',0)) not in required_set]
    if required_rejections:
        rejections.extend({'item':row.get('entry'),'reason':'RequiredLevel outlier'} for row in required_rejections)
        retained_items=[row for row in retained_items if row not in required_rejections]
        band=infer_safe_band([row['item_level'] for row in retained_items],source_kind,target.get('kind','boss'))
        band['candidate_clusters']=candidate_clusters
    required=tuple(sorted(int(row.get('required_level',0)) for row in retained_items if int(row.get('required_level',0))>0))
    qualities=tuple(sorted({int(row.get('quality',0)) for row in retained_items if int(row.get('quality',0))>0}))
    quality_counts=defaultdict(int)
    for row in retained_items:
        quality_counts[int(row.get('quality',0))]+=1
    stock_item_records=tuple({
        'entry':int(row.get('entry',0)),
        'item_level':int(row.get('item_level',0)),
        'required_level':int(row.get('required_level',0)),
        'quality':int(row.get('quality',0)),
        'source_kind':'reference' if row in referenced else 'direct',
    } for row in retained_items)
    band.update({'required_levels':required,'qualities':qualities,'quality_counts':dict(sorted(quality_counts.items())),
                 'dominant_quality':max(quality_counts,key=lambda quality:(quality_counts[quality],quality)) if quality_counts else None,
                 'item_count':len(retained_items),
                 'direct_item_count':len(direct),'reference_item_count':len(referenced),
                 'rejected_reference_count':len(rejected_refs),'rejected_required_level_count':len(required_rejections),
                 'rejected_required_levels':tuple(sorted({int(row.get('required_level',0)) for row in required_rejections})),
                 'reference_provenance':reference_provenance_rows({'_reference_provenance':provenance}),
                 '_stock_item_records':stock_item_records,
                 '_candidate_item_records':candidate_item_records,
                 'rejections':rejections,
                 'required_level_min':min(required) if required else None,
                 'required_level_max':max(required) if required else None})
    cache[cache_key]=band
    catalog.setdefault('_reference_provenance',[]).extend(band.get('reference_provenance',()))
    catalog.setdefault('source_audit',{})['reference_provenance_count']=len(reference_provenance_rows(catalog))
    return band

def item_fits_encounter_profile(item,profile_or_target):
    item_level=int(item.get('ItemLevel',item.get('item_level',0)))
    required_level=int(item.get('RequiredLevel',item.get('required_level',0)))
    ilvl_min=profile_or_target.get('item_level_min')
    ilvl_max=profile_or_target.get('item_level_max')
    req_min=profile_or_target.get('required_level_min')
    req_max=profile_or_target.get('required_level_max')
    if None in (ilvl_min,ilvl_max,req_min,req_max): return False
    if not int(ilvl_min)<=item_level<=int(ilvl_max) or not int(req_min)<=required_level<=int(req_max): return False
    qualities=tuple(profile_or_target.get('qualities',()))
    return not qualities or int(item.get('Quality',item.get('quality',0)))<=max(qualities)

def _stock_item_metadata(fields):
    if len(fields)<=ITEM_TEMPLATE_DISENCHANT_INDEX:
        return None
    entry=_sql_int(fields[0],-1)
    if entry<0:
        return None
    stat_ids={_sql_int(fields[27+i*2]) for i in range(10) if _sql_int(fields[27+i*2])}
    if 4 in stat_ids:
        source_role='tank' if stat_ids & {12,13,14,15} else 'strength_dps'
    elif 3 in stat_ids:
        source_role='hunter' if _sql_int(fields[12]) in (15,26) else 'agility_dps'
    elif 5 in stat_ids or 45 in stat_ids:
        source_role='healer' if 43 in stat_ids else 'caster_dps'
    else:
        source_role=''
    return {
        'entry':entry,'class':_sql_int(fields[1]),'subclass':_sql_int(fields[2]),
        'name':str(fields[4]).strip("'").replace("''", "'"),'displayid':_sql_int(fields[5]),
        'quality':_sql_int(fields[6]),'class_mask':_sql_int(fields[13],-1),
        'item_level':_sql_int(fields[15]),'required_level':_sql_int(fields[16]),
        'inventory_type':_sql_int(fields[12]),'itemset':_sql_int(fields[ITEM_TEMPLATE_ITEMSET_INDEX]),
        'socket_colors':tuple(_sql_int(fields[ITEM_TEMPLATE_SOCKET_COLOR_INDEX+i*2]) for i in range(3)),
        'role':source_role,
        'socket_bonus':_sql_int(fields[ITEM_TEMPLATE_SOCKET_BONUS_INDEX]),
        'required_disenchant_skill':_sql_int(fields[ITEM_TEMPLATE_REQUIRED_DISENCHANT_INDEX],-1),
        'disenchant_id':_sql_int(fields[ITEM_TEMPLATE_DISENCHANT_INDEX]),
        'fields':fields,
    }

def load_feature_catalogs(item_template_path,item_set_path,spell_path,enchantment_path,disenchant_path,proc_path,script_path):
    catalog=empty_feature_catalog()
    catalog['spells'],_,_,_=_read_wdbc_records(spell_path,234,'Spell.dbc')
    catalog['enchantments'],_,_,_=_read_wdbc_records(enchantment_path,38,'SpellItemEnchantment.dbc')
    catalog['item_sets'],catalog['item_set_strings']=_read_item_set_dbc(item_set_path)
    catalog['proc_spells']={_sql_int(row[0]) for row in _load_sql_entry_rows(proc_path) if row}
    catalog['script_spells']={_sql_int(row[0]) for row in _load_sql_entry_rows(script_path) if row}
    catalog['disenchant_ids']={_sql_int(row[0]) for row in _load_sql_entry_rows(disenchant_path) if row}

    for fields in _load_sql_entry_rows(item_template_path):
        meta=_stock_item_metadata(fields)
        if meta is None:
            continue
        catalog['stock_items'][meta['entry']]=meta
        for slot in range(5):
            base=ITEM_TEMPLATE_SPELL_BASE+slot*ITEM_TEMPLATE_SPELL_WIDTH
            spell_id=_sql_int(fields[base])
            trigger=_sql_int(fields[base+1])
            if not spell_id or trigger not in (0,1,2,5):
                continue
            spell=catalog['spells'].get(spell_id)
            if spell is None or not any(spell[index] for index in (71,72,73)):
                continue
            script_backed=spell_id in catalog['script_spells']
            if script_backed:
                catalog['audit']['script_excluded']+=1
                continue
            proc_override=spell_id in catalog['proc_spells']
            package={
                'spell_id':spell_id,'trigger':trigger,'charges':_sql_int(fields[base+2]),
                'ppm_rate':_sql_float(fields[base+3]),'cooldown':_sql_int(fields[base+4],-1),
                'category':_sql_int(fields[base+5]),'category_cooldown':_sql_int(fields[base+6],-1),
                'source_entry':meta['entry'],'source_item_level':meta['item_level'],'source_quality':meta['quality'],
                'source_class':meta['class'],'source_subclass':meta['subclass'],'source_inventory_type':meta['inventory_type'],
                'source_class_mask':meta['class_mask'],'source_role':meta['role'],'proc_override':proc_override,
                'spell_effects':tuple(spell[index] for index in (71,72,73)),
            }
            catalog['effect_packages'].append(package)
            catalog['audit']['effect_packages']+=1
            catalog['audit']['proc_overrides']+=int(proc_override)

        socket_id=meta['socket_bonus']
        enchant=catalog['enchantments'].get(socket_id)
        if socket_id and enchant and any(enchant[index] for index in (2,3,4,5,6,7,11,12,13)):
            catalog['socket_bonuses'].append({
                'enchantment_id':socket_id,'source_entry':meta['entry'],'source_item_level':meta['item_level'],
                'source_quality':meta['quality'],'source_class_mask':meta['class_mask'],
                'source_role':meta['role'],
                'socket_count':sum(color>0 for color in meta['socket_colors']),
                'effect_types':tuple(enchant[2:5]),'effect_amounts':tuple(enchant[5:8]),
                'effect_spells':tuple(enchant[11:14]),'required_level':enchant[37],
            })

        disenchant_id=meta['disenchant_id']
        if (disenchant_id and disenchant_id in catalog['disenchant_ids']
                and meta['required_disenchant_skill']>=0):
            catalog['disenchant_pairs'].append({
                'disenchant_id':disenchant_id,'required_skill':meta['required_disenchant_skill'],
                'source_entry':meta['entry'],'source_item_level':meta['item_level'],'source_quality':meta['quality'],
            })

    catalog['audit']['socket_bonuses']=len(catalog['socket_bonuses'])
    catalog['audit']['disenchant_pairs']=len(catalog['disenchant_pairs'])
    for package in catalog['effect_packages']:
        catalog['effect_index'][(package['trigger'],package['source_class'],package['source_quality'],package['source_item_level']//10)].append(package)
    for bonus in catalog['socket_bonuses']:
        catalog['socket_index'][(bonus['source_quality'],bonus['source_item_level']//10)].append(bonus)
    for pair in catalog['disenchant_pairs']:
        catalog['disenchant_index'][(pair['source_quality'],pair['source_item_level']//10)].append(pair)
    for set_id,row in catalog['item_sets'].items():
        bonuses=[]
        for index in range(8):
            spell_id=row[35+index]; threshold=row[43+index]
            if spell_id and threshold and spell_id in catalog['spells']:
                bonuses.append((threshold,spell_id))
        visuals={}
        members=[]
        for item_id in row[18:28]:
            if not item_id or item_id not in catalog['stock_items']:
                continue
            meta=catalog['stock_items'][item_id]
            members.append(meta)
            for slot,inventory_type in SET_SLOT_INVENTORY_TYPES.items():
                if meta['inventory_type']==inventory_type and slot not in visuals:
                    visuals[slot]=(meta['entry'],meta['displayid'],meta['item_level'],meta['quality'])
        if not all(slot in visuals for slot in SET_SLOT_INVENTORY_TYPES) or not any(threshold==2 for threshold,_ in bonuses) or not any(threshold==4 for threshold,_ in bonuses):
            continue
        masks={meta['class_mask'] for meta in members if meta['class_mask'] not in (-1,0)}
        class_mask=next(iter(masks)) if len(masks)==1 else -1
        role_counts=Counter(meta['role'] for meta in members if meta.get('role'))
        set_role=role_counts.most_common(1)[0][0] if role_counts else ''
        catalog.setdefault('set_templates',[]).append({
            'source_set_id':set_id,'name':_dbc_string(catalog['item_set_strings'],row[1]),'bonuses':tuple(bonuses),
            'visuals':visuals,'class_mask':class_mask,'role':set_role,
            'item_level':round(sum(meta['item_level'] for meta in members)/len(members)),
            'quality':max(meta['quality'] for meta in members),'members':tuple(meta['entry'] for meta in members),
        })
    catalog.setdefault('set_templates',[])
    return catalog

ITEM_DBC_HEADER=struct.Struct('<4s4I')
ITEM_DBC_RECORD=struct.Struct('<Iiiiiiii')
ITEM_DBC_MAGIC=b'WDBC'
ITEM_DBC_FIELD_COUNT=8
ITEM_DBC_COLUMNS=['ID','ClassID','SubclassID','SoundOverrideSubclassID','Material','DisplayInfoID','InventoryType','SheatheType']

def item_dbc_row(item):
    return (int(item['entry']),int(item['item_class']),int(item['subclass']),-1,int(item['Material']),
            int(item['displayid']),int(item['InventoryType']),int(item['sheath']))

def _normalise_item_dbc_row(row):
    if len(row)!=ITEM_DBC_FIELD_COUNT:
        raise ValueError(f'Item.dbc row must contain {ITEM_DBC_FIELD_COUNT} fields: {row!r}')
    try:
        values=tuple(int(value) for value in row)
    except (TypeError,ValueError) as exc:
        raise ValueError(f'Item.dbc row contains a non-integer value: {row!r}') from exc
    if not 0<=values[0]<=0xFFFFFFFF or any(not -0x80000000<=value<=0x7FFFFFFF for value in values[1:]):
        raise ValueError(f'Item.dbc row contains an out-of-range value: {row!r}')
    return values

def _read_item_dbc(path):
    path=Path(path)
    data=path.read_bytes()
    if len(data)<ITEM_DBC_HEADER.size:
        raise ValueError(f'Item.dbc is shorter than its header: {path}')
    magic,record_count,field_count,record_size,string_block_size=ITEM_DBC_HEADER.unpack_from(data)
    if magic!=ITEM_DBC_MAGIC:
        raise ValueError(f'unsupported Item.dbc magic {magic!r}: {path}')
    if field_count!=ITEM_DBC_FIELD_COUNT:
        raise ValueError(f'Item.dbc field count is {field_count}, expected {ITEM_DBC_FIELD_COUNT}: {path}')
    if record_size!=ITEM_DBC_RECORD.size:
        raise ValueError(f'Item.dbc record size is {record_size}, expected {ITEM_DBC_RECORD.size}: {path}')
    expected_size=ITEM_DBC_HEADER.size+record_count*record_size+string_block_size
    if len(data)!=expected_size:
        raise ValueError(f'Item.dbc size is {len(data)}, expected {expected_size}: {path}')
    rows={}
    offset=ITEM_DBC_HEADER.size
    for index in range(record_count):
        row=ITEM_DBC_RECORD.unpack_from(data,offset)
        offset+=record_size
        if row[0] in rows:
            raise ValueError(f'Item.dbc contains duplicate entry {row[0]}: {path}')
        rows[row[0]]=row
    return rows,data[offset:]

def merge_item_dbcs(source_paths,generated_rows,output_path,overwrite=False):
    if isinstance(source_paths,(str,Path)):
        source_paths=[source_paths]
    source_paths=[Path(path).expanduser().resolve() for path in source_paths]
    if not source_paths:
        raise ValueError('at least one Item.dbc source is required')
    output_path=Path(output_path).expanduser().resolve()
    if output_path in source_paths:
        raise ValueError('Item.dbc output must not replace a source file')
    existing={}
    string_block=None
    source_overlap_count=0
    for source_path in source_paths:
        rows,source_string_block=_read_item_dbc(source_path)
        if string_block is None:
            string_block=source_string_block
        elif source_string_block!=string_block:
            raise ValueError(f'Item.dbc sources have different string blocks: {source_paths[0]} and {source_path}')
        for entry,row in rows.items():
            if entry in existing:
                source_overlap_count+=1
                if existing[entry]!=row:
                    raise ValueError(f'conflicting Item.dbc source rows for entry {entry}: {source_path}')
            else:
                existing[entry]=row
    generated={}
    for raw_row in generated_rows:
        row=_normalise_item_dbc_row(raw_row)
        if row[0] in generated:
            raise ValueError(f'generated Item.dbc rows contain duplicate entry {row[0]}')
        generated[row[0]]=row
    conflicts=sorted(entry for entry,row in generated.items() if entry in existing and existing[entry]!=row)
    if conflicts and not overwrite:
        sample=', '.join(map(str,conflicts[:20]))
        suffix='...' if len(conflicts)>20 else ''
        raise ValueError(f'Item.dbc contains conflicting generated entries ({len(conflicts)}): {sample}{suffix}; use --item-dbc-overwrite to replace them')
    merged=dict(existing)
    merged.update(generated)
    payload=b''.join(ITEM_DBC_RECORD.pack(*merged[entry]) for entry in sorted(merged))
    header=ITEM_DBC_HEADER.pack(ITEM_DBC_MAGIC,len(merged),ITEM_DBC_FIELD_COUNT,ITEM_DBC_RECORD.size,len(string_block))
    output_path.parent.mkdir(parents=True,exist_ok=True)
    output_path.write_bytes(header+payload+string_block)
    return {'source_file_count':len(source_paths),'source_paths':[str(path) for path in source_paths],
            'source_row_count':len(existing),'source_overlap_count':source_overlap_count,
            'generated_row_count':len(generated),'merged_row_count':len(merged),
            'overwritten_row_count':len(conflicts),'string_block_size':len(string_block)}

def merge_item_dbc(source_path,generated_rows,output_path,overwrite=False):
    return merge_item_dbcs([source_path],generated_rows,output_path,overwrite)

WORLD_LOOT_ROW_RE=re.compile(r'^\s*\(\s*\d+\s*,\s*\d+\s*,\s*(-?\d+)\s*,.*?World Loot Level\s+(\d+)\b',re.IGNORECASE)
REFERENCE_ENTRY_RE=re.compile(r'^\s*\(\s*(\d+)\s*,')

def _load_loot_insert_rows(path):
    path=Path(path)
    text=path.read_text(encoding='utf-8')
    inserts=list(re.finditer(r'\bINSERT\s+INTO\b.*?\bVALUES\b',text,re.IGNORECASE|re.DOTALL))
    rows=[]
    for index,match in enumerate(inserts):
        end=inserts[index+1].start() if index+1<len(inserts) else len(text)
        rows.extend(_scan_sql_tuples(text[match.end():end]))
    if rows: return rows
    return [_split_sql_tuple(line) for line in text.splitlines() if REFERENCE_ENTRY_RE.match(line) and _split_sql_tuple(line) is not None]

def _load_reference_entries(path):
    entries={int(row[0]):True for row in _load_loot_insert_rows(path) if row and str(row[0]).strip().lstrip('-').isdigit()}
    if not entries:
        raise ValueError(f'no reference loot rows found in {path}')
    return entries

def load_loot_entry_ids(path):
    entries={int(row[0]) for row in _load_loot_insert_rows(path) if row and str(row[0]).strip().lstrip('-').isdigit()}
    if not entries: raise ValueError(f'no loot-template rows found in {path}')
    return entries

def _catalog_reference_contexts():
    contexts=defaultdict(list)
    for (kind,subclass,inventory_type),rows in A.items():
        for row in rows:
            contexts[row[0]].append((row[1],4,subclass,inventory_type,row[2],row[3],f'{kind}[{subclass},{inventory_type}]'))
    for weapon_kind,rows in W.items():
        subclass,inventory_type,_=WEAPON_META[weapon_kind]
        for row in rows:
            contexts[row[0]].append((row[1],2,subclass,inventory_type,row[2],row[3],weapon_kind))
    return contexts

def _split_sql_tuple(line):
    text=line.strip()
    if not text.startswith('('): return None
    if text.endswith(';'): text=text[:-1]
    if text.endswith(','): text=text[:-1]
    if not text.endswith(')'): return None
    text=text[1:-1]
    values=[]; value=[]; quoted=False; index=0
    while index<len(text):
        char=text[index]
        if quoted:
            value.append(char)
            if char=='\\' and index+1<len(text):
                index+=1; value.append(text[index])
            elif char=="'":
                if index+1<len(text) and text[index+1]=="'":
                    index+=1; value.append(text[index])
                else:
                    quoted=False
        elif char=="'":
            quoted=True; value.append(char)
        elif char==',':
            values.append(''.join(value).strip()); value=[]
        else:
            value.append(char)
        index+=1
    if quoted: raise ValueError('unterminated SQL string')
    values.append(''.join(value).strip())
    return values

WEAPON_HARVEST_RULES = {
    0:('1h_axe',{13,21,22}), 1:('2h_axe',{17}), 2:('bow',{15}), 3:('gun',{26}),
    4:('1h_mace',{13,21,22}), 5:('2h_mace',{17}), 6:('polearm',{17}),
    7:('1h_sword',{13,21,22}), 8:('2h_sword',{17}), 10:('staff',{17}),
    13:('fist',{13,21,22}), 15:('dagger',{13,21,22}), 18:('crossbow',{26}), 19:('wand',{26}),
}
# Current AzerothCore item_template column positions. The v2.6 harvester was
# accidentally reading stat slots as weapon damage/delay fields, which caused
# every weapon category to fall back to the tiny curated catalog.
ITEM_TEMPLATE_DMG_MIN1_INDEX = 49
ITEM_TEMPLATE_DMG_MAX1_INDEX = 50
ITEM_TEMPLATE_DMG_TYPE1_INDEX = 51
ITEM_TEMPLATE_DELAY_INDEX = 62
ARMOR_INVENTORY_TYPES = {1,3,5,6,7,8,9,10,20}

def _dedupe_catalog_rows(rows):
    # Keep one representative per visual display. Prefer the earliest/lowest-ilvl
    # stock use so appearance progression stays grounded in when that look entered play.
    by_display={}
    for row in rows:
        displayid=row[1]
        previous=by_display.get(displayid)
        if previous is None or (row[2],row[3],row[0]) < (previous[2],previous[3],previous[0]):
            by_display[displayid]=row
    return sorted(by_display.values(),key=lambda row:(row[2],row[3],row[0]))

def harvest_reference_catalog(path):
    path=Path(path).expanduser().resolve()
    armor=defaultdict(list); weapons=defaultdict(list)
    parsed_rows=0; eligible_rows=0
    with path.open(encoding='utf-8') as source:
        for line_number,line in enumerate(source,1):
            if not REFERENCE_ENTRY_RE.match(line):
                continue
            fields=_split_sql_tuple(line)
            if fields is None or len(fields)<=ITEM_TEMPLATE_DELAY_INDEX:
                continue
            parsed_rows+=1
            try:
                entry=int(fields[0]); item_class=int(fields[1]); subclass=int(fields[2])
                displayid=int(fields[5]); quality=int(fields[6]); inventory_type=int(fields[12]); item_level=int(fields[15])
            except (TypeError,ValueError):
                continue
            if displayid<=0 or item_level<0 or quality<0 or quality>5:
                continue

            if item_class==4:
                key=None
                if subclass in (1,2,3,4) and inventory_type in ARMOR_INVENTORY_TYPES:
                    key=('armor',subclass,inventory_type)
                elif subclass==1 and inventory_type==16:
                    key=('misc',1,16)
                elif subclass==0 and inventory_type in (2,11,12):
                    key=('misc',0,inventory_type)
                elif subclass==6 and inventory_type==14:
                    key=('shield',6,14)
                elif subclass in (7,8,9,10) and inventory_type==28:
                    key=('relic',subclass,28)
                if key is not None:
                    armor[key].append((entry,displayid,item_level,quality)); eligible_rows+=1
                continue

            if item_class==2 and subclass in WEAPON_HARVEST_RULES:
                kind,allowed_inventory=WEAPON_HARVEST_RULES[subclass]
                if inventory_type not in allowed_inventory:
                    continue
                try:
                    dmin=float(fields[ITEM_TEMPLATE_DMG_MIN1_INDEX])
                    dmax=float(fields[ITEM_TEMPLATE_DMG_MAX1_INDEX])
                    school=int(fields[ITEM_TEMPLATE_DMG_TYPE1_INDEX])
                    delay=int(fields[ITEM_TEMPLATE_DELAY_INDEX])
                except (TypeError,ValueError):
                    continue
                if dmin<=0 or dmax<dmin or delay<=0:
                    continue
                weapons[kind].append((entry,displayid,item_level,quality,delay,dmin,dmax,school)); eligible_rows+=1

    armor={key:_dedupe_catalog_rows(rows) for key,rows in armor.items() if rows}
    weapons={key:_dedupe_catalog_rows(rows) for key,rows in weapons.items() if rows}
    harvested_rows=[row for rows in armor.values() for row in rows] + [row for rows in weapons.values() for row in rows]
    harvested_reference_count=len(harvested_rows)
    harvested_unique_displayids=len({row[1] for row in harvested_rows})
    fallback=[]
    for key,rows in FALLBACK_A.items():
        if not armor.get(key):
            armor[key]=list(rows); fallback.append(f'A:{key}')
    for key,rows in FALLBACK_W.items():
        if not weapons.get(key):
            weapons[key]=list(rows); fallback.append(f'W:{key}')

    all_rows=[row for rows in armor.values() for row in rows] + [row for rows in weapons.values() for row in rows]
    report={
        'source':str(path),'mode':'auto-harvested-stock-item-template','parsed_rows':parsed_rows,
        'eligible_rows':eligible_rows,'reference_count':harvested_reference_count,'unique_displayids':harvested_unique_displayids,
        'effective_reference_count':len(all_rows),'effective_unique_displayids':len({row[1] for row in all_rows}),
        'armor_category_count':len(armor),'weapon_category_count':len(weapons),'fallback_categories':fallback,
        'errors':[],'display_mismatches':[],'metadata_mismatches':[],
        'inventory_type_mismatches':[],'template_mismatches':[],
    }
    return armor,weapons,report

def _load_item_template_rows(path,entries):
    wanted=set(entries)
    if not wanted: raise ValueError('item-template reference catalog is empty')
    rows={}
    with path.open(encoding='utf-8') as source:
        for line_number,line in enumerate(source,1):
            match=REFERENCE_ENTRY_RE.match(line)
            if not match: continue
            entry=int(match.group(1))
            if entry not in wanted: continue
            fields=_split_sql_tuple(line)
            if fields is None or len(fields)<=12:
                raise ValueError(f'unparseable item-template row at {path}:{line_number}')
            try:
                row=(int(fields[1]),int(fields[2]),int(fields[5]),int(fields[12]),int(fields[15]),int(fields[6]))
            except (TypeError,ValueError) as exc:
                raise ValueError(f'unparseable item-template fields at {path}:{line_number}') from exc
            previous=rows.get(entry)
            if previous is not None and previous!=row:
                raise ValueError(f'item-template entry {entry} has conflicting rows in {path}')
            rows[entry]=row
    missing=sorted(wanted-set(rows))
    if missing: raise ValueError(f'catalog references missing from {path}: {missing[:10]}')
    return rows

def validate_reference_catalog(path=None):
    path=Path(DEFAULT_ITEM_TEMPLATE_SOURCE if path is None else path).expanduser().resolve()
    _armor,_weapons,report=harvest_reference_catalog(path)
    return report

def load_world_loot_references(world_path=None,reference_path=None):
    world_path=Path(DEFAULT_WORLD_LOOT_SOURCE if world_path is None else world_path)
    reference_path=Path(DEFAULT_REFERENCE_LOOT_SOURCE if reference_path is None else reference_path)
    levels={}
    for row in _load_loot_insert_rows(world_path):
        if len(row)<=9 or 'world loot level' not in str(row[9]).lower(): continue
        match=re.search(r'world loot level\s+(\d+)\b',str(row[9]),re.IGNORECASE)
        if not match: raise ValueError(f'unparseable world-loot row in {world_path}')
        try:
            reference_id=int(row[2]); level=int(match.group(1))
        except (TypeError,ValueError) as exc:
            raise ValueError(f'unparseable world-loot row in {world_path}') from exc
        if reference_id<=0 or level<1:
            raise ValueError(f'invalid world-loot mapping in {world_path}')
        previous=levels.get(reference_id)
        if previous is not None and previous!=level:
            raise ValueError(f'world-loot reference {reference_id} maps to both levels {previous} and {level}')
        levels[reference_id]=level
    if not levels:
        raise ValueError(f'no World Loot Level rows found in {world_path}')
    missing=sorted(set(levels)-set(_load_reference_entries(reference_path)))
    if missing:
        raise ValueError(f'world-loot references missing from {reference_path}: {missing[:10]}')
    return dict(sorted(levels.items()))

def _loot_bracket_index(level):
    if level<1: raise ValueError(f'loot level must be positive: {level}')
    for index,(_label,lo,hi) in enumerate(LOOT_BRACKETS):
        if lo<=min(level,80)<=hi: return index
    raise ValueError(f'loot level has no bracket: {level}')

def _loot_attachment_item(parent_reference):
    item=GENERATED_LOOT_ATTACHMENT_ITEM_BASE+parent_reference
    if item>0xFFFFFFFF:
        raise ValueError(f'generated loot attachment key exceeds uint32: {parent_reference}')
    return item

def build_loot_records(items,world_references):
    grouped=defaultdict(list)
    for item in items: grouped[_loot_bracket_index(item['RequiredLevel'])].append(item)

    pools=[]; pool_rows=[]; active_indexes=set()
    for index,(label,lo,hi) in enumerate(LOOT_BRACKETS):
        group=grouped.get(index,[])
        if not group: continue
        pool_id=GENERATED_LOOT_POOL_BASE+index; active_indexes.add(index)
        pools.append({'pool_id':pool_id,'bracket':label,'level_min':lo,'level_max':hi,'item_count':len(group)})
        for item in group:
            pool_rows.append({'pool_id':pool_id,'item':item['entry'],'bracket':label,'comment':f'Generated item pool {label} | {item["name"]}'})

    attachments=[]
    for parent_reference,world_level in sorted(world_references.items()):
        index=_loot_bracket_index(world_level)
        if index not in active_indexes: continue
        label=LOOT_BRACKETS[index][0]; pool_id=GENERATED_LOOT_POOL_BASE+index
        attachments.append({'parent_reference':parent_reference,'item':_loot_attachment_item(parent_reference),
                            'pool_id':pool_id,'world_level':world_level,'bracket':label})

    item_pool_counts=Counter(row['item'] for row in pool_rows)
    if len(pool_rows)!=len(items) or any(item_pool_counts[item['entry']]!=1 for item in items):
        raise RuntimeError('every generated item must appear in exactly one generated loot pool')
    if len({row['item'] for row in pool_rows})!=len(pool_rows):
        raise RuntimeError('generated loot pool contains duplicate item keys')
    if len({row['item'] for row in attachments})!=len(attachments):
        raise RuntimeError('generated loot attachments contain duplicate keys')
    return {'pools':pools,'pool_rows':pool_rows,'attachments':attachments}

def resolve_encounter_order(profile):
    encounters=list(profile.get('encounters',()))
    nodes={str(row.get('id','')):dict(row) for row in encounters}
    if len(nodes)!=len(encounters) or '' in nodes:
        raise ValueError(f'profile {profile.get("id", "<unknown>")} has duplicate or missing encounter IDs')
    requires={node_id:[str(value) for value in node.get('requires',())] for node_id,node in nodes.items()}
    for node_id,parents in requires.items():
        if node_id in parents or any(parent not in nodes for parent in parents):
            raise ValueError(f'encounter {node_id} has an invalid prerequisite')

    indegree={node_id:len(parents) for node_id,parents in requires.items()}
    children=defaultdict(list)
    for node_id,parents in requires.items():
        for parent in parents: children[parent].append(node_id)
    ready=sorted(node_id for node_id,count in indegree.items() if count==0)
    ranks={node_id:0 for node_id in ready}
    resolved=[]
    while ready:
        current=ready
        ready=[]
        for node_id in current:
            row=dict(nodes[node_id]); row['rank']=ranks[node_id]; resolved.append(row)
            for child in sorted(children[node_id]):
                ranks[child]=max(ranks.get(child,0),ranks[node_id]+1)
                indegree[child]-=1
                if indegree[child]==0: ready.append(child)
        ready.sort()
    if len(resolved)!=len(nodes):
        raise ValueError(f'profile {profile.get("id", "<unknown>")} has a cycle in encounter prerequisites')
    return resolved

def _strip_json_comments(text):
    output=[]; index=0; quoted=False; escaped=False; line_comment=False; block_comment=False
    while index<len(text):
        char=text[index]
        if line_comment:
            if char in '\r\n': line_comment=False; output.append(char)
            else: output.append(' ')
        elif block_comment:
            if text.startswith('*/',index): block_comment=False; output.extend((' ',' ')); index+=1
            else: output.append(char if char in '\r\n' else ' ')
        elif quoted:
            output.append(char)
            if escaped: escaped=False
            elif char=='\\': escaped=True
            elif char=='"': quoted=False
        elif char=='"': quoted=True; output.append(char)
        elif text.startswith('//',index): line_comment=True; output.extend((' ',' ')); index+=1
        elif text.startswith('/*',index): block_comment=True; output.extend((' ',' ')); index+=1
        else: output.append(char)
        index+=1
    if block_comment: raise ValueError('unterminated content manifest block comment')
    return ''.join(output)

def load_content_manifest(path):
    path=Path(path).expanduser().resolve()
    try:
        manifest=json.loads(_strip_json_comments(path.read_text(encoding='utf-8')))
    except json.JSONDecodeError as exc:
        raise ValueError(f'invalid content manifest JSON: {path}: {exc.msg}') from exc
    validate_content_manifest(manifest)
    return manifest

def validate_content_manifest(manifest):
    if not isinstance(manifest,dict) or manifest.get('version')!=1:
        raise ValueError('content manifest must be an object with version 1')
    profiles=manifest.get('profiles',[])
    recipes=manifest.get('recipes',[])
    quests=manifest.get('quest_targets',[])
    if not all(isinstance(rows,list) for rows in (profiles,recipes,quests)):
        raise ValueError('content manifest profiles, recipes, and quest_targets must be lists')
    profile_ids=[]; target_keys=set()
    for profile in profiles:
        if not isinstance(profile,dict) or not str(profile.get('id','')).strip():
            raise ValueError('content profiles need non-empty IDs')
        profile_id=str(profile['id'])
        if profile_id in profile_ids: raise ValueError(f'duplicate content profile: {profile_id}')
        profile_ids.append(profile_id)
        lo=int(profile.get('item_level_min',0)); hi=int(profile.get('item_level_max',0))
        if lo<0 or hi<lo: raise ValueError(f'invalid item-level range for profile {profile_id}')
        chance=float(profile.get('additional_drop_chance',0))
        if not 0<=chance<=100: raise ValueError(f'invalid additional-drop chance for profile {profile_id}')
        if profile.get('loot_mode') is not None and not 0<int(profile['loot_mode'])<=65535:
            raise ValueError(f'invalid loot mode for profile {profile_id}')
        for encounter in profile.get('encounters',[]):
            if not isinstance(encounter,dict) or not str(encounter.get('id','')).strip():
                raise ValueError(f'profile {profile_id} has an encounter without an ID')
            if encounter.get('kind') not in ('boss','trash'):
                raise ValueError(f'encounter {encounter.get("id")} must be boss or trash')
            weight=float(encounter.get('weight',1))
            if weight<=0: raise ValueError(f'encounter {encounter.get("id")} must have a positive weight')
            quantity=int(encounter.get('quantity',1))
            if quantity<1: raise ValueError(f'encounter {encounter.get("id")} must have a positive quantity')
            if encounter.get('loot_mode') is not None and not 0<int(encounter['loot_mode'])<=65535:
                raise ValueError(f'invalid loot mode for encounter {encounter.get("id")}')
            for target in encounter.get('targets',[]):
                target_type=target.get('type') if isinstance(target,dict) else None
                entry=int(target.get('entry',0)) if isinstance(target,dict) else 0
                if target_type not in ('creature','gameobject','reference') or entry<=0:
                    raise ValueError(f'encounter {encounter.get("id")} has an invalid loot target')
                key=(profile_id,encounter.get('id'),target_type,entry) if target_type=='gameobject' else (profile_id,target_type,entry)
                if key in target_keys: raise ValueError(f'duplicate loot target: {target_type}:{entry}')
                target_keys.add(key)
        resolve_encounter_order(profile)
    recipe_ids=[]
    for recipe in recipes:
        if not isinstance(recipe,dict) or not str(recipe.get('id','')).strip():
            raise ValueError('content recipes need non-empty IDs')
        recipe_id=str(recipe['id'])
        if recipe_id in recipe_ids: raise ValueError(f'duplicate content recipe: {recipe_id}')
        recipe_ids.append(recipe_id)
        if recipe.get('set_count') is not None:
            if int(recipe.get('set_count',0))<1 or not 1<=int(recipe.get('set_size',5))<=10:
                raise ValueError(f'recipe {recipe_id} needs a positive set_count and set_size between 1 and 10')
        elif int(recipe.get('count',0))<1:
            raise ValueError(f'recipe {recipe_id} needs a positive count')
        if recipe.get('profile') is not None and str(recipe['profile']) not in profile_ids:
            raise ValueError(f'recipe {recipe_id} references unknown profile {recipe["profile"]}')
    for target in quests:
        if not isinstance(target,dict) or int(target.get('quest_id',0))<=0:
            raise ValueError('quest targets need positive quest_id values')
        if target.get('mode','fixed') not in ('fixed','choice'):
            raise ValueError(f'quest {target.get("quest_id")} mode must be fixed or choice')
        recipe_id=target.get('recipe')
        if recipe_id is not None and str(recipe_id) not in recipe_ids:
            raise ValueError(f'quest target references unknown recipe: {recipe_id}')
    return manifest

def allocate_weighted_counts(total,targets):
    total=int(total)
    if total<0: raise ValueError(f'weighted allocation total must be nonnegative: {total}')
    rows=[(str(row.get('id','')),float(row.get('weight',1))) for row in targets]
    if len({row[0] for row in rows})!=len(rows) or any(not row[0] for row in rows):
        raise ValueError('weighted allocation targets must have unique non-empty IDs')
    active=[row for row in rows if row[1]>0]
    if total and not active: raise ValueError('weighted allocation needs a positive target weight')
    if not total: return {row[0]:0 for row in rows}
    weight_total=sum(weight for _,weight in active)
    counts={target:0 for target,_ in rows}
    remainders=[]
    for target,weight in active:
        raw=total*weight/weight_total
        count=math.floor(raw)
        counts[target]=count
        remainders.append((raw-count,target))
    remaining=total-sum(counts.values())
    for _,target in sorted(remainders,key=lambda row:(-row[0],row[1]))[:remaining]:
        counts[target]+=1
    return counts

def encounter_item_level_band(profile,encounter,resolved):
    explicit=encounter.get('item_level')
    if explicit is not None:
        if not isinstance(explicit,(list,tuple)) or len(explicit)!=2: raise ValueError(f'encounter {encounter["id"]} item_level must be a two-value range')
        lo,hi=map(int,explicit)
    elif 'item_level_min' in encounter or 'item_level_max' in encounter:
        lo=int(encounter.get('item_level_min',profile['item_level_min'])); hi=int(encounter.get('item_level_max',profile['item_level_max']))
    else:
        profile_lo=int(profile['item_level_min']); profile_hi=int(profile['item_level_max'])
        max_rank=max((row['rank'] for row in resolved),default=0)
        if max_rank==0: lo,hi=profile_lo,profile_hi
        else:
            lo=profile_lo+((profile_hi-profile_lo)*encounter['rank'])//(max_rank+1)
            hi=profile_lo+((profile_hi-profile_lo)*(encounter['rank']+1))//(max_rank+1)
            if encounter.get('kind')=='boss' and encounter['id']==next((row['id'] for row in reversed(resolved) if row.get('kind')=='boss'),None): hi=profile_hi
    if lo<0 or hi<lo: raise ValueError(f'invalid item-level band for encounter {encounter["id"]}: {lo}-{hi}')
    return lo,hi

def validate_loot_targets(profile,source_rows):
    for encounter in profile.get('encounters',()):
        for target in encounter.get('targets',()):
            target_type=target['type']; entry=int(target['entry'])
            if entry not in source_rows.get(target_type,set()):
                raise ValueError(f'loot target {target_type}:{entry} for {profile["id"]}/{encounter["id"]} was not found in the supplied SQL source')

def build_encounter_loot_records(items,profile,source_rows,pool_base=GENERATED_ENCOUNTER_POOL_BASE):
    validate_loot_targets(profile,source_rows)
    resolved=resolve_encounter_order(profile)
    encounters=[row for row in resolved if row.get('targets')]
    eligible=[item for item in items if item.get('content_profile')==profile.get('id')]
    if not eligible: return {'profile_id':profile.get('id'),'order':resolved,'encounters':{},'pool_rows':[],'attachments':[]}
    explicit=[item for item in eligible if item.get('content_target')]
    if explicit and len(explicit)!=len(eligible): raise ValueError(f'profile {profile["id"]} mixes explicit and automatic encounter assignments')
    if not explicit:
        counts=allocate_weighted_counts(len(eligible),encounters)
        ordered=sorted(eligible,key=lambda item:h64(profile['id'],item['entry'],'encounter'))
        cursor=0
        for encounter in encounters:
            for item in ordered[cursor:cursor+counts[encounter['id']]]: item['content_target']=encounter['id']
            cursor+=counts[encounter['id']]
    encounter_by_id={row['id']:row for row in encounters}
    if any(item.get('content_target') not in encounter_by_id for item in eligible):
        raise ValueError(f'generated item references an unknown encounter in profile {profile["id"]}')
    pool_rows=[]; attachments=[]; result={}
    for index,encounter in enumerate(encounters):
        target_items=[item for item in eligible if item.get('content_target')==encounter['id']]
        if not target_items: continue
        pool_id=pool_base+index; chance=float(encounter.get('additional_drop_chance',profile.get('additional_drop_chance',0)))
        loot_mode=int(encounter.get('loot_mode',profile.get('loot_mode',loot_mode_for_difficulty(profile.get('map_type'),profile.get('difficulty_id')))))
        quantity=int(encounter.get('quantity',profile.get('quantity',1))); band=encounter_item_level_band(profile,encounter,resolved)
        if not 0<=chance<=100 or quantity<1 or not 0<loot_mode<=65535: raise ValueError(f'invalid loot settings for encounter {encounter["id"]}')
        if any(not band[0]<=item['ItemLevel']<=band[1] for item in target_items if 'ItemLevel' in item):
            raise ValueError(f'items assigned to {profile["id"]}/{encounter["id"]} fall outside its item-level band')
        if any(('RequiredLevel' in item or encounter.get('required_level_min') is not None or profile.get('required_level_min') is not None)
               and not encounter_item_eligibility(item,profile,encounter,resolved) for item in target_items):
            raise ValueError(f'items assigned to {profile["id"]}/{encounter["id"]} fall outside its RequiredLevel/quality band')
        for item in target_items:
            pool_rows.append({'pool_id':pool_id,'item':item['entry'],'encounter':encounter['id'],
                              'comment':f'Generated {profile["id"]} {encounter["id"]} | {item["name"] if item.get("name") else item["entry"]}'})
        for target in encounter['targets']:
            attachments.append({'parent_type':target['type'],'parent_entry':int(target['entry']),'pool_id':pool_id,
                                'encounter':encounter['id'],'chance':chance,'quantity':quantity,'loot_mode':loot_mode})
        result[encounter['id']]={'pool_id':pool_id,'item_count':len(target_items),'rank':encounter['rank'],
                                 'band':band,'chance':chance,'quantity':quantity,'loot_mode':loot_mode,'targets':encounter['targets']}
    return {'profile_id':profile.get('id'),'order':resolved,'encounters':result,'pool_rows':pool_rows,'attachments':attachments}

def build_manifest_encounter_loot_records(items,manifest,world_path,reference_path,source_catalog=None):
    source_rows={'creature':source_catalog['creature_loot_entries'],
                 'reference':source_catalog['reference_loot_entries'],
                 'gameobject':source_catalog.get('gameobject_loot_entries',set())} if source_catalog else {
                     'creature':load_loot_entry_ids(world_path),'reference':load_loot_entry_ids(reference_path),
                     'gameobject':set()}
    records=[]
    for index,profile in enumerate(manifest.get('profiles',())):
        record=build_encounter_loot_records(items,profile,source_rows,
                                             GENERATED_ENCOUNTER_POOL_BASE+index*10_000)
        if record['encounters']: records.append(record)
    used_pools=[pool['pool_id'] for record in records for pool in record['encounters'].values()]
    if len(used_pools)!=len(set(used_pools)) or any(pool_id in source_rows['reference'] for pool_id in used_pools):
        raise ValueError('generated encounter pool ID collides with an existing reference-loot entry')
    return records


def _sibling_conflict_is_active(conflict,profiles):
    profile_ids=tuple(conflict.get('profile_ids',()))
    selected=[profiles.get(profile_id) for profile_id in profile_ids if profile_id in profiles]
    if len(selected)<2: return False
    if len({int(profile.get('map_id',-1)) for profile in selected})!=1: return False
    families=[_profile_active_families(profile) for profile in selected]
    return bool(families[0] & families[1])


def validate_encounter_integration(items,manifest,records,catalog):
    profiles={profile['id']:profile for profile in (manifest or {}).get('profiles',())}
    errors=[]; warnings=[]; pool_ids=[]; record_targets=set()
    sibling_conflicts=list((manifest or {}).get('sibling_conflicts',()))
    for profile in profiles.values():
        sibling_conflicts.extend((profile.get('evidence') or {}).get('sibling_progression_era_conflict',()))
    seen_conflicts=set()
    for conflict in sibling_conflicts:
        key=(conflict.get('reason'),tuple(conflict.get('profile_ids',())))
        if key in seen_conflicts: continue
        seen_conflicts.add(key)
        message='sibling_progression_era_conflict for profiles '+','.join(str(profile_id) for profile_id in conflict.get('profile_ids',()))
        if _sibling_conflict_is_active(conflict,profiles): errors.append(message)
        else: warnings.append(message+' (diagnostic only)')
    encounter_map={(profile['id'],encounter['id']):encounter
                   for profile in profiles.values() for encounter in profile.get('encounters',())}
    for profile in profiles.values():
        if profile.get('valid',True) is False: errors.append(f'profile {profile["id"]} is invalid')
        if profile.get('item_level_min') is None or profile.get('item_level_max') is None:
            errors.append(f'profile {profile["id"]} has no safe ItemLevel band')
        elif int(profile['item_level_min'])>int(profile['item_level_max']):
            errors.append(f'profile {profile["id"]} has an inverted ItemLevel band')
        if profile.get('required_level_min') is not None and profile.get('required_level_max') is not None and int(profile['required_level_min'])>int(profile['required_level_max']):
            errors.append(f'profile {profile["id"]} has an inverted RequiredLevel band')
        if profile.get('loot_mode') is not None and not 0<int(profile['loot_mode'])<=65535:
            errors.append(f'profile {profile["id"]} has an invalid LootMode')
        for encounter in profile.get('encounters',()):
            evidence=encounter.get('evidence') or {}
            if evidence.get('item_level_min') is not None and (int(evidence['item_level_min'])<int(profile.get('item_level_min',evidence['item_level_min'])) or int(evidence['item_level_max'])>int(profile.get('item_level_max',evidence['item_level_max']))):
                errors.append(f'profile {profile["id"]}/{encounter["id"]} ItemLevel range contradicts the profile range')
            if evidence.get('required_level_min') is not None and profile.get('required_level_min') is not None and (int(evidence['required_level_min'])<int(profile['required_level_min']) or int(evidence['required_level_max'])>int(profile.get('required_level_max',evidence['required_level_max']))):
                errors.append(f'profile {profile["id"]}/{encounter["id"]} RequiredLevel range contradicts the profile range')
    for record in records or ():
        if record.get('profile_id') not in profiles:
            errors.append(f'unknown encounter record profile {record.get("profile_id")}')
            continue
        for encounter_id,info in record.get('encounters',{}).items():
            pool_id=info.get('pool_id')
            pool_ids.append(pool_id)
            record_targets.add((record['profile_id'],encounter_id))
            if (record['profile_id'],encounter_id) not in encounter_map:
                errors.append(f'unknown encounter record target {record["profile_id"]}/{encounter_id}')
            if not info.get('targets'): errors.append(f'encounter {record["profile_id"]}/{encounter_id} has no targets')
    if len(pool_ids)!=len(set(pool_ids)): errors.append('generated encounter pool IDs are not unique')

    coverage=(manifest or {}).get('coverage',())
    heroic_candidates=[row for row in coverage if int(row.get('map_type',0) or 0)==1 and int(row.get('difficulty_id',-1))==1 and int(row.get('expansion',-1) or -1)==2]
    heroic_profiles={(int(profile.get('map_id')),int(profile.get('difficulty_id'))) for profile in profiles.values() if int(profile.get('map_type',0) or 0)==1 and int(profile.get('difficulty_id',-1))==1 and int(profile.get('expansion',-1) or -1)==2 and profile.get('valid',True)}
    heroic_candidate_keys={(int(row.get('map_id')),int(row.get('difficulty_id'))) for row in heroic_candidates}
    missing_heroic=heroic_candidate_keys-heroic_profiles
    unexercised_gameobject_missing=[row for row in heroic_candidates if (int(row.get('map_id')),int(row.get('difficulty_id'))) in missing_heroic and row.get('excluded_reason')=='gameobject reward source not_exercised']
    if gameobject_support_state(catalog if catalog else {})=='not_exercised':
        unexercised_gameobject_missing.extend(row for row in heroic_candidates if (int(row.get('map_id')),int(row.get('difficulty_id'))) in missing_heroic and int(row.get('boss_count',0) or 0)==0 and int(row.get('trash_target_count',0) or 0)==0 and row not in unexercised_gameobject_missing)
    actionable_missing=missing_heroic-{(int(row.get('map_id')),int(row.get('difficulty_id'))) for row in unexercised_gameobject_missing}
    if heroic_candidates and not heroic_profiles:
        errors.append(f'catastrophic Heroic dungeon coverage failure: 0/{len(heroic_candidates)} profiles are valid')
    elif actionable_missing:
        errors.append(f'Heroic dungeon coverage incomplete: {len(heroic_profiles)}/{len(heroic_candidates)} profiles are valid; unresolved={sorted(actionable_missing)}')
    elif missing_heroic:
        warnings.append(f'Heroic dungeon coverage incomplete only for unexercised gameobject rewards: {len(heroic_profiles)}/{len(heroic_candidates)} profiles are valid')

    set_profiles=defaultdict(set); set_targets=defaultdict(set); placed_entries=set()
    for item in items:
        profile_id=item.get('content_profile'); encounter_id=item.get('content_target')
        set_id=item.get('set_id') or item.get('itemset')
        if set_id and profile_id: set_profiles[set_id].add(profile_id); set_targets[set_id].add(encounter_id)
        if profile_id is None and encounter_id is None: continue
        placed_entries.add(item.get('entry'))
        profile=profiles.get(profile_id)
        encounter=encounter_map.get((profile_id,encounter_id))
        if profile is None:
            errors.append(f'item {item.get("entry")} references unknown encounter profile {profile_id}')
            continue
        if encounter is None:
            errors.append(f'item {item.get("entry")} references unknown encounter {profile_id}/{encounter_id}')
            continue
        if not encounter_item_eligibility(item,profile,encounter):
            if profile.get('required_level_min') is not None and not int(profile['required_level_min'])<=int(item.get('RequiredLevel',-1))<=int(profile.get('required_level_max',-1)):
                errors.append(f'item {item.get("entry")} RequiredLevel is outside {profile_id}/{encounter_id}')
            else:
                errors.append(f'item {item.get("entry")} is outside {profile_id}/{encounter_id} eligibility')
        if encounter.get('kind')=='trash' and int(item.get('Quality',item.get('quality',0)))>=5:
            errors.append(f'Legendary item {item.get("entry")} is assigned to trash')
    for set_id,profile_ids in set_profiles.items():
        if len(profile_ids)!=1: errors.append(f'set {set_id} is split across encounter profiles')
        if len(set_targets.get(set_id,()))>5: warnings.append(f'set {set_id} uses more than five encounter targets')
    return {'valid':not errors,'errors':errors,'warnings':warnings,
            'profile_count':len(profiles),'record_count':len(records or ()),
            'pool_ids':tuple(sorted(pool_ids)),'placed_entry_count':len(placed_entries),
            'set_summary':{str(set_id):{'profiles':tuple(sorted(profile_ids)),
                                        'targets':tuple(sorted(set_targets.get(set_id,()))) }
                           for set_id,profile_ids in sorted(set_profiles.items())},
            'placement_summary':{'count':len(placed_entries)}}

def assign_plan_encounters(plan,profiles):
    set_profiles=defaultdict(set)
    for row in plan:
        if row.get('set_request_index') is not None and row.get('target_kind') in ('dungeon','raid'):
            set_profiles[(row.get('recipe_id'),row.get('set_request_index'))].add(row.get('content_profile'))
    for set_key,profile_ids in set_profiles.items():
        if len(profile_ids)>1:
            raise ValueError(f'set {set_key} is split across encounter profiles')
    for profile_id,profile in profiles.items():
        rows=[row for row in plan if row.get('content_profile')==profile_id and row.get('target_kind') in ('dungeon','raid')]
        if not rows: continue
        resolved=resolve_encounter_order(profile); encounters=[row for row in resolved if row.get('targets') or row.get('weight',1)>0]
        explicit=[row for row in rows if row.get('content_target')]
        if explicit and len(explicit)!=len(rows): raise ValueError(f'profile {profile_id} mixes explicit and automatic encounter assignments')
        explicit_sets=defaultdict(set)
        for row in explicit:
            if row.get('set_request_index') is not None:
                explicit_sets[(row.get('recipe_id'),row.get('set_request_index'))].add(row.get('content_target'))
        if any(len(targets)>1 for targets in explicit_sets.values()):
            raise ValueError(f'profile {profile_id} explicitly splits a generated set across encounters')
        if not explicit:
            groups=defaultdict(list)
            for row in rows:
                key=(row['recipe_id'],row.get('set_request_index')) if row.get('set_request_index') is not None else (row['recipe_id'],row['index'])
                groups[key].append(row)
            units=[(key,members) for key,members in sorted(groups.items(),key=lambda pair:str(pair[0]))]
            if any(len(members)>1 for _,members in units):
                counts=allocate_weighted_counts(len(units),encounters)
                assignment=[]
                cursor=0
                ordered_units=sorted(units,key=lambda pair:h64(profile_id,str(pair[0]),'encounter'))
                for encounter in encounters:
                    for _key,members in ordered_units[cursor:cursor+counts[encounter['id']]]: assignment.extend((member,encounter['id']) for member in members)
                    cursor+=counts[encounter['id']]
            else:
                counts=allocate_weighted_counts(len(rows),encounters); assignment=[]; ordered_rows=sorted(rows,key=lambda row:h64(profile_id,row['recipe_id'],row['index'],'encounter')); cursor=0
                for encounter in encounters:
                    assignment.extend((row,encounter['id']) for row in ordered_rows[cursor:cursor+counts[encounter['id']]]); cursor+=counts[encounter['id']]
            for row,target in assignment: row['content_target']=target
        encounter_by_id={row['id']:row for row in resolved}
        for row in rows:
            if row.get('content_target') not in encounter_by_id: raise ValueError(f'unknown encounter {row.get("content_target")} in profile {profile_id}')
            lo,hi=encounter_item_level_band(profile,encounter_by_id[row['content_target']],resolved)
            if row.get('item_level_min') is not None: lo=max(lo,row['item_level_min'])
            if row.get('item_level_max') is not None: hi=min(hi,row['item_level_max'])
            if lo>hi: raise ValueError(f'recipe {row["recipe_id"]} cannot satisfy encounter {row["content_target"]} item-level band')
            row['item_level_min']=lo; row['item_level_max']=hi
    return plan

def assign_plan_quests(plan,targets):
    for target in targets:
        recipe_id=str(target.get('recipe','')); quest_id=int(target['quest_id']); mode=target.get('mode','fixed')
        candidates=[row for row in plan if row.get('recipe_id')==recipe_id and row.get('target_kind')=='quest' and row.get('quest_id') is None]
        count=int(target.get('count',1))
        if count<1 or len(candidates)<count: raise ValueError(f'quest {quest_id} recipe {recipe_id} does not have enough generated items')
        for row in sorted(candidates,key=lambda item:item['index'])[:count]:
            row['quest_id']=quest_id; row['quest_mode']=mode; row['quest_slot']=target.get('slot'); row['quest_quantity']=target.get('quantity')
    return plan

def h64(*parts):
    if SEED is None:
        raise RuntimeError('Runtime seed is not configured. Call configure_runtime() first.')
    s='|'.join(map(str,(SEED,)+parts)).encode()
    return int.from_bytes(hashlib.blake2b(s,digest_size=8).digest(),'big')
def r01(*parts): return h64(*parts)/18446744073709551616

def weighted(rows,*key):
    total=sum(w for _,w in rows); x=r01(*key)*total; acc=0
    for v,w in rows:
        acc+=w
        if x < acc: return v
    return rows[-1][0]

CLASS_LEVEL_MIN = {'Death Knight':55}

def _level_cycle(cname, cycle):
    min_level=CLASS_LEVEL_MIN.get(cname,1)
    levels=[l for l in range(min_level,81) for _ in range(100)]
    weights=[]
    for l in range(min_level,81):
        w=0.5 if l<20 else 0.8 if l<40 else 1.0 if l<60 else 1.5 if l<70 else 2.5 if l<75 else 5.0 if l<80 else 20.0
        weights.append((l,w))

    # Every 10,000-item cycle guarantees at least 100 items at every playable level.
    fill_count=DEFAULT_ITEMS_PER_CLASS-len(levels)
    tag='extra_level' if cycle==0 else 'extra_level_ext'
    for i in range(fill_count): levels.append(weighted(weights,cname,tag,cycle,i))
    shuffle_tag='level_shuffle' if cycle==0 else 'level_shuffle_ext'
    return [x for _,x in sorted((h64(cname,shuffle_tag,cycle,i,l),l) for i,l in enumerate(levels))]

def level_list(cname, count=DEFAULT_ITEMS_PER_CLASS):
    if not (1 <= count <= MAX_ITEMS_PER_CLASS):
        raise ValueError(f'count for {cname} must be between 1 and {MAX_ITEMS_PER_CLASS}')
    cycles=(count + DEFAULT_ITEMS_PER_CLASS - 1)//DEFAULT_ITEMS_PER_CLASS
    levels=[]
    for cycle in range(cycles):
        levels.extend(_level_cycle(cname,cycle))
    return levels[:count]

def item_level(req,entry):
    if req < 58: return max(req+1, req + 1 + int(r01(entry,'ilvl')*7))
    if req < 68: return int(80 + (req-58)*3.8 + r01(entry,'ilvl')*6)
    if req < 75: return int(112 + (req-68)*7 + r01(entry,'ilvl')*9)
    if req < 80: return int(160 + (req-75)*7 + r01(entry,'ilvl')*11)
    vals=[(187,8),(200,15),(213,15),(219,10),(226,10),(232,10),(239,7),(245,7),(251,5),(258,5),(264,4),(271,2),(277,1.5),(284,.5)]
    return weighted(vals,entry,'ilvl80')

def quality(req,ilvl,entry):
    # Hard endgame caps: greens stop after ilvl 213 and blues stop after ilvl 226.
    if ilvl>226: return 4
    if ilvl>213: rows=[(3,30),(4,70)]
    elif req<20: rows=[(2,82),(3,17.8),(4,.2)]
    elif req<40: rows=[(2,72),(3,27.5),(4,.5)]
    elif req<60: rows=[(2,60),(3,38.5),(4,1.5)]
    elif req<70: rows=[(2,50),(3,45),(4,5)]
    elif req<75: rows=[(2,38),(3,50),(4,12)]
    elif req<80: rows=[(2,25),(3,50),(4,25)]
    else: rows=[(2,10),(3,55),(4,35)]
    return weighted(rows,entry,'quality')

def slot_weights(req,cname):
    rows=[]
    for s,w in SLOT_BASE:
        if req<10:
            if s=='shoulder' or s=='trinket': w=0
            elif s in ('head','neck','finger'): w=max(1,w//4)
        elif req<20:
            if s=='shoulder': w=2
            if s=='trinket': w=1
        rows.append((s,w))
    if cname in ('Paladin','Death Knight','Shaman','Druid') and req>=50: rows.append(('relic',2))
    return [(s,w) for s,w in rows if w>0]

def armor_subclass(cname,req):
    if cname in ('Warrior','Paladin'): return 3 if req<40 else 4
    if cname in ('Hunter','Shaman'): return 2 if req<40 else 3
    if cname in ('Rogue','Druid'): return 2
    if cname in ('Priest','Mage','Warlock'): return 1
    if cname=='Death Knight': return 4
    raise ValueError(cname)

def weapon_choices(cname,role):
    if cname=='Warrior': rows=[('1h_sword',15),('1h_axe',15),('1h_mace',12),('2h_sword',18),('2h_axe',18),('2h_mace',12),('polearm',10),('bow',2),('gun',2),('crossbow',2)]
    elif cname=='Paladin': rows=[('1h_sword',18),('1h_mace',20),('1h_axe',8),('2h_sword',18),('2h_mace',18),('2h_axe',10),('polearm',8)]
    elif cname=='Hunter': rows=[('bow',30),('gun',17),('crossbow',18),('polearm',12),('2h_axe',9),('2h_sword',8),('1h_axe',3),('1h_sword',3)]
    elif cname=='Rogue': rows=[('dagger',38),('1h_sword',25),('1h_mace',14),('fist',15),('bow',3),('gun',2),('crossbow',3)]
    elif cname=='Priest': rows=[('staff',48),('1h_mace',25),('wand',27)]
    elif cname=='Death Knight': rows=[('1h_sword',14),('1h_axe',14),('1h_mace',10),('2h_sword',22),('2h_axe',22),('2h_mace',18)]
    elif cname=='Shaman':
        rows=[('1h_axe',20),('1h_mace',20),('dagger',12),('fist',12),('staff',20),('2h_axe',8),('2h_mace',8)] if role=='agility_dps' else [('1h_mace',32),('dagger',18),('staff',38),('1h_axe',12)]
    elif cname in ('Mage','Warlock'): rows=[('staff',45),('dagger',20),('1h_sword',15),('wand',20)]
    elif cname=='Druid': rows=[('staff',45),('1h_mace',20),('2h_mace',20),('dagger',10),('polearm',5)]
    else: raise ValueError(cname)
    return rows


CLASS_MASK_BY_NAME = {name:mask for name,mask,_ in CLASSES}
ROLE_COMPATIBLE_CLASSES = {
    'strength_dps': {'Warrior','Paladin','Death Knight'},
    'tank': {'Warrior','Paladin','Death Knight','Druid'},
    'agility_dps': {'Hunter','Rogue','Shaman','Druid'},
    'hunter': {'Hunter','Shaman'},
    'caster_dps': {'Priest','Shaman','Mage','Warlock','Druid'},
    'healer': {'Paladin','Priest','Shaman','Druid'},
}
WEAPON_COMPATIBLE_CLASSES = {
    '1h_sword': {'Warrior','Paladin','Hunter','Rogue','Death Knight','Mage','Warlock'},
    '2h_sword': {'Warrior','Paladin','Hunter','Death Knight'},
    '1h_axe': {'Warrior','Paladin','Hunter','Rogue','Death Knight','Shaman'},
    '2h_axe': {'Warrior','Paladin','Hunter','Death Knight','Shaman'},
    '1h_mace': {'Warrior','Paladin','Rogue','Priest','Death Knight','Shaman','Druid'},
    '2h_mace': {'Warrior','Paladin','Death Knight','Shaman','Druid'},
    'polearm': {'Warrior','Paladin','Hunter','Druid'},
    'dagger': {'Hunter','Rogue','Priest','Shaman','Mage','Warlock','Druid'},
    'staff': {'Hunter','Priest','Shaman','Mage','Warlock','Druid'},
    'fist': {'Hunter','Rogue','Shaman'},
    'bow': {'Warrior','Hunter','Rogue'},
    'gun': {'Warrior','Hunter','Rogue'},
    'crossbow': {'Warrior','Hunter','Rogue'},
    'wand': {'Priest','Mage','Warlock'},
}

def _max_armor_subclass(cname,req):
    if cname in ('Warrior','Paladin'): return 3 if req<40 else 4
    if cname in ('Hunter','Shaman'): return 2 if req<40 else 3
    if cname in ('Rogue','Druid'): return 2
    if cname in ('Priest','Mage','Warlock'): return 1
    if cname=='Death Knight': return 4 if req>=55 else 0
    return 0

def _mask_for_classes(classes):
    return sum(CLASS_MASK_BY_NAME[name] for name in classes)

def compatible_class_mask(source_class,role,req,kind,armor_subclass=None,weapon_kind=None):
    # Relics remain class-specific because their subclasses are class-specific.
    if kind=='relic':
        return CLASS_MASK_BY_NAME[source_class]

    candidates=set(ROLE_COMPATIBLE_CLASSES.get(role,{source_class}))
    if req<55:
        candidates.discard('Death Knight')

    if kind=='armor':
        candidates={name for name in candidates if armor_subclass and _max_armor_subclass(name,req)>=armor_subclass}
    elif kind=='weapon':
        candidates &= WEAPON_COMPATIBLE_CLASSES.get(weapon_kind,set())
    elif kind=='shield':
        candidates &= {'Warrior','Paladin','Shaman'}
    elif kind in ('back','neck','finger','trinket'):
        pass
    else:
        candidates={source_class}

    # Never emit an unusable mask because a role/proficiency intersection was too narrow.
    if not candidates:
        candidates={source_class}
    return _mask_for_classes(sorted(candidates))

def choose_ref(rows,ilvl,q,entry,tag):
    scored=[]
    for row in rows:
        ref_ilvl=row[2]; rq=row[3]
        score=abs(ref_ilvl-ilvl) + abs(rq-q)*10 + r01(entry,tag,row[0])*7
        scored.append((score,row))
    scored.sort(key=lambda x:x[0]); top=[r for _,r in scored[:min(5,len(scored))]]
    idx=min(len(top)-1,int((r01(entry,tag,'pick')**1.8)*len(top)))
    return top[idx]

def role_stats(cname,role,req,is_shield=False):
    if role=='strength_dps': primary=['str','stam']; sec=['crit','hit','haste','expertise','arp','ap']
    elif role=='agility_dps': primary=['agi','stam']; sec=['crit','hit','haste','expertise','arp','ap']
    elif role=='hunter': primary=['agi','stam']; sec=['crit','hit','haste','arp','ap','rap']
    elif role=='caster_dps': primary=['int','stam']; sec=['sp','hit','crit','haste','spirit','spellpen']
    elif role=='healer':
        primary=['int','stam']; sec=['sp','haste','crit','spirit','mp5']
        if cname in ('Paladin','Shaman'): sec=[x for x in sec if x!='spirit']
    elif role=='tank':
        if cname=='Druid': primary=['stam','agi']; sec=['dodge','expertise','hit','crit']
        else: primary=['stam','str']; sec=['def','dodge','parry','expertise','hit']
        if is_shield: sec += ['block','blockvalue']
    else: raise ValueError(role)
    if req<20:
        allowed={'str','agi','int','stam','spirit','ap','rap','sp','def','dodge','mp5'}
        sec=[x for x in sec if x in allowed]
    elif req<40:
        blocked={'haste','expertise','arp','spellpen','blockvalue'}
        sec=[x for x in sec if x not in blocked]
    return primary,sec

def stat_count(req,entry,slot):
    if req<10: rows=[(1,70),(2,30)]
    elif req<30: rows=[(1,15),(2,55),(3,30)]
    elif req<60: rows=[(2,30),(3,55),(4,15)]
    elif req<70: rows=[(2,15),(3,45),(4,40)]
    elif req<80: rows=[(3,35),(4,50),(5,15)]
    else: rows=[(3,20),(4,45),(5,35)]
    if slot=='relic': rows=[(1,20),(2,50),(3,30)] if req<80 else [(2,35),(3,65)]
    return weighted(rows,entry,'stat_count')

def make_stats(cname,role,req,ilvl,q,entry,budget_key,sockets,is_shield=False,force_count=None,budget_multiplier=1.0):
    n=force_count if force_count is not None else stat_count(req,entry,budget_key)
    prim,sec=role_stats(cname,role,req,is_shield)
    picks=[]
    for p in prim:
        if len(picks)<n: picks.append(p)
    pool=[x for x in sec if x not in picks]
    while len(picks)<n and pool:
        idx=int(r01(entry,'stat_pick',len(picks))*len(pool)); picks.append(pool.pop(idx))
    # If n=1, prefer the class-defining primary rather than always stamina for tanks.
    if n==1 and role=='tank' and len(prim)>1: picks=[prim[int(r01(entry,'tank_primary')*len(prim))]]
    slotmult=SLOT_BUDGET.get(budget_key,.8)
    curve=.28 + 1.20*((max(1,ilvl)/213.0)**.85)
    budget=max(n, ilvl*slotmult*curve*QUALITY_POWER[q]*(1-0.035*sockets)*budget_multiplier)
    weights=[]
    for i,p in enumerate(picks):
        base=1.16 if p in prim else 1.0
        weights.append(base*(.86+r01(entry,'stat_weight',i)*.28))
    sw=sum(weights)
    out=[]
    for i,(p,w) in enumerate(zip(picks,weights)):
        share=budget*w/sw
        cost=STAT_COST.get(p,1.0)
        val=max(1,int(round((share/cost)*(0.95+r01(entry,'stat_var',i)*.10))))
        out.append((STAT_ID[p],val,p))
    return out

MAX_NAME_CHARS = 42
MAX_NAME_WORDS = 7

NAME_GLUE_WORDS = {'a','an','and','at','by','for','from','in','of','on','the','to','s'}

def _name_tokens(name):
    return [token.lower() for token in re.findall(r"[A-Za-z]+", name)]

def _meaningful_name_tokens(name):
    tokens=[]
    for token in _name_tokens(name):
        if token in NAME_GLUE_WORDS:
            continue
        # Treat simple plurals such as Kings/King as the same naming root,
        # while avoiding words ending in -ss.
        if len(token)>=5 and token.endswith('s') and not token.endswith('ss'):
            token=token[:-1]
        tokens.append(token)
    return tokens

def has_duplicate_name_root(name):
    tokens=_meaningful_name_tokens(name)
    for i,left in enumerate(tokens):
        for right in tokens[i+1:]:
            # Any repeated meaningful standalone word is a reroll, even when
            # the two copies are separated by the rest of the item name.
            if left==right:
                return True
            # Also reject obvious compound/root echoes anywhere in the name:
            # Earthshard ... Shard, Lionheart ... Heart, Frostfire ... Fire.
            shorter,longer=(left,right) if len(left)<=len(right) else (right,left)
            if (len(shorter)>=4 and len(longer)-len(shorter)>=3
                    and (longer.startswith(shorter) or longer.endswith(shorter))):
                return True
    return False

def valid_item_name(name):
    return (len(name) <= MAX_NAME_CHARS and len(name.split()) <= MAX_NAME_WORDS
            and not name.startswith('Generated Item ')
            and not has_duplicate_name_root(name))

def _short_name_candidates(name):
    words=name.split()
    seen={name}
    for end in range(len(words)-1,1,-1):
        candidate=' '.join(words[:end])
        if candidate not in seen:
            seen.add(candidate)
            yield candidate
    compact=' '.join(word for word in words if word.lower() not in NAME_GLUE_WORDS)
    if compact and compact not in seen:
        yield compact

def repair_item_names(items):
    used={item['name'] for item in items}
    changes=[]
    for item in items:
        old_name=item['name']
        if item.get('itemset'):
            continue
        if valid_item_name(old_name):
            continue
        used.discard(old_name)
        new_name=next((candidate for candidate in _short_name_candidates(old_name)
                        if valid_item_name(candidate) and candidate not in used), None)
        if new_name is None:
            new_name=f"Generated Item {item['entry']}"
        item['name']=new_name
        used.add(new_name)
        changes.append({'entry':item['entry'],'old_name':old_name,'new_name':new_name})
    return changes

def _oath_name_rate_excessive(names):
    names=list(names)
    return len(names)>=1000 and (sum('Oath' in name for name in names)/len(names))>=0.04

OATH_NAME_ACCEPT_RATE=0.20

LEGENDARY_ROOTS = [
    'Aetherion','Ashwake','Blackstar','Dawnspire','Dreadwake','Emberfall','Everfrost','Fatesong',
    'Frostvein','Gravesong','Lightfall','Moonrend','Nightfall','Northstar','Oathrender','Rimeheart',
    'Runefall','Shadowveil','Skybreaker','Soulwake','Starfall','Stormrend','Sunscar','Voidwake',
    'Warbringer','Winterbane','Worldscar','Wyrmfall','Brightward','Deathsong','Ironheart','Duskreaver',
]
LEGENDARY_EPITHETS = [
    'Last Dawn','Fallen Star','Frozen Throne','Endless Night','Ashen Oath','World Tree','Titan Forge',
    'Silver Hand','Ebon Watch','Emerald Dream','Crimson Dawn','Storm Crown','Ancient North',
    'Final Vigil','Broken Crown','Dragon Queen','Forgotten King','Unquiet Dead','Hallowed Flame',
    'Black Citadel','Moon Guard','Wild Hunt','Deep Forge','Long Night','Final Oath','First Flame',
]
LEGENDARY_OATH_EPITHETS = [epithet for epithet in LEGENDARY_EPITHETS if 'Oath' not in epithet]

LEGENDARY_FLAVOR = {
    'weapon': [
        'Its name survives where kingdoms do not.',
        'Forged for an oath that outlived its bearer.',
        'The weapon hums with a purpose older than its wielder.',
        'Power gathers along it like frost on a grave.',
        'Old promises wake when this weapon is drawn.',
        'Its makers are gone. Their purpose remains.',
    ],
    'armor': [
        'Its name survives where kingdoms do not.',
        'Worn by heroes whose victories have faded from memory.',
        'Old vows cling to it more stubbornly than blood or ash.',
        'It bears the scars of battles no chronicle remembers.',
        'Its makers are gone. Their purpose remains.',
        'A quiet strength gathers around whoever wears it.',
    ],
    'shield': [
        'No heraldry remains upon its face, only old scars.',
        'It has turned aside blows meant to end kingdoms.',
        'The shield feels heavier when danger draws near.',
        'Its makers are gone. Their purpose remains.',
        'Old vows seem to gather behind its battered face.',
    ],
    'relic': [
        'A whisper of old power sleeps within this relic.',
        'Its purpose is remembered even if its makers are not.',
        'Power gathers around it like frost on a grave.',
        'Some legends are discovered. Others awaken.',
        'It answers a worthy touch with the faintest pulse.',
    ],
    'accessory': [
        'Its presence is greater than its weight should allow.',
        'A relic of a victory no chronicle remembers.',
        'Power gathers around it like frost on a grave.',
        'Its makers are gone. Their purpose remains.',
        'A faint pulse answers the touch of a worthy hand.',
        'Some legends are discovered. Others awaken.',
    ],
}

def legendary_flavor(entry,kind,weapon_kind=None):
    if weapon_kind or kind in WEAPON_META or kind=='weapon':
        category='weapon'
    elif kind=='shield':
        category='shield'
    elif kind=='relic':
        category='relic'
    elif kind in ('armor','back'):
        category='armor'
    else:
        category='accessory'
    pool=LEGENDARY_FLAVOR[category]
    return pool[h64(entry,'legend_flavor',category)%len(pool)]

def legendary_name_candidates(entry,slot,weapon_kind=None,armor_subclass=None):
    base_pool=base_pool_for_item(slot,weapon_kind,armor_subclass)
    for attempt in range(2000):
        root=LEGENDARY_ROOTS[h64(entry,'legend_root',attempt)%len(LEGENDARY_ROOTS)]
        epithet=LEGENDARY_EPITHETS[h64(entry,'legend_epithet',attempt)%len(LEGENDARY_EPITHETS)]
        base=base_pool[h64(entry,'legend_base',attempt)%len(base_pool)]
        pattern=h64(entry,'legend_pattern',attempt)%4
        if pattern==0: name=f'{root}, {base} of the {epithet}'
        elif pattern==1: name=f'{root}, Legacy of the {epithet}'
        elif pattern==2:
            oath_epithet=LEGENDARY_OATH_EPITHETS[h64(entry,'legend_oath_epithet',attempt)%len(LEGENDARY_OATH_EPITHETS)]
            name=f'{root}, Oath of the {oath_epithet}'
        else: name=f'{root}, {base} of {epithet}'
        if valid_item_name(name):
            yield name

def make_name(entry,slot,weapon_kind=None,legendary=False,armor_subclass=None):
    if legendary:
        yield from legendary_name_candidates(entry,slot,weapon_kind,armor_subclass)
        return

    base_pool=base_pool_for_item(slot,weapon_kind,armor_subclass)

    # Generate compact Blizzard-like names and reject anything that exceeds
    # the hard display budget. Compound fragments are separated into words
    # instead of exposing generator-style internal CamelCase.
    for attempt in range(2000):
        base=base_pool[h64(entry,'base',attempt)%len(base_pool)]
        adj=ADJ[h64(entry,'adj',attempt)%len(ADJ)]
        suf=SUFFIX[h64(entry,'suf',attempt)%len(SUFFIX)]
        owner=OWNER[h64(entry,'owner',attempt)%len(OWNER)]
        a=PROPER_A[h64(entry,'pa',attempt)%len(PROPER_A)]
        b=PROPER_B[h64(entry,'pb',attempt)%len(PROPER_B)]
        proper=f'{a} {b.title()}'

        pat=h64(entry,'pat',attempt)%12
        if pat==0: name=f'{adj} {base}'
        elif pat==1: name=f'{base} of the {suf}'
        elif pat==2: name=f"{owner}'s {base}"
        elif pat==3: name=f'{adj} {base} of the {suf}'
        elif pat==4: name=f"{owner}'s {adj} {base}"
        elif pat==5: name=f'{base} of {suf}'
        elif pat==6: name=f'The {adj} {base}'
        elif pat==7: name=f"{adj} {base}, {owner}'s Oath"
        elif pat==8: name=f'{proper} {base}'
        elif pat==9: name=f'{base}, {proper}'
        elif pat==10: name=f"{owner}'s {base} of the {suf}"
        else: name=f'{adj} {base} of {suf}'
        if 'Oath' in name and r01(entry,'oath-name-throttle',attempt)>=OATH_NAME_ACCEPT_RATE:
            continue
        if valid_item_name(name):
            yield name

def qpick(entry): return THEMES[h64(entry,'theme')%len(THEMES)]

def sqlq(s): return "'"+str(s).replace('\\','\\\\').replace("'","''")+"'"

def armor_formula(sub,slot,ilvl,q,entry):
    # Calibrated from ordinary WotLK stock armor rows, used only for gameplay numbers, never IDs.
    base={1:1.15,2:2.35,3:4.65,4:8.5}[sub]
    sm={'head':.75,'shoulder':.64,'chest':1.0,'wrists':.30,'hands':.50,'waist':.50,'legs':.88,'feet':.58}[slot]
    low=.48+.52*min(1,(ilvl/213.0)**.48)
    return max(1,int(round(ilvl*base*sm*low*QUALITY_POWER[q]*(.96+r01(entry,'armor')*.08))))

def durability(slot,weapon_kind=None):
    if weapon_kind: return 75 if WEAPON_META[weapon_kind][2] in ('one_hand','ranged') else 100
    return {'head':60,'shoulder':60,'chest':100,'wrists':35,'hands':50,'waist':45,'legs':100,'feet':60,'back':0,'neck':0,'finger':0,'trinket':0,'relic':0,'shield':100}.get(slot,0)

def vendor_values(ilvl,q,budget_key,entry):
    sm=SLOT_BUDGET.get(budget_key,.75)
    # Copper; smooth leveling curve, roughly fivefold buy:sell like many stock rows.
    sell=max(1,int(round((max(2,ilvl)**2.15)*sm*QUALITY_POWER[q]*1.55)))
    ratio=3+int(r01(entry,'vendor_ratio')*3)
    return sell*ratio,sell

def weapon_damage(kind,ilvl,q,entry):
    rows=W[kind]
    ref=choose_ref(rows,ilvl,q,entry,'weapon_ref')
    ref_dps=((ref[5]+ref[6])/2)/(ref[4]/1000)
    target=ref_dps*((ilvl/max(1,ref[2]))**1.12)*(QUALITY_POWER[q]/QUALITY_POWER.get(ref[3],.92))*(.97+r01(entry,'dpsvar')*.06)
    # Speed stays within documented 3.3.5 generation profiles and near the chosen stock reference.
    speed_ranges={'dagger':(1400,2000),'fist':(1600,2700),'1h_sword':(1800,2800),'1h_axe':(1800,2800),'1h_mace':(1800,2800),
                  '2h_sword':(3200,3800),'2h_axe':(3200,3800),'2h_mace':(3200,3800),'polearm':(3200,3800),'staff':(2800,3600),
                  'bow':(2400,3200),'gun':(2400,3200),'crossbow':(2600,3400),'wand':(1400,2000)}
    lo,hi=speed_ranges[kind]
    refspeed=min(hi,max(lo,ref[4]))
    speed=int(round((refspeed + (r01(entry,'speed')-.5)*200)/100))*100
    speed=min(hi,max(lo,speed))
    avg=target*(speed/1000)
    spread=.10 + r01(entry,'spread')*.07
    dmin=max(1,int(round(avg*(1-spread)))); dmax=max(dmin+1,int(round(avg*(1+spread))))
    school=ref[7] if kind=='wand' else 0
    actual=((dmin+dmax)/2)/(speed/1000)
    return ref,dmin,dmax,school,speed,actual

def socket_colors(req,ilvl,q,entry,slot,ref_q):
    if req<60: return []
    # Legendaries are intentionally bespoke: always at least two sockets, sometimes three.
    if q==5 and req>=80:
        n=3 if r01(entry,'legend_socket3')<.35 else 2
        colors=[]
        if slot=='head': colors.append(1)
        while len(colors)<n:
            x=r01(entry,'legend_socket_color',len(colors)); colors.append(2 if x<.40 else 4 if x<.75 else 8)
        return colors
    # Conservative socket progression; validated socket bonuses are assigned later when enabled.
    chance = .06 if req<70 else .14 if req<75 else .24 if req<80 else (.24 if q==2 else .36 if q==3 else .50)
    if r01(entry,'socket_chance')>=chance: return []
    maxn=1 if req<70 else 2 if req<80 else 3
    n=1
    if maxn>=2 and r01(entry,'socket2') < (.16 if req<80 else .34): n=2
    if maxn>=3 and r01(entry,'socket3') < .09: n=3
    colors=[]
    if slot=='head' and req>=70 and q>=3 and r01(entry,'meta')<.10:
        colors.append(1)
    while len(colors)<n:
        x=r01(entry,'socket_color',len(colors)); colors.append(2 if x<.40 else 4 if x<.75 else 8)
    return colors

def choose_structure(cname,role,req,ilvl,q,entry):
    slot=weighted(slot_weights(req,cname),entry,'slot')
    if slot=='weapon':
        # Shield substitution only for classes/roles that normally use one.
        shield_ok=(cname in ('Warrior','Paladin') and role=='tank') or (cname=='Paladin' and role=='healer') or (cname=='Shaman' and role in ('caster_dps','healer'))
        if shield_ok and r01(entry,'shield') < .18:
            ref=choose_ref(A[('shield',6,14)],ilvl,q,entry,'shield_ref')
            return dict(slot='shield',cls=4,sub=6,inv=14,kind='shield',budget_key='shield',ref=ref)
        kind=weighted(weapon_choices(cname,role),entry,'weapon_kind')
        sub,inv,bkey=WEAPON_META[kind]
        return dict(slot='weapon',cls=2,sub=sub,inv=inv,kind=kind,budget_key=bkey,ref=None)
    if slot=='relic':
        sub={'Paladin':7,'Druid':8,'Shaman':9,'Death Knight':10}[cname]
        ref=choose_ref(A[('relic',sub,28)],ilvl,q,entry,'relic_ref')
        return dict(slot='relic',cls=4,sub=sub,inv=28,kind='relic',budget_key='relic',ref=ref)
    if slot=='back':
        ref=choose_ref(A[('misc',1,16)],ilvl,q,entry,'back_ref')
        return dict(slot='back',cls=4,sub=1,inv=16,kind='back',budget_key='back',ref=ref)
    if slot in ('neck','finger','trinket'):
        inv={'neck':2,'finger':11,'trinket':12}[slot]
        ref=choose_ref(A[('misc',0,inv)],ilvl,q,entry,slot+'_ref')
        return dict(slot=slot,cls=4,sub=0,inv=inv,kind=slot,budget_key=slot,ref=ref)
    sub=armor_subclass(cname,req)
    if slot=='chest':
        available=[inv for inv in (5,20) if A.get(('armor',sub,inv))]
        if not available:
            raise ValueError(f'no harvested chest appearances for armor subclass {sub}')
        inv=weighted([(candidate,len(A[('armor',sub,candidate)])) for candidate in available],entry,'chest_inventory_type')
    else:
        inv=INV[slot]
    ref=choose_ref(A[('armor',sub,inv)],ilvl,q,entry,'armor_ref')
    return dict(slot=slot,cls=4,sub=sub,inv=inv,kind='armor',budget_key=slot,ref=ref)

def choose_weapon_structure(cname,role,req,ilvl,q,entry,requested_kind=None):
    allowed={kind for kind,_weight in weapon_choices(cname,role)}
    kind=requested_kind or weighted(weapon_choices(cname,role),entry,'targeted_weapon_kind')
    if kind not in allowed: raise ValueError(f'{kind} is not a valid {cname} weapon choice')
    sub,inv,budget_key=WEAPON_META[kind]
    return dict(slot='weapon',cls=2,sub=sub,inv=inv,kind=kind,budget_key=budget_key,ref=None)

def choose_structure_for_slot(cname,role,req,ilvl,q,entry,slot):
    if slot=='weapon': return choose_weapon_structure(cname,role,req,ilvl,q,entry)
    if slot=='relic':
        sub={'Paladin':7,'Druid':8,'Shaman':9,'Death Knight':10}[cname]
        ref=choose_ref(A[('relic',sub,28)],ilvl,q,entry,'targeted_relic_ref')
        return dict(slot=slot,cls=4,sub=sub,inv=28,kind='relic',budget_key='relic',ref=ref)
    if slot=='back':
        ref=choose_ref(A[('misc',1,16)],ilvl,q,entry,'targeted_back_ref')
        return dict(slot=slot,cls=4,sub=1,inv=16,kind='back',budget_key='back',ref=ref)
    if slot in ('neck','finger','trinket'):
        inv={'neck':2,'finger':11,'trinket':12}[slot]
        ref=choose_ref(A[('misc',0,inv)],ilvl,q,entry,'targeted_'+slot+'_ref')
        return dict(slot=slot,cls=4,sub=0,inv=inv,kind=slot,budget_key=slot,ref=ref)
    sub=armor_subclass(cname,req)
    if slot=='chest':
        available=[inv for inv in (5,20) if A.get(('armor',sub,inv))]
        if not available: raise ValueError(f'no harvested chest appearances for armor subclass {sub}')
        inv=weighted([(candidate,len(A[('armor',sub,candidate)])) for candidate in available],entry,'targeted_chest_inventory')
    else: inv=INV[slot]
    ref=choose_ref(A[('armor',sub,inv)],ilvl,q,entry,'targeted_'+slot+'_ref')
    return dict(slot=slot,cls=4,sub=sub,inv=inv,kind='armor',budget_key=slot,ref=ref)

def expected_legendary_count(item_count):
    # Preserve the original rarity: three Legendaries per 100,000 generated items.
    return (item_count*3)//100000

SET_SLOT_ORDER=('head','shoulder','chest','hands','legs','waist','feet','wrists','back','neck')

def feature_enabled(name):
    return name not in DISABLED_FEATURES

def _class_bit(class_name):
    return next(mask for cname,mask,_ in CLASSES if cname==class_name)

def _class_mask_matches(mask,class_name):
    return mask in (-1,0,0xFFFFFFFF) or bool(mask & _class_bit(class_name))

def _nearby_candidates(rows,item,source_level_key='source_item_level'):
    exact=[row for row in rows if _class_mask_matches(row.get('source_class_mask',-1),item['class_name']) and abs(row.get(source_level_key,0)-item['ItemLevel'])<=EFFECT_ILVL_WINDOW]
    if exact:
        return exact
    return [row for row in rows if _class_mask_matches(row.get('source_class_mask',-1),item['class_name'])]

def _indexed_candidates(index,quality,item_level):
    bucket=item_level//10
    rows=[]; seen=set()
    for candidate_quality in range(max(0,quality-1),min(5,quality+1)+1):
        for candidate_bucket in range(max(0,bucket-2),bucket+3):
            for row in index.get((candidate_quality,candidate_bucket),[]):
                marker=id(row)
                if marker not in seen:
                    seen.add(marker); rows.append(row)
    return rows

ROLE_EFFECT_COMPATIBILITY = {
    'strength_dps': {'strength_dps','agility_dps'},
    'agility_dps': {'agility_dps','hunter','strength_dps'},
    'hunter': {'hunter','agility_dps'},
    'caster_dps': {'caster_dps','healer'},
    'healer': {'healer','caster_dps'},
    'tank': {'tank','strength_dps'},
}

def _effect_role_tier(item_role,source_role):
    if source_role==item_role:
        return 0
    if source_role and source_role in ROLE_EFFECT_COMPATIBILITY.get(item_role,{item_role}):
        return 1
    if not source_role:
        return 2
    return None

def _effect_ilvl_window(item_level):
    progression_cap=5 if item_level<40 else 10 if item_level<70 else 15
    return min(EFFECT_ILVL_WINDOW,progression_cap)

def _effect_candidates(item,feature):
    trigger={'spell-effects':1,'chance-on-hit':2,'on-use':None}[feature]
    triggers=(0,5) if trigger is None else (trigger,)
    indexed=[]
    for candidate_trigger in triggers:
        for source_class in (item['item_class'],2,4):
            for candidate_quality in range(max(0,item['Quality']-1),item['Quality']+1):
                for candidate_bucket in range(max(0,item['ItemLevel']//10-2),item['ItemLevel']//10+3):
                    indexed.extend(FEATURE_CATALOG['effect_index'].get((candidate_trigger,source_class,candidate_quality,candidate_bucket),()))
    seen=set(); rows=[]; window=_effect_ilvl_window(item['ItemLevel'])
    for package in indexed:
        marker=id(package)
        if marker in seen:
            continue
        seen.add(marker)
        if feature=='chance-on-hit' and item['item_class']!=2:
            continue
        if package['source_quality']>item['Quality']:
            continue
        if not _class_mask_matches(package['source_class_mask'],item['class_name']):
            continue
        if abs(package['source_item_level']-item['ItemLevel'])>window:
            continue
        if _effect_role_tier(item['role'],package.get('source_role')) is None:
            continue
        rows.append(package)
    return rows

def _feature_chance(item,feature):
    quality=item['Quality']
    quality_base={2:0.002,3:0.01,4:0.04,5:1.0}.get(quality,0.0)
    if feature=='spell-effects':
        base=quality_base*(2.0 if item['kind']=='trinket' else 1.0)*SPELL_EFFECT_RATE_MULTIPLIER
    elif feature=='chance-on-hit':
        base=quality_base*(1.5 if item['item_class']==2 else 0.0)*PROC_RATE_MULTIPLIER
    else:
        base=quality_base*(8.0 if item['kind']=='trinket' else 0.25)*ON_USE_RATE_MULTIPLIER
    return min(1.0,base)

def _choose_effect_package(item,feature):
    candidates=_effect_candidates(item,feature)
    if feature=='on-use' and item['kind']=='trinket':
        candidates=[row for row in candidates if row['source_inventory_type']==12]
    if not candidates:
        return None
    def slot_penalty(row):
        if feature=='on-use':
            return 0 if (item['kind']=='trinket' and row['source_inventory_type']==12) or row['source_inventory_type']==item['InventoryType'] else 1
        if feature=='chance-on-hit':
            return 0 if row['source_class']==2 else 1
        return 0 if row['source_inventory_type']==item['InventoryType'] else 1
    best_role=min(_effect_role_tier(item['role'],row.get('source_role')) for row in candidates)
    candidates=[row for row in candidates if _effect_role_tier(item['role'],row.get('source_role'))==best_role]
    best_slot=min(slot_penalty(row) for row in candidates)
    candidates=[row for row in candidates if slot_penalty(row)==best_slot]
    candidates=sorted(candidates,key=lambda row:(abs(row['source_item_level']-item['ItemLevel']),abs(row['source_quality']-item['Quality']),row['source_entry'],row['spell_id']))
    top=candidates[:min(5,len(candidates))]
    return top[h64(item['entry'],'effect-package',feature)%len(top)]

def _assign_special_effect(item):
    if MAX_SPECIAL_EFFECTS<=0 or item.get('itemset'):
        return
    choices=[]
    for feature in ('spell-effects','chance-on-hit','on-use'):
        if not feature_enabled(feature):
            continue
        package=_choose_effect_package(item,feature)
        if package is None:
            continue
        if item['Quality']==5 or r01(item['entry'],'effect-roll',feature)<_feature_chance(item,feature):
            choices.append((feature,package))
    if not choices:
        return
    feature,package=choices[h64(item['entry'],'effect-feature')%len(choices)]
    item['spell_slots']=[package]
    item['special_effect_feature']=feature
    item['effect_source_entry']=package['source_entry']
    item['effect_source_spell']=package['spell_id']

def _special_effect_budget_multiplier(item):
    if not item.get('spell_slots'):
        return 1.0
    feature=item.get('special_effect_feature')
    if feature=='on-use' and item['kind']=='trinket':
        return 0.70 if item['Quality']>=4 else 0.80
    if feature=='chance-on-hit':
        return 0.85 if item['Quality']>=4 else 0.90
    return 0.90 if item['Quality']>=4 else 0.95

def _assign_socket_bonus(item):
    if not feature_enabled('socket-bonuses') or not item['sockets'] or SOCKET_BONUS_RATE<=0:
        return
    if r01(item['entry'],'socket-bonus-roll')*100 >= SOCKET_BONUS_RATE:
        return
    candidates=_indexed_candidates(FEATURE_CATALOG['socket_index'],item['Quality'],item['ItemLevel'])
    candidates=_nearby_candidates(candidates,item)
    candidates=[row for row in candidates if (
        row['source_quality']<=item['Quality']
        and (row['socket_count']<=len(item['sockets']) or row['socket_count']==0)
        and row.get('required_level',0)<=item.get('RequiredLevel',80)
        and _effect_role_tier(item['role'],row.get('source_role')) is not None
    )]
    if not candidates:
        return
    best_role=min(_effect_role_tier(item['role'],row.get('source_role')) for row in candidates)
    candidates=[row for row in candidates if _effect_role_tier(item['role'],row.get('source_role'))==best_role]
    candidates=sorted(candidates,key=lambda row:(abs(row['source_item_level']-item['ItemLevel']),abs(row['source_quality']-item['Quality']),row['source_entry'],row['enchantment_id']))
    top=candidates[:min(5,len(candidates))]
    chosen=top[h64(item['entry'],'socket-bonus')%len(top)]
    item['socketBonus']=chosen['enchantment_id']
    item['socket_bonus_source_entry']=chosen['source_entry']
    item['socket_bonus_effects']={
        'types':chosen['effect_types'],'amounts':chosen['effect_amounts'],'spells':chosen['effect_spells'],
    }

def _assign_disenchant(item):
    if not feature_enabled('disenchant') or item['Quality']<2 or DISENCHANT_RATE<=0:
        return
    if r01(item['entry'],'disenchant-roll')*100 >= DISENCHANT_RATE:
        return
    candidates=_indexed_candidates(FEATURE_CATALOG['disenchant_index'],item['Quality'],item['ItemLevel'])
    candidates=_nearby_candidates(candidates,item)
    candidates=[row for row in candidates if row['source_quality']==item['Quality'] and row.get('required_skill',-1)>=0]
    if not candidates:
        return
    candidates=sorted(candidates,key=lambda row:(abs(row['source_item_level']-item['ItemLevel']),row['source_entry'],row['disenchant_id']))
    top=candidates[:min(5,len(candidates))]
    chosen=top[h64(item['entry'],'disenchant')%len(top)]
    item['RequiredDisenchantSkill']=chosen['required_skill']
    item['DisenchantID']=chosen['disenchant_id']
    item['disenchant_source_entry']=chosen['source_entry']

def _choose_set_template(anchor,set_size=None):
    templates=[]
    set_window=_effect_ilvl_window(anchor['item_level'])*2
    for template in FEATURE_CATALOG.get('set_templates',[]):
        if not _class_mask_matches(template['class_mask'],anchor['class_name']):
            continue
        if template['quality']>anchor['quality'] or anchor['quality']-template['quality']>1:
            continue
        template_role=template.get('role','')
        if template_role and template_role!=anchor['role']:
            continue
        if abs(template['item_level']-anchor['item_level'])>set_window:
            continue
        thresholds={threshold for threshold,_ in template['bonuses']}
        wanted_size=SET_SIZE if set_size is None else set_size
        if 2 not in thresholds or (wanted_size>=4 and 4 not in thresholds):
            continue
        templates.append(template)
    if not templates:
        return None
    templates.sort(key=lambda row:(0 if row.get('role')==anchor['role'] else 1,abs(row['item_level']-anchor['item_level']),abs(row['quality']-anchor['quality']),row['source_set_id']))
    top=templates[:min(5,len(templates))]
    return top[h64(anchor['entry'],'set-template')%len(top)]

SET_THEME_TITLES = (
    'Frozen Star','Raven Court','Darkiron Vigil','Emerald Dream','Crimson Dawn','Silver Hand',
    'Ebon Watch','Moon Guard','Wild Hunt','Titan Forge','Ancient North','Shattered Crown',
    'Storm Crown','Hallowed Flame','Black Citadel','Dragon Queen','Frostborn Vigil','Runic Watch',
    'Scarlet Keep','Sable Moon','Bone Wastes','High Citadel','Twilight Reach','Drowned Hall',
    'Deep Forge','Rimefang','Northwatch','Argent Vanguard','Violet Citadel','Sunreaver Host',
    'Frostwolf Clan','Warsong Clan','Wildhammer Clan','Bronzebeard Clan','Lordaeron Guard',
    "Quel'Thalas Spires",'Khaz Modan Forge','Icecrown Citadel','Ulduar Watch','Dragonblight Vanguard','Wintergrasp Guard','Wyrmrest Accord',
)
SET_STYLE_BY_ROLE = {
    'strength_dps': ('Battlegear','Warplate','Battleplate'),
    'agility_dps': ('Battlegear','Harness','Raiment'),
    'hunter': ('Battlegear','Harness','Raiment'),
    'caster_dps': ('Regalia','Raiment','Vestments'),
    'healer': ('Vestments','Raiment','Regalia'),
    'tank': ('Warplate','Battlegear','Battleplate'),
}

SET_STYLE_BY_ARMOR = {
    1: ('Regalia','Vestments','Raiment'),
    2: ('Harness','Battlegear','Raiment'),
    3: ('Battlegear','Harness','Regalia'),
    4: ('Battlegear','Warplate','Battleplate'),
}

def _set_styles(anchor):
    role_styles=SET_STYLE_BY_ROLE.get(anchor['role'],())
    armor_styles=SET_STYLE_BY_ARMOR.get(anchor.get('sub'))
    if not armor_styles:
        return role_styles or ('Battlegear','Regalia','Raiment')
    preferred=tuple(style for style in role_styles if style in armor_styles)
    return preferred or armor_styles

def _set_name(anchor,attempt=0):
    styles=_set_styles(anchor)
    theme=SET_THEME_TITLES[h64(anchor['entry'],'set-theme',attempt)%len(SET_THEME_TITLES)]
    style=styles[h64(anchor['entry'],'set-style',attempt)%len(styles)]
    return f'{style} of the {theme}'

def _normalize_set_bonuses(bonuses,set_size):
    wanted=(2,4) if set_size>=4 else (2,) if set_size>=2 else ()
    normalized=[]
    for threshold in wanted:
        spell_id=next((spell_id for candidate_threshold,spell_id in bonuses if candidate_threshold==threshold and spell_id),0)
        if spell_id:
            normalized.append((threshold,spell_id))
    return tuple(normalized)

SET_PIECE_NAMES_BY_STYLE={
    'Battlegear': {'head':'Helm','shoulder':'Shoulderguards','chest':'Breastplate','hands':'Gauntlets','legs':'Legplates','waist':'Girdle','feet':'Greaves','wrists':'Bracers','back':'Cloak','neck':'Gorget'},
    'Warplate': {'head':'Helm','shoulder':'Pauldrons','chest':'Chestguard','hands':'Gauntlets','legs':'Legguards','waist':'Girdle','feet':'Sabatons','wrists':'Bracers','back':'Cloak','neck':'Gorget'},
    'Harness': {'head':'Headguard','shoulder':'Shoulderpads','chest':'Tunic','hands':'Handguards','legs':'Legguards','waist':'Belt','feet':'Boots','wrists':'Wristguards','back':'Cloak','neck':'Choker'},
    'Regalia': {'head':'Cowl','shoulder':'Mantle','chest':'Robes','hands':'Gloves','legs':'Leggings','waist':'Cord','feet':'Slippers','wrists':'Cuffs','back':'Cloak','neck':'Pendant'},
    'Raiment': {'head':'Cowl','shoulder':'Mantle','chest':'Robes','hands':'Gloves','legs':'Leggings','waist':'Cord','feet':'Boots','wrists':'Cuffs','back':'Cloak','neck':'Pendant'},
    'Vestments': {'head':'Cowl','shoulder':'Mantle','chest':'Robes','hands':'Gloves','legs':'Leggings','waist':'Cord','feet':'Slippers','wrists':'Cuffs','back':'Cloak','neck':'Pendant'},
}
SET_PIECE_NAMES_BY_STYLE['Battleplate']=SET_PIECE_NAMES_BY_STYLE['Warplate']

def _set_piece_name(slot,set_name):
    if ' of the ' in set_name:
        style,theme=set_name.split(' of the ',1)
    else:
        style,theme='',set_name
    piece_names=SET_PIECE_NAMES_BY_STYLE.get(style,SET_PIECE_NAMES_BY_STYLE['Battlegear'])
    return f"{piece_names.get(slot,slot.title())} of the {theme}"

def _set_piece_names(candidates,set_name):
    names=tuple(_set_piece_name(member['slot'],set_name) for member in candidates)
    if len(names)!=len(set(names)) or any(not valid_item_name(name) for name in names):
        return None
    return names

def assign_item_sets(skeletons):
    if not feature_enabled('sets') or SET_RATE<=0 or SET_SIZE<1:
        return []
    if SET_SIZE>10:
        raise ValueError('--set-size cannot exceed 10 for the current ItemSet.dbc layout')
    target_pieces=(len(skeletons)*SET_RATE)//100
    target_sets=target_pieces//SET_SIZE
    if target_sets<=0:
        return []
    slots=SET_SLOT_ORDER[:SET_SIZE]
    next_set_id=max(FEATURE_CATALOG['item_sets'],default=0)+1
    used=set(); definitions=[]; used_set_names=set(); used_set_piece_names=set()
    for anchor in sorted(skeletons,key=lambda row:h64(row['entry'],'set-anchor')):
        if len(definitions)>=target_sets or anchor['entry'] in used or anchor['required_level']<SET_MIN_LEVEL or anchor['slot']!=slots[0]:
            continue
        candidates=[anchor]
        for slot in slots[1:]:
            matches=[row for row in skeletons if row['entry'] not in used and row['entry'] not in {item['entry'] for item in candidates}
                     and row['class_name']==anchor['class_name'] and row['role']==anchor['role'] and row['quality']==anchor['quality']
                     and row['slot']==slot and row['sub']==anchor['sub'] and row['required_level']>=SET_MIN_LEVEL
                     and abs(row['item_level']-anchor['item_level'])<=EFFECT_ILVL_WINDOW]
            if not matches:
                candidates=[]
                break
            matches.sort(key=lambda row:(abs(row['item_level']-anchor['item_level']),abs(row['required_level']-anchor['required_level']),row['entry']))
            candidates.append(matches[0])
        if len(candidates)!=SET_SIZE:
            continue
        template=_choose_set_template(anchor)
        if template is None:
            continue
        final_bonuses=_normalize_set_bonuses(template['bonuses'],SET_SIZE)
        if 2 not in {threshold for threshold,_ in final_bonuses} or (SET_SIZE>=4 and 4 not in {threshold for threshold,_ in final_bonuses}):
            continue
        set_id=next_set_id; next_set_id+=1
        for name_attempt in range(len(SET_THEME_TITLES)*4):
            set_name=_set_name(anchor,name_attempt)
            piece_names=_set_piece_names(candidates,set_name)
            if (set_name not in used_set_names and piece_names is not None
                    and not used_set_piece_names.intersection(piece_names)):
                break
        else:
            continue
        used_set_names.add(set_name)
        used_set_piece_names.update(piece_names)
        for member,piece_name in zip(candidates,piece_names):
            member['item_level']=anchor['item_level']
            member['required_level']=anchor['required_level']
            member['class_mask']=CLASS_MASK_BY_NAME[anchor['class_name']]
            member['set_id']=set_id
            member['set_name']=set_name
            member['set_piece_name']=piece_name
            member['set_bonuses']=final_bonuses
            member['set_template_id']=template['source_set_id']
            member['set_visual_ref']=template['visuals'].get(member['slot'])
            used.add(member['entry'])
        definitions.append({'set_id':set_id,'name':set_name,'bonuses':final_bonuses,'items':tuple(member['entry'] for member in candidates),'template_id':template['source_set_id']})
    return definitions

def assign_targeted_sets(skeletons):
    groups=defaultdict(list)
    for item in skeletons:
        if item.get('set_request_index') is not None:
            groups[(item['recipe_id'],item['set_request_index'])].append(item)
    if not groups: return []
    if not feature_enabled('sets'):
        raise ValueError('targeted set recipes require the sets feature to be enabled')
    definitions=[]; used_set_names=set(); used_piece_names=set()
    next_set_id=max(FEATURE_CATALOG.get('item_sets',()),default=0)+1
    for _group_key,members in sorted(groups.items()):
        members.sort(key=lambda item:item['set_piece_index'])
        set_size=members[0].get('set_size') or len(members)
        if len(members)!=set_size: raise ValueError(f'targeted set has {len(members)} pieces, expected {set_size}')
        anchor=members[0]
        template=_choose_set_template(anchor,set_size)
        if template is None: raise ValueError(f'no compatible stock set template for targeted set {anchor["recipe_id"]}')
        final_bonuses=_normalize_set_bonuses(template['bonuses'],set_size)
        thresholds={threshold for threshold,_ in final_bonuses}
        if 2 not in thresholds or (set_size>=4 and 4 not in thresholds):
            raise ValueError(f'targeted set {anchor["recipe_id"]} lacks required stock bonuses')
        for attempt in range(len(SET_THEME_TITLES)*4):
            set_name=_set_name(anchor,attempt)
            piece_names=_set_piece_names(members,set_name)
            if set_name not in used_set_names and piece_names is not None and not used_piece_names.intersection(piece_names): break
        else: raise ValueError(f'could not create a unique name for targeted set {anchor["recipe_id"]}')
        used_set_names.add(set_name); used_piece_names.update(piece_names)
        set_id=next_set_id; next_set_id+=1
        for member,piece_name in zip(members,piece_names):
            member['item_level']=anchor['item_level']; member['required_level']=anchor['required_level']
            member['class_mask']=CLASS_MASK_BY_NAME[anchor['class_name']]
            member['set_id']=set_id; member['set_name']=set_name; member['set_piece_name']=piece_name
            member['set_bonuses']=final_bonuses; member['set_template_id']=template['source_set_id']
            member['set_visual_ref']=template['visuals'].get(member['slot'])
        definitions.append({'set_id':set_id,'name':set_name,'bonuses':final_bonuses,
                            'items':tuple(member['entry'] for member in members),'template_id':template['source_set_id']})
    return definitions

def generated_item_set_rows(items):
    grouped=defaultdict(list)
    for item in items:
        if item.get('itemset'):
            grouped[item['itemset']].append(item)
    rows=[]
    for set_id,members in sorted(grouped.items()):
        members.sort(key=lambda item:SET_SLOT_ORDER.index(item['slot']) if item['slot'] in SET_SLOT_ORDER else 99)
        first=members[0]
        bonuses=_normalize_set_bonuses(first.get('set_bonuses',()),len(members))
        rows.append(item_set_row(set_id,first.get('set_name','Generated Set'),[item['entry'] for item in members],bonuses))
    return rows

def _recipe_range(recipe,profile,key,default_lo,default_hi):
    value=recipe.get(key)
    if value is None and profile is not None:
        value=profile.get(key)
    if value is None:
        if default_lo is None and default_hi is None and f'{key}_min' not in recipe and f'{key}_max' not in recipe and not profile:
            return None,None
        lo=recipe.get(f'{key}_min',profile.get(f'{key}_min',default_lo) if profile else default_lo)
        hi=recipe.get(f'{key}_max',profile.get(f'{key}_max',default_hi) if profile else default_hi)
    else:
        if not isinstance(value,(list,tuple)) or len(value)!=2:
            raise ValueError(f'{key} range must contain exactly two values')
        lo,hi=value
    lo=int(lo); hi=int(hi)
    if (default_lo is not None and lo<default_lo) or (default_hi is not None and hi>default_hi) or lo>hi:
        raise ValueError(f'invalid {key} range: {lo}-{hi}')
    return lo,hi

def build_generation_plan(manifest,available_classes):
    validate_content_manifest(manifest)
    profiles={str(row['id']):row for row in manifest.get('profiles',())}
    class_names=[row[0] for row in available_classes]
    class_counts=Counter()
    plan=[]
    for recipe in manifest.get('recipes',()):
        recipe_id=str(recipe['id']); profile=profiles.get(str(recipe.get('profile'))) if recipe.get('profile') else None
        classes=recipe.get('classes') or ([recipe['class']] if recipe.get('class') else class_names)
        normalized=[]
        for class_name in classes:
            key=''.join(ch for ch in str(class_name).lower() if ch.isalnum())
            normalized_name=CLASS_ALIASES.get(key)
            if normalized_name not in class_names: raise ValueError(f'recipe {recipe_id} references unknown class: {class_name}')
            normalized.append(normalized_name)
        required_min,required_max=_recipe_range(recipe,profile,'required_level',1,80)
        item_min,item_max=_recipe_range(recipe,profile,'item_level',None,None)
        set_count=int(recipe.get('set_count',0)); set_size=int(recipe.get('set_size',5)) if set_count else 0
        total_count=set_count*set_size if set_count else int(recipe['count'])
        set_classes={}
        for index in range(total_count):
            set_index=index//set_size if set_count else None
            if set_count and set_index not in set_classes:
                set_classes[set_index]=normalized[set_index%len(normalized)] if len(normalized)==1 else weighted([(name,1) for name in normalized],recipe_id,set_index,'set_class')
            class_name=set_classes[set_index] if set_count else (normalized[index%len(normalized)] if len(normalized)==1 else weighted([(name,1) for name in normalized],recipe_id,index,'class'))
            local_index=class_counts[class_name]
            if local_index>=MAX_ITEMS_PER_CLASS: raise ValueError(f'targeted generation exceeds the per-class cap for {class_name}')
            class_counts[class_name]+=1
            row=dict(recipe_id=recipe_id,index=index,class_name=class_name,class_index=local_index,
                     required_level_min=required_min,required_level_max=required_max,
                     item_level_min=item_min,item_level_max=item_max,
                     quality=recipe.get('quality'),role=recipe.get('role'),kind=recipe.get('kind'),
                     weapon_kind=recipe.get('weapon_kind'),content_profile=recipe.get('profile'),
                     target_kind=recipe.get('target_kind','general'),content_target=recipe.get('target'),
                     set_request_index=set_index,set_piece_index=index%set_size if set_count else None,
                     set_size=set_size or None,set_slot=SET_SLOT_ORDER[index%set_size] if set_count else None,
                     quest_id=None,quest_mode=None,quest_slot=None,quest_quantity=None)
            plan.append(row)
    if not plan: raise ValueError('content manifest must contain at least one recipe item')
    assign_plan_encounters(plan,profiles)
    assign_plan_quests(plan,manifest.get('quest_targets',()))
    return plan

def choose_recipe_level(recipe,index):
    lo=int(recipe['required_level_min']); hi=int(recipe['required_level_max'])
    return lo if lo==hi else lo+int(r01(recipe['recipe_id'],index,'required_level')*(hi-lo+1))

def choose_recipe_item_level(recipe,required_level,index):
    if recipe.get('item_level_min') is None or recipe.get('item_level_max') is None:
        return item_level(required_level,entry_for_class(recipe['class_name'],recipe['class_index']))
    lo=int(recipe['item_level_min']); hi=int(recipe['item_level_max'])
    if lo==hi: return lo
    return lo+int(r01(recipe['recipe_id'],index,'item_level',required_level)*(hi-lo+1))

def build_targeted_skeletons(plan,ui=None):
    skeletons=[]
    for completed,recipe in enumerate(plan,1):
        cname=recipe['class_name']; entry=entry_for_class(cname,recipe['class_index'])
        req=choose_recipe_level(recipe,recipe['index']); ilvl=choose_recipe_item_level(recipe,req,recipe['index'])
        q=int(recipe['quality']) if recipe.get('quality') is not None else quality(req,ilvl,entry)
        role=recipe.get('role') or weighted(ROLE_WEIGHTS[cname],entry,'targeted_role',recipe['recipe_id'])
        if recipe.get('set_slot'):
            st=choose_structure_for_slot(cname,role,req,ilvl,q,entry,recipe['set_slot'])
        elif recipe.get('kind')=='weapon':
            st=choose_weapon_structure(cname,role,req,ilvl,q,entry,recipe.get('weapon_kind'))
        else:
            st=choose_structure(cname,role,req,ilvl,q,entry)
        mask_kind='weapon' if st['cls']==2 else st['kind']
        weapon_kind=st['kind'] if st['cls']==2 else None
        class_mask=compatible_class_mask(cname,role,req,mask_kind,armor_subclass=st['sub'],weapon_kind=weapon_kind)
        skeletons.append(dict(entry=entry,class_name=cname,class_mask=class_mask,required_level=req,item_level=ilvl,quality=q,role=role,
                              recipe_id=recipe['recipe_id'],content_profile=recipe.get('content_profile'),target_kind=recipe.get('target_kind'),
                              content_target=recipe.get('content_target'),set_request_index=recipe.get('set_request_index'),
                              set_piece_index=recipe.get('set_piece_index'),set_size=recipe.get('set_size'),quest_id=recipe.get('quest_id'),
                              quest_mode=recipe.get('quest_mode'),quest_slot=recipe.get('quest_slot'),quest_quantity=recipe.get('quest_quantity'),**st))
        if ui and (completed==1 or completed==len(plan) or completed%25==0):
            ui.progress(completed,len(plan),current=f'{cname} • Level {req} • {QUALITY_NAME[q]}')
    return skeletons

def build_runtime_skeletons(ui=None):
    if TARGETED_PLAN is None: return build_skeletons(ui=ui)
    skeletons=build_targeted_skeletons(TARGETED_PLAN,ui=ui)
    assign_targeted_sets(skeletons)
    return skeletons

def build_skeletons(ui=None):
    if ACTIVE_CLASSES is None or CLASS_ITEM_COUNTS is None or TARGET_ITEM_COUNT is None:
        raise RuntimeError('Runtime generation plan is not configured. Call configure_runtime() first.')
    sk=[]
    completed=0
    for cname,_source_mask,_legacy_start in ACTIVE_CLASSES:
        count=CLASS_ITEM_COUNTS.get(cname,0)
        levels=level_list(cname,count)
        assert len(levels)==count
        for i,req in enumerate(levels):
            entry=entry_for_class(cname,i); ilvl=item_level(req,entry); q=quality(req,ilvl,entry); role=weighted(ROLE_WEIGHTS[cname],entry,'role')
            st=choose_structure(cname,role,req,ilvl,q,entry)
            mask_kind='weapon' if st['cls']==2 else st['kind']
            weapon_kind=st['kind'] if st['cls']==2 else None
            class_mask=compatible_class_mask(cname,role,req,mask_kind,armor_subclass=st['sub'],weapon_kind=weapon_kind)
            sk.append(dict(entry=entry,class_name=cname,class_mask=class_mask,required_level=req,item_level=ilvl,quality=q,role=role,**st))
            completed+=1
            if ui and (completed==1 or completed==TARGET_ITEM_COUNT or completed%25==0 or i+1==count):
                ui.progress(completed,TARGET_ITEM_COUNT,current=f'{cname} • Level {req} • {QUALITY_NAME[q]}',class_name=cname,class_completed=i+1,class_total=count)
    if len(sk)!=TARGET_ITEM_COUNT:
        raise RuntimeError(f'generation plan produced {len(sk)} skeletons, expected {TARGET_ITEM_COUNT}')

    # Preserve extreme rarity but distribute promoted Legendaries across distinct classes when possible.
    target=expected_legendary_count(len(sk))
    eligible=[x for x in sk if x['required_level']==80 and x['item_level']>=264 and x['quality']==4]
    eligible.sort(key=lambda x:h64(x['entry'],'legendary'))
    selected=[]; used_classes=set()
    if target>0:
        for x in eligible:
            if x['class_name'] in used_classes: continue
            selected.append(x); used_classes.add(x['class_name'])
            if len(selected)>=target: break
    if len(selected)<target:
        selected_ids={x['entry'] for x in selected}
        selected.extend(x for x in eligible if x['entry'] not in selected_ids and len(selected)<target)
    for x in selected: x['quality']=5
    if ui and feature_enabled('sets'):
        ui.status('Assembling complete class/role item sets')
    assign_item_sets(sk)
    return sk

def finish_items(sk,ui=None):
    names=set(); items=[]; ui_class_completed=Counter()
    reserved_set_names={x['set_piece_name'] for x in sk if x.get('set_id') and x.get('set_piece_name')}
    for idx,x in enumerate(sk):
        entry=x['entry']; q=x['quality']; ilvl=x['item_level']; req=x['required_level']; cname=x['class_name']; role=x['role']; slot=x['slot']
        theme=qpick(entry)
        weapon_kind=x['kind'] if x['cls']==2 else None
        # Choose appearance/damage ref after legendary promotion so quality proximity is final.
        if x['cls']==2:
            ref,dmin,dmax,school,delay,dps=weapon_damage(weapon_kind,ilvl,q,entry)
            x['ref']=ref; displayid=ref[1]; armor=0; block=0
        else:
            ref=x.get('set_visual_ref') or x['ref']; displayid=ref[1]; dmin=dmax=0; school=0; delay=0; dps=0.0
            if x['kind']=='armor': armor=armor_formula(x['sub'],slot,ilvl,q,entry); block=0
            elif x['kind']=='back': armor=max(1,int(round(ilvl*.65*(.65+.35*min(1,ilvl/200))*QUALITY_POWER[q]))); block=0
            elif x['kind']=='shield':
                armor=max(20,int(round(ilvl*35*(.60+.40*min(1,ilvl/213))*QUALITY_POWER[q])))
                block=max(3,int(round(ilvl*1.0*(.55+.45*min(1,ilvl/213))*QUALITY_POWER[q])))
            else: armor=0; block=0
        colors=socket_colors(req,ilvl,q,entry,slot,ref[3])
        effect_probe=dict(entry=entry,class_name=cname,class_mask=x['class_mask'],role=role,Quality=q,ItemLevel=ilvl,
                          RequiredLevel=req,item_class=x['cls'],InventoryType=x['inv'],kind=x['kind'],itemset=x.get('set_id',0),
                          spell_slots=[],special_effect_feature='',effect_source_entry=0,effect_source_spell=0)
        _assign_special_effect(effect_probe)
        stats=make_stats(cname,role,req,ilvl,q,entry,x['budget_key'],len(colors),x['kind']=='shield',
                         force_count=5 if q==5 else None,budget_multiplier=_special_effect_budget_multiplier(effect_probe))
        # Name uniqueness over the entire generated collection.
        name=None
        armor_name_sub=x['sub'] if x['kind']=='armor' else None
        if x.get('set_id'):
            name=x['set_piece_name']
            if name in names:
                raise ValueError(f'duplicate generated set piece name: {name}')
        else:
            name_candidates=make_name(entry,'shield' if x['kind']=='shield' else 'relic' if x['kind']=='relic' else slot,
                                      weapon_kind,q==5,armor_subclass=armor_name_sub)
            for cand in name_candidates:
                if cand not in names and cand not in reserved_set_names:
                    name=cand; break
        if name is None:
            name=f'Generated Item {entry}'
        names.add(name)
        bkey=x['budget_key']; buy,sell=vendor_values(ilvl,q,bkey,entry)
        bonding=1 if q==5 or (req==80 and q>=4 and ilvl>=232) else 2
        material = 6 if x['sub']==4 and x['cls']==4 else 5 if x['sub']==3 and x['cls']==4 else 8 if x['sub']==2 and x['cls']==4 else 7 if x['sub']==1 and x['cls']==4 else 4 if slot in ('neck','finger','trinket') else 1 if x['kind']=='shield' else 0
        sheath=4 if x['kind']=='shield' else 1 if x['cls']==2 and x['budget_key']=='two_hand' and weapon_kind!='staff' else 2 if weapon_kind=='staff' else 3 if x['cls']==2 and x['budget_key']=='one_hand' else 0
        maxdur=durability('shield' if x['kind']=='shield' else slot,weapon_kind)
        if q==5:
            desc=legendary_flavor(entry,x['kind'],weapon_kind)
        else:
            desc=FLAVOR[h64(entry,'flavor')%len(FLAVOR)] if r01(entry,'flavor_chance')<.24 else ''
        item=dict(entry=entry,class_name=cname,class_mask=x['class_mask'],role=role,theme=theme,slot=slot,name=name,Quality=q,
                  ItemLevel=ilvl,RequiredLevel=req,item_class=x['cls'],subclass=x['sub'],InventoryType=x['inv'],displayid=displayid,
                  reference_entry=ref[0],reference_item_level=ref[2],reference_quality=ref[3],stats=stats,
                  dmg_min1=dmin,dmg_max1=dmax,dmg_type1=school,delay=delay,dps=round(dps,3),armor=armor,block=block,
                  sockets=colors,bonding=bonding,BuyPrice=buy,SellPrice=sell,Material=material,sheath=sheath,
                  MaxDurability=maxdur,description=desc,kind=x['kind'],weapon_kind=weapon_kind or '',
                  itemset=x.get('set_id',0),socketBonus=0,RequiredDisenchantSkill=-1,DisenchantID=0,
                  special_effect_feature=effect_probe['special_effect_feature'],effect_source_entry=effect_probe['effect_source_entry'],
                  effect_source_spell=effect_probe['effect_source_spell'],spell_slots=effect_probe['spell_slots'],
                  set_name=x.get('set_name',''),set_bonuses=x.get('set_bonuses',()),set_template_id=x.get('set_template_id',0),
                  recipe_id=x.get('recipe_id',''),content_profile=x.get('content_profile'),target_kind=x.get('target_kind','general'),
                  content_target=x.get('content_target'),set_request_index=x.get('set_request_index'),quest_id=x.get('quest_id'),
                  quest_mode=x.get('quest_mode'),quest_slot=x.get('quest_slot'),quantity=x.get('quest_quantity'))
        _assign_socket_bonus(item)
        _assign_disenchant(item)
        items.append(item)
        if ui:
            ui.item(item)
            ui_class_completed[cname]+=1
            completed=idx+1
            if completed==1 or completed==len(sk) or completed%25==0:
                class_total=CLASS_ITEM_COUNTS.get(cname,0) if CLASS_ITEM_COUNTS else 0
                ui.progress(completed,len(sk),current=f'{cname} • Level {req} • {QUALITY_NAME[q]} • {name}',class_name=cname,class_completed=ui_class_completed[cname],class_total=class_total)
    return items

def validate(items,ui=None):
    errors=[]
    entries=[x['entry'] for x in items]; names=[x['name'] for x in items]
    expected_total=TARGET_ITEM_COUNT if TARGET_ITEM_COUNT is not None else len(items)
    expected_counts=CLASS_ITEM_COUNTS or Counter(x['class_name'] for x in items)
    if len(items)!=expected_total: errors.append(f'count={len(items)} expected={expected_total}')

    if CONTENT_MANIFEST is None:
        expected_entries=[]
        for cname,_,_start in CLASSES:
            for i in range(expected_counts.get(cname,0)):
                expected_entries.append(entry_for_class(cname,i))
        if entries!=expected_entries: errors.append('entry allocation does not match the configured class/item plan')
    else:
        for cname,_,_start in CLASSES:
            actual=sorted(x['entry'] for x in items if x['class_name']==cname)
            expected=[entry_for_class(cname,i) for i in range(expected_counts.get(cname,0))]
            if actual!=expected: errors.append(f'{cname} targeted entry allocation does not match the configured class/item plan')
    if len(set(entries))!=len(entries): errors.append('duplicate entries')
    if len(set(names))!=len(names): errors.append('duplicate names')
    for x in items:
        if x['name'].startswith('Generated Item '):
            errors.append(f"{x['entry']} generated placeholder name: {x['name']}")
        elif not valid_item_name(x['name']):
            errors.append(f"{x['entry']} name too long: {x['name']}")

    class_counts=Counter(x['class_name'] for x in items)
    for cname,_,_ in CLASSES:
        expected=expected_counts.get(cname,0)
        if class_counts[cname]!=expected: errors.append(f'{cname} count {class_counts[cname]} expected {expected}')
        if expected==10000:
            lv=Counter(x['RequiredLevel'] for x in items if x['class_name']==cname)
            min_level=CLASS_LEVEL_MIN.get(cname,1)
            if any(lv[l]<100 for l in range(min_level,81)): errors.append(f'{cname} missing base level coverage')
            if cname=='Death Knight' and any(level<55 for level in lv): errors.append('Death Knight generated below level 55')

    legends=[x for x in items if x['Quality']==5]
    expected_legends=expected_legendary_count(expected_total)
    if len(legends)!=expected_legends or any(x['RequiredLevel']!=80 or x['ItemLevel']<264 for x in legends):
        errors.append(f'legendary policy violation: {len(legends)} expected {expected_legends}')
    if any(len(x['stats'])!=5 or len(x['sockets'])<2 or not x['description'] or ',' not in x['name'] for x in legends):
        errors.append('legendary bespoke-design policy violation')

    camel_name_re=re.compile(r'[a-z][A-Z]')
    for validation_index,x in enumerate(items,1):
        if not (1<=x['RequiredLevel']<=80): errors.append(f"{x['entry']} bad req")
        if x['ItemLevel']<x['RequiredLevel']: errors.append(f"{x['entry']} ilvl<req")
        if x['Quality'] not in (2,3,4,5): errors.append(f"{x['entry']} quality")
        if x['ItemLevel']>213 and x['Quality']==2: errors.append(f"{x['entry']} green above ilvl 213")
        if x['ItemLevel']>226 and x['Quality']==3: errors.append(f"{x['entry']} blue above ilvl 226")
        if camel_name_re.search(x['name']): errors.append(f"{x['entry']} internal CamelCase name: {x['name']}")
        if x['class_mask']<=0: errors.append(f"{x['entry']} empty class mask")
        if x.get('itemset'):
            expected_name=_set_piece_name(x['slot'],x.get('set_name',''))
            if x['name']!=expected_name:
                errors.append(f"{x['entry']} set piece name does not match its set title")
            if x['class_mask']!=CLASS_MASK_BY_NAME.get(x['class_name'],0):
                errors.append(f"{x['entry']} set piece class mask is not exact")
        if x['class_name']=='Death Knight' and x['RequiredLevel']<55: errors.append(f"{x['entry']} Death Knight below 55")
        if x['displayid']<=0 or x['reference_entry']<=0: errors.append(f"{x['entry']} display/ref")
        ids=[s[0] for s in x['stats']]
        if not (1<=len(ids)<=5) or len(ids)!=len(set(ids)) or 0 in ids: errors.append(f"{x['entry']} stats")
        if len(x['sockets'])>3 or any(c not in (1,2,4,8) for c in x['sockets']): errors.append(f"{x['entry']} sockets")
        for package in x.get('spell_slots',[]):
            if package['spell_id'] not in FEATURE_CATALOG['spells']:
                errors.append(f"{x['entry']} unknown spell {package['spell_id']}")
            if package['trigger'] not in (0,1,2,5):
                errors.append(f"{x['entry']} invalid spell trigger {package['trigger']}")
            if package.get('source_quality',x['Quality'])>x['Quality']:
                errors.append(f"{x['entry']} effect copied from higher quality source")
            if abs(package.get('source_item_level',x['ItemLevel'])-x['ItemLevel'])>_effect_ilvl_window(x['ItemLevel']):
                errors.append(f"{x['entry']} effect source outside progression window")
            if _effect_role_tier(x['role'],package.get('source_role')) is None:
                errors.append(f"{x['entry']} unrelated-role effect source")
        if x.get('socketBonus') and x['socketBonus'] not in FEATURE_CATALOG['enchantments']:
            errors.append(f"{x['entry']} unknown socket bonus {x['socketBonus']}")
        if x.get('DisenchantID') and x['DisenchantID'] not in FEATURE_CATALOG['disenchant_ids']:
            errors.append(f"{x['entry']} unknown disenchant {x['DisenchantID']}")
        if x.get('DisenchantID') and x.get('RequiredDisenchantSkill',-1)<0:
            errors.append(f"{x['entry']} disenchant source has negative required skill")
        if x.get('itemset'):
            expected_thresholds=(2,4) if SET_SIZE>=4 else (2,) if SET_SIZE>=2 else ()
            actual_thresholds=tuple(threshold for threshold,_ in x.get('set_bonuses',()))
            if actual_thresholds!=expected_thresholds:
                errors.append(f"{x['entry']} set bonuses are not normalized: {actual_thresholds}")
        if x.get('itemset') and x.get('special_effect_feature'):
            errors.append(f"{x['entry']} set piece has independent special effect")
        if x['item_class']==2:
            if not (x['dmg_min1']>0 and x['dmg_max1']>=x['dmg_min1'] and x['delay']>0 and x['armor']==0): errors.append(f"{x['entry']} weapon")
            calc=((x['dmg_min1']+x['dmg_max1'])/2)/(x['delay']/1000)
            if abs(calc-x['dps'])/max(1,x['dps'])>.02: errors.append(f"{x['entry']} dps")
        if x['kind']=='armor' and x['armor']<=0: errors.append(f"{x['entry']} armor")
        if x['kind']=='shield' and (x['armor']<=0 or x['block']<=0 or x['subclass']!=6 or x['InventoryType']!=14): errors.append(f"{x['entry']} shield")
        if x['kind']=='relic':
            expected={'Paladin':7,'Druid':8,'Shaman':9,'Death Knight':10}.get(x['class_name'])
            if expected!=x['subclass'] or x['InventoryType']!=28: errors.append(f"{x['entry']} relic")
        if x['kind']=='armor':
            expected=armor_subclass(x['class_name'],x['RequiredLevel'])
            if x['subclass']!=expected: errors.append(f"{x['entry']} armor compatibility")
        if ui and (validation_index==1 or validation_index==len(items) or validation_index%100==0):
            ui.progress(validation_index,len(items),current=f"{x['class_name']} • {x['name']}")
    set_groups=defaultdict(list)
    for item in items:
        if item.get('itemset'):
            set_groups[item['itemset']].append(item)
    for set_id,members in set_groups.items():
        if len({item['name'] for item in members})!=len(members):
            errors.append(f'{set_id} set piece names are not unique')
        if len({item['ItemLevel'] for item in members})!=1:
            errors.append(f'{set_id} set item levels are not cohesive')
        if len({item['RequiredLevel'] for item in members})!=1:
            errors.append(f'{set_id} set required levels are not cohesive')
    ordinary_names=[x['name'] for x in items if x['Quality']!=5]
    if _oath_name_rate_excessive(ordinary_names):
        errors.append('ordinary naming pool overuses Oath (>=4%)')
    return errors

SQL_COLUMNS=['entry','class','subclass','SoundOverrideSubclass','name','displayid','Quality','Flags','FlagsExtra','BuyCount','BuyPrice','SellPrice','InventoryType','AllowableClass','AllowableRace','ItemLevel','RequiredLevel']
for i in range(1,11): SQL_COLUMNS += [f'stat_type{i}',f'stat_value{i}']
SQL_COLUMNS += ['dmg_min1','dmg_max1','dmg_type1','armor','delay','ammo_type','RangedModRange']
for i in range(1,6): SQL_COLUMNS += [f'spellid_{i}',f'spelltrigger_{i}',f'spellcharges_{i}',f'spellppmRate_{i}',f'spellcooldown_{i}',f'spellcategory_{i}',f'spellcategorycooldown_{i}']
SQL_COLUMNS += ['bonding','description','Material','sheath','RandomProperty','RandomSuffix','block','itemset','MaxDurability','socketColor_1','socketContent_1','socketColor_2','socketContent_2','socketColor_3','socketContent_3','socketBonus','RequiredDisenchantSkill','DisenchantID','flagsCustom','VerifiedBuild']
LOOT_SQL_COLUMNS=['Entry','Item','Reference','Chance','QuestRequired','LootMode','GroupId','MinCount','MaxCount','Comment']

def sql_values(x):
    vals=[x['entry'],x['item_class'],x['subclass'],-1,sqlq(x['name']),x['displayid'],x['Quality'],0,0,1,x['BuyPrice'],x['SellPrice'],x['InventoryType'],x['class_mask'],-1,x['ItemLevel'],x['RequiredLevel']]
    ss=x['stats']+[(0,0,'')]*(10-len(x['stats']))
    for sid,v,_ in ss: vals += [sid,v]
    ammo=2 if x['weapon_kind'] in ('bow','crossbow') else 3 if x['weapon_kind']=='gun' else 0
    rng=100 if x['weapon_kind'] in ('bow','crossbow','gun','wand') else 0
    vals += [x['dmg_min1'],x['dmg_max1'],x['dmg_type1'],x['armor'],x['delay'],ammo,rng]
    spell_slots=x.get('spell_slots',[])
    for index in range(5):
        package=spell_slots[index] if index<len(spell_slots) else None
        if package is None:
            vals += [0,0,0,0,-1,0,-1]
        else:
            vals += [package['spell_id'],package['trigger'],package['charges'],package['ppm_rate'],package['cooldown'],package['category'],package['category_cooldown']]
    vals += [x['bonding'],sqlq(x['description']),x['Material'],x['sheath'],0,0,x['block'],x.get('itemset',0),x['MaxDurability']]
    cs=x['sockets']+[0]*(3-len(x['sockets']))
    vals += [cs[0],0,cs[1],0,cs[2],0,x.get('socketBonus',0),x.get('RequiredDisenchantSkill',-1),x.get('DisenchantID',0),0,12340]
    assert len(vals)==len(SQL_COLUMNS),(len(vals),len(SQL_COLUMNS),x['entry'])
    return vals

def fmt(v):
    if isinstance(v,str) and v.startswith("'"): return v
    if isinstance(v,float): return f'{v:.3f}'.rstrip('0').rstrip('.')
    return str(v)

def _contiguous_ranges(values):
    values=sorted(set(values))
    if not values: return []
    ranges=[]
    start=prev=values[0]
    for value in values[1:]:
        if value == prev + 1:
            prev=value
            continue
        ranges.append((start,prev))
        start=prev=value
    ranges.append((start,prev))
    return ranges

def _entry_filter_sql(items):
    ranges=_contiguous_ranges(x['entry'] for x in items)
    parts=[]
    for lo,hi in ranges:
        if lo==hi: parts.append(f'`entry` = {lo}')
        else: parts.append(f'`entry` BETWEEN {lo} AND {hi}')
    if not parts: return '1 = 0'
    if len(parts)==1: return parts[0]
    return '('+' OR '.join(parts)+')'

def _format_entry_ranges(items):
    return ', '.join(str(lo) if lo==hi else f'{lo}-{hi}' for lo,hi in _contiguous_ranges(x['entry'] for x in items))

def _loot_sql_row(values):
    return '('+','.join(fmt(v) for v in values)+')'

def build_world_item_placement_rows(items,loot):
    pools={pool['pool_id']:pool for pool in loot.get('pools',())}
    pool_items={row['item']:row for row in loot.get('pool_rows',())}
    attachments=defaultdict(list)
    for row in loot.get('attachments',()): attachments[row['pool_id']].append(row)
    rows=[]
    for item in items:
        pool_row=pool_items.get(item['entry'])
        if pool_row is None or pool_row['pool_id'] not in pools:
            raise RuntimeError(f'world placement is missing generated item {item["entry"]}')
        pool=pools[pool_row['pool_id']]; targets=sorted(attachments.get(pool['pool_id'],()),key=lambda row:row['parent_reference'])
        rows.append({'entry':item['entry'],'name':item['name'],'required_level':item['RequiredLevel'],'item_level':item['ItemLevel'],
                     'quality':item['Quality'],'destination':'world','pool_id':pool['pool_id'],'pool_bracket':pool['bracket'],
                     'pool_level_min':pool['level_min'],'pool_level_max':pool['level_max'],'world_reference_count':len(targets),
                     'world_reference_entries':'; '.join(str(row['parent_reference']) for row in targets),
                     'world_loot_levels':'; '.join(str(level) for level in sorted({row['world_level'] for row in targets})),
                     'chance':LOOT_CHANCE if LOOT_CHANCE is not None else 0})
    return rows

def build_encounter_item_placement_rows(items,records,manifest,source_catalog=None):
    profiles={profile['id']:profile for profile in (manifest or {}).get('profiles',())}
    encounters={(profile['id'],encounter['id']):encounter for profile in profiles.values() for encounter in profile.get('encounters',())}
    infos={(record['profile_id'],encounter_id):info for record in records for encounter_id,info in record.get('encounters',{}).items()}
    source_catalog=source_catalog or {}
    creature_templates=source_catalog.get('creature_templates',{})
    instance_encounters=source_catalog.get('instance_encounters',{})
    rows=[]
    for item in items:
        key=(item.get('content_profile'),item.get('content_target'))
        info=infos.get(key); profile=profiles.get(key[0]); encounter=encounters.get(key)
        if info is None or profile is None or encounter is None: continue
        target_entries=[]; target_names=[]; target_details=[]
        for target in info.get('targets',()):
            target_type=str(target['type']); entry=int(target['entry']); target_entries.append(f'{target_type}:{entry}')
            if target_type=='creature':
                creature_entry=int(target.get('creature_entry',entry)); name=creature_templates.get(creature_entry,{}).get('name')
            else:
                name=None
            name=name or ('Reference '+str(entry) if target_type=='reference' else str(entry))
            target_names.append(name); target_details.append(f'{target_type}:{entry}={name}')
        encounter_id=key[1]; encounter_name='Trash' if encounter_id=='trash' else encounter_id
        match=re.fullmatch(r'boss_(\d+)',str(encounter_id))
        if match:
            encounter_name=instance_encounters.get(int(match.group(1)),{}).get('comment') or encounter_name
        evidence=encounter.get('evidence') or profile.get('evidence') or {}
        set_id=item.get('set_id') or item.get('itemset')
        rows.append({'entry':item['entry'],'name':item['name'],'required_level':item['RequiredLevel'],'item_level':item['ItemLevel'],
                     'quality':item['Quality'],'profile_id':profile['id'],'map_id':profile.get('map_id',''),
                     'difficulty_id':profile.get('difficulty_id',''),'instance':profile.get('instance',profile['id']),
                     'destination':'raid' if profile.get('map_type')==2 else 'dungeon' if profile.get('map_type')==1 else 'dungeon/raid',
                     'encounter':encounter_id,'encounter_kind':encounter.get('kind',''),'encounter_name':encounter_name,
                     'pool_id':info['pool_id'],'loot_mode':info.get('loot_mode',1),'chance':info['chance'],'quantity':info['quantity'],
                     'item_level_min':info['band'][0],'item_level_max':info['band'][1],
                     'profile_required_level_min':profile.get('required_level_min',''),
                     'profile_required_level_max':profile.get('required_level_max',''),
                     'band_source':item.get('placement_band_source') or evidence.get('band_source','explicit'),
                     'band_source_item_count':evidence.get('item_count',''),
                     'band_center':evidence.get('band_center',''),
                     'placement_score':json.dumps(item.get('placement_score',''),separators=(',',':')),
                     'placement_reason':item.get('placement_reason',''),
                     'set_id':set_id or '', 'set_name':item.get('set_name',''),
                     'set_atomic_profile':item.get('set_atomic_profile') or (profile['id'] if set_id else ''),
                     'target_count':len(target_entries),'target_entries':'; '.join(target_entries),
                     'target_names':'; '.join(target_names),'targets':'; '.join(target_details)})
    return rows

def write_placement_reports(items,loot,records,output_dir,manifest=None,source_catalog=None):
    output_dir=Path(output_dir); output_dir.mkdir(parents=True,exist_ok=True)
    world_path=output_dir/'world_item_placements.csv'; world_fields=['entry','name','required_level','item_level','quality','destination','pool_id','pool_bracket','pool_level_min','pool_level_max','world_reference_count','world_reference_entries','world_loot_levels','chance']
    with world_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=world_fields); writer.writeheader(); writer.writerows(build_world_item_placement_rows(items,loot))
    encounter_path=output_dir/'dungeon_raid_item_placements.csv'; encounter_fields=['entry','name','required_level','item_level','quality','profile_id','map_id','difficulty_id','instance','destination','encounter','encounter_kind','encounter_name','pool_id','loot_mode','chance','quantity','item_level_min','item_level_max','profile_required_level_min','profile_required_level_max','band_source','band_source_item_count','band_center','placement_score','placement_reason','set_id','set_name','set_atomic_profile','target_count','target_entries','target_names','targets']
    with encounter_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=encounter_fields); writer.writeheader(); writer.writerows(build_encounter_item_placement_rows(items,records,manifest,source_catalog))
    manifest=manifest or {}; profiles=manifest.get('profiles',())
    coverage_path=output_dir/'encounter_profile_coverage.csv'
    coverage_fields=['map_id','map_name','instance_type','map_type','expansion','difficulty_id','difficulty_label','profile_created','boss_count','trash_target_count','stock_loot_item_count','stock_direct_item_count','stock_reference_item_count','rejected_reference_count','difficulty_resolution','excluded_reason']
    with coverage_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=coverage_fields); writer.writeheader()
        writer.writerows({field:json.dumps(row.get(field,''),separators=(',',':')) if field=='difficulty_resolution' else row.get(field,'') for field in coverage_fields} for row in sorted(manifest.get('coverage',()),key=lambda row:(row.get('map_id',0),row.get('difficulty_id',0))))

    profile_path=output_dir/'encounter_profiles.csv'
    profile_fields=['profile_id','map_id','map_name','destination','difficulty_id','difficulty_label','expansion','boss_count','trash_count','stock_direct_item_count','stock_reference_item_count','rejected_reference_item_count','item_level_min','item_level_max','required_level_min','required_level_max','band_method','progression_cluster','difficulty_resolution','valid','invalid_reason']
    with profile_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=profile_fields); writer.writeheader()
        for profile in sorted(profiles,key=lambda row:str(row.get('id',''))):
            evidence=profile.get('evidence') or {}; encounters=profile.get('encounters',())
            writer.writerow({'profile_id':profile.get('id',''),'map_id':profile.get('map_id',''),'map_name':profile.get('map_name',profile.get('instance','')),
                             'destination':'raid' if profile.get('map_type')==2 else 'dungeon','difficulty_id':profile.get('difficulty_id',''),
                             'difficulty_label':profile.get('difficulty_label',''),'expansion':profile.get('expansion',''),
                             'boss_count':sum(row.get('kind')=='boss' for row in encounters),'trash_count':sum(row.get('kind')=='trash' for row in encounters),
                             'stock_direct_item_count':evidence.get('direct_item_count',0),'stock_reference_item_count':evidence.get('reference_item_count',0),
                             'rejected_reference_item_count':evidence.get('rejected_reference_count',0),'item_level_min':profile.get('item_level_min',''),
                             'item_level_max':profile.get('item_level_max',''),'required_level_min':profile.get('required_level_min',''),
                             'required_level_max':profile.get('required_level_max',''),'band_method':evidence.get('band_source','explicit'),
                             'progression_cluster':json.dumps(evidence.get('progression_cluster',{}),separators=(',',':')),
                             'difficulty_resolution':json.dumps(profile.get('difficulty_resolution',()),separators=(',',':')),
                             'valid':profile.get('valid',True),'invalid_reason':profile.get('invalid_reason','')})

    comparison_path=output_dir/'difficulty_band_comparison.csv'
    comparison_fields=['map_id','instance','difficulty_a','difficulty_b','stock_item_count_a','stock_item_count_b','band_a','band_b','identical','reason']
    with comparison_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=comparison_fields); writer.writeheader()
        writer.writerows({field:row.get(field,'') for field in comparison_fields} for row in manifest.get('difficulty_comparisons',()))

    rejection_path=output_dir/'encounter_band_rejections.csv'
    rejection_fields=['profile_id','encounter_id','source_kind','item','reference','reason']
    with rejection_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=rejection_fields); writer.writeheader()
        for profile in profiles:
            evidence_rows=[('',profile.get('evidence') or {})]+[(encounter.get('id',''),encounter.get('evidence') or {}) for encounter in profile.get('encounters',())]
            for encounter_id,evidence in evidence_rows:
                for rejection in evidence.get('rejections',()):
                    writer.writerow({'profile_id':profile.get('id',''),'encounter_id':rejection.get('encounter') or encounter_id,
                                     'source_kind':evidence.get('band_source',''),'item':rejection.get('item',''),
                                     'reference':rejection.get('reference',''),'reason':rejection.get('reason','')})

    set_path=output_dir/'set_manifest.csv'
    set_fields=['set_id','set_name','entry','name','slot','profile_id','encounter','atomic_profile']
    with set_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=set_fields); writer.writeheader()
        for item in sorted((item for item in items if item.get('set_id') or item.get('itemset')),key=lambda row:row['entry']):
            writer.writerow({'set_id':item.get('set_id') or item.get('itemset'),'set_name':item.get('set_name',''),
                             'entry':item.get('entry',''),'name':item.get('name',''),'slot':item.get('slot',''),
                             'profile_id':item.get('content_profile',''),'encounter':item.get('content_target',''),
                             'atomic_profile':item.get('set_atomic_profile') or item.get('content_profile','')})
    reward_path=output_dir/'gameobject_reward_targets.csv'
    reward_fields=['profile_id','map_id','difficulty_id','encounter_id','encounter_name',
                   'gameobject_entry','gameobject_name','loot_entry','spawn_guid','spawn_mask',
                   'association_method','association_source','direct_item_count','reference_item_count',
                   'valid','invalid_reason']
    with reward_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=reward_fields); writer.writeheader()
        writer.writerows({field:row.get(field,'') for field in reward_fields}
                         for row in (manifest or {}).get('gameobject_reward_targets',()))
    reference_provenance_path=output_dir/'encounter_reference_provenance.csv'
    reference_provenance_fields=['reference_id','parent_target_type','parent_target_entry',
                                 'effective_target_entry','parent_loot_id','map_id',
                                 'difficulty_id','parent_loot_mode','reference_loot_mode',
                                 'consumer_map_count','consumer_profile_count','verified_parent']
    provenance_rows=[]
    if source_catalog:
        provenance_rows.extend(reference_provenance_rows(source_catalog))
        provenance_rows.extend(source_catalog.get('reference_provenance',()))
    provenance_rows.extend((manifest or {}).get('reference_provenance',()))
    for profile in profiles:
        provenance_rows.extend((profile.get('evidence') or {}).get('reference_provenance',()))
        for encounter in profile.get('encounters',()):
            provenance_rows.extend((encounter.get('evidence') or {}).get('reference_provenance',()))
    unique_provenance=[]; seen_provenance=set()
    for row in provenance_rows:
        normalized={field:row.get(field,'') for field in reference_provenance_fields}
        key=tuple(normalized[field] for field in reference_provenance_fields)
        if key not in seen_provenance:
            seen_provenance.add(key); unique_provenance.append(normalized)
    def provenance_sort_value(value):
        return (0,int(value)) if value not in ('',None) and str(value).lstrip('-').isdigit() else (1,str(value))
    unique_provenance.sort(key=lambda row:tuple(
        provenance_sort_value(row[field]) if field!='parent_target_type' else (0,str(row[field]))
        for field in reference_provenance_fields))
    with reference_provenance_path.open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=reference_provenance_fields); writer.writeheader()
        writer.writerows(unique_provenance)
    return {'world':world_path,'encounter':encounter_path,'coverage':coverage_path,'profiles':profile_path,
            'difficulty_comparison':comparison_path,'rejections':rejection_path,'sets':set_path,
            'gameobject_rewards':reward_path,'reference_provenance':reference_provenance_path}

def render_encounter_loot_sql(records):
    columns=',\n    '.join(f'`{column}`' for column in LOOT_SQL_COLUMNS)
    pool_ids=sorted({value['pool_id'] for value in records.get('encounters',{}).values()})
    pool_modes={value['pool_id']:value.get('loot_mode',1) for value in records.get('encounters',{}).values()}
    pool_rows=records.get('pool_rows',[])
    sql=['-- Generated encounter loot; existing loot rows remain independent.','START TRANSACTION;']
    for pool_id in pool_ids:
        rows=[_loot_sql_row((pool_id,row['item'],0,0,0,pool_modes[pool_id],1,1,1,sqlq(row['comment']))) for row in pool_rows if row['pool_id']==pool_id]
        sql.extend([f'DELETE FROM `reference_loot_template` WHERE `Entry` = {pool_id};',
                    'INSERT INTO `reference_loot_template`\n(\n    '+columns+'\n)\nVALUES\n'+',\n'.join(rows)+';'])
    for row in records.get('attachments',[]):
        table={'creature':'creature_loot_template','reference':'reference_loot_template',
               'gameobject':'gameobject_loot_template'}.get(row['parent_type'])
        if table is None: raise ValueError(f'unsupported encounter attachment type: {row["parent_type"]}')
        values=(row['parent_entry'],1,row['pool_id'],row['chance'],0,row.get('loot_mode',1),0,row['quantity'],row['quantity'],sqlq(f'Generated encounter attachment | {records.get("profile_id")} | {row["encounter"]}'))
        sql.extend([f'DELETE FROM `{table}` WHERE `Entry` = {row["parent_entry"]} AND `Item` = 1 AND `Reference` = {row["pool_id"]};',
                    f'INSERT INTO `{table}`\n(\n    {columns}\n)\nVALUES\n'+_loot_sql_row(values)+';'])
    sql.append('COMMIT;')
    cleanup=['-- Removes only generated encounter pools and attachments.','START TRANSACTION;']
    if pool_ids: cleanup.append(f'DELETE FROM `reference_loot_template` WHERE `Entry` IN ({", ".join(map(str,pool_ids))}) OR `Reference` IN ({", ".join(map(str,pool_ids))});')
    for row in records.get('attachments',[]):
        table={'creature':'creature_loot_template','reference':'reference_loot_template',
               'gameobject':'gameobject_loot_template'}.get(row['parent_type'])
        if table is None: raise ValueError(f'unsupported encounter attachment type: {row["parent_type"]}')
        cleanup.append(f'DELETE FROM `{table}` WHERE `Entry` = {row["parent_entry"]} AND `Item` = 1 AND `Reference` = {row["pool_id"]};')
    cleanup.append('COMMIT;')
    return '\n\n'.join(sql)+'\n', '\n'.join(cleanup)+'\n'

def build_quest_reward_records(items,targets,source_rows):
    records=[]
    for target in targets:
        quest_id=int(target['quest_id']); mode=target.get('mode','fixed'); source=source_rows.get(quest_id)
        if source is None: raise ValueError(f'quest {quest_id} was not found in the supplied quest_template source')
        candidates=[item for item in items if int(item.get('quest_id') or 0)==quest_id and item.get('quest_mode',mode)==mode]
        if not candidates: raise ValueError(f'quest {quest_id} has no generated items assigned to its {mode} rewards')
        slots=[dict(slot) for slot in source.get('fixed' if mode=='fixed' else 'choice',())]
        used=set()
        for item in candidates:
            requested=target.get('slot')
            slot_index=int(requested)-1 if requested is not None else next((index for index,slot in enumerate(slots) if index not in used and not slot['item']),None)
            if slot_index is None or not 0<=slot_index<len(slots): raise ValueError(f'quest {quest_id} has no available {mode} reward slot')
            slot=slots[slot_index]
            if slot['item'] and not target.get('overwrite',False): raise ValueError(f'quest {quest_id} {mode} reward slot {slot_index+1} is already occupied')
            used.add(slot_index)
            records.append({'quest_id':quest_id,'mode':mode,'column':slot['item_column'],'quantity_column':slot['quantity_column'],
                            'old_item':int(slot['item']),'old_quantity':int(slot['quantity']),'new_item':int(item['entry']),
                            'new_quantity':int(target.get('quantity') or item.get('quantity') or 1)})
    return records

def render_quest_reward_sql(records):
    sql=['-- Generated quest rewards; existing unmapped reward fields remain unchanged.','START TRANSACTION;']
    cleanup=['-- Restores only quest reward fields changed by this generation.','START TRANSACTION;']
    for record in records:
        sql.append(f'UPDATE `quest_template` SET `{record["column"]}` = {record["new_item"]}, `{record["quantity_column"]}` = {record["new_quantity"]} WHERE `ID` = {record["quest_id"]};')
        cleanup.append(f'UPDATE `quest_template` SET `{record["column"]}` = {record["old_item"]}, `{record["quantity_column"]}` = {record["old_quantity"]} WHERE `ID` = {record["quest_id"]};')
    sql.append('COMMIT;'); cleanup.append('COMMIT;')
    return '\n'.join(sql)+'\n', '\n'.join(cleanup)+'\n'

def load_quest_reward_slots(path,quest_ids):
    path=Path(path); text=path.read_text(encoding='utf-8')
    schema_match=re.search(r'CREATE\s+TABLE\s+`?quest_template`?\s*\((.*?)\)\s*ENGINE',text,re.IGNORECASE|re.DOTALL)
    if not schema_match: raise ValueError(f'quest_template schema not found in {path}')
    quote=chr(96)
    columns=[line.split(quote)[1] for line in schema_match.group(1).splitlines() if line.lstrip().startswith(quote)]
    indexes={name:index for index,name in enumerate(columns)}
    if 'ID' not in indexes: raise ValueError(f'quest_template schema has no ID column: {path}')
    insert_match=re.search(r'INSERT\s+INTO\s+`?quest_template`?\s+VALUES\s*',text,re.IGNORECASE)
    if not insert_match: raise ValueError(f'quest_template data insert not found in {path}')
    wanted={int(value) for value in quest_ids}; found={}
    for line in text[insert_match.end():].splitlines():
        values=_split_sql_tuple(line)
        if values is None: continue
        if len(values)!=len(columns): raise ValueError(f'quest_template row has {len(values)} values; schema has {len(columns)} columns')
        quest_id=int(values[indexes['ID']]);
        if quest_id not in wanted: continue
        def number(column):
            raw=values[indexes[column]].strip().strip("'") if column in indexes else '0'
            return 0 if raw.upper() in ('','NULL') else int(float(raw))
        fixed=[]; choice=[]
        for index in range(1,5):
            item_column=f'RewardItem{index}'; quantity_column=f'RewardAmount{index}'
            if item_column in indexes and quantity_column in indexes:
                fixed.append({'item_column':item_column,'quantity_column':quantity_column,'item':number(item_column),'quantity':number(quantity_column)})
        for index in range(1,7):
            item_column=f'RewardChoiceItemID{index}'; quantity_column=f'RewardChoiceItemQuantity{index}'
            if item_column in indexes and quantity_column in indexes:
                choice.append({'item_column':item_column,'quantity_column':quantity_column,'item':number(item_column),'quantity':number(quantity_column)})
        found[quest_id]={'fixed':fixed,'choice':choice}
        if found.keys()>=wanted: break
    missing=sorted(wanted-set(found))
    if missing: raise ValueError(f'quests missing from {path}: {missing[:10]}')
    return found

def write_outputs(items,ui=None,name_changes=()):
    if (OUT is None or SQLDIR is None or LOOT_CHANCE is None or WORLD_LOOT_SOURCE is None or
            REFERENCE_LOOT_SOURCE is None or ITEM_TEMPLATE_SOURCE is None or ITEM_DBC_SOURCES is None or
            ITEM_SET_DBC_SOURCE is None or REFERENCE_CATALOG_AUDIT is None):
        raise RuntimeError('Runtime output directory is not configured. Call configure_runtime() first.')
    encounter_loot_records=[]
    encounter_manifest=CONTENT_MANIFEST if CONTENT_MANIFEST is not None else DEFAULT_ENCOUNTER_MANIFEST
    encounter_status={'enabled':encounter_manifest is not None,'valid':True,'errors':[],'warnings':[],
                      'profile_count':0,'record_count':0,'pool_ids':(),
                      'placement_summary':{'count':0},'set_summary':{}}
    if ui: ui.status('Mapping world-loot references')
    world_references=load_world_loot_references(WORLD_LOOT_SOURCE,REFERENCE_LOOT_SOURCE)
    if ui: ui.progress(1,10,current='World-loot references mapped')
    loot=build_loot_records(items,world_references)
    if encounter_manifest is not None:
        try:
            if CONTENT_MANIFEST is not None:
                if ui: ui.status('Mapping targeted dungeon and raid encounters')
                encounter_loot_records=build_manifest_encounter_loot_records(items,CONTENT_MANIFEST,WORLD_LOOT_SOURCE,REFERENCE_LOOT_SOURCE,ENCOUNTER_SOURCE_CATALOG)
            else:
                if ui: ui.status('Assigning generated items to dungeon and raid encounters')
                assign_default_encounter_items(items,DEFAULT_ENCOUNTER_MANIFEST)
                encounter_loot_records=build_manifest_encounter_loot_records(items,DEFAULT_ENCOUNTER_MANIFEST,WORLD_LOOT_SOURCE,REFERENCE_LOOT_SOURCE,ENCOUNTER_SOURCE_CATALOG)
            encounter_status.update(validate_encounter_integration(items,encounter_manifest,encounter_loot_records,ENCOUNTER_SOURCE_CATALOG or {}))
            encounter_status['enabled']=True
            if not encounter_status['valid']:
                for item in items: _clear_encounter_metadata(item)
                encounter_loot_records=[]
        except Exception as exc:
            encounter_status.update({'enabled':True,'valid':False,'errors':[str(exc)],'warnings':[],
                                     'record_count':0,'pool_ids':(),
                                     'placement_summary':{'count':0},'set_summary':{}})
            for item in items: _clear_encounter_metadata(item)
            encounter_loot_records=[]
            if ui: ui.status(f'Encounter integration disabled: {exc}')
    if ui:
        ui.status(f'Placement: world loot ({len(loot["attachments"]):,} references)')
        if encounter_loot_records:
            ui.status(f'Placement: dungeon/raid loot ({sum(len(record["attachments"]) for record in encounter_loot_records):,} targets)')
    if ui: ui.progress(2,10,current='Generated loot pools built')
    item_dbc_rows=[item_dbc_row(x) for x in items]
    item_set_rows=generated_item_set_rows(items) if feature_enabled('sets') else []
    if ui: ui.progress(3,10,current='Client DBC rows prepared')
    for item_dbc_source in ITEM_DBC_SOURCES:
        try:
            item_dbc_source.relative_to(OUT)
        except ValueError:
            pass
        else:
            raise ValueError('item-dbc source cannot be inside the output directory being replaced')
    for source_path in (ITEM_SET_DBC_SOURCE,SPELL_DBC_SOURCE,SPELL_ENCHANTMENT_DBC_SOURCE,DISENCHANT_SOURCE,SPELL_PROC_SOURCE,SPELL_SCRIPT_NAMES_SOURCE):
        try:
            source_path.relative_to(OUT)
        except ValueError:
            pass
        else:
            raise ValueError(f'feature source cannot be inside the output directory being replaced: {source_path}')
    if OUT.exists(): shutil.rmtree(OUT)
    SQLDIR.mkdir(parents=True)
    client_dir=OUT/'client'; client_dir.mkdir()
    if ui: ui.progress(4,10,current='Output directories prepared')
    with (client_dir/'item_dbc_rows.csv').open('w',encoding='utf-8',newline='') as f:
        w=csv.writer(f); w.writerow(ITEM_DBC_COLUMNS); w.writerows(item_dbc_rows)
    item_dbc_info={'source_file_count':0,'source_paths':[],'source_row_count':0,'source_overlap_count':0,
                   'generated_row_count':len(item_dbc_rows),'merged_row_count':0,'overwritten_row_count':0,
                   'string_block_size':0,'output':None}
    merged_item_dbc_rows=None
    if ITEM_DBC_SOURCES:
        item_dbc_info.update(merge_item_dbcs(ITEM_DBC_SOURCES,item_dbc_rows,client_dir/'Item.dbc',ITEM_DBC_OVERWRITE))
        item_dbc_info['source_paths']=[_portable_source_path(path) for path in ITEM_DBC_SOURCES]
        item_dbc_info['output']='client/Item.dbc'
        merged_item_dbc_rows,_=_read_item_dbc(client_dir/'Item.dbc')
        with (client_dir/'item_dbc_merged_rows.csv').open('w',encoding='utf-8',newline='') as f:
            w=csv.writer(f); w.writerow(ITEM_DBC_COLUMNS)
            w.writerows(merged_item_dbc_rows[entry] for entry in sorted(merged_item_dbc_rows))
        item_dbc_info['merged_manifest']='client/item_dbc_merged_rows.csv'
    item_set_info=None
    if feature_enabled('sets'):
        client_itemset=client_dir/'ItemSet.dbc'
        item_set_info=merge_item_sets(ITEM_SET_DBC_SOURCE,item_set_rows,client_itemset)
        server_itemset=_copy_server_itemset(client_itemset,OUT)
        item_set_info['source_path']=_portable_source_path(ITEM_SET_DBC_SOURCE)
        item_set_info['output']='client/ItemSet.dbc'
        item_set_info['server_output']=server_itemset.relative_to(OUT).as_posix()
        with (client_dir/'item_set_rows.csv').open('w',encoding='utf-8',newline='') as f:
            w=csv.writer(f); w.writerow(['ID','Name','ItemIDs','BonusThresholds','BonusSpellIDs','SourceTemplateID'])
            for row in item_set_rows:
                bonuses=[(row[43+i],row[35+i]) for i in range(8) if row[35+i] and row[43+i]]
                w.writerow([row[0],getattr(row,'name',''),'|'.join(map(str,row[18:28])).strip('|'),bonuses and '|'.join(str(pair[0]) for pair in bonuses) or '',bonuses and '|'.join(str(pair[1]) for pair in bonuses) or '',next((item.get('set_template_id',0) for item in items if item.get('itemset')==row[0]),0)])
    if ui: ui.progress(6,10,current='ItemSet.dbc merged and staged for client/server')
    with (OUT/'items.ndjson').open('w',encoding='utf-8') as f:
        for x in items:
            y=dict(x); y['stats']=[{'id':a,'value':b,'name':c} for a,b,c in x['stats']]
            f.write(json.dumps(y,ensure_ascii=False,separators=(',',':'))+'\n')
    manifest_cols=['entry','class_name','name','Quality','RequiredLevel','ItemLevel','role','kind','weapon_kind','InventoryType','subclass','displayid','reference_entry','reference_item_level','armor','dps','sockets','itemset','special_effect_feature','effect_source_entry','effect_source_spell','socketBonus','DisenchantID']
    with (OUT/'manifest.csv').open('w',encoding='utf-8',newline='') as f:
        w=csv.writer(f); w.writerow(manifest_cols)
        for x in items: w.writerow([x[k] if k!='sockets' else '|'.join(map(str,x['sockets'])) for k in manifest_cols])
    refs={}
    for x in items: refs[(x['reference_entry'],x['displayid'])]=(x['reference_entry'],x['displayid'],x['reference_item_level'],x['reference_quality'])
    with (OUT/'reference_catalog_used.csv').open('w',newline='',encoding='utf-8') as f:
        w=csv.writer(f); w.writerow(['reference_entry','displayid','item_level','quality']); w.writerows(sorted(refs.values()))

    if ui: ui.progress(7,10,current='Manifests and item records written')

    import_order=[]
    generated_class_names=[]
    for cname,_,_ in CLASSES:
        subset=[x for x in items if x['class_name']==cname]
        if not subset: continue
        generated_class_names.append(cname)
        cdir=SQLDIR/cname.lower().replace(' ','_'); cdir.mkdir()
        for label,lo,hi in LOOT_BRACKETS:
            group=[x for x in subset if lo<=x['RequiredLevel']<=hi]
            for part in range(0,len(group),BATCH_SIZE):
                batch=group[part:part+BATCH_SIZE]
                if not batch: continue
                path=cdir/f'{label}_part_{part//BATCH_SIZE+1:02d}.sql'; import_order.append(path.relative_to(OUT).as_posix())
                with path.open('w',encoding='utf-8') as f:
                    f.write(f'-- {cname} | Required Level {label} | {len(batch)} finalized items\n')
                    f.write(f'-- Generator seed: {SEED}\nSTART TRANSACTION;\n\n')
                    f.write('DELETE FROM `item_template` WHERE `entry` IN (\n    '+', '.join(str(x['entry']) for x in batch)+'\n);\n\n')
                    f.write('INSERT INTO `item_template`\n(\n    '+',\n    '.join(f'`{c}`' for c in SQL_COLUMNS)+'\n)\nVALUES\n')
                    rows=['('+','.join(fmt(v) for v in sql_values(x))+')' for x in batch]
                    f.write(',\n'.join(rows)+';\n\nCOMMIT;\n')

    if ui: ui.progress(8,10,current='Item SQL batches written')

    loot_dir=SQLDIR/'loot'; loot_dir.mkdir()
    loot_columns=',\n    '.join(f'`{c}`' for c in LOOT_SQL_COLUMNS)
    pool_ids=[GENERATED_LOOT_POOL_BASE+i for i in range(len(LOOT_BRACKETS))]
    encounter_pool_ids=[pool['pool_id'] for record in encounter_loot_records for pool in record['encounters'].values()]
    pool_id_list=', '.join(map(str,pool_ids)) or '0'
    encounter_pool_id_list=', '.join(map(str,encounter_pool_ids)) or '0'
    cleanup_path=loot_dir/'00_generated_loot_cleanup.sql'; import_order.append(cleanup_path.relative_to(OUT).as_posix())
    cleanup_path.write_text(
        '-- Removes generated reference pools and any rows pointing at them.\n'
        'START TRANSACTION;\n'
        f'DELETE FROM `reference_loot_template` WHERE `Entry` IN ({pool_id_list}) OR `Reference` IN ({pool_id_list});\n'
        'COMMIT;\n',encoding='utf-8')

    for pool in loot['pools']:
        rows=[_loot_sql_row((row['pool_id'],row['item'],0,0,0,1,1,1,1,sqlq(row['comment'])))
              for row in loot['pool_rows'] if row['pool_id']==pool['pool_id']]
        path=loot_dir/f'{pool["bracket"]}_pool.sql'; import_order.append(path.relative_to(OUT).as_posix())
        with path.open('w',encoding='utf-8') as f:
            f.write(f'-- Generated item pool | Required Level {pool["bracket"]} | {pool["item_count"]} items\n')
            f.write(f'-- Generator seed: {SEED}\nSTART TRANSACTION;\n\n')
            f.write(f'DELETE FROM `reference_loot_template` WHERE `Entry` = {pool["pool_id"]};\n\n')
            f.write(f'INSERT INTO `reference_loot_template`\n(\n    {loot_columns}\n)\nVALUES\n')
            f.write(',\n'.join(rows)+';\n\nCOMMIT;\n')

    attachment_conditions=' OR '.join(f'(`Entry` = {row["parent_reference"]} AND `Item` = {row["item"]})' for row in loot['attachments']) or '1 = 0'
    if loot['attachments']:
        path=loot_dir/'world_loot_attachments.sql'; import_order.append(path.relative_to(OUT).as_posix())
        with path.open('w',encoding='utf-8') as f:
            f.write('-- Generated item pools attached to existing shared world-loot references.\n')
            f.write(f'-- Generator seed: {SEED}\nSTART TRANSACTION;\n\n')
            f.write('DELETE FROM `reference_loot_template` WHERE '+attachment_conditions+';\n\n')
            f.write(f'INSERT INTO `reference_loot_template`\n(\n    {loot_columns}\n)\nVALUES\n')
            rows=[_loot_sql_row((row['parent_reference'],row['item'],row['pool_id'],LOOT_CHANCE,0,1,0,1,1,
                                 sqlq(f'Generated item pool attachment | World Loot Level {row["world_level"]} -> {row["bracket"]}')))
                  for row in loot['attachments']]
            f.write(',\n'.join(rows)+';\n\nCOMMIT;\n')

    encounter_sql=[]; encounter_cleanup=[]
    for record in encounter_loot_records:
        sql,cleanup=render_encounter_loot_sql(record)
        encounter_sql.append(sql); encounter_cleanup.append(cleanup)
    if encounter_sql:
        cleanup_path=loot_dir/'00_generated_encounter_loot_cleanup.sql'; import_order.append(cleanup_path.relative_to(OUT).as_posix())
        cleanup_path.write_text('\n'.join(encounter_cleanup),encoding='utf-8')
        path=loot_dir/'dungeon_raid_encounter_loot.sql'; import_order.append(path.relative_to(OUT).as_posix())
        path.write_text('\n'.join(encounter_sql),encoding='utf-8')
        with (OUT/'encounter_loot.csv').open('w',encoding='utf-8',newline='') as f:
            w=csv.writer(f); w.writerow(['profile_id','encounter','rank','pool_id','item_count','chance','quantity','loot_mode','item_level_min','item_level_max','parent_type','parent_entry'])
            for record in encounter_loot_records:
                for encounter_id,info in record['encounters'].items():
                    for target in info['targets']:
                        w.writerow([record['profile_id'],encounter_id,info['rank'],info['pool_id'],info['item_count'],info['chance'],info['quantity'],info['loot_mode'],info['band'][0],info['band'][1],target['type'],target['entry']])

    encounter_csv=OUT/'encounter_loot.csv'
    if not encounter_csv.exists():
        with encounter_csv.open('w',encoding='utf-8',newline='') as f:
            csv.writer(f).writerow(['profile_id','encounter','rank','pool_id','item_count','chance','quantity','loot_mode','item_level_min','item_level_max','parent_type','parent_entry'])
    placement_reports=write_placement_reports(
        items,loot,encounter_loot_records,
        OUT,CONTENT_MANIFEST if CONTENT_MANIFEST is not None else DEFAULT_ENCOUNTER_MANIFEST,
        ENCOUNTER_SOURCE_CATALOG)
    if ui: ui.status('Placement reports written for world and dungeon/raid loot')

    quest_records=build_quest_reward_records(items,CONTENT_MANIFEST.get('quest_targets',()),QUEST_REWARD_ROWS) if CONTENT_MANIFEST and CONTENT_MANIFEST.get('quest_targets') else []
    if quest_records:
        quest_sql,quest_cleanup=render_quest_reward_sql(quest_records)
        quest_cleanup_path=SQLDIR/'00_generated_quest_rewards_cleanup.sql'; import_order.append(quest_cleanup_path.relative_to(OUT).as_posix()); quest_cleanup_path.write_text(quest_cleanup,encoding='utf-8')
        quest_path=SQLDIR/'quest_rewards.sql'; import_order.append(quest_path.relative_to(OUT).as_posix()); quest_path.write_text(quest_sql,encoding='utf-8')
        with (OUT/'quest_rewards.csv').open('w',encoding='utf-8',newline='') as f:
            w=csv.writer(f); w.writerow(['quest_id','mode','column','quantity_column','old_item','old_quantity','new_item','new_quantity'])
            for row in quest_records: w.writerow([row['quest_id'],row['mode'],row['column'],row['quantity_column'],row['old_item'],row['old_quantity'],row['new_item'],row['new_quantity']])

    with (OUT/'loot_pools.csv').open('w',encoding='utf-8',newline='') as f:
        w=csv.writer(f); w.writerow(['pool_id','bracket','level_min','level_max','item_count','chance','group_id'])
        for pool in loot['pools']: w.writerow([pool['pool_id'],pool['bracket'],pool['level_min'],pool['level_max'],pool['item_count'],0,1])
    with (OUT/'loot_attachments.csv').open('w',encoding='utf-8',newline='') as f:
        w=csv.writer(f); w.writerow(['parent_reference','world_loot_level','bracket','pool_id','synthetic_item_key','chance','group_id'])
        for row in loot['attachments']:
            w.writerow([row['parent_reference'],row['world_level'],row['bracket'],row['pool_id'],row['item'],LOOT_CHANCE,0])

    (OUT/'sql'/'IMPORT_ORDER.txt').write_text('\n'.join(import_order)+'\n',encoding='utf-8')

    cmd=OUT/'additem_commands'; cmd.mkdir()
    for cname in generated_class_names:
        with (cmd/(cname.lower().replace(' ','_')+'.txt')).open('w',encoding='utf-8') as f:
            for x in items:
                if x['class_name']==cname: f.write(f".additem {x['entry']} 1 -- {x['name']}\n")

    if ui: ui.progress(9,10,current='Loot SQL and GM command files written')

    entry_filter=_entry_filter_sql(items)
    encounter_pool_filter=f'`Entry` IN ({encounter_pool_id_list})'
    encounter_pool_reference_filter=f'`Reference` IN ({encounter_pool_id_list})'
    encounter_creature_conditions=' OR '.join(f'(`Entry` = {row["parent_entry"]} AND `Item` = 1 AND `Reference` = {row["pool_id"]})' for record in encounter_loot_records for row in record['attachments'] if row['parent_type']=='creature') or '1 = 0'
    encounter_reference_conditions=' OR '.join(f'(`Entry` = {row["parent_entry"]} AND `Item` = 1 AND `Reference` = {row["pool_id"]})' for record in encounter_loot_records for row in record['attachments'] if row['parent_type']=='reference') or '1 = 0'
    encounter_gameobject_conditions=' OR '.join(f'(`Entry` = {row["parent_entry"]} AND `Item` = 1 AND `Reference` = {row["pool_id"]})' for record in encounter_loot_records for row in record['attachments'] if row['parent_type']=='gameobject') or '1 = 0'
    quest_restore_sql=''.join(f'UPDATE `quest_template` SET `{row["column"]}` = {row["old_item"]}, `{row["quantity_column"]}` = {row["old_quantity"]} WHERE `ID` = {row["quest_id"]};\n' for row in quest_records)
    pool_filter=f'`Entry` IN ({pool_id_list})'
    pool_reference_filter=f'`Reference` IN ({pool_id_list})'
    (OUT/'00_PREIMPORT_COLLISION_CHECK.sql').write_text(
        '-- MUST return 0 before import. This generator cannot inspect your live database.\n'
        'SELECT COUNT(*) AS collision_count\nFROM `item_template`\nWHERE '+entry_filter+';\n\n'
        '-- If non-zero, inspect collisions before importing:\n'
        'SELECT `entry`,`name` FROM `item_template`\nWHERE '+entry_filter+'\nORDER BY `entry`;\n\n'
        'SELECT COUNT(*) AS generated_loot_pool_collision_count\nFROM `reference_loot_template`\nWHERE '+pool_filter+';\n'
        'SELECT `Entry`,`Item`,`Reference`,`Comment` FROM `reference_loot_template`\nWHERE '+pool_filter+'\nORDER BY `Entry`,`Item`;\n\n'
        'SELECT COUNT(*) AS generated_loot_reference_collision_count\nFROM `reference_loot_template`\nWHERE '+pool_reference_filter+';\n'
        'SELECT `Entry`,`Item`,`Reference`,`Comment` FROM `reference_loot_template`\nWHERE '+pool_reference_filter+'\nORDER BY `Entry`,`Item`;\n\n'
        'SELECT COUNT(*) AS generated_loot_attachment_collision_count\nFROM `reference_loot_template`\nWHERE '+attachment_conditions+';\n'
        'SELECT `Entry`,`Item`,`Reference`,`Comment` FROM `reference_loot_template`\nWHERE '+attachment_conditions+'\nORDER BY `Entry`,`Item`;\n\n'
        'SELECT COUNT(*) AS generated_encounter_pool_collision_count\nFROM `reference_loot_template`\nWHERE '+encounter_pool_filter+' OR '+encounter_pool_reference_filter+';\n\n'
        'SELECT COUNT(*) AS generated_encounter_creature_attachment_collision_count\nFROM `creature_loot_template`\nWHERE '+encounter_creature_conditions+';\n\n'
        'SELECT COUNT(*) AS generated_encounter_reference_attachment_collision_count\nFROM `reference_loot_template`\nWHERE '+encounter_reference_conditions+';\n',encoding='utf-8')
    (OUT/'99_REMOVE_GENERATED_ITEMS.sql').write_text(
        'START TRANSACTION;\n'
        f'DELETE FROM `reference_loot_template` WHERE `Entry` IN ({pool_id_list}) OR `Reference` IN ({pool_id_list}) OR `Entry` IN ({encounter_pool_id_list}) OR `Reference` IN ({encounter_pool_id_list});\n'
        'DELETE FROM `creature_loot_template` WHERE '+encounter_creature_conditions+';\n'
        'DELETE FROM `reference_loot_template` WHERE '+encounter_reference_conditions+';\n'
        +quest_restore_sql
        + 'DELETE FROM `item_template` WHERE '+entry_filter+';\n'
        'COMMIT;\n',encoding='utf-8')
    with (OUT/'00_PREIMPORT_COLLISION_CHECK.sql').open('a',encoding='utf-8') as f:
        f.write(
            '\nSELECT COUNT(*) AS generated_encounter_gameobject_attachment_collision_count\n'
            'FROM `gameobject_loot_template`\nWHERE '+encounter_gameobject_conditions+';\n'
            'SELECT `Entry`,`Item`,`Reference`,`Comment` FROM `gameobject_loot_template`\nWHERE '+encounter_gameobject_conditions+'\nORDER BY `Entry`,`Item`;\n'
        )
    with (OUT/'99_REMOVE_GENERATED_ITEMS.sql').open('a',encoding='utf-8') as f:
        f.write('START TRANSACTION;\nDELETE FROM `gameobject_loot_template` WHERE '+encounter_gameobject_conditions+';\nCOMMIT;\n')
    (OUT/'00_SCHEMA_CHECK.sql').write_text(
        "SHOW COLUMNS FROM `acore_world`.`item_template`;\n"
        "SHOW COLUMNS FROM `acore_world`.`reference_loot_template`;\n"
        "SHOW COLUMNS FROM `acore_world`.`creature_loot_template`;\n"
        +("SHOW COLUMNS FROM `acore_world`.`quest_template`;\n" if quest_records else ''),encoding='utf-8')

    q=Counter(QUALITY_NAME[x['Quality']] for x in items); roles=Counter(x['role'] for x in items); kinds=Counter(x['kind'] for x in items)
    loot_bracket_distribution={label:next((pool['item_count'] for pool in loot['pools'] if pool['bracket']==label),0) for label,_,_ in LOOT_BRACKETS}
    world_loot_bracket_distribution={label:sum(row['bracket']==label for row in loot['attachments']) for label,_,_ in LOOT_BRACKETS}
    classes={}
    for cname in generated_class_names:
        xs=[x for x in items if x['class_name']==cname]
        classes[cname]={'count':len(xs),'entry_min':min(x['entry'] for x in xs),'entry_max':max(x['entry'] for x in xs),
                        'unique_names':len({x['name'] for x in xs}),'unique_displayids':len({x['displayid'] for x in xs}),
                        'level_min':min(x['RequiredLevel'] for x in xs),'level_max':max(x['RequiredLevel'] for x in xs)}
    item_dbc_report=dict(item_dbc_info)
    item_dbc_report['source']=_portable_source_path(ITEM_DBC_SOURCES[0]) if len(ITEM_DBC_SOURCES)==1 else None
    item_dbc_report['manifest']='client/item_dbc_rows.csv'
    feature_counts={feature:sum(1 for x in items if (
        (feature=='sets' and x.get('itemset')) or
        (feature=='spell-effects' and x.get('special_effect_feature')=='spell-effects') or
        (feature=='chance-on-hit' and x.get('special_effect_feature')=='chance-on-hit') or
        (feature=='on-use' and x.get('special_effect_feature')=='on-use') or
        (feature=='socket-bonuses' and x.get('socketBonus')) or
        (feature=='disenchant' and x.get('DisenchantID'))
    )) for feature in NEW_FEATURES}
    report={'seed':SEED,'requested_number':TARGET_ITEM_COUNT,'selected_classes':generated_class_names,
            'total_items':len(items),'entry_min':min(x['entry'] for x in items),'entry_max':max(x['entry'] for x in items),
            'unique_entries':len({x['entry'] for x in items}),'unique_names':len({x['name'] for x in items}),
            'unique_displayids':len({x['displayid'] for x in items}),'unique_reference_entries':len({x['reference_entry'] for x in items}),
            'quality_counts':dict(q),'role_counts':dict(roles),'kind_counts':dict(kinds),'classes':classes,
            'loot_pool_count':len(loot['pools']),'loot_pool_row_count':len(loot['pool_rows']),
            'loot_attachment_count':len(loot['attachments']),'loot_chance':LOOT_CHANCE,
            'world_loot_source':_portable_source_path(WORLD_LOOT_SOURCE),'reference_loot_source':_portable_source_path(REFERENCE_LOOT_SOURCE),
            'item_template_source':_portable_source_path(ITEM_TEMPLATE_SOURCE),
            'feature_sources':{'item_set_dbc':_portable_source_path(ITEM_SET_DBC_SOURCE),'spell_dbc':_portable_source_path(SPELL_DBC_SOURCE),
                               'spell_enchantment_dbc':_portable_source_path(SPELL_ENCHANTMENT_DBC_SOURCE),'disenchant':_portable_source_path(DISENCHANT_SOURCE),
                               'spell_proc':_portable_source_path(SPELL_PROC_SOURCE),'spell_script_names':_portable_source_path(SPELL_SCRIPT_NAMES_SOURCE)},
            'disabled_features':sorted(DISABLED_FEATURES),'feature_counts':feature_counts,
            'feature_catalog_audit':FEATURE_CATALOG['audit'],'item_set':item_set_info,
            'item_dbc':item_dbc_report,
            'reference_catalog_count':REFERENCE_CATALOG_AUDIT['reference_count'],
            'reference_catalog_unique_displayids':REFERENCE_CATALOG_AUDIT.get('unique_displayids'),
            'reference_catalog_effective_count':REFERENCE_CATALOG_AUDIT.get('effective_reference_count',REFERENCE_CATALOG_AUDIT['reference_count']),
            'reference_catalog_effective_unique_displayids':REFERENCE_CATALOG_AUDIT.get('effective_unique_displayids',REFERENCE_CATALOG_AUDIT.get('unique_displayids')),
            'reference_catalog_fallback_categories':REFERENCE_CATALOG_AUDIT.get('fallback_categories',[]),
            'reference_catalog_inventory_type_mismatch_count':len(REFERENCE_CATALOG_AUDIT['inventory_type_mismatches']),
            'world_loot_reference_count':len(world_references),'loot_bracket_distribution':loot_bracket_distribution,
            'world_loot_bracket_distribution':world_loot_bracket_distribution,
            'loot_destinations':['world']+(['dungeon','raid'] if encounter_loot_records else []),
            'placement_reports':{key:path.relative_to(OUT).as_posix() for key,path in placement_reports.items()},
            'generated_loot_pool_ids':[pool['pool_id'] for pool in loot['pools']],
            'encounter_loot_profiles':[{'profile_id':record['profile_id'],'order':record['order'],'encounters':record['encounters'],
                                       'pool_row_count':len(record['pool_rows']),'attachment_count':len(record['attachments'])}
                                      for record in encounter_loot_records],
            'generated_encounter_pool_ids':encounter_pool_ids,
            'encounter_integration_enabled':encounter_status['enabled'],
            'encounter_integration_valid':encounter_status['valid'],
            'encounter_validation_errors':encounter_status['errors'],
            'encounter_validation_warnings':encounter_status['warnings'],
            'encounter_validation_summary':{key:value for key,value in encounter_status.items()
                                            if key not in ('errors','warnings')},
            'encounter_source_audit':None if ENCOUNTER_SOURCE_CATALOG is None else {
                'source_paths':[_portable_source_path(path) for path in (ENCOUNTER_SOURCE_PATHS or ())],
                'gameobject_source_paths':[_portable_source_path(path) for path in (GAMEOBJECT_SOURCE_PATHS or ())],
                'map_count':len(ENCOUNTER_SOURCE_CATALOG['maps']),'map_difficulty_count':len(ENCOUNTER_SOURCE_CATALOG['map_difficulties']),
                'creature_template_count':len(ENCOUNTER_SOURCE_CATALOG['creature_templates']),'spawn_creature_count':len(ENCOUNTER_SOURCE_CATALOG['creature_maps']),
                'instance_encounter_count':len(ENCOUNTER_SOURCE_CATALOG['instance_encounters']),
                'gameobject_template_count':len(ENCOUNTER_SOURCE_CATALOG.get('gameobject_templates',{})),
                'gameobject_count':len(ENCOUNTER_SOURCE_CATALOG.get('gameobject_maps',{})),
                'gameobject_support':ENCOUNTER_SOURCE_CATALOG.get('source_audit',{}).get('gameobject_support','not_exercised'),
                'stock_item_count':len(ENCOUNTER_SOURCE_CATALOG.get('stock_items',{})),
                'reference_consumer_count':ENCOUNTER_SOURCE_CATALOG.get('source_audit',{}).get('reference_consumer_count',0),
                'reference_consumer_map_count':ENCOUNTER_SOURCE_CATALOG.get('source_audit',{}).get('reference_consumer_map_count',0),
                'reference_consumer_profile_count':ENCOUNTER_SOURCE_CATALOG.get('source_audit',{}).get('reference_consumer_profile_count',0),
                'reference_provenance_count':ENCOUNTER_SOURCE_CATALOG.get('source_audit',{}).get('reference_provenance_count',0),
                'profile_count':0 if DEFAULT_ENCOUNTER_MANIFEST is None else len(DEFAULT_ENCOUNTER_MANIFEST['profiles']),
            },
            'quest_reward_count':len(quest_records),'quest_rewards':quest_records,
            'random_effects_enabled':feature_enabled('spell-effects'),'socket_bonus_ids_generated':feature_enabled('socket-bonuses'),
            'disenchant_ids_generated':feature_enabled('disenchant'),'chance_on_hit_enabled':feature_enabled('chance-on-hit'),
            'on_use_enabled':feature_enabled('on-use'),'sets_enabled':feature_enabled('sets'),
            'random_property_or_suffix_enabled':False,'validation_errors':0,
            'name_repair_count':len(name_changes),'name_repairs':list(name_changes)}
    (OUT/'validation_report.json').write_text(json.dumps(report,indent=2),encoding='utf-8')
    digest=hashlib.sha256((OUT/'items.ndjson').read_bytes()).hexdigest()
    (OUT/'CHECKSUMS.txt').write_text(f'{digest}  items.ndjson\n',encoding='utf-8')

    class_summary=', '.join(generated_class_names)
    entry_summary='; '.join(f"{c}: {_format_entry_ranges([x for x in items if x['class_name']==c])}" for c in generated_class_names)
    readme=f"""# AzerothCore Random WotLK Item Pack

Deterministic seed: `{SEED}`<br>
Output directory: `generated-{SEED}`<br>
Generated items: `{len(items)}`<br>
Automatic name repairs: `{len(name_changes)}`<br>
Classes: `{class_summary}`<br>
Generated entry ranges: `{entry_summary}`<br>
Generated loot pools: `{len(loot['pools'])}` (`{len(loot['pool_rows'])}` item rows)<br>
World-loot attachments: `{len(loot['attachments'])}` at `{LOOT_CHANCE}%`<br>
Loot destinations: `world` plus `{len(encounter_pool_ids)}` dungeon/raid encounter pools<br>
Dungeon/raid LootMode: `1 << MapDifficulty difficulty_id`<br>
Placement reports: `world_item_placements.csv`, `dungeon_raid_item_placements.csv`, `encounter_profile_coverage.csv`, `encounter_profiles.csv`, `difficulty_band_comparison.csv`, `encounter_band_rejections.csv`, `set_manifest.csv`<br>
World-loot source: `{_portable_source_path(WORLD_LOOT_SOURCE)}`<br>
Reference-loot source: `{_portable_source_path(REFERENCE_LOOT_SOURCE)}`<br>
Dungeon/raid source files: `{', '.join(_portable_source_path(path) for path in (ENCOUNTER_SOURCE_PATHS or ())) or 'none'}`<br>
Optional gameobject source files: `{', '.join(_portable_source_path(path) for path in (GAMEOBJECT_SOURCE_PATHS or ())) or 'none'}`<br>
Item-template source: `{_portable_source_path(ITEM_TEMPLATE_SOURCE)}`<br>
Client Item.dbc sources: `{', '.join(_portable_source_path(path) for path in ITEM_DBC_SOURCES)}`<br>
ItemSet.dbc source: `{_portable_source_path(ITEM_SET_DBC_SOURCE)}`<br>
Spell.dbc source: `{_portable_source_path(SPELL_DBC_SOURCE)}`<br>
SpellItemEnchantment.dbc source: `{_portable_source_path(SPELL_ENCHANTMENT_DBC_SOURCE)}`<br>
Disenchant source: `{_portable_source_path(DISENCHANT_SOURCE)}`<br>
Spell proc source: `{_portable_source_path(SPELL_PROC_SOURCE)}`<br>
Spell script source: `{_portable_source_path(SPELL_SCRIPT_NAMES_SOURCE)}`<br>
Disabled new features: `{', '.join(sorted(DISABLED_FEATURES)) or 'none'}`<br>
Feature counts: `{json.dumps(feature_counts,sort_keys=True)}`<br>
Harvested stock appearance references: `{REFERENCE_CATALOG_AUDIT['reference_count']}`<br>
Harvested unique stock display IDs: `{REFERENCE_CATALOG_AUDIT.get('unique_displayids', 0)}`<br>
Appearance fallback categories: `{len(REFERENCE_CATALOG_AUDIT.get('fallback_categories', []))}`<br>
Target: AzerothCore / WotLK 3.3.5a

## Generator CLI

- `py generate_pack.py` - default 100,000-item pack (10,000 per class).
- `py generate_pack.py` - also reads the dungeon/raid DBC and SQL sources and writes world plus dungeon/raid loot integrations by default.
- `py generate_pack.py --number 10` - exactly 10 items total, distributed across classes.
- `py generate_pack.py --class warrior` - default 10,000-item Warrior block.
- `py generate_pack.py --seed 12311523 --number 20 --class warlock` - exactly 20 deterministic Warlock items.
- `py generate_pack.py --number 200000` - maximum pack: 200,000 items total, 20,000 per class.
- `py generate_pack.py --class warrior --number 20000` - maximum single-class pack: 20,000 Warrior items.
- `py generate_pack.py --loot-chance 5` - override the default 2% independent roll on each shared world-loot reference.
- `py generate_pack.py --world-loot-source PATH --reference-loot-source PATH` - use alternate base loot SQL sources.
- `py generate_pack.py --item-template-source PATH` - use an alternate stock item-template source for appearance harvesting.
- `py generate_pack.py` - always uses the vanilla `Item.dbc`; `Item.custom.dbc` beside the generator is merged automatically only when it exists, then the merged copy is written under `client/`.
- `py generate_pack.py --item-dbc-source PATH --item-dbc-source PATH` - merge every complete or additive WotLK `Item.dbc` source supplied; repeat the option for each client baseline.
- Add `--item-dbc-overwrite` only when intentionally replacing conflicting generated-ID rows in that source DBC.
- `py generate_pack.py --disable sets chance-on-hit` - disable selected new features; `effects` disables all three item spell triggers and `all-new` disables every new feature.
- Encounter integration is source-backed and fail-closed. If validation is invalid, diagnostic reports remain available but encounter SQL is omitted from `sql/IMPORT_ORDER.txt`; item and world-loot output still completes.
- `--set-rate`, `--set-min-level`, `--set-size` - tune complete class/role set generation; five pieces is the default.
- `--spell-effect-rate-multiplier`, `--proc-rate-multiplier`, `--on-use-rate-multiplier`, `--effect-ilvl-window`, `--max-special-effects` - tune stock effect-package selection; low-level effects still obey the stricter 5/10/15 progression windows.
- `--socket-bonus-rate`, `--disenchant-rate` - tune validated stock socket and disenchant assignment.
- `--ui auto|fancy|plain` - choose the terminal presentation; `auto` uses the Rich live dashboard on an interactive terminal when Rich is installed and falls back to plain output otherwise.
- `--no-animations` - keep the styled dashboard but disable animated spinners.
- `--show-items` - expand the live discovery feed beyond the default Legendary, set, proc, and special-effect callouts.
- `--quiet` - suppress progress output and print only errors plus the final completion line.
- Rich is optional. If installed, interactive `--ui auto` runs use the live dashboard; otherwise the generator automatically falls back to the standard-library plain UI.

Flags can be combined in any order. The default remains 100,000 total and world-loot attachment chance defaults to 2%. Explicit `--number` is capped at 200,000 total and 20,000 per selected class.

## Safety / generation policy

- Final values are generated and validated before SQL is emitted.
- Stock appearances are auto-harvested from the complete supplied `item_template.sql`, including current-schema weapon damage/delay fields, deduplicated by display ID per compatible equipment category, and weighted by reference item level/quality.
- The old curated appearance rows are used only as safety fallbacks for categories missing from the supplied stock table.
- Generated names reject repeated meaningful words anywhere in the name plus compound-root repetitions such as `Earthshard Shard`.
- Legendary flavor text is equipment-aware for weapons, armor, shields, relics, and accessories.
- Death Knight items are generated only for required levels 55-80.
- Uncommon quality is capped at item level 213; Rare quality is capped at item level 226.
- Ordinary gear uses role/equipment-compatible multi-class masks; class-specific relics remain class-specific.
- Legendaries use dedicated names, guaranteed flavor text, five stats, at least two sockets, and distinct source classes when possible.
- Static stats are packed contiguously from stat slot 1.
- `RandomProperty` and `RandomSuffix` are zero.
- Item spell effects are copied as complete stock packages and validated against `Spell.dbc`, `spell_proc.sql`, and `spell_script_names.sql`.
- Generated sets use complete class/role groups (five pieces by default), stock visual families where available, and exactly one stock 2-piece plus one stock 4-piece bonus when the configured size supports it in merged `client/ItemSet.dbc`.
- The same generated `ItemSet.dbc` is staged under `server/dbc/ItemSet.dbc` because AzerothCore worldserver must load the generated set definitions too.
- Socket bonuses are resolved through `SpellItemEnchantment.dbc`; no enchantment ID is invented.
- Disenchant pairs are copied from stock item rows only when their `DisenchantID` exists in `disenchant_loot_template.sql`.
- Set pieces do not receive independent random special effects by default.
- Every catalog `displayid`, class, subclass, and inventory type is checked against the selected `item_template.sql` before generation.
- SQL uses explicit column lists and transactions.
- Generated items are placed into up to six centralized `reference_loot_template` pools by required-level bracket.
- Pool rows use `Chance = 0`, `GroupId = 1` to select one generated item; attachments use `GroupId = 0` and the configured independent roll.
- Existing creature loot rows are not rewritten. World-loot levels 81–82 use the level-80 pool, and the generated pool is shared across classes.
- Encounter placement requires both ItemLevel and RequiredLevel evidence, respects each MapDifficulty LootMode, rejects unsafe shared references/outliers, and keeps generated sets in one map+difficulty.
- Generated reference pool IDs are reserved at `3000000`–`3000005`; attachment keys use the reserved `2000000000 + parent_reference` range.
- Item entries use the `200000-399999` namespace, split into 20,000-ID blocks per class.
- The default 100,000-item pack uses the first 10,000 IDs of each class block; larger runs fill those blocks up to 200,000 items.

## Import

1. Run `00_SCHEMA_CHECK.sql` and confirm the columns match your AzerothCore schema.
2. Run `00_PREIMPORT_COLLISION_CHECK.sql`. Do not import unless every reported collision count is 0.
3. Import files in `sql/IMPORT_ORDER.txt`. Encounter SQL appears there only when encounter integration validation succeeds.
4. When sets are enabled, copy `server/dbc/ItemSet.dbc` into the AzerothCore worldserver DBC directory.
5. Restart worldserver after the SQL import and server DBC copy.
6. With the client closed, clear `Cache/WDB/<locale>/itemcache.wdb` if item names/icons are stale, then retest.
7. `client/item_dbc_rows.csv` contains only this run's generated rows; `client/item_dbc_merged_rows.csv` contains the complete final client table.
8. When sets are enabled, package `client/ItemSet.dbc` as `DBFilesClient\\ItemSet.dbc` alongside `client/Item.dbc`.
9. All configured DBC sources are merged additively. Identical duplicate rows are accepted; conflicting rows stop generation instead of silently overwriting client data.
10. Package only the final `client/Item.dbc` and `client/ItemSet.dbc` externally and keep other custom client assets/DBC rows in the effective source set.

`00_PREIMPORT_COLLISION_CHECK.sql` checks item IDs, reserved pool IDs, pool references, and attachment keys. `99_REMOVE_GENERATED_ITEMS.sql` removes this run's generated items, pools, and pool attachments.
"""
    (OUT/'README.md').write_text(readme,encoding='utf-8')
    if ui: ui.progress(10,10,current='Validation report, checksums, and README written')
    return report

def main(argv=None):
    args=parse_args(argv)
    ui=create_terminal_ui(args)
    started=time.monotonic()
    try:
        ui.banner()
        runtime=configure_runtime(args=args,ui=ui)
        ui.configure(runtime)

        ui.phase('Generating item skeletons',total=runtime['number'],detail='Levels, item levels, quality, roles, slots, and class compatibility')
        sk=build_runtime_skeletons(ui=ui)
        ui.phase_done('Generating item skeletons',f'{len(sk):,} skeletons ready')

        ui.phase('Finalizing generated items',total=len(sk),detail='Stats, appearances, effects, sockets, disenchant data, and names')
        items=finish_items(sk,ui=ui)
        ui.phase_done('Finalizing generated items',f'{len(items):,} items forged')

        ui.phase('Validating generated pack',total=len(items),detail='IDs • names • progression • effects • sets • sockets • disenchant')
        name_changes=repair_item_names(items)
        if name_changes:
            ui.status(f'Adjusted {len(name_changes)} item names to satisfy name rules')
        errs=validate(items,ui=ui)
        ui.validation(errs,name_changes)
        if errs:
            ui.error('VALIDATION FAILED\n'+'\n'.join(errs[:50]))
            raise SystemExit(1)
        ui.phase_done('Validating generated pack','0 errors')

        ui.phase('Writing output pack',total=10,detail='SQL • loot pools • Item.dbc • ItemSet.dbc • manifests • checksums')
        report=write_outputs(items,ui=ui,name_changes=name_changes)
        ui.phase_done('Writing output pack')
        ui.complete(report,time.monotonic()-started,runtime['output_dir'])
        return report
    except KeyboardInterrupt:
        ui.error('Generation cancelled by user.')
        raise
    except Exception as exc:
        ui.error(str(exc))
        raise
    finally:
        ui.close()

if __name__=='__main__': main()
