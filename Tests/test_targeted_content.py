import importlib.util
import csv
import json
import pathlib
import tempfile
import unittest


HERE = pathlib.Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location('generator', HERE.parent / 'generate_pack.py')
g = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(g)


def _minimal_encounter_catalog(*, map_id=631, map_type=2, instance_type=13,
                               difficulty_ids=(0,), boss_spawn=True,
                               dungeon_map_rows=None):
    return {
        'maps': {map_id: {
            'id': map_id, 'directory': 'TestRaid', 'map_type': map_type,
            'instance_type': instance_type,
        }},
        'map_difficulties': {
            (map_id, difficulty_id): {
                'id': difficulty_id + 1, 'map_id': map_id,
                'difficulty_id': difficulty_id, 'max_players': 10,
                'item_level': 264,
            }
            for difficulty_id in difficulty_ids
        },
        'dungeon_maps': dungeon_map_rows or {},
        'creature_templates': {
            9001: {'entry': 9001, 'name': 'Scripted Boss', 'lootid': 9100,
                   'minlevel': 60, 'maxlevel': 80},
        },
        'creature_maps': {9001: {map_id}} if boss_spawn else {},
        'instance_encounters': {
            1: {'credit_type': 0, 'credit_entry': 9001,
                'last_encounter_dungeon': 500, 'comment': 'Scripted Boss'},
        },
        'creature_loot_columns': (
            'Entry', 'Item', 'Reference', 'Chance', 'QuestRequired',
            'LootMode', 'GroupId', 'MinCount', 'MaxCount', 'Comment',
        ),
        'creature_loot_rows': [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'boss'),
            (9100, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'boss'),
            (9100, 5003, 0, 100.0, 0, 4, 0, 1, 1, 'boss'),
            (9100, 5004, 0, 100.0, 0, 8, 0, 1, 1, 'boss'),
        ],
        'creature_loot_entries': {9100},
        'reference_loot_entries': set(),
        'stock_items': {
            5001: _stock_item(5001, 150, 60),
            5002: _stock_item(5002, 165, 65),
            5003: _stock_item(5003, 180, 70),
            5004: _stock_item(5004, 200, 75),
        },
        'reference_loot_columns': (
            'Entry', 'Item', 'Reference', 'Chance', 'QuestRequired',
            'LootMode', 'GroupId', 'MinCount', 'MaxCount', 'Comment',
        ),
        'reference_loot_rows': [],
        'gameobject_templates': {}, 'gameobject_maps': {},
        'gameobject_loot_columns': [], 'gameobject_loot_rows': [],
        'gameobject_loot_entries': set(),
    }


def _catalog_with_gameobject_sources():
    catalog = _minimal_encounter_catalog(map_id=631, map_type=2,
                                         instance_type=13)
    catalog['gameobject_templates'] = {
        7001: {'entry': 7001, 'type': 3, 'name': 'Reward Chest',
               'lootid': 97001},
    }
    catalog['gameobject_spawns'] = [
        {'guid': 44, 'id': 7001, 'map': 631, 'spawn_mask': 3},
    ]
    catalog['gameobject_maps'] = {7001: {631}}
    catalog['gameobject_loot_entries'] = {97001}
    return catalog


def _stock_item(entry, item_level, required_level, quality=4):
    return {
        'entry': entry, 'class': 4, 'subclass': 2, 'name': f'Stock {entry}',
        'quality': quality, 'item_level': item_level,
        'required_level': required_level, 'inventory_type': 5,
        'class_mask': -1, 'role': 'strength_dps',
    }


def _loot_catalog(rows, reference_rows=(), stock_items=None, maps=None,
                  creatures=None, creature_maps=None):
    loot_columns = ('Entry', 'Item', 'Reference', 'Chance', 'QuestRequired',
                    'LootMode', 'GroupId', 'MinCount', 'MaxCount', 'Comment')
    maps = maps or {100: {'id': 100, 'directory': 'BandDungeon',
                          'map_type': 1, 'instance_type': 1}}
    creatures = creatures or {10: {'entry': 10, 'name': 'Boss', 'lootid': 9100,
                                   'minlevel': 70, 'maxlevel': 70}}
    return {
        'maps': maps,
        'map_difficulties': {(map_id, difficulty_id): {
            'id': map_id + difficulty_id, 'map_id': map_id,
            'difficulty_id': difficulty_id, 'max_players': 5,
            'item_level': 127,
        } for map_id in maps for difficulty_id in (0, 1)},
        'dungeon_maps': {}, 'creature_templates': creatures,
        'creature_maps': creature_maps or {10: {100}},
        'instance_encounters': {1: {'credit_type': 0, 'credit_entry': 10,
                                    'last_encounter_dungeon': 0,
                                    'comment': 'Boss'}},
        'creature_loot_columns': loot_columns,
        'creature_loot_rows': list(rows),
        'reference_loot_columns': loot_columns,
        'reference_loot_rows': list(reference_rows),
        'creature_loot_entries': {int(row[0]) for row in rows},
        'reference_loot_entries': {int(row[0]) for row in reference_rows},
        'stock_items': stock_items or {},
        'gameobject_templates': {}, 'gameobject_maps': {},
        'gameobject_loot_columns': [], 'gameobject_loot_rows': [],
        'gameobject_loot_entries': set(),
    }


class BandTests(unittest.TestCase):
    def test_outlier_rejection_keeps_dominant_equipment_cluster(self):
        evidence = g.infer_safe_band(
            (150, 152, 155, 158, 160, 284), 'profile_aggregate', 'boss')

        self.assertLessEqual(evidence['item_level_max'], 160)
        self.assertIn(284, evidence['rejected_item_levels'])

    def test_shared_reference_is_rejected_from_progression_evidence(self):
        rows = [
            (9100, 0, 9200, 100.0, 0, 1, 0, 1, 1, 'shared'),
            (9101, 0, 9200, 100.0, 0, 1, 0, 1, 1, 'shared'),
        ]
        reference_rows = [(9200, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'gear')]
        catalog = _loot_catalog(
            rows, reference_rows=reference_rows,
            stock_items={5001: _stock_item(5001, 180, 70)},
            maps={
                100: {'id': 100, 'directory': 'One', 'map_type': 1,
                      'instance_type': 1},
                200: {'id': 200, 'directory': 'Two', 'map_type': 1,
                      'instance_type': 1},
            },
            creatures={
                10: {'entry': 10, 'name': 'One Boss', 'lootid': 9100,
                     'minlevel': 70, 'maxlevel': 70},
                20: {'entry': 20, 'name': 'Two Boss', 'lootid': 9101,
                     'minlevel': 70, 'maxlevel': 70},
            },
            creature_maps={10: {100}, 20: {200}},
        )

        evidence = g.collect_target_stock_evidence(
            catalog, {'map_id': 100, 'difficulty_id': 0, 'loot_mode': 1},
            {'type': 'creature', 'entry': 9100, 'creature_entry': 10},
        )

        self.assertEqual(evidence['reference_item_count'], 0)
        self.assertEqual(evidence['rejected_reference_count'], 1)

    def test_loot_mode_keeps_normal_and_heroic_bands_independent(self):
        rows = [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'normal'),
            (9100, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'heroic'),
        ]
        catalog = _loot_catalog(rows, stock_items={
            5001: _stock_item(5001, 150, 60),
            5002: _stock_item(5002, 200, 70),
        })
        target = {'type': 'creature', 'entry': 9100, 'creature_entry': 10}

        normal = g.collect_target_stock_evidence(
            catalog, {'map_id': 100, 'difficulty_id': 0, 'loot_mode': 1}, target)
        heroic = g.collect_target_stock_evidence(
            catalog, {'map_id': 100, 'difficulty_id': 1, 'loot_mode': 2}, target)

        self.assertNotEqual(
            (normal['item_level_min'], normal['item_level_max']),
            (heroic['item_level_min'], heroic['item_level_max']),
        )

    def test_required_level_is_part_of_band_eligibility(self):
        profile = {
            'required_level_min': 70, 'required_level_max': 80,
            'item_level_min': 170, 'item_level_max': 190,
            'qualities': (4,),
        }

        self.assertFalse(g.item_fits_encounter_profile(
            {'ItemLevel': 180, 'RequiredLevel': 4, 'Quality': 4}, profile))

    def test_stock_item_level_below_required_level_is_not_progression_evidence(self):
        catalog = _loot_catalog(
            [(9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'invalid')],
            stock_items={5001: _stock_item(5001, 1, 70)},
        )

        evidence = g.collect_target_stock_evidence(
            catalog, {'map_id': 100, 'difficulty_id': 0, 'loot_mode': 1},
            {'type': 'creature', 'entry': 9100, 'creature_entry': 10},
        )

        self.assertFalse(evidence['valid'])


