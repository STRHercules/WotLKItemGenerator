import importlib.util
import io
import pathlib
import unittest

HERE = pathlib.Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('generator', HERE / 'generate_pack.py')
g = importlib.util.module_from_spec(spec)
spec.loader.exec_module(g)


class CliUiTests(unittest.TestCase):
    def test_cli_display_flags(self):
        args = g.parse_args(['--ui', 'fancy', '--no-animations', '--show-items'])
        self.assertEqual(args.ui, 'fancy')
        self.assertTrue(args.no_animations)
        self.assertTrue(args.show_items)
        self.assertFalse(args.quiet)

        quiet = g.parse_args(['--quiet'])
        self.assertTrue(quiet.quiet)
        self.assertEqual(quiet.ui, 'auto')

    def test_ui_mode_resolution(self):
        self.assertEqual(g.resolve_ui_mode('plain', is_tty=True, rich_available=True), 'plain')
        self.assertEqual(g.resolve_ui_mode('fancy', is_tty=True, rich_available=False), 'plain')
        self.assertEqual(g.resolve_ui_mode('auto', is_tty=False, rich_available=True), 'plain')
        self.assertEqual(g.resolve_ui_mode('auto', is_tty=True, rich_available=True), 'fancy')

    def test_plain_ui_has_stable_phase_and_summary_output(self):
        stream = io.StringIO()
        ui = g.PlainTerminalUI(stream=stream, animations=False, show_items=True)
        ui.banner()
        ui.phase('Generating item skeletons', total=10)
        ui.progress(5, 10, current='Rogue • Level 72 • Epic')
        ui.phase_done('Generating item skeletons')
        ui.complete({
            'item_count': 10,
            'quality_distribution': {'Uncommon': 5, 'Rare': 3, 'Epic': 2},
            'feature_counts': {'sets': 1, 'spell-effects': 2, 'chance-on-hit': 1, 'on-use': 1,
                               'socket-bonuses': 4, 'disenchant': 9},
            'validation_errors': 0,
        }, elapsed=1.25, output_dir='generated-123')
        out = stream.getvalue()
        self.assertIn('WotLK ITEM FORGE', out)
        self.assertIn('Generating item skeletons', out)
        self.assertIn('5/10', out)
        self.assertIn('GENERATION COMPLETE', out)
        self.assertIn('generated-123', out)

    def test_notable_item_event_prefers_legendary_and_sets(self):
        legendary = {'Quality': 5, 'name': 'Skybreaker, Oath of the Final Vigil', 'class_name': 'Paladin',
                     'RequiredLevel': 80, 'ItemLevel': 277, 'stats': [1,2,3,4,5], 'sockets': [2,8,4],
                     'special_effect_feature': 'spell-effects', 'itemset': 0}
        event = g.notable_item_event(legendary)
        self.assertEqual(event['kind'], 'legendary')
        self.assertIn('Skybreaker', event['title'])

        set_piece = {'Quality': 4, 'name': 'Helm of the Frozen Star', 'class_name': 'Warrior',
                    'RequiredLevel': 80, 'ItemLevel': 232, 'stats': [], 'sockets': [],
                    'special_effect_feature': '', 'itemset': 902, 'set_name': 'Battlegear of the Frozen Star'}
        event = g.notable_item_event(set_piece)
        self.assertEqual(event['kind'], 'set')
        self.assertIn('Frozen Star', event['title'])

    def test_repairs_invalid_set_names_and_reports_changes(self):
        items = [
            {'entry': 320590, 'name': 'Handguards of the Lordaeron Guard'},
            {'entry': 322020, 'name': 'Legguards of the Lordaeron Guard'},
            {'entry': 329191, 'name': 'Headguard of the Lordaeron Guard'},
        ]

        changes = g.repair_item_names(items)

        self.assertEqual([item['name'] for item in items], [
            'Handguards of the Lordaeron',
            'Legguards of the Lordaeron',
            'Headguard of the Lordaeron',
        ])
        self.assertEqual(changes, [
            {'entry': 320590, 'old_name': 'Handguards of the Lordaeron Guard', 'new_name': 'Handguards of the Lordaeron'},
            {'entry': 322020, 'old_name': 'Legguards of the Lordaeron Guard', 'new_name': 'Legguards of the Lordaeron'},
            {'entry': 329191, 'old_name': 'Headguard of the Lordaeron Guard', 'new_name': 'Headguard of the Lordaeron'},
        ])

        stream = io.StringIO()
        g.PlainTerminalUI(stream=stream).validation([], changes)
        output = stream.getvalue()
        self.assertIn('NAME REPAIRS', output)
        self.assertIn('320590: Handguards of the Lordaeron Guard -> Handguards of the Lordaeron', output)


if __name__ == '__main__':
    unittest.main()

class RecorderUI:
    def __init__(self):
        self.progress_calls=[]
        self.items=[]
        self.events=[]
    def progress(self,*args,**kwargs): self.progress_calls.append((args,kwargs))
    def item(self,item): self.items.append(item['entry'])
    def event(self,*args,**kwargs): self.events.append((args,kwargs))
    def status(self,*args,**kwargs): pass

class ProgressIntegrationTests(unittest.TestCase):
    def setUp(self):
        g.SEED=424242
        g.ACTIVE_CLASSES=[('Warrior',1,200000)]
        g.CLASS_ITEM_COUNTS={'Warrior':8}
        g.TARGET_ITEM_COUNT=8
        g.DISABLED_FEATURES=set(g.NEW_FEATURES)
        g.FEATURE_CATALOG=g.empty_feature_catalog()
        g.SET_RATE=0.20
        g.SET_MIN_LEVEL=20
        g.SET_SIZE=5
        g.SPELL_EFFECT_RATE_MULTIPLIER=1.0
        g.PROC_RATE_MULTIPLIER=1.0
        g.ON_USE_RATE_MULTIPLIER=1.0
        g.EFFECT_ILVL_WINDOW=15
        g.SOCKET_BONUS_RATE=100.0
        g.DISENCHANT_RATE=100.0
        g.MAX_SPECIAL_EFFECTS=1

    def test_generation_callbacks_do_not_change_items(self):
        baseline_skeletons=g.build_skeletons()
        baseline=g.finish_items(baseline_skeletons)
        rec=RecorderUI()
        observed_skeletons=g.build_skeletons(ui=rec)
        observed=g.finish_items(observed_skeletons,ui=rec)
        self.assertEqual(baseline,observed)
        self.assertTrue(rec.progress_calls)
        self.assertEqual(rec.items,[item['entry'] for item in observed])
