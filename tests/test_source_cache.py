import importlib.util
import pathlib
import tempfile
import unittest
from collections import defaultdict


ROOT = pathlib.Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('generator', ROOT / 'generate_pack.py')
g = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(g)


class SourceCacheTests(unittest.TestCase):
    def test_cache_round_trip_preserves_derived_source_data(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            cache_path = pathlib.Path(temp_dir) / 'source-cache.json.gz'
            key = {'version': 1, 'sources': ['source-a']}
            payload = {
                'catalog': defaultdict(set, {1: {'dungeon', 'raid'}}),
                'rows': ((1, 2), (3, 4)),
                'raw': b'WDBC',
                'path': pathlib.Path(temp_dir),
            }

            self.assertTrue(g._save_source_cache(cache_path, key, payload))
            self.assertEqual(g._load_source_cache(cache_path, key), payload)

    def test_source_cache_key_changes_when_an_input_changes(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            source = pathlib.Path(temp_dir) / 'Map.dbc'
            source.write_bytes(b'first')
            first = g._source_cache_key([source])
            source.write_bytes(b'second')

            self.assertNotEqual(first, g._source_cache_key([source]))

    def test_source_cache_miss_for_different_key(self):
        with tempfile.TemporaryDirectory() as temp_dir:
            cache_path = pathlib.Path(temp_dir) / 'source-cache.json.gz'
            g._save_source_cache(cache_path, {'version': 1}, {'ready': True})

            self.assertIsNone(g._load_source_cache(cache_path, {'version': 2}))


if __name__ == '__main__':
    unittest.main()
