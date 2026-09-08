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


if __name__ == '__main__':
    unittest.main()
