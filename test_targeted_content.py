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

    def test_quest_recipe_assigns_generated_item_to_mapped_quest(self):
        manifest = {
            'version': 1, 'profiles': [],
            'recipes': [{'id': 'quest_item', 'count': 1, 'class': 'Warrior', 'target_kind': 'quest'}],
            'quest_targets': [{'quest_id': 100, 'mode': 'fixed', 'recipe': 'quest_item'}],
        }

        plan = g.build_generation_plan(manifest, g.CLASSES)

        self.assertEqual(plan[0]['quest_id'], 100)
        self.assertEqual(plan[0]['quest_mode'], 'fixed')

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
    def _configure_example(self):
        directory = tempfile.TemporaryDirectory()
        self.addCleanup(directory.cleanup)
        path = pathlib.Path(directory.name) / 'quest_template.sql'
        path.write_text("""CREATE TABLE `quest_template` (
  `ID` int unsigned NOT NULL,
  `RewardItem1` int unsigned NOT NULL,
  `RewardAmount1` smallint unsigned NOT NULL,
  `RewardChoiceItemID1` int unsigned NOT NULL,
  `RewardChoiceItemQuantity1` smallint unsigned NOT NULL
) ENGINE=InnoDB;
INSERT INTO `quest_template` VALUES
(2,0,0,0,0);
""", encoding='utf-8')
        return g.configure_runtime([
            '--seed', '424242', '--content-manifest', 'content_manifest.example.json',
            '--quest-template-source', str(path), '--disable', 'all-new', '--ui', 'plain',
        ])

    def test_manifest_runtime_uses_manifest_count(self):
        runtime = self._configure_example()

        self.assertEqual(runtime['number'], 11)
        self.assertEqual(runtime['content_manifest']['profiles'][0]['id'], 'example_normal')
        self.assertEqual(len(g.build_runtime_skeletons()), 11)

    def test_targeted_validation_accepts_interleaved_class_entries(self):
        self._configure_example()
        items = g.finish_items(g.build_runtime_skeletons())

        self.assertEqual(g.validate(items), [])


