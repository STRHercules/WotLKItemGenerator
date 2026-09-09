import importlib.util
import pathlib
import unittest


ROOT = pathlib.Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('generator', ROOT / 'generate_pack.py')
g = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(g)


class DataSourceTests(unittest.TestCase):
    def test_default_sql_and_dbc_sources_are_in_data_directory(self):
        sources = (
            g.DEFAULT_WORLD_LOOT_SOURCE,
            g.DEFAULT_REFERENCE_LOOT_SOURCE,
            g.DEFAULT_ITEM_TEMPLATE_SOURCE,
            g.DEFAULT_ITEM_DBC_SOURCE,
            g.DEFAULT_ITEM_DBC_CUSTOM_SOURCE,
            g.DEFAULT_ITEM_SET_DBC_SOURCE,
            g.DEFAULT_SPELL_DBC_SOURCE,
            g.DEFAULT_SPELL_ENCHANTMENT_DBC_SOURCE,
            g.DEFAULT_DISENCHANT_SOURCE,
            g.DEFAULT_SPELL_PROC_SOURCE,
            g.DEFAULT_SPELL_SCRIPT_NAMES_SOURCE,
            g.DEFAULT_MAP_DBC_SOURCE,
            g.DEFAULT_MAP_DIFFICULTY_DBC_SOURCE,
            g.DEFAULT_DUNGEON_MAP_DBC_SOURCE,
            g.DEFAULT_CREATURE_SOURCE,
            g.DEFAULT_CREATURE_TEMPLATE_SOURCE,
            g.DEFAULT_INSTANCE_ENCOUNTERS_SOURCE,
        )

        data_dir = (g.ROOT / 'Data').resolve()
        for source in sources:
            self.assertEqual(pathlib.Path(source).resolve().parent, data_dir, source)