class ProfileTests(unittest.TestCase):
    def test_map_only_gameobject_audit_never_becomes_encounter_target(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {}
        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        self.assertTrue(any(not row['valid'] for row in manifest['gameobject_reward_targets']))
        self.assertFalse(any(target.get('type') == 'gameobject'
                             for profile in manifest['profiles']
                             for encounter in profile['encounters']
                             for target in encounter['targets']))

    def test_script_reward_mapping_propagates_to_audited_target(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['source_audit'] = {'gameobject_source_paths': ['gameobject.sql',
                                                               'gameobject_template.sql',
                                                               'gameobject_loot_template.sql']}
        catalog['instance_encounters'] = {
            44: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        catalog['gameobject_loot_columns'] = catalog['creature_loot_columns']
        catalog['gameobject_loot_rows'] = [
            (97001, 6001, 0, 100.0, 0, 1, 0, 1, 1, 'cache gear'),
        ]
        catalog['stock_items'][6001] = _stock_item(6001, 220, 80)
        catalog['script_reward_mappings'] = [{
            'gameobject_entry': 7001, 'encounter_identifier': 'DATA_BOSS',
            'source_path': 'instance_test.cpp',
            'difficulty_condition': 'difficulty == RAID_DIFFICULTY_10_N',
            'evidence_type': 'SummonGameObject completion path',
        }]
        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        rows = manifest['gameobject_reward_targets']
        self.assertTrue(any(row['association_method'] == 'script_summon'
                            for row in rows))
        self.assertTrue(any(target.get('type') == 'gameobject'
                            for profile in manifest['profiles']
                            for encounter in profile['encounters']
                            for target in encounter['targets']))

    def test_multiple_instance_mappings_remain_distinct_in_profile(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {
            44: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache A'},
            45: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache B'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        catalog['gameobject_loot_columns'] = catalog['creature_loot_columns']
        catalog['gameobject_loot_rows'] = [
            (97001, 6001, 0, 100.0, 0, 1, 0, 1, 1, 'cache gear'),
        ]
        catalog['stock_items'][6001] = _stock_item(6001, 220, 80)

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        profile = next(profile for profile in manifest['profiles']
                       if profile['map_id'] == 631 and profile['difficulty_id'] == 0)
        self.assertEqual(
            [encounter['id'] for encounter in profile['encounters']
             if encounter['kind'] == 'boss'],
            ['boss_000044', 'boss_000045'])

    def test_script_only_reward_mapping_creates_profile_target(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {}
        catalog['gameobject_loot_columns'] = catalog['creature_loot_columns']
        catalog['gameobject_loot_rows'] = [
            (97001, 6001, 0, 100.0, 0, 1, 0, 1, 1, 'cache gear'),
        ]
        catalog['stock_items'][6001] = _stock_item(6001, 220, 80)
        catalog['script_reward_mappings'] = [{
            'gameobject_entry': 7001, 'encounter_identifier': 'DATA_BOSS',
            'source_path': 'instance_test.cpp',
            'difficulty_condition': '',
            'evidence_type': 'SummonGameObject completion path',
        }]
        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        self.assertTrue(any(row['association_method'] == 'script_summon'
                            and row['encounter_id'].startswith('script_')
                            for row in manifest['gameobject_reward_targets']))
        self.assertTrue(any(target.get('type') == 'gameobject'
                            for profile in manifest['profiles']
                            for encounter in profile['encounters']
                            for target in encounter['targets']))

    def test_explicit_and_script_associations_remain_separate(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['source_audit'] = {'gameobject_source_paths': ['gameobject.sql',
                                                               'gameobject_template.sql',
                                                               'gameobject_loot_template.sql']}
        catalog['instance_encounters'] = {
            1: {'credit_type': 1, 'credit_entry': 7001,
                'last_encounter_dungeon': 500, 'comment': 'Reward Cache'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        catalog['script_reward_mappings'] = [{
            'gameobject_entry': 7001, 'encounter_identifier': 'OTHER_BOSS',
            'source_path': 'other.cpp', 'difficulty_condition': '',
            'evidence_type': 'SummonGameObject completion path',
        }]
        rows = g.discover_gameobject_reward_targets(catalog, 631, 0)
        self.assertEqual(rows[0]['association_method'], 'explicit_instance_mapping')
        self.assertEqual(rows[0]['encounter_id'], 'boss_000001')
        self.assertIn('gameobject.sql', rows[0]['association_source'])
        self.assertTrue(any(row['association_method'] == 'script_summon'
                            and row['encounter_id'].startswith('script_')
                            for row in rows))
    def test_default_profiles_use_stock_bands_per_difficulty(self):
        catalog = _minimal_encounter_catalog(
            difficulty_ids=(0, 1), map_id=631, map_type=2,
            instance_type=13,
        )
        catalog['creature_templates'][9001]['minlevel'] = 60
        catalog['creature_templates'][9001]['maxlevel'] = 80
        catalog['creature_loot_columns'] = (
            'Entry', 'Item', 'Reference', 'Chance', 'QuestRequired',
            'LootMode', 'GroupId', 'MinCount', 'MaxCount', 'Comment',
        )
        catalog['creature_loot_rows'] = [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'normal'),
            (9100, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'heroic'),
        ]
        catalog['stock_items'] = {
            5001: _stock_item(5001, 150, 60),
            5002: _stock_item(5002, 200, 70),
        }

        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        profiles = {profile['difficulty_id']: profile for profile in manifest['profiles']}

        self.assertNotEqual(
            (profiles[0]['item_level_min'], profiles[0]['item_level_max']),
            (profiles[1]['item_level_min'], profiles[1]['item_level_max']),
        )
        self.assertEqual(profiles[0]['loot_mode'], 1)
        self.assertEqual(profiles[1]['loot_mode'], 2)

    def test_coverage_keeps_excluded_candidate_visible(self):
        catalog = _minimal_encounter_catalog(map_id=631, map_type=2,
                                             instance_type=13)
        catalog['stock_items'] = {}
        catalog['creature_loot_rows'] = []

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        row = next(row for row in manifest['coverage'] if row['map_id'] == 631)
        self.assertFalse(row['profile_created'])
        self.assertIn(row['excluded_reason'], {
            'no usable stock equipment loot',
            'raid has no usable boss or reward evidence',
        })

    def test_gameobject_reward_becomes_first_class_encounter_target(self):
        catalog = _minimal_encounter_catalog(map_id=631, map_type=2,
                                             instance_type=13)
        catalog['instance_encounters'] = {
            1: {'credit_type': 1, 'credit_entry': 7001,
                'last_encounter_dungeon': 500, 'comment': 'Reward Cache'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        catalog['gameobject_templates'] = {
            7001: {'entry': 7001, 'type': 3, 'lootid': 97001},
        }
        catalog['gameobject_maps'] = {7001: {631}}
        catalog['gameobject_spawns'] = [{'guid': 44, 'id': 7001, 'map': 631,
                                         'spawn_mask': 3}]
        catalog['gameobject_loot_columns'] = catalog['creature_loot_columns']
        catalog['gameobject_loot_rows'] = [
            (97001, 6001, 0, 100.0, 0, 1, 0, 1, 1, 'cache gear'),
        ]
        catalog['gameobject_loot_entries'] = {97001}
        catalog['stock_items'][6001] = _stock_item(6001, 220, 80)

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        self.assertTrue(any(
            target.get('type') == 'gameobject'
            for profile in manifest['profiles']
            for encounter in profile['encounters']
            for target in encounter['targets']
        ))


def _phase2_difficulty_catalog(*, map_id=100, map_type=1, instance_type=1,
                               difficulty_ids=(0, 1)):
    catalog = _minimal_encounter_catalog(
        map_id=map_id, map_type=map_type, instance_type=instance_type,
        difficulty_ids=difficulty_ids,
    )
    base = catalog['creature_templates'][9001]
    base['difficulty_entries'] = [9002, 9003, 9004]
    catalog['creature_templates'].update({
        9002: {'entry': 9002, 'name': 'Difficulty Boss 1', 'lootid': 9102,
               'minlevel': 80, 'maxlevel': 80, 'difficulty_entries': [0, 0, 0]},
        9003: {'entry': 9003, 'name': 'Difficulty Boss 2', 'lootid': 9103,
               'minlevel': 80, 'maxlevel': 80, 'difficulty_entries': [0, 0, 0]},
        9004: {'entry': 9004, 'name': 'Difficulty Boss 3', 'lootid': 9104,
               'minlevel': 80, 'maxlevel': 80, 'difficulty_entries': [0, 0, 0]},
    })
    catalog['creature_loot_entries'].update({9102, 9103, 9104})
    catalog['creature_loot_rows'] = [
        (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'normal'),
        (9102, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'heroic'),
        (9103, 5003, 0, 100.0, 0, 4, 0, 1, 1, 'raid heroic 10'),
        (9104, 5004, 0, 100.0, 0, 8, 0, 1, 1, 'raid heroic 25'),
    ]
    catalog['stock_items'].update({
        5001: _stock_item(5001, 150, 60),
        5002: _stock_item(5002, 200, 80),
        5003: _stock_item(5003, 232, 80),
        5004: _stock_item(5004, 264, 80),
    })
    return catalog


class Phase2Tests(unittest.TestCase):
    def test_difficulty_profile_uses_effective_creature_template_and_loot(self):
        catalog = _phase2_difficulty_catalog(difficulty_ids=(0, 1))

        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        profiles = {profile['difficulty_id']: profile for profile in manifest['profiles']}

        heroic_target = profiles[1]['encounters'][-1]['targets'][0]
        self.assertEqual(heroic_target['entry'], 9102)
        self.assertEqual((profiles[1]['item_level_min'], profiles[1]['item_level_max']), (200, 200))
        self.assertEqual(heroic_target['effective_creature_entry'], 9002)

    def test_difficulty_variant_reference_consumer_maps_to_base_spawn(self):
        catalog = _phase2_difficulty_catalog(difficulty_ids=(0, 1))
        catalog['creature_loot_rows'] = [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'normal'),
            (9102, 0, 9200, 100.0, 0, 2, 0, 1, 1, 'heroic reference'),
        ]
        catalog['reference_loot_rows'] = [
            (9200, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'heroic gear'),
        ]
        catalog['reference_loot_entries'] = {9200}
        catalog['stock_items'][5002] = _stock_item(5002, 200, 80)

        evidence = g.collect_target_stock_evidence(
            catalog, {'map_id': 100, 'difficulty_id': 1, 'loot_mode': 2},
            {'type': 'creature', 'entry': 9102, 'creature_entry': 9002},
        )

        self.assertEqual(evidence['reference_item_count'], 1)
        self.assertEqual(evidence['item_level_min'], 200)

    def test_raid_difficulty_profiles_resolve_all_four_template_variants(self):
        catalog = _phase2_difficulty_catalog(
            map_id=649, map_type=2, instance_type=29,
            difficulty_ids=(0, 1, 2, 3),
        )

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        profiles = {profile['difficulty_id']: profile for profile in manifest['profiles']}
        self.assertEqual(set(profiles), {0, 1, 2, 3})
        self.assertEqual(
            {profiles[index]['encounters'][-1]['targets'][0]['entry'] for index in profiles},
            {9100, 9102, 9103, 9104},
        )

    def test_raid_trash_only_candidate_is_excluded(self):
        catalog = _minimal_encounter_catalog(map_id=631, map_type=2,
                                             instance_type=13)
        catalog['instance_encounters'] = {}

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        self.assertFalse(manifest['profiles'])
        row = next(row for row in manifest['coverage'] if row['map_id'] == 631)
        self.assertIn('boss or reward', row['excluded_reason'])

    def test_filtered_encounters_rebuild_prerequisites(self):
        catalog = _phase2_difficulty_catalog(
            map_id=649, map_type=2, instance_type=29, difficulty_ids=(0,))
        catalog['creature_loot_rows'] = [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'modern 1'),
            (9100, 5007, 0, 100.0, 0, 1, 0, 1, 1, 'modern 2'),
            (9100, 5008, 0, 100.0, 0, 1, 0, 1, 1, 'modern 3'),
            (9110, 5005, 0, 100.0, 0, 1, 0, 1, 1, 'legacy 1'),
            (9110, 5006, 0, 100.0, 0, 1, 0, 1, 1, 'legacy 2'),
        ]
        catalog['stock_items'].update({
            5001: _stock_item(5001, 213, 80),
            5007: _stock_item(5007, 214, 80),
            5008: _stock_item(5008, 215, 80),
            5005: _stock_item(5005, 60, 60),
            5006: _stock_item(5006, 61, 60),
        })
        catalog['creature_templates'][9005] = {
            'entry': 9005, 'name': 'Filtered Boss', 'lootid': 9110,
            'minlevel': 80, 'maxlevel': 80, 'difficulty_entries': [0, 0, 0],
        }
        catalog['creature_maps'][9005] = {649}
        catalog['creature_loot_entries'].add(9110)
        catalog['instance_encounters'] = {
            1: {'credit_type': 0, 'credit_entry': 9005,
                'last_encounter_dungeon': 0, 'comment': 'Filtered Boss'},
            2: {'credit_type': 0, 'credit_entry': 9001,
                'last_encounter_dungeon': 0, 'comment': 'Retained Boss'},
        }

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        resolved = g.resolve_encounter_order(manifest['profiles'][0])
        self.assertEqual([row['id'] for row in resolved], ['boss_000002'])

    def test_prerequisite_rebuild_clears_removed_parents(self):
        encounters = [{'id': 'boss_2', 'kind': 'boss', 'requires': ['boss_1']}]

        g.rebuild_encounter_prerequisites(encounters)

        self.assertNotIn('requires', encounters[0])

    def test_mixed_era_raid_keeps_active_boss_cluster(self):
        catalog = _minimal_encounter_catalog(map_id=249, map_type=2,
                                             instance_type=29)
        catalog['instance_encounters'] = {
            1: {'credit_type': 0, 'credit_entry': 9001,
                'last_encounter_dungeon': 0, 'comment': 'Modern Boss'},
        }
        catalog['creature_templates'][9001]['minlevel'] = 83
        catalog['creature_templates'][9001]['maxlevel'] = 83
        catalog['creature_maps'][9010] = {249}
        catalog['creature_templates'][9010] = {
            'entry': 9010, 'name': 'Legacy Trash', 'lootid': 9110,
            'minlevel': 60, 'maxlevel': 60, 'difficulty_entries': [0, 0, 0],
        }
        catalog['creature_loot_entries'].add(9110)
        catalog['creature_loot_rows'] = [
            (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'modern boss'),
            (9110, 5002, 0, 100.0, 0, 1, 0, 1, 1, 'legacy trash'),
        ]
        catalog['stock_items'] = {
            5001: _stock_item(5001, 213, 80),
            5002: _stock_item(5002, 60, 60),
        }

        manifest = g.build_default_encounter_manifest(catalog, 2.0)
        profile = manifest['profiles'][0]

        self.assertGreaterEqual(profile['item_level_min'], 200)
        self.assertLessEqual(profile['item_level_max'] - profile['item_level_min'], 20)
        self.assertNotIn('trash', {encounter['id'] for encounter in profile['encounters']})
        self.assertTrue(profile['evidence'].get('progression_cluster'))
        self.assertIn(60, profile['evidence']['progression_cluster']['rejected'])
        self.assertTrue(any(
            row.get('reason') == 'mixed progression cluster excluded'
            for row in profile['evidence'].get('rejections', ())
        ))

    def test_profile_range_contradiction_invalidates_encounter_integration(self):
        profile = _placement_profile('sample', 'raid', (200, 220), (80, 80))
        profile['encounters'][0]['evidence'] = {
            'band_source': 'direct', 'item_level_min': 180,
            'item_level_max': 240, 'required_level_min': 70,
            'required_level_max': 80, 'band_center': 210,
            'qualities': (4,), 'item_count': 2,
        }

        report = g.validate_encounter_integration(
            [], {'profiles': [profile]}, [], {})

        self.assertFalse(report['valid'])
        self.assertTrue(any('range' in error.lower() for error in report['errors']))

    def test_encounter_sql_rejects_required_level_outside_retained_band(self):
        profile = _placement_profile('sample', 'dungeon', (100, 140), (70, 80))
        item = {'entry': 7001, 'name': 'Generated', 'ItemLevel': 120,
                'RequiredLevel': 4, 'Quality': 4,
                'content_profile': 'sample', 'content_target': 'boss'}

        with self.assertRaises(ValueError):
            g.build_encounter_loot_records(
                [item], profile, {'creature': {9001}, 'reference': set()},
                pool_base=3100000,
            )

    def test_heroic_coverage_failure_invalidates_encounter_integration(self):
        coverage = [
            {'map_id': map_id, 'map_name': f'Heroic {map_id}',
             'map_type': 1, 'expansion': 2, 'difficulty_id': 1,
             'profile_created': False, 'excluded_reason': 'no usable stock equipment loot'}
            for map_id in range(16)
        ]

        report = g.validate_encounter_integration(
            [], {'profiles': [], 'coverage': coverage}, [], {})

        self.assertFalse(report['valid'])
        self.assertTrue(any('heroic' in error.lower() for error in report['errors']))

    def test_gameobject_support_is_not_exercised_without_sources(self):
        catalog = _minimal_encounter_catalog()
        catalog['source_audit'] = {'gameobject_source_paths': []}

        self.assertEqual(g.gameobject_support_state(catalog), 'not_exercised')


def _placement_profile(profile_id, kind, item_level, required_level,
                       target_kind='boss', qualities=(2, 3, 4, 5)):
    return {
        'id': profile_id, 'map_id': 100 if kind == 'dungeon' else 631,
        'instance': profile_id, 'map_type': 1 if kind == 'dungeon' else 2,
        'difficulty_id': 0, 'loot_mode': 1,
        'item_level_min': item_level[0], 'item_level_max': item_level[1],
        'required_level_min': required_level[0],
        'required_level_max': required_level[1], 'qualities': qualities,
        'evidence': {'band_source': 'direct', 'band_center': sum(item_level) / 2},
        'encounters': [{
            'id': target_kind, 'kind': target_kind, 'weight': 1,
            'item_level': list(item_level), 'targets': [
                {'type': 'creature', 'entry': 9001},
            ],
        }],
    }


def _placement_manifest(profiles):
    return {'version': 1, 'profiles': profiles, 'recipes': [],
            'quest_targets': []}


def _set_items(count, item_level=220, required_level=80, item_levels=None):
    levels=item_levels or [item_level] * count
    return [{
        'entry': 200000 + index, 'ItemLevel': level,
        'RequiredLevel': required_level, 'Quality': 4,
        'itemset': 9000, 'set_id': 9000,
        'slot': ('hands', 'shoulder', 'chest', 'head', 'legs')[index],
    } for index,level in enumerate(levels)]


class PlacementTests(unittest.TestCase):
    def setUp(self):
        g.SEED = 424242

    def test_required_level_mismatch_remains_world_only(self):
        item = {'entry': 1, 'ItemLevel': 120, 'RequiredLevel': 4, 'Quality': 4}
        manifest = _placement_manifest([_placement_profile(
            'high_dungeon', 'dungeon', (100, 140), (70, 80))])

        g.assign_default_encounter_items([item], manifest)

        self.assertNotIn('content_profile', item)

    def test_set_members_share_one_profile(self):
        items = _set_items(5)
        manifest = _placement_manifest([
            _placement_profile('wide_dungeon', 'dungeon', (200, 240), (70, 80)),
            _placement_profile('raid_10', 'raid', (220, 220), (80, 80)),
        ])

        g.assign_default_encounter_items(items, manifest)

        self.assertEqual({item['content_profile'] for item in items}, {'raid_10'})

    def test_set_members_stay_world_only_without_common_profile(self):
        items = _set_items(5, item_levels=[210, 220, 230, 240, 250])
        manifest = _placement_manifest([
            _placement_profile('early', 'dungeon', (210, 230), (70, 80)),
            _placement_profile('late', 'raid', (240, 250), (80, 80)),
        ])

        g.assign_default_encounter_items(items, manifest)

        self.assertTrue(all('content_profile' not in item for item in items))

    def test_legendary_never_uses_trash(self):
        item = {'entry': 1, 'ItemLevel': 284, 'RequiredLevel': 80, 'Quality': 5}
        manifest = _placement_manifest([_placement_profile(
            'trash_only', 'raid', (250, 284), (80, 80),
            target_kind='trash', qualities=(5,))])

        g.assign_default_encounter_items([item], manifest)

        self.assertNotIn('content_target', item)

    def test_explicit_manifest_cannot_split_a_set(self):
        profile = {
            'id': 'sample', 'item_level_min': 200, 'item_level_max': 240,
            'encounters': [
                {'id': 'boss_a', 'kind': 'boss', 'targets': [{'type': 'creature', 'entry': 1}]},
                {'id': 'boss_b', 'kind': 'boss', 'targets': [{'type': 'creature', 'entry': 2}]},
            ],
        }
        plan = [
            {'recipe_id': 'set', 'set_request_index': 0, 'index': 0,
             'content_profile': 'sample', 'content_target': 'boss_a',
             'target_kind': 'dungeon', 'item_level_min': 200, 'item_level_max': 220},
            {'recipe_id': 'set', 'set_request_index': 0, 'index': 1,
             'content_profile': 'sample', 'content_target': 'boss_b',
             'target_kind': 'dungeon', 'item_level_min': 200, 'item_level_max': 220},
        ]

        with self.assertRaises(ValueError):
            g.assign_plan_encounters(plan, {'sample': profile})


class SafetyTests(unittest.TestCase):
    def test_encounter_validation_rejects_out_of_band_required_level(self):
        profile = _placement_profile('high_dungeon', 'dungeon', (100, 140), (70, 80))
        item = {
            'entry': 1, 'ItemLevel': 120, 'RequiredLevel': 4, 'Quality': 4,
            'content_profile': 'high_dungeon', 'content_target': 'boss',
        }

        report = g.validate_encounter_integration(
            [item], {'profiles': [profile]}, [], {})

        self.assertFalse(report['valid'])
        self.assertTrue(any('RequiredLevel' in error
                            for error in report['errors']))

    def test_encounter_validation_rejects_split_set(self):
        profile = _placement_profile('sample', 'dungeon', (200, 240), (70, 80))
        other_profile = _placement_profile('other', 'dungeon', (200, 240), (70, 80))
        items = _set_items(2)
        items[0]['content_profile'] = 'sample'
        items[0]['content_target'] = 'boss'
        items[1]['content_profile'] = 'other'
        items[1]['content_target'] = 'boss'

        report = g.validate_encounter_integration(
            items, {'profiles': [profile, other_profile]}, [], {})

        self.assertFalse(report['valid'])
        self.assertTrue(any('set' in error.lower() for error in report['errors']))


class ReportTests(unittest.TestCase):
    def test_reward_target_report_has_fixed_header(self):
        with tempfile.TemporaryDirectory() as directory:
            paths = g.write_placement_reports(
                [], {'pools': [], 'attachments': []}, [], pathlib.Path(directory),
                {'profiles': [], 'gameobject_reward_targets': [{
                    'profile_id': 'map_631_difficulty_0', 'map_id': 631,
                    'difficulty_id': 0, 'encounter_id': '',
                    'encounter_name': '', 'gameobject_entry': 7001,
                    'gameobject_name': 'Reward Chest', 'loot_entry': 97001,
                    'spawn_guid': 44, 'spawn_mask': 3,
                    'association_method': 'static_spawn',
                    'association_source': 'gameobject.sql',
                    'direct_item_count': 0, 'reference_item_count': 0,
                    'valid': False, 'invalid_reason': 'no boss association',
                }]})
            header = paths['gameobject_rewards'].read_text(
                encoding='utf-8').splitlines()[0]
        self.assertEqual(header, 'profile_id,map_id,difficulty_id,encounter_id,encounter_name,gameobject_entry,gameobject_name,loot_entry,spawn_guid,spawn_mask,association_method,association_source,direct_item_count,reference_item_count,valid,invalid_reason')
    def test_gameobject_encounter_sql_uses_gameobject_table(self):
        records = {
            'profile_id': 'sample',
            'encounters': {
                'cache': {
                    'pool_id': 3100000, 'item_count': 1, 'rank': 0,
                    'band': (200, 200), 'chance': 2.0, 'quantity': 1,
                    'loot_mode': 1,
                    'targets': [{'type': 'gameobject', 'entry': 7001}],
                },
            },
            'pool_rows': [{'pool_id': 3100000, 'item': 7002,
                           'comment': 'Generated cache item'}],
            'attachments': [{'parent_type': 'gameobject', 'parent_entry': 7001,
                             'pool_id': 3100000, 'encounter': 'cache',
                             'chance': 2.0, 'quantity': 1, 'loot_mode': 1}],
        }

        sql, cleanup = g.render_encounter_loot_sql(records)

        self.assertIn('INSERT INTO `gameobject_loot_template`', sql)
        self.assertIn('DELETE FROM `gameobject_loot_template`', cleanup)

    def test_encounter_reports_include_evidence_columns(self):
        items = [{
            'entry': 7001, 'name': 'Generated', 'RequiredLevel': 80,
            'ItemLevel': 220, 'Quality': 4, 'set_id': 9000,
            'content_profile': 'sample', 'content_target': 'boss',
            'placement_score': (0, 0), 'placement_reason': 'direct evidence',
            'placement_band_source': 'direct',
        }]
        loot = {
            'pools': [{'pool_id': 3000004, 'bracket': '70-79',
                       'level_min': 70, 'level_max': 79, 'item_count': 1}],
            'pool_rows': [{'pool_id': 3000004, 'item': 7001,
                           'comment': 'Generated'}],
            'attachments': [{'parent_reference': 9000, 'pool_id': 3000004,
                             'world_level': 70, 'bracket': '70-79'}],
        }
        profile = {
            'id': 'sample', 'map_id': 631, 'map_type': 2,
            'difficulty_id': 0, 'required_level_min': 80,
            'required_level_max': 80,
            'encounters': [{
                'id': 'boss', 'kind': 'boss', 'loot_mode': 1,
                'item_level': [220, 220],
                'targets': [{'type': 'creature', 'entry': 8001}],
            }],
        }
        records = [g.build_encounter_loot_records(
            items, profile, {'creature': {8001}, 'reference': set()},
            pool_base=3100000)]
        with tempfile.TemporaryDirectory() as directory:
            paths = g.write_placement_reports(
                items, loot, records, pathlib.Path(directory),
                {'profiles': [profile]},
                {'creature_templates': {8001: {'name': 'Test Boss'}},
                 'instance_encounters': {}},
            )
            header = paths['encounter'].read_text(encoding='utf-8').splitlines()[0]

        self.assertIn('profile_required_level_min', header)
        self.assertIn('band_source', header)
        self.assertIn('placement_score', header)
        self.assertIn('set_atomic_profile', header)

    def test_encounter_rejection_report_preserves_filtered_encounter_id(self):
        profile = {
            'id': 'sample', 'map_id': 631, 'map_type': 2,
            'encounters': [],
            'evidence': {
                'band_source': 'direct',
                'rejections': [{
                    'encounter': 'legacy_boss',
                    'reason': 'mixed progression cluster excluded',
                }],
            },
        }

        with tempfile.TemporaryDirectory() as directory:
            paths = g.write_placement_reports(
                [], {'pools': [], 'attachments': []}, [],
                pathlib.Path(directory), {'profiles': [profile]},
            )
            with paths['rejections'].open(newline='', encoding='utf-8') as report:
                rows = list(csv.DictReader(report))

        self.assertEqual(rows[0]['encounter_id'], 'legacy_boss')


class ManifestTests(unittest.TestCase):
    def test_cli_accepts_content_manifest(self):
        args = g.parse_args(['--content-manifest', 'content_manifest.json'])

        self.assertEqual(args.content_manifest, pathlib.Path('content_manifest.json'))

    def test_load_content_manifest_accepts_json_comments(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / 'manifest.json'
            path.write_text("""// Copy this file and edit the recipes.
{
  /* Comments are accepted by the manifest loader. */
  "version": 1,
  "profiles": [],
  "recipes": [],
  "quest_targets": []
}
""", encoding='utf-8')

            manifest = g.load_content_manifest(path)

        self.assertEqual(manifest['version'], 1)

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
            '--seed', '424242', '--content-manifest', str(g.ROOT / 'Docs' / 'content_manifest.example.json'),
            '--quest-template-source', str(path), '--disable', 'all-new', '--ui', 'plain',
        ])

    def test_manifest_runtime_uses_manifest_count(self):
        runtime = self._configure_example()

        self.assertEqual(runtime['number'], 10)
        self.assertEqual(runtime['content_manifest']['profiles'][0]['id'], 'example_normal')
        self.assertEqual(len(g.build_runtime_skeletons()), 10)

    def test_targeted_validation_accepts_interleaved_class_entries(self):
        self._configure_example()
        items = g.finish_items(g.build_runtime_skeletons())

        self.assertEqual(g.validate(items), [])


class LootTests(unittest.TestCase):
    def setUp(self):
        g.SEED = 424242

    def test_placement_reports_list_world_and_encounter_destinations_per_item(self):
        items = [{'entry': 7001, 'name': 'Generated', 'RequiredLevel': 70, 'ItemLevel': 120, 'Quality': 4,
                  'content_profile': 'sample', 'content_target': 'boss'}]
        loot = {
            'pools': [{'pool_id': 3000004, 'bracket': '70-79', 'level_min': 70, 'level_max': 79, 'item_count': 1}],
            'pool_rows': [{'pool_id': 3000004, 'item': 7001, 'bracket': '70-79', 'comment': 'Generated'}],
            'attachments': [{'parent_reference': 9000, 'pool_id': 3000004, 'world_level': 70, 'bracket': '70-79'}],
        }
        profile = {'id': 'sample', 'map_id': 100, 'map_type': 2, 'difficulty_id': 1,
                   'encounters': [{'id': 'boss', 'kind': 'boss', 'loot_mode': 2,
                                   'item_level': [100, 140], 'targets': [{'type': 'creature', 'entry': 8001}]}]}
        encounter_records = [g.build_encounter_loot_records(items, profile,
                                                              {'creature': {8001}, 'reference': set()},
                                                              pool_base=3_100_000)]
        with tempfile.TemporaryDirectory() as directory:
            paths = g.write_placement_reports(items, loot, encounter_records, pathlib.Path(directory),
                                              {'profiles': [profile]},
                                              {'creature_templates': {8001: {'name': 'Test Boss'}},
                                               'instance_encounters': {}})
            with paths['world'].open(encoding='utf-8', newline='') as world_file:
                world_rows = list(__import__('csv').DictReader(world_file))
            with paths['encounter'].open(encoding='utf-8', newline='') as encounter_file:
                encounter_rows = list(__import__('csv').DictReader(encounter_file))

        self.assertEqual(world_rows[0]['entry'], '7001')
        self.assertEqual(world_rows[0]['world_reference_entries'], '9000')
        self.assertEqual(encounter_rows[0]['entry'], '7001')
        self.assertEqual(encounter_rows[0]['destination'], 'raid')
        self.assertEqual(encounter_rows[0]['encounter_name'], 'boss')
        self.assertEqual(encounter_rows[0]['targets'], 'creature:8001=Test Boss')

    def test_placement_reports_always_emit_both_csv_headers(self):
        items = [{'entry': 7001, 'name': 'Generated', 'RequiredLevel': 10, 'ItemLevel': 12, 'Quality': 2}]
        loot = {'pools': [{'pool_id': 3000000, 'bracket': '1-19', 'level_min': 1, 'level_max': 19, 'item_count': 1}],
                'pool_rows': [{'pool_id': 3000000, 'item': 7001}], 'attachments': []}

        with tempfile.TemporaryDirectory() as directory:
            paths = g.write_placement_reports(items, loot, [], pathlib.Path(directory))
            world_header = paths['world'].read_text(encoding='utf-8').splitlines()[0]
            encounter_header = paths['encounter'].read_text(encoding='utf-8').splitlines()[0]

        self.assertIn('world_reference_entries', world_header)
        self.assertIn('encounter_name', encounter_header)

    def test_difficulty_loot_modes_use_distinct_bits(self):
        self.assertEqual(g.loot_mode_for_difficulty(1, 0), 1)
        self.assertEqual(g.loot_mode_for_difficulty(1, 1), 2)
        self.assertEqual(g.loot_mode_for_difficulty(2, 2), 4)
        self.assertEqual(g.loot_mode_for_difficulty(2, 3), 8)

    def test_default_manifest_derives_item_level_band_from_creature_levels(self):
        catalog = {
            'maps': {100: {'id': 100, 'directory': 'TestDungeon', 'map_type': 1, 'instance_type': 1}},
            'map_difficulties': {(100, 0): {'id': 1, 'map_id': 100, 'difficulty_id': 0, 'max_players': 5, 'item_level': 0}},
            'dungeon_maps': {},
            'creature_templates': {
                10: {'entry': 10, 'name': 'Trash', 'lootid': 110, 'minlevel': 66, 'maxlevel': 68},
                20: {'entry': 20, 'name': 'Boss', 'lootid': 120, 'minlevel': 66, 'maxlevel': 68},
            },
            'creature_maps': {10: {100}, 20: {100}},
            'instance_encounters': {1: {'credit_entry': 20, 'comment': 'Boss'}},
            'creature_loot_entries': {110, 120},
            'reference_loot_entries': set(),
        }

        profile = g.build_default_encounter_manifest(catalog, 2.0)['profiles'][0]

        self.assertEqual((profile['item_level_min'], profile['item_level_max']), (110, 120))
        self.assertEqual(profile['loot_mode'], 1)
        self.assertEqual(profile['encounters'][0]['item_level'], [110, 120])

    def test_default_assignment_filters_items_by_profile_item_level(self):
        manifest = {
            'version': 1,
            'profiles': [
                {'id': 'low', 'map_type': 1, 'item_level_min': 1, 'item_level_max': 10,
                 'loot_mode': 1, 'encounters': [{'id': 'trash', 'kind': 'trash', 'weight': 1,
                                                'item_level': [1, 10], 'targets': [{'type': 'creature', 'entry': 110}]}]},
                {'id': 'high', 'map_type': 2, 'item_level_min': 100, 'item_level_max': 120,
                 'loot_mode': 2, 'encounters': [{'id': 'boss', 'kind': 'boss', 'weight': 1,
                                                'item_level': [100, 120], 'targets': [{'type': 'creature', 'entry': 120}]}]},
            ],
        }
        items = [{'entry': 1, 'ItemLevel': 5}, {'entry': 2, 'ItemLevel': 110}, {'entry': 3, 'ItemLevel': 250}]

        g.assign_default_encounter_items(items, manifest)

        self.assertEqual(items[0]['content_profile'], 'low')
        self.assertEqual(items[1]['content_profile'], 'high')
        self.assertNotIn('content_profile', items[2])

    def test_encounter_pool_and_attachment_share_difficulty_loot_mode(self):
        profile = {
            'id': 'sample', 'item_level_min': 100, 'item_level_max': 120, 'loot_mode': 2,
            'encounters': [{'id': 'boss', 'kind': 'boss', 'weight': 1, 'item_level': [100, 120],
                           'targets': [{'type': 'creature', 'entry': 9001}]}],
        }
        records = g.build_encounter_loot_records(
            [{'entry': 7001, 'content_profile': 'sample', 'content_target': 'boss', 'ItemLevel': 110, 'name': 'Generated'}],
            profile, {'creature': {9001}, 'reference': set()}, pool_base=3_100_000)

        sql, _ = g.render_encounter_loot_sql(records)

        self.assertIn('(3100000,7001,0,0,0,2,1,1,1', sql)
        self.assertIn('(9001,1,3100000,0,0,2,0,1,1', sql)

    def test_world_loot_source_parses_multi_tuple_insert_statements(self):
        with tempfile.TemporaryDirectory() as directory:
            world = pathlib.Path(directory) / 'creature_loot_template.sql'
            reference = pathlib.Path(directory) / 'reference_loot_template.sql'
            world.write_text(
                "INSERT INTO `creature_loot_template` VALUES "
                "(10,1,9001,0,0,1,5,1,1,'World Loot Level 24'),"
                "(10,2,9002,0,0,1,5,1,1,'World Loot Level 25');\n",
                encoding='utf-8')
            reference.write_text(
                "INSERT INTO `reference_loot_template` VALUES "
                "(9001,1,0,0,0,1,1,1,1,'one'),"
                "(9002,1,0,0,0,1,1,1,1,'two');\n",
                encoding='utf-8')

            levels = g.load_world_loot_references(world, reference)

        self.assertEqual(levels, {9001: 24, 9002: 25})

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


class SourceTests(unittest.TestCase):
    def test_all_missing_explicit_gameobject_sources_leave_core_sources_available(self):
        with tempfile.TemporaryDirectory() as directory:
            paths = tuple(pathlib.Path(directory) / name for name in (
                'gameobject.sql', 'gameobject_template.sql',
                'gameobject_loot_template.sql'))
            self.assertIsNone(g.resolve_optional_gameobject_sources(paths))

    def test_partially_missing_explicit_gameobject_sources_leave_core_sources_available(self):
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            paths = tuple(root / name for name in (
                'gameobject.sql', 'gameobject_template.sql',
                'gameobject_loot_template.sql'))
            paths[0].write_text('available', encoding='utf-8')
            self.assertIsNone(g.resolve_optional_gameobject_sources(paths))

    def test_script_mapping_retains_visible_difficulty_condition(self):
        source = """
const uint32 GO_REWARD_CHEST = 7001;
void InstanceTest::SetBossState(uint32 id, EncounterState state) {
    if (state == DONE && difficulty == RAID_DIFFICULTY_10_N)
        instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
}
"""
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
            mappings, _ = g.discover_script_reward_mappings(root, {
                'gameobject_templates': {7001: {'type': 3, 'lootid': 97001}},
                'gameobject_loot_entries': {97001},
            })
        self.assertIn('RAID_DIFFICULTY_10_N', mappings[0]['difficulty_condition'])

    def test_nested_control_block_does_not_inherit_outer_done_condition(self):
        source = """
const uint32 GO_REWARD_CHEST = 7001;
void InstanceTest::Complete(uint32 id, EncounterState state) {
    if (state == DONE) {
        if (id == DATA_BOSS)
            instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
    }
}
"""
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
            mappings, _ = g.discover_script_reward_mappings(root, {
                'gameobject_templates': {7001: {'type': 3, 'lootid': 97001}},
                'gameobject_loot_entries': {97001},
            })
        self.assertEqual(mappings, [])

    def test_done_path_survives_unrelated_later_difficulty_if(self):
        source = """
const uint32 GO_REWARD_CHEST = 7001;
void InstanceTest::Complete(uint32 id, EncounterState state) {
    if (state == DONE) {
        instance->SetBossState(DATA_BOSS, DONE);
        if (difficulty == RAID_DIFFICULTY_10_N) {
            instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
        }
    }
}
"""
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
            mappings, _ = g.discover_script_reward_mappings(root, {
                'gameobject_templates': {7001: {'type': 3, 'lootid': 97001}},
                'gameobject_loot_entries': {97001},
            })
        self.assertEqual(len(mappings), 1)
        self.assertEqual(mappings[0]['encounter_identifier'],
                         'InstanceTest::Complete')

    def test_braced_done_control_block_reports_real_function(self):
        source = """
const uint32 GO_REWARD_CHEST = 7001;
void InstanceTest::SetBossState(uint32 id, EncounterState state) {
    if (id == DATA_BOSS && state == DONE) {
        instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
    }
}
"""
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
            mappings, _ = g.discover_script_reward_mappings(root, {
                'gameobject_templates': {7001: {'type': 3, 'lootid': 97001}},
                'gameobject_loot_entries': {97001},
            })
        self.assertEqual(len(mappings), 1)
        self.assertEqual(mappings[0]['encounter_identifier'],
                         'InstanceTest::SetBossState')

    def test_multiple_instance_mappings_are_preserved_in_audit(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {
            44: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache A'},
            45: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache B'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        rows = g.discover_gameobject_reward_targets(catalog, 631, 0)
        self.assertEqual({row['encounter_id'] for row in rows},
                         {'boss_000044', 'boss_000045'})

    def test_static_chest_uses_map_and_data1_without_fuzzy_boss_association(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {}
        rows = g.discover_gameobject_reward_targets(catalog, 631, 0)
        self.assertEqual(rows[0]['gameobject_entry'], 7001)
        self.assertEqual(rows[0]['loot_entry'], 97001)
        self.assertEqual(rows[0]['spawn_mask'], 3)
        self.assertFalse(rows[0]['valid'])
        self.assertIn('boss', rows[0]['invalid_reason'].lower())

    def test_gameobject_instance_mapping_is_valid_only_for_the_matching_map(self):
        catalog = _catalog_with_gameobject_sources()
        catalog['instance_encounters'] = {
            44: {'credit_type': 1, 'credit_entry': 7001,
                 'last_encounter_dungeon': 500, 'comment': 'Reward Cache'},
        }
        catalog['dungeon_maps'] = {500: (500, 631)}
        rows = g.discover_gameobject_reward_targets(catalog, 631, 0)
        self.assertTrue(rows[0]['valid'])
        self.assertEqual(rows[0]['association_method'], 'explicit_instance_mapping')

    def test_explicit_done_path_summon_maps_script_reward(self):
        source = """
enum GameObjects { GO_REWARD_CHEST = 7001 };
void InstanceTest::SetBossState(uint32 id, EncounterState state) {
    if (id == DATA_BOSS && state == DONE)
        instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
}
"""
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
            mappings, status = g.discover_script_reward_mappings(root, {
                'gameobject_templates': {7001: {'entry': 7001, 'type': 3,
                                                'name': 'Reward Chest',
                                                'lootid': 97001}},
                'gameobject_loot_entries': {97001},
            })
        self.assertEqual(status, 'exercised')
        self.assertEqual(mappings[0]['gameobject_entry'], 7001)
        self.assertIn('SummonGameObject', mappings[0]['evidence_type'])

    def test_same_file_symbol_cooccurrence_is_not_script_reward_evidence(self):
        source = "enum GameObjects { GO_REWARD_CHEST = 7001 }; void Other() { }"
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / 'unrelated.cpp'
            path.write_text(source, encoding='utf-8')
            mappings, status = g.discover_script_reward_mappings(
                pathlib.Path(directory), {'gameobject_templates': {7001: {}},
                                           'gameobject_loot_entries': {97001}})
        self.assertEqual(status, 'exercised')
        self.assertEqual(mappings, [])
    def test_complete_default_gameobject_trio_is_discoverable(self):
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            for name in ('gameobject.sql', 'gameobject_template.sql',
                         'gameobject_loot_template.sql'):
                (root / name).write_text('source', encoding='utf-8')

            paths = g.resolve_optional_gameobject_sources(
                data_dir=root, explicit_paths=(None, None, None))

        self.assertEqual(paths, tuple(root / name for name in (
            'gameobject.sql', 'gameobject_template.sql',
            'gameobject_loot_template.sql')))

    def test_incomplete_explicit_gameobject_trio_is_rejected(self):
        with self.assertRaises(ValueError):
            g.resolve_optional_gameobject_sources(
                explicit_paths=(pathlib.Path('gameobject.sql'), None, None))

    def test_malformed_gameobject_source_tuple_is_rejected(self):
        for paths in ((None, None), (None, None, None, None)):
            with self.assertRaises(ValueError):
                g.resolve_optional_gameobject_sources(explicit_paths=paths)

    def test_scripted_boss_uses_instance_encounter_without_static_spawn(self):
        catalog = _minimal_encounter_catalog(
            difficulty_ids=(0, 1, 2, 3), boss_spawn=False,
            dungeon_map_rows={500: (500, 631)},
        )

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        self.assertEqual({p['difficulty_id'] for p in manifest['profiles']}, {0, 1, 2, 3})
        self.assertTrue(any(
            target.get('creature_entry') == 9001
            for profile in manifest['profiles']
            for encounter in profile['encounters']
            for target in encounter['targets']
        ))

    def test_raid_profile_does_not_require_dungeon_map_membership(self):
        catalog = _minimal_encounter_catalog(dungeon_map_rows={})

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        self.assertEqual(len(manifest['profiles']), 1)
        self.assertEqual(manifest['profiles'][0]['map_id'], 631)

    def test_gameobject_target_is_loaded_when_sources_are_supplied(self):
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            gameobject_path = root / 'gameobject.sql'
            gameobject_template_path = root / 'gameobject_template.sql'
            gameobject_loot_path = root / 'gameobject_loot_template.sql'
            gameobject_path.write_text(
                """CREATE TABLE `gameobject` (
  `guid` int,
  `id` int,
  `map` int
) ENGINE=InnoDB;
INSERT INTO `gameobject` VALUES (1,7001,631);
""",
                encoding='utf-8',
            )
            gameobject_template_path.write_text(
                """CREATE TABLE `gameobject_template` (
  `entry` int,
  `name` varchar(100),
  `type` int,
  `data1` int
) ENGINE=InnoDB;
INSERT INTO `gameobject_template` VALUES (7001,'Chest',3,97001),(7002,'Wrong type',2,97002),(7003,'No loot',3,0);
""",
                encoding='utf-8',
            )
            gameobject_loot_path.write_text(
                """CREATE TABLE `gameobject_loot_template` (
  `Entry` int,
  `Item` int,
  `Reference` int,
  `LootMode` int
) ENGINE=InnoDB;
INSERT INTO `gameobject_loot_template` VALUES (97001,19001,0,1);
""",
                encoding='utf-8',
            )

            catalog = g.load_encounter_source_catalog(
                g.DATA_DIR / 'Map.dbc', g.DATA_DIR / 'MapDifficulty.dbc',
                g.DATA_DIR / 'DungeonMap.dbc', g.DATA_DIR / 'creature.sql',
                g.DATA_DIR / 'creature_template.sql',
                g.DATA_DIR / 'instance_encounters.sql',
                g.DATA_DIR / 'creature_loot_template.sql',
                g.DATA_DIR / 'reference_loot_template.sql',
            gameobject_path=gameobject_path,
            gameobject_template_path=gameobject_template_path,
            gameobject_loot_path=gameobject_loot_path,
        )

        self.assertIn(7001, catalog['gameobject_templates'])
        self.assertIn(97001, catalog['gameobject_loot_entries'])
        self.assertEqual(catalog['gameobject_templates'][7001]['lootid'], 97001)
        self.assertEqual(catalog['gameobject_templates'][7001]['type'], 3)
        self.assertEqual(catalog['gameobject_templates'][7002]['type'], 2)
        self.assertEqual(catalog['gameobject_templates'][7002]['lootid'], 97002)
        self.assertEqual(catalog['gameobject_templates'][7003]['type'], 3)
        self.assertEqual(catalog['gameobject_templates'][7003]['lootid'], 0)
        self.assertEqual(catalog['supported_gameobject_entries'], {7001})
        self.assertEqual(catalog['gameobject_spawns'][0]['spawn_mask'], 1)
        self.assertEqual(catalog['gameobject_maps'][7001], {631})

    def test_default_encounter_manifest_maps_source_backed_trash_and_boss_loot(self):
        catalog = {
            'maps': {100: {'id': 100, 'directory': 'TestDungeon', 'map_type': 1, 'instance_type': 1}},
            'map_difficulties': {(100, 0): {'id': 1, 'map_id': 100, 'difficulty_id': 0, 'max_players': 5, 'item_level': 127}},
            'dungeon_maps': {},
            'creature_templates': {
                10: {'entry': 10, 'name': 'Trash', 'lootid': 110},
                20: {'entry': 20, 'name': 'Boss', 'lootid': 120},
            },
            'creature_maps': {10: {100}, 20: {100}},
            'instance_encounters': {1: {'credit_entry': 20, 'comment': 'Boss'}},
            'creature_loot_entries': {110, 120},
            'reference_loot_entries': set(),
        }

        manifest = g.build_default_encounter_manifest(catalog, 2.0)

        self.assertEqual(len(manifest['profiles']), 1)
        profile = manifest['profiles'][0]
        self.assertEqual(profile['map_id'], 100)
        self.assertEqual([row['kind'] for row in profile['encounters']], ['trash', 'boss'])
        self.assertEqual(profile['encounters'][0]['targets'][0]['entry'], 110)
        self.assertEqual(profile['encounters'][0]['targets'][0]['creature_entry'], 10)
        self.assertEqual(profile['encounters'][1]['targets'][0]['entry'], 120)

    def test_default_encounter_assignment_covers_items_with_valid_bands(self):
        g.SEED = 424242
        manifest = {
            'version': 1,
            'profiles': [{
                'id': 'sample', 'item_level_min': 1, 'item_level_max': 284,
                'encounters': [
                    {'id': 'trash', 'kind': 'trash', 'weight': 1, 'targets': [{'type': 'creature', 'entry': 110}]},
                    {'id': 'boss', 'kind': 'boss', 'requires': ['trash'], 'weight': 3, 'targets': [{'type': 'creature', 'entry': 120}]},
                ],
            }],
        }
        items = [{'entry': 1, 'ItemLevel': 50}, {'entry': 2, 'ItemLevel': 250}]

        g.assign_default_encounter_items(items, manifest)

        self.assertEqual({row['content_profile'] for row in items}, {'sample'})
        self.assertEqual({row['content_target'] for row in items}, {'trash', 'boss'})

    def test_root_sources_build_map_creature_and_encounter_catalogs(self):
        catalog = g.load_encounter_source_catalog(
            g.DATA_DIR / 'Map.dbc', g.DATA_DIR / 'MapDifficulty.dbc', g.DATA_DIR / 'DungeonMap.dbc',
            g.DATA_DIR / 'creature.sql', g.DATA_DIR / 'creature_template.sql', g.DATA_DIR / 'instance_encounters.sql',
            g.DATA_DIR / 'creature_loot_template.sql', g.DATA_DIR / 'reference_loot_template.sql')

        self.assertIn(533, catalog['maps'])
        self.assertIn((533, 0), catalog['map_difficulties'])
        self.assertIn(27483, catalog['creature_templates'])
        self.assertTrue(catalog['creature_maps'][27483])
        self.assertTrue(any(row['credit_entry'] == 27483 for row in catalog['instance_encounters'].values()))

    def test_targeted_profile_requires_real_map_difficulty_spawn_and_boss_data(self):
        catalog = {
            'maps': {533: {'id': 533}},
            'map_difficulties': {(533, 0): {'map_id': 533, 'difficulty_id': 0}},
            'dungeon_maps': {533: (533,)},
            'creature_templates': {15956: {'entry': 15956, 'name': "Anub'Rekhan", 'lootid': 15956}},
            'creature_maps': {15956: {533}},
            'instance_encounters': {673: {'credit_entry': 15956, 'comment': "Anub'Rekhan"}},
            'creature_loot_entries': {15956},
            'reference_loot_entries': set(),
        }
        manifest = {'profiles': [{
            'id': 'naxx_10', 'map_id': 533, 'difficulty_id': 0,
            'encounters': [{
                'id': 'anub_rekhan', 'kind': 'boss', 'requires': [],
                'targets': [{'type': 'creature', 'entry': 15956}],
            }],
        }]}

        g.validate_targeted_source_membership(manifest, catalog)


if __name__ == '__main__':
    unittest.main()
