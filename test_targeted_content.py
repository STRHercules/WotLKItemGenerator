import importlib.util
import json
import pathlib
import tempfile
import unittest


HERE = pathlib.Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location('generator', HERE / 'generate_pack.py')
g = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(g)


class ManifestTests(unittest.TestCase):
    def test_cli_accepts_content_manifest(self):
        args = g.parse_args(['--content-manifest', 'content_manifest.json'])

        self.assertEqual(args.content_manifest, pathlib.Path('content_manifest.json'))

    def test_load_content_manifest_validates_profile_targets(self):
        payload = {
            'version': 1,
            'profiles': [{
                'id': 'sample',
                'item_level_min': 100,
                'item_level_max': 110,
                'encounters': [{
                    'id': 'boss',
                    'kind': 'boss',
                    'requires': [],
                    'targets': [{'type': 'creature', 'entry': 9001}],
                }],
            }],
            'recipes': [{'id': 'sample_items', 'count': 2, 'profile': 'sample'}],
            'quest_targets': [],
        }
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / 'manifest.json'
            path.write_text(json.dumps(payload), encoding='utf-8')
            manifest = g.load_content_manifest(path)

        self.assertEqual(manifest['profiles'][0]['id'], 'sample')

    def test_manifest_rejects_duplicate_loot_targets(self):
        profile = {
            'id': 'bad',
            'encounters': [
                {'id': 'one', 'kind': 'boss', 'requires': [],
                 'targets': [{'type': 'reference', 'entry': 9001}]},
                {'id': 'two', 'kind': 'boss', 'requires': ['one'],
                 'targets': [{'type': 'reference', 'entry': 9001}]},
            ],
        }

        with self.assertRaises(ValueError):
            g.validate_content_manifest({'version': 1, 'profiles': [profile], 'recipes': []})

    def test_resolve_encounter_order_uses_prerequisites(self):
        profile = {
            'id': 'sample',
            'encounters': [
                {'id': 'final', 'kind': 'boss', 'requires': ['wing_a', 'wing_b']},
                {'id': 'wing_b', 'kind': 'boss', 'requires': []},
                {'id': 'wing_a', 'kind': 'boss', 'requires': []},
            ],
        }

        resolved = g.resolve_encounter_order(profile)

        self.assertEqual([row['id'] for row in resolved], ['wing_a', 'wing_b', 'final'])
        self.assertEqual([row['rank'] for row in resolved], [0, 0, 1])

    def test_manifest_rejects_encounter_cycles(self):
        profile = {
            'id': 'bad',
            'encounters': [
                {'id': 'a', 'kind': 'boss', 'requires': ['b']},
                {'id': 'b', 'kind': 'boss', 'requires': ['a']},
            ],
        }

        with self.assertRaises(ValueError):
            g.resolve_encounter_order(profile)

    def test_weighted_counts_preserve_exact_total(self):
        targets = [{'id': 'trash', 'weight': 1}, {'id': 'boss', 'weight': 3}]

        self.assertEqual(g.allocate_weighted_counts(10, targets), {'trash': 2, 'boss': 8})


