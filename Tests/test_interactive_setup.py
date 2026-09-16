import importlib.util
import pathlib
import tempfile
import unittest
from unittest.mock import patch


ROOT = pathlib.Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('generator', ROOT / 'generate_pack.py')
g = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(g)


class InteractiveSetupTests(unittest.TestCase):
    def test_bare_invocation_enters_interactive_setup(self):
        with patch.object(g.sys, 'argv', ['generate_pack.py']), \
                patch.object(g, 'interactive_setup', return_value=None) as setup:
            self.assertIsNone(g.main())

        setup.assert_called_once_with()

    def test_interactive_setup_reuses_saved_source_root(self):
        class FakeConsole:
            def print(self, *args, **kwargs):
                pass

        with tempfile.TemporaryDirectory() as temp_dir:
            storage = pathlib.Path(temp_dir) / 'source-root.txt'
            source_root = pathlib.Path(temp_dir).resolve()
            g._save_azerothcore_source(source_root, storage)
            console = FakeConsole()

            with patch.object(g, 'RICH_AVAILABLE', True), \
                    patch.object(g, 'Prompt') as prompt, \
                    patch.object(g, 'IntPrompt') as int_prompt, \
                    patch.object(g, 'Confirm') as confirm:
                prompt.ask.side_effect = ['All', 'All', 'ALL', 'All of the Above']
                int_prompt.ask.return_value = 10
                confirm.ask.side_effect = [True, True, True, True, True, True, True]

                args = g.interactive_setup(storage_path=storage, console=console)

            self.assertEqual(args.azerothcore_source_root, source_root)
            self.assertEqual(args.number, 10)
            self.assertEqual(args.expansion, 'All')
            self.assertEqual(args.class_names, tuple(row[0] for row in g.CLASSES))
            self.assertTrue(args.generate_sockets)
            self.assertTrue(args.generate_legendaries)
            self.assertEqual(args.disabled_features, [])
            self.assertEqual(args.loot_destinations, frozenset({'world', 'dungeon', 'raid'}))

    def test_class_selection_accepts_comma_separated_names_and_all(self):
        self.assertEqual(g._interactive_class_names('warrior,paladin,death knight'),
                         ('Warrior', 'Paladin', 'Death Knight'))
        self.assertEqual(g._interactive_class_names('ALL'),
                         tuple(row[0] for row in g.CLASSES))
        with self.assertRaises(ValueError):
            g._interactive_class_names('warrior,unknown')

    def test_magic_effect_selection_disables_only_unselected_effects(self):
        self.assertEqual(g._interactive_disabled_features('On Hit', True, True, True),
                         ['on-use', 'spell-effects'])
        self.assertEqual(g._interactive_disabled_features('None', False, False, False),
                         ['chance-on-hit', 'disenchant', 'on-use', 'sets', 'socket-bonuses', 'spell-effects'])

    def test_expansion_filter_keeps_only_matching_profile_and_coverage(self):
        manifest = {
            'profiles': [
                {'id': 'classic-a', 'map_type': 1, 'expansion': 0},
                {'id': 'tbc-a', 'map_type': 1, 'expansion': 1},
                {'id': 'wrath-a', 'map_type': 2, 'expansion': 2},
            ],
            'coverage': [
                {'map_id': 1, 'map_type': 1, 'expansion': 0},
                {'map_id': 2, 'map_type': 1, 'expansion': 1},
                {'map_id': 3, 'map_type': 2, 'expansion': 2},
            ],
        }

        filtered = g.filter_encounter_manifest(manifest, frozenset({'dungeon', 'raid'}), 'Wrath')

        self.assertEqual([row['id'] for row in filtered['profiles']], ['wrath-a'])
        self.assertEqual([row['map_id'] for row in filtered['coverage']], [3])

    def test_encounter_scope_ignores_non_instance_map_types(self):
        catalog = {
            'maps': {
                0: {'map_type': 0, 'expansion': 0},
                100: {'map_type': 1, 'expansion': 0},
                200: {'map_type': 2, 'expansion': 2},
            },
        }

        self.assertEqual(g._encounter_scope_map_ids(catalog, 'Classic', {'dungeon'}), {100})

    def test_expansion_level_ranges_match_selected_content_scope(self):
        self.assertEqual(g.expansion_level_range('Classic'), (1, 60))
        self.assertEqual(g.expansion_level_range('TBC'), (58, 70))
        self.assertEqual(g.expansion_level_range('Wrath'), (68, 80))
        self.assertEqual(g.expansion_level_range('All'), (1, 80))

    def test_legendary_count_respects_expansion_and_toggle(self):
        old_range = g.ACTIVE_LEVEL_RANGE
        old_enabled = getattr(g, 'GENERATE_LEGENDARIES', True)
        try:
            g.ACTIVE_LEVEL_RANGE = (1, 60)
            g.GENERATE_LEGENDARIES = True
            self.assertEqual(g.expected_legendary_count(100000), 0)

            g.ACTIVE_LEVEL_RANGE = (68, 80)
            self.assertEqual(g.expected_legendary_count(100000), 3)

            g.GENERATE_LEGENDARIES = False
            self.assertEqual(g.expected_legendary_count(100000), 0)
        finally:
            g.ACTIVE_LEVEL_RANGE = old_range
            g.GENERATE_LEGENDARIES = old_enabled

    def test_no_sockets_overrides_legendary_guaranteed_sockets(self):
        old_seed = g.SEED
        old_enabled = getattr(g, 'GENERATE_SOCKETS', True)
        try:
            args = g.parse_args(['--no-sockets'])
            self.assertFalse(args.generate_sockets)
            g.SEED = '424242'
            g.GENERATE_SOCKETS = args.generate_sockets
            self.assertEqual(g.socket_colors(80, 264, 5, 1, 'head', 4), [])
        finally:
            g.SEED = old_seed
            g.GENERATE_SOCKETS = old_enabled

    def test_classic_name_pools_exclude_later_expansion_terms(self):
        old_expansion = g.EXPANSION
        try:
            g.EXPANSION = 'Classic'
            later_terms = (
                'burningcrusade', 'outland', 'draenei', 'bloodelf', 'sindorei',
                'silvermoon', 'exodar', 'hellfire', 'shadowmoon', 'netherstorm',
                'nagrand', 'terokkar', 'zangarmarsh', 'sunwell', 'tempestkeep',
                'blacktemple', 'karazhan', 'mounthyjal', 'nether', 'fel',
                'northrend', 'icecrown', 'scourge', 'saronite', 'vrykul',
                'nerubian', 'borean', 'dragonblight', 'howlingfjord', 'sholazar',
                'zuldrak', 'wintergrasp', 'dalaran', 'nexus', 'utgarde',
                'gundrak', 'draktharon', 'azjolnerub', 'naxxramas', 'ulduar',
                'wyrmrest', 'ebon', 'deathknight', 'runeblade', 'frostborn',
                'valkyr', 'sunreaver', 'argentvanguard', 'wrathgate', 'lichking',
                'wotlk', 'wrath', 'mantid', 'mechagnome', 'gilnean', 'arathian',
                'pandaren', 'draenor', 'warlords', 'legion', 'kultiras',
                'zandalari', 'shadowlands', 'dragonflight', 'dracthyr',
                'warwithin', 'titanforged',
            )
            pools = (
                g.THEMES, g.ADJ, g.SUFFIX, g.OWNER, g.PROPER_A, g.PROPER_B,
                g.LEGENDARY_ROOTS, g.LEGENDARY_EPITHETS, g.SET_THEME_TITLES,
                *g.BASE_BY_SLOT.values(), *g.BASE_BY_WEAPON.values(),
            )
            compact = lambda value: ''.join(ch for ch in str(value).casefold() if ch.isalnum())
            values = [value for pool in pools for value in g._expansion_pool(pool)]
            self.assertFalse(any(term in compact(value) for value in values for term in later_terms))
        finally:
            g.EXPANSION = old_expansion

    def test_classic_name_pools_exclude_remaining_wrath_location_labels(self):
        old_expansion = g.EXPANSION
        try:
            g.EXPANSION = 'Classic'
            remaining = ('frenzyheart', 'argentcrusader', 'constructwing', 'plaguewing',
                         'militarywing', 'spiderwing', 'frozenhalls', 'pitofsaron',
                         'forgeofsouls', 'hallsofreflection', 'argenttournament',
                         'crusaderscoliseum')
            pools = (g.SUFFIX, g.OWNER, g.SET_THEME_TITLES, g.LEGENDARY_EPITHETS)
            compact = lambda value: ''.join(ch for ch in str(value).casefold() if ch.isalnum())
            values = [value for pool in pools for value in g._expansion_pool(pool)]
            self.assertFalse(any(term in compact(value) for value in values for term in remaining))
        finally:
            g.EXPANSION = old_expansion

    def test_classic_filters_auxiliary_name_and_flavor_vocabularies(self):
        old_expansion = g.EXPANSION
        try:
            g.EXPANSION = 'Classic'
            forbidden = ('silvercovenant', 'warsonghold', 'titanwatch', 'taunkavillage',
                         'stormpeaks', 'drakkari', 'oracle', 'yak', 'grizzly', 'stormpeak')
            pools = [g.SUFFIX, g.OWNER, g.SET_THEME_TITLES, g.FLAVOR]
            pools.extend(g.LEGENDARY_FLAVOR.values())
            compact = lambda value: ''.join(ch for ch in str(value).casefold() if ch.isalnum())
            values = [value for pool in pools for value in g._expansion_pool(pool)]
            self.assertFalse(any(term in compact(value) for value in values for term in forbidden))
        finally:
            g.EXPANSION = old_expansion

    def test_classic_appearance_harvest_excludes_later_required_levels(self):
        old_expansion = g.EXPANSION
        old_range = g.ACTIVE_LEVEL_RANGE

        def item_row(entry, item_level, required_level):
            fields = ['0'] * 133
            fields[0] = str(entry)
            fields[1] = '4'
            fields[2] = '1'
            fields[5] = str(1000 + entry)
            fields[6] = '3'
            fields[12] = '1'
            fields[15] = str(item_level)
            fields[16] = str(required_level)
            return '(' + ','.join(fields) + ')'

        try:
            g.EXPANSION = 'Classic'
            g.ACTIVE_LEVEL_RANGE = (1, 60)
            with tempfile.TemporaryDirectory() as directory:
                path = pathlib.Path(directory) / 'item_template.sql'
                path.write_text('\n'.join((item_row(1, 60, 60), item_row(2, 150, 80))), encoding='utf-8')
                armor, _weapons, report = g.harvest_reference_catalog(path)

            self.assertEqual(armor[('armor', 1, 1)], [(1, 1001, 60, 3)])
            self.assertIn({
                'reference_entry': 1, 'displayid': 1001, 'item_level': 60,
                'quality': 3, 'source': 'item_template.sql',
                'earliest_expansion': 'Classic',
            }, report['appearance_provenance'])
        finally:
            g.EXPANSION = old_expansion
            g.ACTIVE_LEVEL_RANGE = old_range

    def test_interactive_number_is_limited_to_one_hundred_thousand(self):
        self.assertEqual(g._interactive_number_arg('1'), 1)
        self.assertEqual(g._interactive_number_arg('100000'), 100000)
        for value in ('0', '100001', 'items'):
            with self.assertRaises(ValueError):
                g._interactive_number_arg(value)

    def test_destination_choices_select_world_dungeon_and_raid(self):
        self.assertEqual(g.loot_destinations_for_choice('World'), frozenset({'world'}))
        self.assertEqual(g.loot_destinations_for_choice('Dungeon'), frozenset({'dungeon'}))
        self.assertEqual(g.loot_destinations_for_choice('Raid'), frozenset({'raid'}))
        self.assertEqual(g.loot_destinations_for_choice('World+Dungeon'), frozenset({'world', 'dungeon'}))
        self.assertEqual(g.loot_destinations_for_choice('World+Raid'), frozenset({'world', 'raid'}))
        self.assertEqual(g.loot_destinations_for_choice('All of the Above'),
                         frozenset({'world', 'dungeon', 'raid'}))

    def test_source_root_persistence_round_trips(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            storage = pathlib.Path(temp_dir) / 'source-root.txt'
            source_root = pathlib.Path(temp_dir).resolve()

            self.assertIsNone(g._load_saved_azerothcore_source(storage))
            g._save_azerothcore_source(source_root, storage)

            self.assertEqual(g._load_saved_azerothcore_source(storage), source_root)

    def test_encounter_manifest_filters_only_selected_destinations(self):
        manifest = {
            'profiles': [
                {'id': 'dungeon-a', 'map_type': 1},
                {'id': 'raid-a', 'map_type': 2},
            ],
            'coverage': [
                {'map_id': 1, 'map_type': 1},
                {'map_id': 2, 'map_type': 2},
            ],
        }

        filtered = g.filter_encounter_manifest(manifest, frozenset({'raid'}))

        self.assertEqual([row['id'] for row in filtered['profiles']], ['raid-a'])
        self.assertEqual([row['map_id'] for row in filtered['coverage']], [2])
        self.assertEqual(len(manifest['profiles']), 2)


if __name__ == '__main__':
    unittest.main()
