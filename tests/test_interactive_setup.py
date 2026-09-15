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
                prompt.ask.return_value = 'All of the Above'
                int_prompt.ask.return_value = 10
                confirm.ask.side_effect = [True, True]

                args = g.interactive_setup(storage_path=storage, console=console)

            self.assertEqual(args.azerothcore_source_root, source_root)
            self.assertEqual(args.number, 10)
            self.assertEqual(args.loot_destinations, frozenset({'world', 'dungeon', 'raid'}))
            prompt.ask.assert_called_once()

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
