-- Death Knight | Required Level 80 | 5 finalized items
-- Generator seed: 6003911716
START TRANSACTION;

DELETE FROM `item_template` WHERE `entry` IN (
    309976, 309986, 309987, 309993, 309999
);

INSERT INTO `item_template`
(
    `entry`,
    `class`,
    `subclass`,
    `SoundOverrideSubclass`,
    `name`,
    `displayid`,
    `Quality`,
    `Flags`,
    `FlagsExtra`,
    `BuyCount`,
    `BuyPrice`,
    `SellPrice`,
    `InventoryType`,
    `AllowableClass`,
    `AllowableRace`,
    `ItemLevel`,
    `RequiredLevel`,
    `stat_type1`,
    `stat_value1`,
    `stat_type2`,
    `stat_value2`,
    `stat_type3`,
    `stat_value3`,
    `stat_type4`,
    `stat_value4`,
    `stat_type5`,
    `stat_value5`,
    `stat_type6`,
    `stat_value6`,
    `stat_type7`,
    `stat_value7`,
    `stat_type8`,
    `stat_value8`,
    `stat_type9`,
    `stat_value9`,
    `stat_type10`,
    `stat_value10`,
    `dmg_min1`,
    `dmg_max1`,
    `dmg_type1`,
    `armor`,
    `delay`,
    `ammo_type`,
    `RangedModRange`,
    `bonding`,
    `description`,
    `Material`,
    `sheath`,
    `RandomProperty`,
    `RandomSuffix`,
    `block`,
    `MaxDurability`,
    `socketColor_1`,
    `socketContent_1`,
    `socketColor_2`,
    `socketContent_2`,
    `socketColor_3`,
    `socketContent_3`,
    `socketBonus`,
    `RequiredDisenchantSkill`,
    `DisenchantID`,
    `flagsCustom`,
    `VerifiedBuild`
)
VALUES
(309976,4,4,-1,'Visor of the Iron Council',55485,4,0,0,1,593965,118793,1,35,-1,187,80,4,65,7,68,32,61,44,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1122,0,0,0,2,'',6,0,0,0,0,60,4,0,0,0,0,0,0,-1,0,0,12340),
(309986,4,4,-1,'Soulcaller''s Sorcerous Handguards',54517,3,0,0,1,505120,101024,10,35,-1,200,80,4,51,7,54,37,37,36,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,787,0,0,0,2,'A strip of faded blue cloth is wrapped around the grip.',6,0,0,0,0,50,8,0,2,0,4,0,0,-1,0,0,12340),
(309987,4,4,-1,'Dawnforged Bracers of Drowned Hall',55386,3,0,0,1,433765,86753,9,35,-1,213,80,4,43,7,47,38,66,36,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,516,0,0,0,2,'',6,0,0,0,0,35,2,0,0,0,0,0,0,-1,0,0,12340),
(309993,4,4,-1,'Crimson Gauntlets of the Silvermoon Spires',59306,4,0,0,1,667340,133468,10,35,-1,219,80,4,88,7,86,37,78,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,927,0,0,0,2,'',6,0,0,0,0,50,2,0,4,0,0,0,0,-1,0,0,12340),
(309999,4,4,-1,'Magebound Vambraces of Dawn Oath',55726,2,0,0,1,309296,77324,9,35,-1,213,80,7,40,4,41,13,32,37,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,456,0,0,0,2,'',6,0,0,0,0,35,4,0,4,0,0,0,0,-1,0,0,12340);

COMMIT;