class PlannerTests(unittest.TestCase):
    def setUp(self):
        g.SEED = 424242

    def test_generation_plan_keeps_recipe_counts_disjoint(self):
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [], 'recipes': [
            {'id': 'epics', 'count': 4, 'quality': 4},
            {'id': 'warrior_weapons', 'count': 2, 'class': 'Warrior', 'kind': 'weapon'},
        ]}

        plan = g.build_generation_plan(manifest, g.CLASSES)

        self.assertEqual(len(plan), 6)
        self.assertEqual(sum(row['recipe_id'] == 'epics' for row in plan), 4)
        self.assertEqual(sum(row['recipe_id'] == 'warrior_weapons' for row in plan), 2)
        self.assertEqual({row['class_name'] for row in plan if row['recipe_id'] == 'warrior_weapons'}, {'Warrior'})

    def test_targeted_skeleton_honors_required_and_item_level_ranges(self):
        plan = [{
            'recipe_id': 'sample',
            'index': 0,
            'class_name': 'Warrior',
            'class_index': 0,
            'required_level_min': 30,
            'required_level_max': 50,
            'item_level_min': 100,
            'item_level_max': 115,
            'quality': 4,
        }]

        skeletons = g.build_targeted_skeletons(plan)

        self.assertEqual(len(skeletons), 1)
        self.assertEqual(skeletons[0]['class_name'], 'Warrior')
        self.assertTrue(30 <= skeletons[0]['required_level'] <= 50)
        self.assertTrue(100 <= skeletons[0]['item_level'] <= 115)

    def test_recipe_without_item_level_uses_existing_progression_curve(self):
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [],
                    'recipes': [{'id': 'sample', 'count': 1}]}

        plan = g.build_generation_plan(manifest, g.CLASSES)

        self.assertIsNone(plan[0]['item_level_min'])
        self.assertIsNone(plan[0]['item_level_max'])

    def test_weapon_recipe_only_creates_weapon_skeletons(self):
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [],
                    'recipes': [{'id': 'weapons', 'count': 4, 'class': 'Warrior', 'kind': 'weapon'}]}

        plan = g.build_generation_plan(manifest, g.CLASSES)
        skeletons = g.build_targeted_skeletons(plan)

        self.assertEqual({row['cls'] for row in skeletons}, {2})

    def test_targeted_assignment_metadata_survives_item_finalization(self):
        g.DISABLED_FEATURES = set(g.NEW_FEATURES)
        g.FEATURE_CATALOG = g.empty_feature_catalog()
        g.SET_RATE = 0
        g.SET_MIN_LEVEL = 20
        g.SET_SIZE = 5
        g.EFFECT_ILVL_WINDOW = 15
        g.SOCKET_BONUS_RATE = 100.0
        g.DISENCHANT_RATE = 100.0
        g.MAX_SPECIAL_EFFECTS = 1
        g.SPELL_EFFECT_RATE_MULTIPLIER = 1.0
        g.PROC_RATE_MULTIPLIER = 1.0
        g.ON_USE_RATE_MULTIPLIER = 1.0
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [],
                    'recipes': [{'id': 'sample', 'count': 1, 'class': 'Warrior',
                                 'item_level': [200, 200], 'target_kind': 'dungeon',
                                 'target': 'boss'}]}

        skeleton = g.build_targeted_skeletons(g.build_generation_plan(manifest, g.CLASSES))
        item = g.finish_items(skeleton)[0]

        self.assertEqual(item['recipe_id'], 'sample')
        self.assertEqual(item['target_kind'], 'dungeon')
        self.assertEqual(item['content_target'], 'boss')

    def test_set_recipe_expands_to_cohesive_piece_groups(self):
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [],
                    'recipes': [{'id': 'rogue_sets', 'set_count': 2, 'set_size': 5,
                                 'class': 'Rogue', 'quality': 4}]}

        plan = g.build_generation_plan(manifest, g.CLASSES)
        skeletons = g.build_targeted_skeletons(plan)

        self.assertEqual(len(plan), 10)
        self.assertEqual(len(skeletons), 10)
        self.assertEqual({row['set_request_index'] for row in skeletons}, {0, 1})
        self.assertEqual({row['set_size'] for row in skeletons}, {5})
        self.assertEqual({row['slot'] for row in skeletons}, set(g.SET_SLOT_ORDER[:5]))

    def test_targeted_set_recipe_assigns_one_itemset_definition(self):
        g.DISABLED_FEATURES = set()
        g.SET_SIZE = 5
        g.EFFECT_ILVL_WINDOW = 15
        g.FEATURE_CATALOG = {
            'item_sets': [900],
            'set_templates': [{
                'source_set_id': 1, 'class_mask': -1, 'quality': 4, 'role': '',
                'item_level': 200, 'bonuses': ((2, 100), (4, 101)), 'visuals': {},
            }],
        }
        manifest = {'version': 1, 'profiles': [], 'quest_targets': [],
                    'recipes': [{'id': 'rogue_sets', 'set_count': 1, 'set_size': 5,
                                 'class': 'Rogue', 'quality': 4, 'item_level': [200, 200]}]}

        skeletons = g.build_targeted_skeletons(g.build_generation_plan(manifest, g.CLASSES))
        definitions = g.assign_targeted_sets(skeletons)

        self.assertEqual(len(definitions), 1)
        self.assertEqual({row['set_id'] for row in skeletons}, {901})
        g.TARGETED_PLAN = g.build_generation_plan(manifest, g.CLASSES)
        runtime_skeletons = g.build_runtime_skeletons()
        g.TARGETED_PLAN = None
        self.assertEqual({row['set_id'] for row in runtime_skeletons}, {901})


class RuntimeTests(unittest.TestCase):
    def test_manifest_runtime_uses_manifest_count(self):
        runtime = g.configure_runtime([
            '--seed', '424242', '--content-manifest', 'content_manifest.example.json',
            '--disable', 'all-new', '--ui', 'plain',
        ])

        self.assertEqual(runtime['number'], 10)
        self.assertEqual(runtime['content_manifest']['profiles'][0]['id'], 'example_normal')
        self.assertEqual(len(g.build_runtime_skeletons()), 10)


if __name__ == '__main__':
    unittest.main()