class LootTests(unittest.TestCase):
    def setUp(self):
        g.SEED = 424242

    def test_encounter_progression_ends_at_profile_maximum(self):
        profile = {
            'id': 'sample',
            'item_level_min': 200,
            'item_level_max': 240,
            'encounters': [
                {'id': 'first', 'kind': 'boss', 'requires': []},
                {'id': 'last', 'kind': 'boss', 'requires': ['first']},
            ],
        }

        resolved = g.resolve_encounter_order(profile)

        self.assertEqual(g.encounter_item_level_band(profile, resolved[0], resolved)[0], 200)
        self.assertEqual(g.encounter_item_level_band(profile, resolved[-1], resolved)[1], 240)

    def test_generation_plan_assigns_weighted_encounters_and_bands(self):
        manifest = {
            'version': 1,
            'profiles': [{
                'id': 'sample',
                'item_level_min': 200,
                'item_level_max': 240,
                'encounters': [
                    {'id': 'trash', 'kind': 'trash', 'requires': [], 'weight': 1,
                     'targets': [{'type': 'creature', 'entry': 9001}]},
                    {'id': 'final', 'kind': 'boss', 'requires': [], 'weight': 3,
                     'targets': [{'type': 'creature', 'entry': 9002}]},
                ],
            }],
            'recipes': [{'id': 'items', 'count': 4, 'profile': 'sample', 'target_kind': 'dungeon'}],
            'quest_targets': [],
        }

        plan = g.build_generation_plan(manifest, g.CLASSES)

        self.assertEqual(sum(row['content_target'] == 'trash' for row in plan), 1)
        self.assertEqual(sum(row['content_target'] == 'final' for row in plan), 3)
        final_rows = [row for row in plan if row['content_target'] == 'final']
        self.assertTrue(all(row['item_level_max'] == 240 for row in final_rows))

    def test_encounter_loot_validates_targets_and_defaults_to_one_drop(self):
        profile = {
            'id': 'sample',
            'item_level_min': 200,
            'item_level_max': 240,
            'additional_drop_chance': 12.5,
            'encounters': [{
                'id': 'boss', 'kind': 'boss', 'requires': [], 'weight': 3,
                'targets': [{'type': 'creature', 'entry': 9001}],
            }],
        }
        items = [
            {'entry': 1, 'content_profile': 'sample'},
            {'entry': 2, 'content_profile': 'sample'},
        ]

        records = g.build_encounter_loot_records(items, profile,
                                                  {'creature': {9001}, 'reference': set()})

        self.assertEqual(records['encounters']['boss']['quantity'], 1)
        self.assertEqual(records['encounters']['boss']['chance'], 12.5)
        self.assertEqual(len(records['pool_rows']), 2)

    def test_encounter_loot_sql_is_additive_and_independent(self):
        profile = {
            'id': 'sample', 'item_level_min': 200, 'item_level_max': 240,
            'additional_drop_chance': 12.5,
            'encounters': [{
                'id': 'boss', 'kind': 'boss', 'requires': [], 'weight': 1,
                'targets': [{'type': 'creature', 'entry': 9001}, {'type': 'reference', 'entry': 9002}],
            }],
        }
        records = g.build_encounter_loot_records(
            [{'entry': 7001, 'content_profile': 'sample', 'content_target': 'boss', 'name': 'Generated'}],
            profile, {'creature': {9001}, 'reference': {9002}}, pool_base=3_100_000)

        sql, cleanup = g.render_encounter_loot_sql(records)

        self.assertIn('INSERT INTO `creature_loot_template`', sql)
        self.assertIn('INSERT INTO `reference_loot_template`', sql)
        self.assertIn('12.5', sql)
        self.assertIn('MinCount', sql)
        self.assertIn('DELETE FROM `creature_loot_template`', cleanup)
        self.assertIn('DELETE FROM `reference_loot_template`', cleanup)

    def test_load_loot_entry_ids_reads_sql_entries(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / 'loot.sql'
            path.write_text('(9001,1,0,1,0,1,0,1,1,\'one\'),\n(9002,1,0,1,0,1,0,1,1,\'two\'),\n', encoding='utf-8')

            entries = g.load_loot_entry_ids(path)

        self.assertEqual(entries, {9001, 9002})


class QuestTests(unittest.TestCase):
    def test_quest_rewards_fill_empty_fixed_and_choice_slots_only(self):
        source = {
            100: {
                'fixed': [
                    {'item_column': 'RewardItem1', 'quantity_column': 'RewardAmount1', 'item': 0, 'quantity': 0},
                    {'item_column': 'RewardItem2', 'quantity_column': 'RewardAmount2', 'item': 900, 'quantity': 1},
                ],
                'choice': [
                    {'item_column': 'RewardChoiceItemID1', 'quantity_column': 'RewardChoiceItemQuantity1', 'item': 0, 'quantity': 0},
                    {'item_column': 'RewardChoiceItemID2', 'quantity_column': 'RewardChoiceItemQuantity2', 'item': 0, 'quantity': 0},
                ],
            },
        }
        targets = [{'quest_id': 100, 'mode': 'fixed'}, {'quest_id': 100, 'mode': 'choice'}]
        items = [
            {'entry': 7001, 'quest_id': 100, 'quest_mode': 'fixed'},
            {'entry': 7002, 'quest_id': 100, 'quest_mode': 'choice'},
        ]

        records = g.build_quest_reward_records(items, targets, source)

        self.assertEqual(records[0]['column'], 'RewardItem1')
        self.assertEqual(records[1]['column'], 'RewardChoiceItemID1')
        self.assertEqual(records[0]['old_item'], 0)
        self.assertEqual(records[1]['old_item'], 0)

    def test_quest_rewards_reject_occupied_slots_by_default(self):
        source = {100: {'fixed': [
            {'item_column': 'RewardItem1', 'quantity_column': 'RewardAmount1', 'item': 900, 'quantity': 1},
        ], 'choice': []}}
        items = [{'entry': 7001, 'quest_id': 100, 'quest_mode': 'fixed'}]

        with self.assertRaises(ValueError):
            g.build_quest_reward_records(items, [{'quest_id': 100, 'mode': 'fixed'}], source)

    def test_quest_reward_sql_updates_only_mapped_fields(self):
        records = [{'quest_id': 100, 'column': 'RewardItem1', 'quantity_column': 'RewardAmount1',
                    'old_item': 0, 'old_quantity': 0, 'new_item': 7001, 'new_quantity': 1}]

        sql, cleanup = g.render_quest_reward_sql(records)

        self.assertIn('UPDATE `quest_template`', sql)
        self.assertIn('`RewardItem1` = 7001', sql)
        self.assertIn('`RewardAmount1` = 1', sql)
        self.assertIn('`RewardItem1` = 0', cleanup)

    def test_load_quest_reward_slots_parses_requested_quests(self):
        sql = """CREATE TABLE `quest_template` (
  `ID` int unsigned NOT NULL,
  `RewardItem1` int unsigned NOT NULL,
  `RewardAmount1` smallint unsigned NOT NULL,
  `RewardChoiceItemID1` int unsigned NOT NULL,
  `RewardChoiceItemQuantity1` smallint unsigned NOT NULL
) ENGINE=InnoDB;
INSERT INTO `quest_template` VALUES
(100,0,0,0,0),
(101,900,1,901,1);
"""
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / 'quest_template.sql'
            path.write_text(sql, encoding='utf-8')
            slots = g.load_quest_reward_slots(path, {100})

        self.assertEqual(slots[100]['fixed'][0]['item'], 0)
        self.assertEqual(slots[100]['choice'][0]['item'], 0)


if __name__ == '__main__':
    unittest.main()
