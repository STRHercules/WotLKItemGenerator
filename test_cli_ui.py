import importlib.util
import io
import pathlib
import unittest
from unittest.mock import patch

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

    def test_set_piece_names_are_repaired_as_a_set_not_individually(self):
        items = [
            {'entry': 320590, 'name': 'Handguards of the Lordaeron Guard', 'itemset': 902},
        ]

        self.assertEqual(g.repair_item_names(items), [])
        self.assertEqual(items[0]['name'], 'Handguards of the Lordaeron Guard')

    def test_plate_set_styles_never_use_leather_or_mail_style(self):
        anchor = {'entry': 320590, 'role': 'tank', 'sub': 4}

        with patch.object(g, 'h64', return_value=2):
            style = g._set_name(anchor).split(' of the ', 1)[0]

        self.assertIn(style, {'Battlegear', 'Warplate', 'Battleplate'})

    def test_generated_item_placeholder_is_rejected(self):
        self.assertFalse(g.valid_item_name('Generated Item 320590'))


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

    def test_set_members_use_exact_class_mask_and_levels(self):
        g.DISABLED_FEATURES=set()
        g.SET_RATE=100.0
        g.SET_SIZE=5
        g.SET_MIN_LEVEL=20
        g.EFFECT_ILVL_WINDOW=15
        g.FEATURE_CATALOG={'item_sets': [900]}
        skeletons=[]
        for index,slot in enumerate(g.SET_SLOT_ORDER[:5]):
            skeletons.append(dict(entry=1000+index,class_name='Rogue',class_mask=1100,
                                  role='agility_dps',quality=4,slot=slot,sub=2,
                                  required_level=70+index,item_level=190+index*3))

        with patch.object(g, '_choose_set_template', return_value={
                'source_set_id': 1, 'bonuses': ((2, 100), (4, 101)), 'visuals': {}}):
            g.assign_item_sets(skeletons)

        self.assertEqual({item['class_mask'] for item in skeletons}, {g.CLASS_MASK_BY_NAME['Rogue']})
        self.assertEqual({item['item_level'] for item in skeletons}, {190})
        self.assertEqual({item['required_level'] for item in skeletons}, {70})

    def test_set_title_collision_is_rejected_when_piece_names_collide(self):
        g.DISABLED_FEATURES=set()
        g.SET_RATE=100.0
        g.SET_SIZE=5
        g.SET_MIN_LEVEL=20
        g.EFFECT_ILVL_WINDOW=15
        g.FEATURE_CATALOG={'item_sets': [900]}
        skeletons=[]
        for base in (1000, 2000):
            for index,slot in enumerate(g.SET_SLOT_ORDER[:5]):
                skeletons.append(dict(entry=base+index,class_name='Rogue',class_mask=8,
                                      role='agility_dps',quality=4,slot=slot,sub=2,
                                      required_level=70,item_level=190))

        def set_name(anchor, attempt=0):
            if anchor['entry'] < 2000:
                return 'Battlegear of the Same Theme' if attempt == 0 else 'Battlegear of the First Theme'
            return 'Warplate of the Same Theme' if attempt == 0 else 'Warplate of the Other Theme'

        with patch.object(g, '_choose_set_template', return_value={
                'source_set_id': 1, 'bonuses': ((2, 100), (4, 101)), 'visuals': {}}), \
                patch.object(g, '_set_name', side_effect=set_name):
            definitions=g.assign_item_sets(skeletons)

        self.assertEqual(len(definitions), 2)
        piece_names=[g._set_piece_name(item['slot'], item['set_name']) for item in skeletons]
        self.assertEqual(len(piece_names), len(set(piece_names)))

    def test_sets_do_not_mix_armor_tiers_when_normalizing_levels(self):
        g.DISABLED_FEATURES=set()
        g.SET_RATE=100.0
        g.SET_SIZE=5
        g.SET_MIN_LEVEL=20
        g.EFFECT_ILVL_WINDOW=15
        g.FEATURE_CATALOG={'item_sets': [900]}
        skeletons=[dict(entry=1000,class_name='Warrior',class_mask=3,
                        role='strength_dps',quality=4,slot='head',sub=3,
                        required_level=30,item_level=100)]
        skeletons.extend(dict(entry=1000+index,class_name='Warrior',class_mask=3,
                              role='strength_dps',quality=4,slot=slot,sub=4,
                              required_level=70,item_level=100)
                         for index,slot in enumerate(g.SET_SLOT_ORDER[1:5],1))

        with patch.object(g, '_choose_set_template', return_value={
                'source_set_id': 1, 'bonuses': ((2, 100), (4, 101)), 'visuals': {}}):
            self.assertEqual(g.assign_item_sets(skeletons), [])

    def test_trinket_on_use_requires_a_trinket_source(self):
        g.EFFECT_ILVL_WINDOW=15
        g.FEATURE_CATALOG=g.empty_feature_catalog()
        package={'trigger': 0, 'source_class': 4, 'source_quality': 4,
                  'source_item_level': 200, 'source_entry': 1, 'spell_id': 2,
                  'source_class_mask': -1, 'source_role': 'agility_dps',
                  'source_inventory_type': 11}
        g.FEATURE_CATALOG['effect_index'][(0, 4, 4, 20)].append(package)
        item={'entry': 10, 'class_name': 'Rogue', 'item_class': 4, 'Quality': 4,
              'ItemLevel': 200, 'InventoryType': 12, 'kind': 'trinket',
              'role': 'agility_dps'}

        self.assertIsNone(g._choose_effect_package(item, 'on-use'))
