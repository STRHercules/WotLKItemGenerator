Is this feasible?

-   Any chance you could add scaling functionality to make duplicates of specific items at different levels? Like, if I wants to give ragnaros lv60 some down-leveled lv80 raid gear for example, could I choose "hey, take all of the gear from Lord Marrowgar and scale it to be molten core ilvl?
    - Also, if it CAN do that, can it take items from later expansions to use as the baseline? Like, could it be fed the information for the Cataclysm legendary staff progression items and then recreate them to be a sunwell plateau chain instead?

-------------

Yes, this is feasible, but it should be treated as a **source-item transformation system**, not just another random-generation option.

**Lord Marrowgar gear scaled to Molten Core**

A recipe could:

1. Select an encounter or item group, such as Lord Marrowgar’s loot.
2. Copy each item into new generated entries.
3. Retarget the items to a level/item-level band.
4. Recalculate:
   - Stats
   - Armor
   - Weapon damage and DPS
   - Required level
   - Vendor values
   - Socket count and socket colors
   - Disenchant data
5. Preserve:
   - Equipment slot
   - Armor type
   - Class restrictions
   - Item appearance, where compatible
   - Names with a new target prefix/theme
   - Effects, where a compatible scaled effect exists
6. Insert the duplicates into Molten Core or another selected loot destination.

The difficult part is magic effects. A fixed spell ID may contain values designed for item level 264, and simply attaching it to an item level 60 item could create an overpowered result. The scaler should either select a lower-level stock equivalent or apply explicit effect-scaling rules. Script-backed and quest-dependent spells would need to be rejected or manually mapped.

**Using Cataclysm items as blueprints**

Also feasible, but not by directly importing Cataclysm DBC rows into this WotLK generator. Cataclysm item, spell, appearance, and quest IDs may not exist or be compatible in a WotLK client/server.

A better approach is:

```json
{
  "source": "Cataclysm legendary staff progression",
  "target_content": "Sunwell Plateau",
  "target_item_level": 154,
  "class_restrictions": ["Mage", "Warlock", "Priest"],
  "effect_policy": "replace_with_wotlk_compatible",
  "quest_chain": "sunwell_staff_recreation"
}
```

The external source would provide the **design blueprint**, while the generator maps it to WotLK-compatible:

- Item entries
- Spell IDs
- Models and display IDs
- Quest templates and rewards
- Loot targets
- NPC or encounter references
- Progression requirements

For a legendary quest chain, the generator would need more than item scaling: quest creation or mapping, quest rewards, prerequisite links, spell effects, NPC dialogue/rewards, and possibly custom server scripts.

**Recommended implementation phases**

1. **Scale selected WotLK items** to a target item level.
2. **Scale encounter loot groups** and place them into another encounter.
3. **Add recipe manifests** for custom transformations.
4. **Add cross-expansion blueprint import** with explicit WotLK replacement mappings.
5. **Add quest-chain generation** for legendary progression content.

The first two phases fit the current architecture well. Cross-expansion legendary recreation is feasible, but should require a mapping manifest rather than attempting to consume foreign DBC files directly.