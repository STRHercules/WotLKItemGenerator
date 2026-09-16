-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100000,240574,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000464 | Dusty Bindings of Utgarde Pinnacle'),
(3100000,260244,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000464 | Dwarven Shanker of Undercity Depths');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100001,200110,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Bracers of the Rune Forge'),
(3100001,200154,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Siege Hammer of the Long Road'),
(3100001,200176,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Starbound Backcloth of Pale King'),
(3100001,200195,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Wildcaller''s Chestguard of the Light Watch'),
(3100001,200241,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Hammerlord''s Mail of the Broken Promise'),
(3100001,200283,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Brooch of the Endless Path'),
(3100001,200388,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Furious Necklace'),
(3100001,200469,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Nightforged Footguards of Arathi Highlands'),
(3100001,200502,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Glittering Mail'),
(3100001,200734,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Lost King''s Wrist Chains'),
(3100001,200750,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Argent Champion''s Coif of the Fallen Lord'),
(3100001,200880,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Warbelt of Blackrock Mountain'),
(3100001,220248,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Nightmare Treads'),
(3100001,220282,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Rimekeeper''s Briarwoven Grips'),
(3100001,220362,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Duskcaller''s Scythe of the Scarlet Banner'),
(3100001,220457,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Starkeeper''s Blighted Treads'),
(3100001,220525,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Witchkeeper''s Faceguard of the Final Dawn'),
(3100001,220565,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Drakekeeper''s Waistchain'),
(3100001,220802,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Razor-edged Great Runeblade'),
(3100001,220890,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Spiritcaller''s Clawmarked Warboots'),
(3100001,220896,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Fel Hauberk of the Shadow Moon'),
(3100001,220963,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Last Warden''s Legmail'),
(3100001,240003,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Lightforged Bindings of Arcane Watch'),
(3100001,240268,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Belt, Doom Ray'),
(3100001,240566,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Deathguard''s Claws'),
(3100001,240635,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Darkmoon Seal'),
(3100001,240663,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Shoulderpads of the Moon Watch'),
(3100001,240681,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Boots, Blood Lament'),
(3100001,240876,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Stonebound Striders of Final Promise'),
(3100001,260083,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Gloves of the Cold Moon'),
(3100001,260095,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Northforged Legguards'),
(3100001,260154,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Clouded Ringlet of the Northern Forge'),
(3100001,260157,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Chestpiece of Eye of Eternity'),
(3100001,260159,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Moonbound Girdle of the Bone Throne'),
(3100001,260183,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Colossal Clutches of the Endless Vigil'),
(3100001,260184,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Heavy Talisman of Storm Peaks'),
(3100001,260223,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Steelforged Grips'),
(3100001,260239,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Crusader''s Claws'),
(3100001,260252,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Necklace of the Wild Pact'),
(3100001,260281,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Beastbound Wargrips of Frozen Memory'),
(3100001,260455,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Boots of Hallowed Ground'),
(3100001,260500,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Flameforged Treads of the Silent Crown'),
(3100001,280160,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Dragonsteel Conduit'),
(3100001,280186,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Chestwrap, Violet Knuckle'),
(3100001,280229,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Waistwrap, Silver Hunter'),
(3100001,280278,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Fanged Crook'),
(3100001,280289,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Drakelord''s Greatstaff of the Wyrm Forge'),
(3100001,280379,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Broken Warden''s Dreamwoven Circlet'),
(3100001,280676,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Stormmarked Veil of the Scholomance'),
(3100001,280736,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Nightlord''s Torque'),
(3100001,280880,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Skullcap of Moon Flame'),
(3100001,280887,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Bear Keeper Bracelets'),
(3100001,280947,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Iron Mace of the Demon Watch'),
(3100001,280973,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Windcaller''s Amulet of the Stormwind Guard'),
(3100001,320533,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Dragonforged Longcloak'),
(3100001,320636,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Girdle of the Ebon Watch'),
(3100001,320777,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Royal Cloak, Bear Wound'),
(3100001,320799,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Emberwarden''s Mark of the Titan Vault'),
(3100001,320956,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Clutches of the Frozen Road'),
(3100001,340100,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Wildbound Neckguard of the Winter King'),
(3100001,340142,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Twilightwarden''s Lost Leggings'),
(3100001,340221,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Dragon Queen''s Harsh Skirt'),
(3100001,340389,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Stoneguard''s Drakebound Raiment'),
(3100001,340404,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Flamewarden''s Tiara'),
(3100001,340497,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Thunderlord''s Hood of the Blade Edge'),
(3100001,340508,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Titan Queen''s Mage Staff'),
(3100001,340530,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Watchkeeper''s Pants'),
(3100001,340642,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | First Keeper''s Wrap'),
(3100001,340766,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Age-darkened Walkers'),
(3100001,340781,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Necrotic Spirit Staff'),
(3100001,340811,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Carved Skirt of Violet Eye'),
(3100001,340934,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Nightwoven Breeches'),
(3100001,340990,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Wolfcaller''s Wristwraps'),
(3100001,360083,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Rugged Waistwrap'),
(3100001,360107,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Furious Waistwrap'),
(3100001,360356,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Binding of Light Guard'),
(3100001,360374,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Stonefather''s Neckchain'),
(3100001,360613,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | The Bronzed Leggings'),
(3100001,360654,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Death Storm Binding'),
(3100001,380033,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Leafwoven Harness of the Red Dragonflight'),
(3100001,380240,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Chestpiece of the Red Dawn'),
(3100001,380309,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Frostmarked Branch'),
(3100001,380468,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Torc of Rimefang'),
(3100001,380555,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Stalkers of the Dragon Spirit'),
(3100001,380752,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Brightsteel Strap of the Frost Queen'),
(3100001,380813,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Ferocious Longstaff of the Dead Watch'),
(3100001,380930,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 trash | Wind Thorn Shaman Staff');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100002,200455,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Dreamwoven Boots'),
(3100002,200871,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Manaforged Legmail of Violet Watch'),
(3100002,200993,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Coldfire Great Hauberk'),
(3100002,220514,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Warmaster''s Wrap'),
(3100002,240167,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Drakewarden''s Pendant Chain'),
(3100002,240696,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Bloodfire Wind Treads'),
(3100002,260492,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Silverguard''s Mystwoven Medallion'),
(3100002,260586,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Silver Queen''s Runemarked Strap'),
(3100002,260901,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Jeweled Token of the Eagle Spirit'),
(3100002,280174,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Demon Horn Handwraps'),
(3100002,280194,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Crusader Robe of the Wild Moon'),
(3100002,280690,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Scale-bound Breeches'),
(3100002,280952,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Watchful Robe'),
(3100002,280976,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Talisman, Far Rage'),
(3100002,320077,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Leafwoven Charmstone'),
(3100002,320556,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Mystic Handguards of the Shadow Crown'),
(3100002,320815,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Skullkeeper''s Cinch of the Light Crown'),
(3100002,320881,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Skullbound Vest'),
(3100002,340378,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Sepulchral Fang'),
(3100002,340512,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Wildcaller''s Skirt of the Shattered Crown'),
(3100002,360032,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Whitefrost Wristwraps'),
(3100002,360364,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Watchful Cuffs of the Stone Fathers'),
(3100002,360467,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Battlelord''s Duskbound Shawl'),
(3100002,360611,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Tombkeeper''s Boots of the Titan Watch'),
(3100002,360762,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Winterlord''s Bracelets'),
(3100002,360946,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Veteran Torc'),
(3100002,380068,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | The Darkforged Footguards'),
(3100002,380654,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Shadow Feather Vest'),
(3100002,380825,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Breeches of Ice Queen'),
(3100002,380858,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Stiletto of the Spellweaver'),
(3100002,380893,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000465 | Nightbound Pants');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100003,220108,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Footguards of Ice Moon'),
(3100003,240228,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | First Knight''s Ironforged Stone'),
(3100003,240365,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Argent Champion''s Leggings'),
(3100003,240668,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | The Devout Cinch'),
(3100003,260311,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Pale-blue Bindings of the Silent King'),
(3100003,320087,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | The Goldbound Shoulderwraps'),
(3100003,360598,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Mitts of Titan Watcher'),
(3100003,360627,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Runekeeper''s Siegebound Treads'),
(3100003,380649,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | Deathcaller''s Boots'),
(3100003,380873,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000466 | The Corpsebound Gloves');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100005,200090,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | The Wyrmscale Boots'),
(3100005,200924,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Hauberk, Frost Flare'),
(3100005,240220,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Ashen Hunting Rifle, Wayfarer''s Oath'),
(3100005,240559,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | High Hymn Legwraps'),
(3100005,260050,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Spear Blood Girdle'),
(3100005,260103,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Soulfire Spear Legguards'),
(3100005,340273,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Wristwraps, Red Starfall'),
(3100005,340765,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | The Doomforged Shaman Staff'),
(3100005,360436,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Frozen Warden''s Footwraps'),
(3100005,360462,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Vest of Scale Queen'),
(3100005,360904,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Northguard''s Mitts of the Black Citadel'),
(3100005,380355,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Whitegold Choker of the Scholomance'),
(3100005,380589,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Gemmed Band of Frozen North'),
(3100005,380652,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000468 | Boots of Sacred Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100006,200708,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Mooncaller''s Girdle of the Bone Throne'),
(3100006,260782,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Ravenlord''s Bindings'),
(3100006,260935,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Legwraps of Abyssal Flame'),
(3100006,360741,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Shadowwoven Robe of the Thorim Arena'),
(3100006,380224,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Necklace of Burning Sky'),
(3100006,380243,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000469 | Crusader''s Coin');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3100007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3100007,200544,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Footguards of Pale King'),
(3100007,200550,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | The Soulforged War Axe'),
(3100007,220167,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Warbelt, Moon Brand'),
(3100007,220584,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Spiritforged Rune Band, Bearwarden''s Oath'),
(3100007,220872,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Warhelm of Second Dawn'),
(3100007,240207,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Long Crossbow of Wyrm Queen'),
(3100007,240230,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Ancient King''s Wolfsworn Warband'),
(3100007,240277,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Lion Doom Cape'),
(3100007,240606,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Terrible Strap of the Wind Spirit'),
(3100007,320192,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Twilightkeeper''s Undying Mask'),
(3100007,340475,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Legwraps of Voldrune'),
(3100007,340528,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | The Starsteel Circlet'),
(3100007,380169,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Stonekeeper''s Rune Band'),
(3100007,380305,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Mask of the Bitter Memory'),
(3100007,380933,0,0,0,1,1,1,1,'Generated map_33_difficulty_0 boss_000470 | Royal Stonehammer of Void Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3914 AND `Item` = 1 AND `Reference` = 3100000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3914,1,3100000,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000464');

DELETE FROM `creature_loot_template` WHERE `Entry` = 2529 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(2529,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3849 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3849,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3850 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3850,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3851 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3851,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3853 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3853,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3854 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3854,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3855 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3855,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3857 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3857,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3859 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3859,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3861 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3861,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3862 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3862,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3863 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3863,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3864 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3864,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3866 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3866,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3868 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3868,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3872 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3872,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3873 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3873,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3875 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3875,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3877 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3877,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14682 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14682,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36296 AND `Item` = 1 AND `Reference` = 3100001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36296,1,3100001,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3886 AND `Item` = 1 AND `Reference` = 3100002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3886,1,3100002,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000465');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3887 AND `Item` = 1 AND `Reference` = 3100003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3887,1,3100003,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000466');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4279 AND `Item` = 1 AND `Reference` = 3100005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4279,1,3100005,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000468');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4274 AND `Item` = 1 AND `Reference` = 3100006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4274,1,3100006,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000469');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3927 AND `Item` = 1 AND `Reference` = 3100007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3927,1,3100007,2,0,1,0,1,1,'Generated encounter attachment | map_33_difficulty_0 | boss_000470');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3110000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3110000,240449,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 boss_000537 | Pale Lady''s Unhallowed Belt'),
(3110000,320840,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 boss_000537 | Runeforged Gorget');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3110001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3110001,220238,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Chainmail of the Ancient Thorn'),
(3110001,240132,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Treads of the Blighted Land'),
(3110001,240354,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Dragonsteel Boots'),
(3110001,240627,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | The Wyrmforged Runering'),
(3110001,260499,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Polished Leggings of Nightwatch'),
(3110001,260667,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Night Spear Chestguard'),
(3110001,280235,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Witchkeeper''s Magebound Chain'),
(3110001,280603,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | The Runic Hand Hammer'),
(3110001,280777,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Sunbound Talisman'),
(3110001,360285,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Thorn Plate Leggings'),
(3110001,360483,0,0,0,1,1,1,1,'Generated map_34_difficulty_0 trash | Robe of Titan Keeper');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1666 AND `Item` = 1 AND `Reference` = 3110000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1666,1,3110000,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | boss_000537');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1706 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1706,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1707 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1707,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1708 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1708,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1711 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1711,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1715 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1715,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1720 AND `Item` = 1 AND `Reference` = 3110001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1720,1,3110001,2,0,1,0,1,1,'Generated encounter attachment | map_34_difficulty_0 | trash');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120000,200391,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Rimewalker''s Reaver of the Rune King'),
(3120000,200409,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Plaguelord''s Marauding Charmstone'),
(3120000,200533,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Deathwarden''s Colossal Chausses'),
(3120000,220084,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Firewarden''s Desecrated Vambraces'),
(3120000,220449,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Draconic Harness'),
(3120000,220557,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Desecrated Gloves'),
(3120000,220897,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Ebon Champion''s Wrist Chains'),
(3120000,240137,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Legguards of Silver Watch'),
(3120000,240567,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Leggings, Argent Snow'),
(3120000,240592,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Stonelord''s Strap'),
(3120000,240737,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Bloodbound Waistguard'),
(3120000,260426,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Dragon Void Marksman Crossbow'),
(3120000,260677,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Wolfbound Neckguard of Terokkar'),
(3120000,260867,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | The Barbed Vest'),
(3120000,280409,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | The Razor-edged Warhammer'),
(3120000,280477,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Warped Graspers'),
(3120000,280707,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | East Dream Stonehammer'),
(3120000,320155,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Ravenbound Chestpiece of Frozen Star'),
(3120000,320561,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Dreambound Helm'),
(3120000,320600,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Twilight Claws of Amphitheater'),
(3120000,340087,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Black Bolt Runed Staff'),
(3120000,340385,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Warborn Shoulderpads of Howling Fjord'),
(3120000,340428,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Greatcloak of the Azure Flame'),
(3120000,340502,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Sable Brand Walkers'),
(3120000,340575,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Pale-blue Spell Stave of the Grim Watch'),
(3120000,340964,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Wild Focus of Demon Lord'),
(3120000,360490,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Graspers of Frozen Promise'),
(3120000,360660,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Cryptkeeper''s Legwraps'),
(3120000,360683,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Deathly Cinch'),
(3120000,380863,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Grimdark Collar of Silver Flame'),
(3120000,380965,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000161 | Veil of the Dark Ritual');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120001,200026,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Flamewarden''s Neckguard'),
(3120001,200063,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Heroic Harness'),
(3120001,200125,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stoneguard''s Scourgebound Helm'),
(3120001,200143,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Warboots of Twilight Flame'),
(3120001,200159,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Signet of the Borean Expanse'),
(3120001,200168,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Argent Defender''s Legguards'),
(3120001,200180,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runesmith''s Legmail of the Star Forge'),
(3120001,200244,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Chain of the Wind King'),
(3120001,200252,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hallowed Battle Axe of the Silent Road'),
(3120001,200263,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Coldfire Hauberk of Twilight Crown'),
(3120001,200284,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Griefbound Necklace'),
(3120001,200290,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Waistguard of Argent Watch'),
(3120001,200307,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wintertouched Helm of Emerald Path'),
(3120001,200365,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Lost Queen''s Helm'),
(3120001,200374,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostveined Wargrips'),
(3120001,200394,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostcaller''s Baneful Greaves'),
(3120001,200406,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ferocious Leggings'),
(3120001,200423,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Warpriest''s Warboots'),
(3120001,200435,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Enduring Harness'),
(3120001,200482,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sunwarden''s Twilight Great Hauberk'),
(3120001,200519,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stonewarden''s Briarwoven Warhelm'),
(3120001,200541,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runelord''s Colossal Casque'),
(3120001,200573,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Verdant Gauntlets of Hallowed Watch'),
(3120001,200640,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hauberk of the Azure Flame'),
(3120001,200648,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Firekeeper''s Greenwood Treads'),
(3120001,200661,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Winter King''s Waistchain'),
(3120001,200688,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stonewarden''s Boots of the Ancestor Spirit'),
(3120001,200697,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Royal Cloak of Soul Watch'),
(3120001,200717,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gloves, Gold Covenant'),
(3120001,200742,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gravecaller''s Snowbound Sledge'),
(3120001,200754,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Emberkeeper''s Ghoststeel Waistchain'),
(3120001,200782,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Solemn Shawl of Blood Promise'),
(3120001,200805,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Merciless Royal Band'),
(3120001,200836,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Warhelm, Prime Tongue'),
(3120001,200990,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Kingskeeper''s Gladiatorial Oathring'),
(3120001,200995,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Tombforged Reaver, Emberkeeper''s Oath'),
(3120001,220002,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Royal War Leggings of Sacred Flame'),
(3120001,220028,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Darkmoon Talisman'),
(3120001,220029,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Solemn Casque of Wind Watch'),
(3120001,220077,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Footguards, Azure Chain'),
(3120001,220101,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deathless Neckchain'),
(3120001,220131,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sunforged Wargrips'),
(3120001,220137,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Corpsebound Chausses'),
(3120001,220153,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cryptkeeper''s Raider Royal Band'),
(3120001,220171,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Kingsblade of Death Rise'),
(3120001,220188,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mail of the Grave Lord'),
(3120001,220198,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Faithful Boots of the Thunder Crown'),
(3120001,220207,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ironthane Hauberk'),
(3120001,220230,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | War Leggings of the Exodar Crystal'),
(3120001,220235,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Warped Mail'),
(3120001,220271,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Soulforged Backcloth of the Shattered Gate'),
(3120001,220353,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Demon Bringerless Seal'),
(3120001,220357,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frozen Armguards'),
(3120001,220358,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Handguards of the Burning Steppes'),
(3120001,220369,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wintertouched Slasher of Scarlet Dawn'),
(3120001,220384,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Golden Bracers of Ashen Pact'),
(3120001,220430,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stonecaller''s Wrathful Handguards'),
(3120001,220458,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Stormwrought Chestguard'),
(3120001,220461,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Witchlord''s Wildwoven Harness'),
(3120001,220492,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bonekeeper''s Forsaken Chainmail'),
(3120001,220502,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ghostwarden''s Casque of the Plague Watch'),
(3120001,220510,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ember Shard Treads'),
(3120001,220555,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runesmith''s Ironthane Footguards'),
(3120001,220566,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bloodmarked Wargrips of Silent Moon'),
(3120001,220594,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostscarred Capelet'),
(3120001,220623,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Forge Talon War Leggings'),
(3120001,220705,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Torque of Shattered Gate'),
(3120001,220716,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Coal-black Raider Axe'),
(3120001,220737,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Forgotten Signet of the Hallowed Flame'),
(3120001,220745,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deathknight''s Runesword of the Dragon Pact'),
(3120001,220755,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Signet of the Khaz Modan'),
(3120001,220768,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Lost King''s Winterworn Greaves'),
(3120001,220787,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Last King''s Manawoven Glaive'),
(3120001,220818,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Rime-coated Gloves of the Frozen Forge'),
(3120001,220844,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | First Queen''s Darksteel Warcloak'),
(3120001,220858,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Dragonbound Helm'),
(3120001,220969,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runemaster''s Battleblade'),
(3120001,240011,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ghostly Grips'),
(3120001,240021,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Lost Treads, First Knight''s Oath'),
(3120001,240048,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Corroded Longcloak of Winter Court'),
(3120001,240049,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Skull Glyph Great Cape'),
(3120001,240070,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frozen King''s Deathless Waistguard'),
(3120001,240087,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Siege Crossbow, Starfire Cry'),
(3120001,240113,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Voidsteel Legguards of the Scarlet Crusade'),
(3120001,240117,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Locket of the Unending Watch'),
(3120001,240156,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ancestor''s Handguards'),
(3120001,240162,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stormscarred Pendant'),
(3120001,240190,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mantle of the Bitter Memory'),
(3120001,240192,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Longblade of the Astral Gate'),
(3120001,240216,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bloodkeeper''s Mask'),
(3120001,240246,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gloves, Black Wound'),
(3120001,240317,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Vanguard''s Wargrips'),
(3120001,240344,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Starcaller''s Siege Gun'),
(3120001,240351,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Battlemage''s Orb'),
(3120001,240361,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wildbound Jerkin of the Rime Crown'),
(3120001,240375,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Black Ritual Breeches'),
(3120001,240388,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Plagueborn Tunic of the Coldarra'),
(3120001,240391,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Longcloak of the Twilight Reach'),
(3120001,240419,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deathbound Fingerband'),
(3120001,240517,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Bloodsoaked Footguards'),
(3120001,240530,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Age-darkened Band'),
(3120001,240578,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Brightsteel Striders of the Utgarde Keep'),
(3120001,240657,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hexed Breeches of the Emerald Moon'),
(3120001,240664,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Jerkin, East Light'),
(3120001,240738,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Nerubian Runering'),
(3120001,240757,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Choker, Death Edge'),
(3120001,240760,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cruel Cowl of the Arcane Star'),
(3120001,240772,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Scarlet Marshal''s Charm'),
(3120001,240782,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Fernwoven Legguards of the Black Harvest'),
(3120001,240813,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deep Torment Great Warbow'),
(3120001,240822,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bindings of the Grim March'),
(3120001,240826,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Rimeforged Belt'),
(3120001,240886,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Twilightwarden''s Leafbound Runebow'),
(3120001,240900,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Headguard of the Alterac Mountains'),
(3120001,240902,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Starkeeper''s Gleaming Seal Ring'),
(3120001,240907,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Relentless Leggings of the Eternal Watch'),
(3120001,240921,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stormwarden''s Seal of the Moon Path'),
(3120001,240941,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Boots, White Vault'),
(3120001,240957,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Embersteel Chestpiece'),
(3120001,240970,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cap, Ember Beacon'),
(3120001,240981,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Plaguekeeper''s Emberforged Reaver'),
(3120001,260029,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Band of Burning Sky'),
(3120001,260049,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bindings of the Fel Watch'),
(3120001,260098,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Breeches of the Raven Queen'),
(3120001,260100,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Woe-bound Striders of the Tempest Keep'),
(3120001,260125,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Flamewarden''s Embersteel Rondel'),
(3120001,260132,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wild Hail Chestpiece'),
(3120001,260241,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Astral Claws of the Mystic Eye'),
(3120001,260249,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Plagueborn Gorget of the Dawn Star'),
(3120001,260261,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostmarked Wargrips'),
(3120001,260274,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mist Keeper Girdle'),
(3120001,260283,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bracers, Starfire Fury'),
(3120001,260286,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Celestial Plate Drape'),
(3120001,260320,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Mountainborn Warcloak'),
(3120001,260398,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Sorrowful Legguards'),
(3120001,260408,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mask, Doom Pledge'),
(3120001,260457,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Light Sorrow Legguards'),
(3120001,260473,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bracers of Iron Crown'),
(3120001,260478,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Oathwarden''s Treads of the Frozen Halls'),
(3120001,260484,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Soul Lord Bracers'),
(3120001,260528,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wargrips of the Ghost Moon'),
(3120001,260531,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Winterforged Carapace of Long Night'),
(3120001,260585,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Striders of Burning Shadow'),
(3120001,260603,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Forsaken Deathmask'),
(3120001,260627,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Austere Carapace of Bleak Shore'),
(3120001,260637,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Shadowguard''s Legguards'),
(3120001,260652,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Belt of the Kings Promise'),
(3120001,260699,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runelord''s Frostscarred Shoulderguards'),
(3120001,260808,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Weathered Cape of the Construct Wing'),
(3120001,260854,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Longcloak of the Frozen Watch'),
(3120001,260882,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Dusty Battlecloak'),
(3120001,260896,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Soullord''s Treads'),
(3120001,260908,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ebon Memory Wristguards'),
(3120001,260954,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Umbral Tunic of the Black Anvil'),
(3120001,260963,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Moon King''s Steelforged Bracers'),
(3120001,260964,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bloodmage''s Handguards of the Final Dawn'),
(3120001,260989,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Snowbound Locket of High Citadel'),
(3120001,260998,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Titanic Battlecloak of Valiance Keep'),
(3120001,280001,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cuffs, Green Dusk'),
(3120001,280025,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Graspers of the Bone Throne'),
(3120001,280029,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Waistband, Ember Ritual'),
(3120001,280046,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Spirit Wand of the Silver Banner'),
(3120001,280050,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cryptborn Boots of High Citadel'),
(3120001,280080,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Ironthane Regalia'),
(3120001,280084,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gravekeeper''s Capelet of the Death Lord'),
(3120001,280085,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hood, Ash Hammer'),
(3120001,280097,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Manawoven Grips of Sun King'),
(3120001,280108,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Seer Staff, Gray Reach'),
(3120001,280141,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Footwraps of the Blood Ritual'),
(3120001,280153,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Forgotten Vault Boots'),
(3120001,280167,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Grave Knuckle Capelet'),
(3120001,280209,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mantle, Nightfang Dirge'),
(3120001,280284,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Stormsteel Spellrod'),
(3120001,280362,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Titanguard''s Wand of the Bone Ritual'),
(3120001,280387,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Chestwrap, Falcon Banner'),
(3120001,280417,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Voidshard Stone Boots'),
(3120001,280468,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Devout Runebands'),
(3120001,280470,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Leggings of the Grim Watch'),
(3120001,280515,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Arcane Rod, Frostfire Doom'),
(3120001,280530,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Chestwrap of Shadow Ritual'),
(3120001,280553,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stoneward Pendant Chain of the Shadow Moon'),
(3120001,280632,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ruthless Raiment'),
(3120001,280675,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Necrotic Mark of Frozen Memory'),
(3120001,280739,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Spiritbound Locket'),
(3120001,280760,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Warband, Storm Blade'),
(3120001,280814,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Crusher, Abyss Glyph'),
(3120001,280821,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Quarterstaff of Iron Dwarf'),
(3120001,280837,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Leggings, Red Vigil'),
(3120001,280890,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Storm Queen''s Titanbound Walkers'),
(3120001,280905,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Beastbound Leggings of Drowned Hall'),
(3120001,280946,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Argent Song Warder Cloak'),
(3120001,280956,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Nameless Warden''s Shoes'),
(3120001,280965,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Forsaken Cinch of the Last Vigil'),
(3120001,280993,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Drakebound Cape of Nesingwary Camp'),
(3120001,320011,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Light Maw Handguards'),
(3120001,320044,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Broken Warden''s Mask'),
(3120001,320057,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Claws, Shield Rune'),
(3120001,320058,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Argent Champion''s Strap of the Drake Rider'),
(3120001,320071,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Silversteel Cinch of Dusk Watch'),
(3120001,320078,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Heavenforged Hand Hammer'),
(3120001,320081,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gleaming Battle Axe of the Winter Memory'),
(3120001,320141,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Trousers of Blue Dragon'),
(3120001,320152,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostguard''s Winterborn Wristbands'),
(3120001,320187,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Titanforged Girdle of Kaskala'),
(3120001,320239,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wristbands of the Dread Host'),
(3120001,320250,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runed Cap of Alterac Mountains'),
(3120001,320259,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Dalaran Mask of Green Flight'),
(3120001,320312,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Archmage''s Headdress of the Dark Ritual'),
(3120001,320354,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Armorsmith''s Bone of the Fel Ritual'),
(3120001,320360,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Headguard of Deadwind Pass'),
(3120001,320365,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cryptkeeper''s Armguards of the Bone Ritual'),
(3120001,320471,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Boneforged Chestpiece of the Demon Lord'),
(3120001,320481,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Violet Mage''s Poniard'),
(3120001,320502,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Warped Headguard'),
(3120001,320535,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | First Warden''s Harness'),
(3120001,320539,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hammerlord''s Handguards'),
(3120001,320542,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Spellscarred Walkers'),
(3120001,320568,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Moon King''s Reinforced Leggings'),
(3120001,320572,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Longstaff, Eternal Hex'),
(3120001,320605,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Kingsguard Neckchain'),
(3120001,320628,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Unwavering Cap of Nightwatch'),
(3120001,320662,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Royal Band of the Frost Moon'),
(3120001,320716,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Skullbound Legwraps of Silver Hand'),
(3120001,320758,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frostworn Chestpiece of the Last King'),
(3120001,320821,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sky Keeper Chestpiece'),
(3120001,320825,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Fire Vine Stave'),
(3120001,320832,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Twilight Hail Footguards'),
(3120001,320884,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wayfarer''s Wristbands'),
(3120001,320888,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Waistband, Gray Song'),
(3120001,320933,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Seal Ring of the Storm Spirit'),
(3120001,320971,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Unyielding Pants'),
(3120001,340010,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Moonbound Choker of Blood Ritual'),
(3120001,340016,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Thunderous Waistwrap of the Shattered Oath'),
(3120001,340040,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Snowforged Diadem'),
(3120001,340062,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Legwraps, Black Snowfall'),
(3120001,340175,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Hidden Hex Medallion'),
(3120001,340201,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Boots of the Ebon Hold'),
(3120001,340309,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Spiritcaller''s Hood'),
(3120001,340345,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Mooncaller''s Brightsteel Clasp'),
(3120001,340368,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Soulforged Chain'),
(3120001,340395,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sandals of the Tirisfal Glades'),
(3120001,340407,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Seer''s Silvered Binding'),
(3120001,340464,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Draconic Robes'),
(3120001,340468,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ironbound Fingerband of the Hidden Path'),
(3120001,340488,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Robe of Pale Flame'),
(3120001,340499,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Void Mail Grips'),
(3120001,340519,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Chestwrap, Argent Song'),
(3120001,340531,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Armbands of the Drak Tharon'),
(3120001,340540,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Pants of Arathi Highlands'),
(3120001,340586,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ancient Knight''s Grips of the North Wind'),
(3120001,340629,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Ivory Bracelets'),
(3120001,340631,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | North Shard Nightcloak'),
(3120001,340655,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ravenous Shroud of Shadowbinder'),
(3120001,340681,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Highborne Band'),
(3120001,340755,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ebon Treads'),
(3120001,340764,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Quarterstaff of Ancient Flame'),
(3120001,340803,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Gloves, North Ash'),
(3120001,340846,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Chestwrap of Coldarra'),
(3120001,340859,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Stoneward Mitts'),
(3120001,340944,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bonebound Graspers of the Fel Flame'),
(3120001,340950,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Rune Dagger of Sunwell'),
(3120001,340952,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Borean Robes of the Wolf Spirit'),
(3120001,340975,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Robe, Stone Blade'),
(3120001,340982,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sunfire Bite Footwraps'),
(3120001,360030,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Witchforged Graspers'),
(3120001,360056,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Voidforged Skullcap of the War Banner'),
(3120001,360061,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Skullcap, Ice Rune'),
(3120001,360079,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Twilight-forged Shadowblade'),
(3120001,360085,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Armbands of the Darkened Sun'),
(3120001,360109,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Saber of the Fallen King'),
(3120001,360113,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Nightkeeper''s Brooch of the Dragon Pact'),
(3120001,360140,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Bloodwarden''s Bone Wand of the Frozen Road'),
(3120001,360143,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Boneguard''s Treads'),
(3120001,360203,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Holy Spear Robes'),
(3120001,360273,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Lightwarden''s Binding'),
(3120001,360308,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Void Reach Regalia'),
(3120001,360309,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Thunderkeeper''s Radiant Circlet'),
(3120001,360322,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ancient King''s Warstaff'),
(3120001,360358,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Leggings of Wyrm Lord'),
(3120001,360360,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Trousers of Dying Light'),
(3120001,360361,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Storm Steel Walkers'),
(3120001,360376,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Starfang Horn Hood'),
(3120001,360392,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cruel Rune Band of the Zim Torga'),
(3120001,360395,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Feathered Promise of Old Gods'),
(3120001,360415,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Seal of Sable Crown'),
(3120001,360423,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Spellrod of Silver Banner'),
(3120001,360435,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runewoven Robes, Duskcaller''s Oath'),
(3120001,360450,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Shoes of the Final March'),
(3120001,360620,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | High Rage Handwraps'),
(3120001,360642,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Nightcloak, Emerald Bolt'),
(3120001,360651,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Branch of Void King'),
(3120001,360678,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Signet Ring, Dire Void'),
(3120001,360716,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Blighted Handwraps of Searing Gorge'),
(3120001,360722,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Skullcap, Savage Vine'),
(3120001,360739,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Scale, Fel Song'),
(3120001,360745,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Glittering Raiment of the Ebon Vanguard'),
(3120001,360758,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Runebands of Obsidian Sanctum'),
(3120001,360776,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Vrykul Traveling Cloak'),
(3120001,360781,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deepwarden''s Ethereal Wrap'),
(3120001,360915,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Nightkeeper''s Bindings of the Fel Ritual'),
(3120001,360929,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sorrowful Signet'),
(3120001,360959,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Sash of Makers Vault'),
(3120001,360991,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wolf Creed Vestments'),
(3120001,380015,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Frozen Bodkin'),
(3120001,380025,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Northwind Trousers'),
(3120001,380030,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ominous Breeches, Argent Crusader''s Oath'),
(3120001,380038,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Serpent Crush Mantle'),
(3120001,380049,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Drakebound Headdress'),
(3120001,380062,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Ice Branch Armguards'),
(3120001,380095,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Scourgeforged Hoop of Grim Watch'),
(3120001,380115,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cabalistic Vest'),
(3120001,380130,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Moon Queen''s Battle Mace'),
(3120001,380131,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Pendant Chain, Bear Talon'),
(3120001,380158,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Titan Keeper''s Haunted Legwraps'),
(3120001,380180,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Feathered Brooch'),
(3120001,380194,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wolfheart Night Band'),
(3120001,380219,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Icetouched Harness'),
(3120001,380292,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Pitiless Maul'),
(3120001,380307,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Band of the Frozen Heart'),
(3120001,380336,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Earthwoven Legwraps'),
(3120001,380342,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Duskbound Bindings of the Frost Moon'),
(3120001,380352,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Earth Sigil Promise'),
(3120001,380361,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Breeches of the Final Promise'),
(3120001,380395,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Grim Cowl'),
(3120001,380437,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Patient Collar of the Frozen Dead'),
(3120001,380489,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Corroded Carapace of Frozen Pact'),
(3120001,380497,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Cloak of the Ancient Earth'),
(3120001,380617,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Nameless Warden''s Ironclad Ring'),
(3120001,380632,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Age-darkened Poniard'),
(3120001,380676,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Leggings, Stormshard Plate'),
(3120001,380727,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Draconic Chain of Emerald Watch'),
(3120001,380732,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Deathlord''s Boots of the Thunder King'),
(3120001,380738,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Great Cape of Iron Giant'),
(3120001,380768,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Handguards, Red Bringerless'),
(3120001,380814,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | The Graveborn Tunic'),
(3120001,380828,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Vrykul Battlecloak of the Dark Iron Clan'),
(3120001,380841,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Grimkeeper''s Rod of the Iron Watch'),
(3120001,380855,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Moonkeeper''s Handguards'),
(3120001,380895,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Beastbound Cap of the Final Promise'),
(3120001,380897,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Grey Winter Backcloth'),
(3120001,380919,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 trash | Wyrmlord''s Talisman of the Makers Overlook');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120002,200997,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Consecrated Armguards of Dragon Forge'),
(3120002,220052,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Warden''s Unquiet Veil'),
(3120002,220438,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Talisman of the Grim Oath'),
(3120002,260436,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | The Doomforged Treads'),
(3120002,260557,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Dragonlord''s Grips'),
(3120002,260974,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | White Shadow Handguards'),
(3120002,340533,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Ashen King''s Battlecloak'),
(3120002,360905,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Duskrun Vest'),
(3120002,380222,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Sunbound Belt of the Sholazar'),
(3120002,380254,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | The Razor-edged Great Maul'),
(3120002,380954,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000163 | Waistband, Earthshard Reaver');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120003,200113,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Cutlass, North Glacier'),
(3120003,200504,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Mail, Azure Will'),
(3120003,200848,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Violet Grips of the Hidden King'),
(3120003,220011,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Violet Warden''s War Leggings'),
(3120003,220222,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Soul Wolf Grand Axe'),
(3120003,220699,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Silver Queen''s Shadowsteel Gemmed Band'),
(3120003,240745,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Thunderforged Cap of Fallen King'),
(3120003,240934,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | The Scourgebound Chestguard'),
(3120003,260218,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Fel Deathmask of Scourge Host'),
(3120003,260591,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | The Harsh Helm'),
(3120003,260714,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Vanguard''s Heavy Traveling Cloak'),
(3120003,260756,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Runemaster''s Stalwart Shawl'),
(3120003,280086,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Silverkeeper''s Bindings'),
(3120003,280156,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Ashkeeper''s Neckchain'),
(3120003,320148,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Worldforged Stave of the Zangarmarsh'),
(3120003,320325,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Mystic Trousers'),
(3120003,320528,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Low Snowfall Handguards'),
(3120003,320783,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Cracked Cinch of Soul King'),
(3120003,320868,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Far Hand Gemmed Band'),
(3120003,360701,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Mitts of the Emerald Path'),
(3120003,380597,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | Handguards of Forgotten Dead'),
(3120003,380755,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000164 | The Stonebound Vest');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120005,200351,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | The Thornwoven Chestguard'),
(3120005,200395,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Wildcaller''s Coil of the Black Ritual'),
(3120005,200762,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Hauberk, Prime Twilight'),
(3120005,220892,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Broadsword, Earthshard Forge'),
(3120005,240475,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Spaulders of the Burning Steppes'),
(3120005,240588,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Breeches of the Hallowed Watch'),
(3120005,240828,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Wyrmcarved Legwraps of Silver Hand'),
(3120005,260419,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | The Sunforged Legwraps'),
(3120005,280298,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Waistwrap, Earthshard Tongue'),
(3120005,280714,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Graveborn Keepsake'),
(3120005,320316,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Shoulderwraps of Frostguard'),
(3120005,320527,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Legguards, Scourge Rime'),
(3120005,320713,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Harness of Mystic Eye'),
(3120005,320769,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Rimelord''s Grips'),
(3120005,320917,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Pants, Raven Verse'),
(3120005,340118,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Bloodkeeper''s Spiritforged Armbands'),
(3120005,380047,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000166 | Long Wind Footguards');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3120006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3120006,200057,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Boots of the Violet Eye'),
(3120006,200095,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Crown Vow Leggings'),
(3120006,200797,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Bonebound Treads of Dread Wyrm'),
(3120006,200872,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Winter King''s Voidsteel Legguards'),
(3120006,220366,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Umbral Waistguard of the Astral Gate'),
(3120006,220624,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Warden Warbelt of Raven Queen'),
(3120006,240238,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Helm of Forgotten King'),
(3120006,240256,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Dark Keeper Veil'),
(3120006,240333,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Scourge Sigil Trousers'),
(3120006,260842,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Ebon Warden''s Lightblessed Bindings'),
(3120006,280079,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Insignia of the Broken Road'),
(3120006,280180,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Virtuous Wristwraps of the Silver Pact'),
(3120006,280472,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | The Wyrmbound Bell'),
(3120006,280847,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Coal-black Fingerband of Northwatch'),
(3120006,340012,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Drakecaller''s Ghostly Vestments'),
(3120006,340034,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | First Keeper''s Sepulchral Legwraps'),
(3120006,360747,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Shattered Vestments of the Forgotten Oath'),
(3120006,380017,0,0,0,1,1,1,1,'Generated map_36_difficulty_0 boss_000167 | Walkers of Star Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 644 AND `Item` = 1 AND `Reference` = 3120000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(644,1,3120000,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | boss_000161');

DELETE FROM `creature_loot_template` WHERE `Entry` = 598 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(598,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 622 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(622,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 634 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(634,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 636 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(636,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 641 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(641,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 642 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(642,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 657 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(657,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1725 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1725,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1729 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1729,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1731 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1731,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1732 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1732,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3586 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3586,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3947 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3947,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4416 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4416,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4417 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4417,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4418 AND `Item` = 1 AND `Reference` = 3120001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4418,1,3120001,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1763 AND `Item` = 1 AND `Reference` = 3120002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1763,1,3120002,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | boss_000163');

DELETE FROM `creature_loot_template` WHERE `Entry` = 646 AND `Item` = 1 AND `Reference` = 3120003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(646,1,3120003,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | boss_000164');

DELETE FROM `creature_loot_template` WHERE `Entry` = 647 AND `Item` = 1 AND `Reference` = 3120005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(647,1,3120005,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | boss_000166');

DELETE FROM `creature_loot_template` WHERE `Entry` = 639 AND `Item` = 1 AND `Reference` = 3120006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(639,1,3120006,2,0,1,0,1,1,'Generated encounter attachment | map_36_difficulty_0 | boss_000167');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130000,200355,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Drakebound Helm'),
(3130000,200580,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Greaves of Iron Giant'),
(3130000,200704,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Violet Warden''s Leggings'),
(3130000,220374,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Dragon Vengeance Belt'),
(3130000,220393,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | The Spectral Legguards'),
(3130000,220578,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Rune-carved Waistguard, Magekeeper''s Oath'),
(3130000,220887,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Aged Signet Ring'),
(3130000,240102,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Stonefather''s Spellbound Chestpiece'),
(3130000,240199,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Gloves, Star Gloom'),
(3130000,240242,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Dusty Waistguard of Silver Covenant'),
(3130000,240701,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Striders of the Drowned King'),
(3130000,260490,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Arcane Anchor Chestguard'),
(3130000,260932,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Death Scar Handguards'),
(3130000,280021,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | War Mace, Bear Blade'),
(3130000,280458,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Shoes of Frozen Road'),
(3130000,280691,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Spiritforged Breeches of Silver Light'),
(3130000,280984,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Calm Mantle of Stratholme'),
(3130000,280998,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Voidbound Chestwrap of Blood Pact'),
(3130000,320209,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Striders of Construct Wing'),
(3130000,320708,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Charmstone, Arcane Helm'),
(3130000,340187,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Stormlord''s Headdress'),
(3130000,340218,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Dusk Decree Skirt'),
(3130000,340560,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | The Ruthless Legwraps'),
(3130000,340772,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Shieldbearer''s Bracelets'),
(3130000,360208,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Signet Ring of the Storm Pact'),
(3130000,360284,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Handwraps of Northern Light'),
(3130000,380052,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Conqueror Signet Ring'),
(3130000,380102,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Violet Mage''s Claws'),
(3130000,380116,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Warder Cloak of the Dead Watch'),
(3130000,380151,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Flamecaller''s Girdle of the Far North'),
(3130000,380290,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | The Tempered Gloves'),
(3130000,380776,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000585 | Darkened Pillar of the Shadow Crown');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130001,200003,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Brutish Girdle, Ashcaller''s Oath'),
(3130001,200056,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Nightshrouded Band'),
(3130001,200233,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Runeforged War Hatchet of Grave Lord'),
(3130001,200243,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Girdle of Frozen Moon'),
(3130001,200952,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Silent King''s Adamant Signet Ring'),
(3130001,220294,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Girdle of Moon Flame'),
(3130001,220644,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Stonecarved Headguard of Black Forge'),
(3130001,220723,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Stonecarved Warbelt'),
(3130001,240047,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Waistband of Titan Watcher'),
(3130001,240459,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Stormkeeper''s Treads of the Winter Moon'),
(3130001,240511,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Blackened Band'),
(3130001,240610,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Northwarden''s Lost Bracers'),
(3130001,240669,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Witchkeeper''s Hellforged Mask'),
(3130001,240702,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Stone Legacy Vest'),
(3130001,260449,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Gravekeeper''s Armguards of the Rime King'),
(3130001,260541,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Wristguards of Blue Flight'),
(3130001,260584,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Sainted Girdle, Rimecaller''s Oath'),
(3130001,260614,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Graveborn Pants, First King''s Oath'),
(3130001,280943,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Walkers, Primal Scar'),
(3130001,320523,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Armored Pants of the Black Anvil'),
(3130001,320700,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | The Emberwrought Cape'),
(3130001,320770,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Grim Woe Hatchet'),
(3130001,320860,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Striders, Mist Twilight'),
(3130001,340051,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Rimekeeper''s Lightblessed Warstaff'),
(3130001,360385,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Frost Queen''s Shroud of the North Wind'),
(3130001,360463,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Deathguard''s Walkers of the Ice Moon'),
(3130001,360507,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Goldbound Legwraps of Death Lord'),
(3130001,360686,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Wild Mist Waistwrap'),
(3130001,360975,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Lost Horn Seal'),
(3130001,380478,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Prime Thirst Pendant Chain'),
(3130001,380718,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Runewoven Waistguard'),
(3130001,380734,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 trash | Gray Helm of the Plague Watch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130002,200329,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Chestguard, Rune Bolt'),
(3130002,220474,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Light Crush Handguards'),
(3130002,220609,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Leggings, Silent Death'),
(3130002,260102,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Coldbound Legwraps'),
(3130002,260151,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Hoary Piercer'),
(3130002,260721,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Flameforged Shoulderwraps'),
(3130002,260814,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Wristguards of Kamagua'),
(3130002,280619,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Stone Wrath Vest'),
(3130002,320500,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Bright Clutches'),
(3130002,340517,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Sash, Moonfire Flame'),
(3130002,340957,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Mountainborn Trousers'),
(3130002,360078,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Robes of the Tirisfal Glades'),
(3130002,360229,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Relicbound Skullcap'),
(3130002,360823,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Pants of the Holy Crown'),
(3130002,360964,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Conqueror Coil'),
(3130002,380099,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | The Dragonforged Wristbands'),
(3130002,380165,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Waistguard of the Fallen King'),
(3130002,380516,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000586 | Bracers, Iron Blade');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130003,200037,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000587 | Voidkeeper''s Chilled Handguards'),
(3130003,320891,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000587 | The Purified Shoulderguards'),
(3130003,340951,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000587 | Channeling Rod of Shadow Vault'),
(3130003,380429,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000587 | Bloodmarked Bracers of Grave Lord');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130004,200059,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Worldwarden''s Bracers of the Stone Forge'),
(3130004,200681,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Rune King''s Stonehewn Gorget'),
(3130004,220658,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Farseer''s Necklace'),
(3130004,340762,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Voidcaller''s Pillar of the Last Watch'),
(3130004,360114,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Chestwrap of Death Knight'),
(3130004,380389,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Gravekeeper''s Wrap of the Storm Banner'),
(3130004,380610,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000588 | Tunic of the Lost Watch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130005,280020,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | East Bane Cap'),
(3130005,280060,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | Battlecloak of Old Kingdom'),
(3130005,280276,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | Hood of the Holy Flame'),
(3130005,280575,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | Chestwrap, Lionheart Wing'),
(3130005,320763,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | The Shadowwoven Beads'),
(3130005,360204,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000589 | Runesteel Hood of Spellweaver');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130006,240311,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000590 | Fireforged Cowl'),
(3130006,260601,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000590 | Silent Warden''s Spellbound Walkers'),
(3130006,340937,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000590 | Warrior-forged Skullcap'),
(3130006,360961,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000590 | Runelord''s Robe'),
(3130006,380951,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000590 | Seer''s Pants');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3130007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3130007,200065,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Northkeeper''s Legmail'),
(3130007,200382,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Hardened Shoulderguards of the Titan Vault'),
(3130007,220683,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Armguards, Skull Requiem'),
(3130007,220936,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | The Sunlit Waistchain'),
(3130007,240195,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Lost King''s Charm'),
(3130007,240831,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Rootbound Walkers of Cold Hearth'),
(3130007,240917,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Watchkeeper''s Deathmask'),
(3130007,260002,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | The Darkforged Walkers'),
(3130007,260613,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Corrupted Girdle'),
(3130007,280065,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Warscarred Footwraps'),
(3130007,320131,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Witchkeeper''s Bonebound Handguards'),
(3130007,340768,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | The Divine Shoulder Cape'),
(3130007,340909,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Ashen Queen''s Warrior-forged Boots'),
(3130007,380113,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Holy Striders'),
(3130007,380153,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Shoulderpads of the Alterac Mountains'),
(3130007,380627,0,0,0,1,1,1,1,'Generated map_43_difficulty_0 boss_000591 | Bronze Plate Waistguard');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3671 AND `Item` = 1 AND `Reference` = 3130000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3671,1,3130000,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000585');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3840 AND `Item` = 1 AND `Reference` = 3130001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3840,1,3130001,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5912 AND `Item` = 1 AND `Reference` = 3130001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5912,1,3130001,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3669 AND `Item` = 1 AND `Reference` = 3130002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3669,1,3130002,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000586');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3653 AND `Item` = 1 AND `Reference` = 3130003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3653,1,3130003,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000587');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3670 AND `Item` = 1 AND `Reference` = 3130004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3670,1,3130004,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000588');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3674 AND `Item` = 1 AND `Reference` = 3130005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3674,1,3130005,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000589');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3673 AND `Item` = 1 AND `Reference` = 3130006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3673,1,3130006,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000590');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5775 AND `Item` = 1 AND `Reference` = 3130007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5775,1,3130007,2,0,1,0,1,1,'Generated encounter attachment | map_43_difficulty_0 | boss_000591');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140000,200136,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Nameless Warden''s Lightwoven Compass'),
(3140000,200235,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Deathless Greatbow'),
(3140000,200239,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Deepforged Warhelm of the Dark Crown'),
(3140000,200552,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Froststeel Armguards'),
(3140000,200671,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Sun Branch Chausses'),
(3140000,200758,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Treads, Wolf Knuckle'),
(3140000,200784,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Warbelt of Ancient Banner'),
(3140000,200845,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Bitter Gauntlets'),
(3140000,200958,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Golden Warhelm'),
(3140000,220096,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Merciless Surcoat'),
(3140000,220325,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Coif, Spider Bolt'),
(3140000,220397,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Flamekeeper''s Ruthless Torc'),
(3140000,220415,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Spaulders of the Midnight Flame'),
(3140000,220661,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Sacred Knuckle Runesword'),
(3140000,220687,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Cudgel of Iron Crown'),
(3140000,220707,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Shawl of the Stormwind Keep'),
(3140000,220762,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Rune Band of the Western Plaguelands'),
(3140000,220849,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Spaulders of the Wind King'),
(3140000,220898,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Kingsworn Waistchain of Shadow Pact'),
(3140000,220952,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Stormmarked Collar of the Last Watch'),
(3140000,220981,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Rimeforged Fang Axe'),
(3140000,240341,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Worldworn Leggings'),
(3140000,240362,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Chestpiece, Crypt Chain'),
(3140000,240503,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Headguard of the Violet Hold'),
(3140000,240865,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Warsage''s Runebound Breeches'),
(3140000,240879,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Deep Whisper Jerkin'),
(3140000,240937,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Plagueborn Great Runeblade'),
(3140000,260038,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Runekeeper''s Footguards'),
(3140000,260045,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Deathly Pendant Chain'),
(3140000,260117,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Thorned Breeches'),
(3140000,260126,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Duskkeeper''s Carrion Loop'),
(3140000,260304,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Scarlet Champion''s Helm'),
(3140000,260428,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Silent Queen''s Mantle'),
(3140000,260462,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Spiritkeeper''s Deathmask'),
(3140000,260728,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Dreaming Mask of the Lordaeron Guard'),
(3140000,260818,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Barbed Helm of the Lost King'),
(3140000,280090,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Pale Channeling Rod of the Ghost Moon'),
(3140000,280353,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Coil, Serpent Mail'),
(3140000,280366,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Rootbound Locket'),
(3140000,280543,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Coil of the Kings Road'),
(3140000,280642,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Grips of Makers Vault'),
(3140000,280682,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Silversteel Shoulderwraps'),
(3140000,280720,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Shieldguard''s Wintersteel Gloves'),
(3140000,280754,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Drakeforged Longcloak'),
(3140000,280914,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Winterforged Crystal Wand of Iron Crown'),
(3140000,280932,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Shoulder Cape of Earth Spirit'),
(3140000,320114,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Shard of the Broken Shield'),
(3140000,320122,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Windbound Seal of the Gjalerbron'),
(3140000,320149,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Soulbound Crusher'),
(3140000,320182,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Clawmarked Helm'),
(3140000,320212,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Timeworn Clutches'),
(3140000,320236,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Clutches of the North Road'),
(3140000,320287,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Girdle, Boar Shine'),
(3140000,320348,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Undying Waistguard of the Winter Crown'),
(3140000,320429,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Faded Girdle, Gravewarden''s Oath'),
(3140000,320521,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Striders of the Ice Forge'),
(3140000,320658,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Titan-carved Tunic of North Wind'),
(3140000,320684,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Tunic, Emerald Horn'),
(3140000,320711,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Bloodsoaked Strap of Raven Spirit'),
(3140000,320785,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Waistband of Black Dragon'),
(3140000,320899,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Handguards, Skull Glyph'),
(3140000,320967,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Winterguard''s Pendant Chain'),
(3140000,320998,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Wolf Wrath Archmage Staff'),
(3140000,340081,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Drakebound Kilt'),
(3140000,340196,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Silent Knight''s Trousers'),
(3140000,340315,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Starsteel Compass of the Last Stand'),
(3140000,340386,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Skullbound Bindings'),
(3140000,340652,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Rimebound Icon of Mount Hyjal'),
(3140000,340680,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Ancestral Capelet'),
(3140000,340901,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Starlit Walkers of the Final Promise'),
(3140000,340968,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Voidforged Epaulets, Windlord''s Oath'),
(3140000,360011,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Seal, North Edge'),
(3140000,360291,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Forsworn Robes'),
(3140000,360404,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Winterguard''s Runestaff'),
(3140000,360569,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Titan Carver Runering'),
(3140000,360802,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Titan King''s Kilt'),
(3140000,380042,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Bloodkeeper''s Longcloak of the Ghost Moon'),
(3140000,380063,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Moon Queen''s Greatstaff'),
(3140000,380127,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Locket of Blue Flame'),
(3140000,380141,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | The Stormscarred Sledge'),
(3140000,380190,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Coil of the Forgotten Memory'),
(3140000,380262,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Moonkeeper''s Violet Wargrips'),
(3140000,380385,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Spaulders, Primal Anchor'),
(3140000,380493,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Rimewalker''s Ornate Deathmask'),
(3140000,380585,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Scarlet Templar''s Blessed Boots'),
(3140000,380726,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Sun Singer Cinch'),
(3140000,380839,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Heavy Girdle'),
(3140000,380942,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Pants, Grim Talon'),
(3140000,380969,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Gemmed Band of the Last King'),
(3140000,380976,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Walkers of the Golden King'),
(3140000,380981,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000438 | Treads, Red Dawn');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140001,200152,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Shadowsteel Harness'),
(3140001,200834,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Frostworn Chainmail of Great Hunt'),
(3140001,200877,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Arcane Bloom Circle'),
(3140001,200893,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Gladiatorial Harness of Violet Citadel'),
(3140001,220141,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Royal Helm of Broken Banner'),
(3140001,220291,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Dragonkeeper''s Epaulets of the Pale Flame'),
(3140001,220522,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Aged Footguards, Deathknight''s Oath'),
(3140001,220694,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Blacksteel Headguard'),
(3140001,220784,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Brightsteel Gloves'),
(3140001,220812,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Silent King''s Ironthane Necklace'),
(3140001,220863,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Dawncaller''s Girdle'),
(3140001,220893,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Mooncaller''s Keepsake'),
(3140001,220996,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Silverguard''s Enchanted Spaulders'),
(3140001,240023,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Voidbound Stalkers'),
(3140001,240176,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Scarlet Templar''s Necrotic Cinch'),
(3140001,240200,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Scourgebound Chestguard of the Golden King'),
(3140001,240777,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Dream Ice Royal Band'),
(3140001,240819,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Dragoncaller''s Deepdelver Stalkers'),
(3140001,240855,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Shoulderwraps of the Star Crown'),
(3140001,240868,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Violet Wind Steel Crossbow'),
(3140001,260166,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Trousers of the Iron Banner'),
(3140001,260329,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Lightbound Wargrips of the Dragon Forge'),
(3140001,260459,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Terrible Shoulderguards of the Holy Crown'),
(3140001,260571,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Sable Pants'),
(3140001,260695,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Jerkin of Endless Night'),
(3140001,260759,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Warscarred Carapace'),
(3140001,260953,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Greenwood Clasp'),
(3140001,280019,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Shoulderpads of Dread Crown'),
(3140001,280310,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Violet Reach Waistwrap'),
(3140001,280439,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Feathered Circle'),
(3140001,280485,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Tombkeeper''s Cinch'),
(3140001,280510,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Northman''s Shoulder Cape'),
(3140001,280567,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Dragonhide Vestments of Silvermoon Spires'),
(3140001,280599,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Ringlet of the Midnight Flame'),
(3140001,280827,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Thundersteel Keepsake of the Dark Forge'),
(3140001,280836,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Gloves of Iron March'),
(3140001,320073,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Strap of Silver Hand'),
(3140001,320074,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Spaulders, Winter Decree'),
(3140001,320174,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Runemarked Belt'),
(3140001,320327,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Drakekeeper''s Striders'),
(3140001,320330,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Cloak, Sunfire Veil'),
(3140001,320382,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Ebon Marshal''s Starwoven Armguards'),
(3140001,320493,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Signet of Deep Mountain'),
(3140001,320589,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Silent King''s Warder Cloak'),
(3140001,320610,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Warlord''s Tower Shield'),
(3140001,320720,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Northborn Pants of the Skorn'),
(3140001,320723,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Duskrun Hoop'),
(3140001,320812,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Necklace of Bronzebeard Clan'),
(3140001,320926,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Headguard, Bleak Watch'),
(3140001,320948,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Runewarden''s Wargrips'),
(3140001,340155,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Tunic of the Golden Light'),
(3140001,340165,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Tiara of Stone King'),
(3140001,340216,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Shieldmaster''s Robe of the Scholomance'),
(3140001,340446,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Lightforged Feather'),
(3140001,340494,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Frostmarked Chestwrap of Dark Forge'),
(3140001,340507,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Last Queen''s Heavenforged Grips'),
(3140001,340960,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Brightwarden''s Bindings'),
(3140001,360197,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Silent Keeper''s Wyrmforged Spell Scepter'),
(3140001,360422,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Drakewarden''s Crimson Mantle'),
(3140001,360470,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Sanctified Neckchain of Shadow Crown'),
(3140001,360473,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Kingskeeper''s Robes'),
(3140001,360693,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Kingsguard Tunic, Wildwarden''s Oath'),
(3140001,360866,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Tiara of the Dark Iron Clan'),
(3140001,360913,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Sinister Dirk of North Road'),
(3140001,360986,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Gloomed Breeches'),
(3140001,380870,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | The Spiritforged Warder Cloak'),
(3140001,380935,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 trash | Razor-edged Gloves, Crusader''s Oath');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140002,260552,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000439 | Shoulder Drape of the Star Grove'),
(3140002,280069,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000439 | Drakekeeper''s Duskrun Branch'),
(3140002,340593,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000439 | Titan Queen''s Dreadforged Waistwrap');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140003,200121,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Iron Chill War Leggings'),
(3140003,200155,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Warbelt of Argent Watch'),
(3140003,200250,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Scourgebound Boots of Sable Crown'),
(3140003,200257,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Earthcaller''s Spiritbound Epaulets'),
(3140003,200258,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Stoneward Legguards of the Wind Spirit'),
(3140003,200268,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Warlord Vambraces'),
(3140003,200567,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Hammerlord''s Dwarven Hoop'),
(3140003,200625,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Vial of the Fire Spirit'),
(3140003,200673,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Ravenkeeper''s Wildwoven Shortsword'),
(3140003,200719,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Vambraces, Frost Shadow'),
(3140003,200749,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Armguards of the Ancient Banner'),
(3140003,200777,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Spiritkeeper''s Rime-coated War Leggings'),
(3140003,220073,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Rootwoven Circle'),
(3140003,220130,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Voidsteel Battle Hatchet'),
(3140003,220363,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Treads of Sacred Oath'),
(3140003,220370,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Wargrips of Winter Watch'),
(3140003,220391,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Storm Vine Blade'),
(3140003,220676,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Obsidian Warden Wrist Chains'),
(3140003,220865,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Violet Mage''s Dalaran Casque'),
(3140003,240112,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Fallen Banner Drape'),
(3140003,240196,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Barbed Warbow of the Wild Path'),
(3140003,240252,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Dawnlit Traveling Cloak of War Watch'),
(3140003,240534,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Worldforged Breeches'),
(3140003,240572,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Deathcaller''s Waistguard'),
(3140003,240675,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Illusory Girdle'),
(3140003,240740,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Blacksmith''s Long Recurve'),
(3140003,240913,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Darkforged Mantle'),
(3140003,260052,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Boneclad Shoulderpads'),
(3140003,260053,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Feathered Pants'),
(3140003,260093,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Storm Queen''s Sunlit Bindings'),
(3140003,260173,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Tunic of the Frozen Forge'),
(3140003,260486,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Sable Bindings of Dalaran'),
(3140003,260491,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Kingsworn Harness, Windlord''s Oath'),
(3140003,260521,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Iceforged Walkers of Temple of Storms'),
(3140003,260555,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Moonforged Legwraps'),
(3140003,260560,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Blighted Hoop of Last Promise'),
(3140003,260576,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Shoulderwraps, Bone Sun'),
(3140003,260582,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Bearhide Pants'),
(3140003,260669,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Starfire Covenant Shoulderpads'),
(3140003,260696,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Mantle, Flame Wound'),
(3140003,260813,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Chestpiece of the Forgotten Road'),
(3140003,260873,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Silverblessed Belt'),
(3140003,260958,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Eternal Singer Leggings'),
(3140003,260981,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Doomed Treads'),
(3140003,280038,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Forgekeeper''s Battlecloak of the War Watch'),
(3140003,280072,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Mystic Hood of the Shadow Vault'),
(3140003,280081,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Lost Queen''s Brassbound Pendant'),
(3140003,280204,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Shadowforged Armbands'),
(3140003,280305,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Argent Crusader''s Shoulderwraps'),
(3140003,280342,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Plaguekeeper''s Robes'),
(3140003,280533,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Hallowed Runering'),
(3140003,280546,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Chillborn Armbands'),
(3140003,280594,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Graspers of the Final Dawn'),
(3140003,280601,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Plaguetouched Grips'),
(3140003,280879,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Old Keeper''s Skullcap'),
(3140003,280967,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Unbroken Scale of the Frozen Promise'),
(3140003,320094,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Darkcaller''s Striders of the Ancient Storm'),
(3140003,320235,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Scourgebound Icon'),
(3140003,320299,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Anvilkeeper''s Waistguard'),
(3140003,320577,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Dreambound Legwraps'),
(3140003,320638,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Old Cinch of the Grave King'),
(3140003,320726,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Titanforged Chestguard'),
(3140003,320940,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Ivory Dancer Harness'),
(3140003,320995,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Jerkin, Holy Pact'),
(3140003,340105,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Shoulderwraps of the Astral Gate'),
(3140003,340174,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Sandals of the Storm Peaks'),
(3140003,340272,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Signet of the Death Rise'),
(3140003,340310,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Silent King''s Cutlass'),
(3140003,340332,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Twilightwarden''s Wolfsworn Leggings'),
(3140003,340481,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Ancient Warden''s Cowl'),
(3140003,340490,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Stargazer''s Bright Cuffs'),
(3140003,340706,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Thorn Bloom Boots'),
(3140003,340856,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Vestments of the Bone Throne'),
(3140003,340916,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Mournbound Shoulderpads'),
(3140003,360064,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Sunbound Crystal of Emerald Wilds'),
(3140003,360111,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Glittering Shoulder Cape of the Fel Flame'),
(3140003,360266,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Sash, Gray Snowfall'),
(3140003,360298,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Ironthane Hoop'),
(3140003,360580,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Northman''s Polished Collar'),
(3140003,360640,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Backcloth, Fel Horn'),
(3140003,360665,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Bloodied Vest'),
(3140003,360914,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Tombkeeper''s Epaulets'),
(3140003,360985,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Seal Ring, Steel Mail'),
(3140003,380072,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Virtuous Armguards of Stone Forge'),
(3140003,380088,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Ferocious Great Stave of Frozen Gate'),
(3140003,380198,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Nightmare Staff'),
(3140003,380273,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Void Anchor Torque'),
(3140003,380316,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Warped Armguards'),
(3140003,380341,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Wolfmarked Chestguard, Frozen King''s Oath'),
(3140003,380463,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Cowl, Shield Piercer'),
(3140003,380719,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Legwraps of Deep Earth'),
(3140003,380763,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Primal Pants of the Fire Spirit'),
(3140003,380812,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | The Drakescale Walkers'),
(3140003,380816,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Ebon Champion''s Veil'),
(3140003,380818,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Worldforged Chestguard of the Autumn Wind'),
(3140003,380896,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000440 | Nightmare Trousers of the Autumn Wind');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140004,200156,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Winterkeeper''s Steelforged Lance'),
(3140004,200222,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Vambraces of the White Crown'),
(3140004,200366,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Greatcloak, South Winter'),
(3140004,200566,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Wolfkeeper''s Charmstone'),
(3140004,200593,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Arcanist''s Flask'),
(3140004,220958,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Runemaster''s Wargrips'),
(3140004,240144,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Moonlord''s Shoulderpads of the Violet Eye'),
(3140004,240310,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Rune Queen''s Trousers'),
(3140004,260641,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Shadowforged Claws'),
(3140004,260951,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Wildfire Edge Handguards'),
(3140004,280333,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Deepfrost Walkers of Celestial Gate'),
(3140004,280511,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Ancestral Leggings of the Pale Moon'),
(3140004,280629,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Death Spear Cap'),
(3140004,280651,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Ember Leaf Sandals'),
(3140004,280919,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Wildforged Cap of Great Eagle'),
(3140004,320294,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Faithful Greatcloak of Frozen Heart'),
(3140004,320565,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Ancient Warden''s Brightmoon Vest'),
(3140004,320837,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Light Ruin Headdress'),
(3140004,360194,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Weathered Pants of Utgarde'),
(3140004,360402,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Horn of the Military Wing'),
(3140004,360447,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Titanbound Epaulets, Frostmage''s Oath'),
(3140004,360481,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Mark, Grave Doom'),
(3140004,360597,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Circle of Fallen Star'),
(3140004,380108,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Warchief''s Hammer of the Amphitheater'),
(3140004,380373,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Earth Bringerless Deathmask'),
(3140004,380621,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Chestpiece of the Thor Modan'),
(3140004,380778,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000441 | Ironthane Cinch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140005,220173,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000443 | Hauberk of Bronzebeard Clan'),
(3140005,220214,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000443 | Pendant Chain of Wyrm Crown'),
(3140005,280416,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000443 | Ancient Ripper Hood'),
(3140005,280820,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000443 | Blood King''s Voidbound Trousers');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3140006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3140006,200419,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Ghostcaller''s Runewoven Ringlet'),
(3140006,200477,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Reaver of Halls of Stone'),
(3140006,200626,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Silent Queen''s Gladiatorial Grips'),
(3140006,220200,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | The Veiled Warboots'),
(3140006,220482,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Greaves, Unbroken Seal'),
(3140006,220611,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | War Leggings of the Zul Drak'),
(3140006,220899,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | The Illusory Greaves'),
(3140006,240015,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Hallowed Whisper Seal Ring'),
(3140006,240324,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Lightwarden''s Crystal'),
(3140006,240832,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Frozen King''s Stalkers of the Dark Star'),
(3140006,260692,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Shoulderpads of the Utgarde'),
(3140006,260792,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Blackened Choker of Green Flight'),
(3140006,280016,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Starfire Vengeance Mace'),
(3140006,280124,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Tombkeeper''s Waistwrap'),
(3140006,320181,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Bloodfire Branch Mantle'),
(3140006,320515,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Ashcaller''s Footguards of the Silver Light'),
(3140006,340039,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Ancient King''s Druid Staff'),
(3140006,340251,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Mystwoven Waistband of the Zangarmarsh'),
(3140006,340333,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Deathlord''s Scalebound Promise'),
(3140006,340390,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Skullkeeper''s Tiara of the Dread Crown'),
(3140006,340487,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Grips, Gray Covenant'),
(3140006,340733,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Rootwoven Treads of Rainspeaker Canopy'),
(3140006,380332,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Frostlord''s Fierce Footguards'),
(3140006,380579,0,0,0,1,1,1,1,'Generated map_47_difficulty_0 boss_000883 | Gold Bloom Waistband');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6168 AND `Item` = 1 AND `Reference` = 3140000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6168,1,3140000,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000438');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4425 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4425,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4427 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4427,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4435 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4435,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4436 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4436,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4437 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4437,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4438 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4438,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4440 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4440,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4442 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4442,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4511 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4511,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4512 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4512,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4514 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4514,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4515 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4515,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4516 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4516,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4517 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4517,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4518 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4518,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4519 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4519,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4520 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4520,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4522 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4522,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4523 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4523,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4525 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4525,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4530 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4530,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4531 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4531,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4532 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4532,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4538 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4538,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4541 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4541,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4623 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4623,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4842 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4842,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6035 AND `Item` = 1 AND `Reference` = 3140001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6035,1,3140001,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4424 AND `Item` = 1 AND `Reference` = 3140002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4424,1,3140002,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000439');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4428 AND `Item` = 1 AND `Reference` = 3140003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4428,1,3140003,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000440');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4420 AND `Item` = 1 AND `Reference` = 3140004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4420,1,3140004,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000441');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4421 AND `Item` = 1 AND `Reference` = 3140005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4421,1,3140005,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000443');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4422 AND `Item` = 1 AND `Reference` = 3140006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4422,1,3140006,2,0,1,0,1,1,'Generated encounter attachment | map_47_difficulty_0 | boss_000883');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150000,200289,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000219 | Nightfang Scream Casque'),
(3150000,360676,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000219 | Vest of the Twilight Crown');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150001,200021,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wargrips, Hidden Promise'),
(3150001,200067,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wargrips, Last Edge'),
(3150001,200072,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Armguards of Cold Moon'),
(3150001,200147,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Frostlord''s War Mantle'),
(3150001,200151,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Forgotten Chainmail of the Wild Crown'),
(3150001,200172,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Legmail, Soulfire Carver'),
(3150001,200350,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Long Glaive, Dire Fire'),
(3150001,200399,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Spell Reach Torc'),
(3150001,200614,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Legguards, Lionheart Shadow'),
(3150001,200747,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Bearhide Handguards of the Crimson Flame'),
(3150001,200763,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shadow Reach Hauberk'),
(3150001,200816,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shoulder Guards of the Soul Watch'),
(3150001,200866,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Dragoncaller''s Warcloak of the Arcane Star'),
(3150001,220010,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Winterguard''s Shadowmarked Longblade'),
(3150001,220032,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Rimeforged Warhelm of the Void Watch'),
(3150001,220121,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Seal Ring of Long Road'),
(3150001,220124,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Seal Ring, Mana Spear'),
(3150001,220127,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Legguards of the Wyrm Crown'),
(3150001,220161,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Darkrider''s Pitiless War Scythe'),
(3150001,220301,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Farseer''s Legguards'),
(3150001,220322,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Great Hauberk of Ashen Vale'),
(3150001,220352,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Boots of Amber Ledge'),
(3150001,220561,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ancestor''s Treads'),
(3150001,220569,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Coif of Scarlet Monastery'),
(3150001,220619,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Waistguard of the Wyrmskull'),
(3150001,220629,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Farseer''s Runed Great Maul'),
(3150001,220632,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Warband of Ebon Flame'),
(3150001,220860,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Defiant Chausses'),
(3150001,220867,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Casque of the Black Moon'),
(3150001,220888,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Coif, Cold Vengeance'),
(3150001,220918,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Gloves of the Endless Path'),
(3150001,240158,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Reinforced Waistband'),
(3150001,240174,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ironthane''s Worldforged Waistguard'),
(3150001,240193,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Voidsteel Mark of Scarlet Keep'),
(3150001,240198,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wyrmhide Girdle'),
(3150001,240235,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Feral Striders'),
(3150001,240331,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Northwarden''s Grips of the Midnight Watch'),
(3150001,240366,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Warband of the Restless Dead'),
(3150001,240484,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ironlord''s Leggings'),
(3150001,240491,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Orb of the Titan Keeper'),
(3150001,240494,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Emberforged Waistband'),
(3150001,240553,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Stone Beacon Idol'),
(3150001,240556,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Embercaller''s Marksman Crossbow'),
(3150001,240637,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Runelord''s Jerkin'),
(3150001,240677,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ranger Bow of Soul Crown'),
(3150001,240708,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Brightwarden''s Gorget'),
(3150001,240899,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Plaguetouched Band'),
(3150001,240944,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Tombforged Footguards'),
(3150001,240959,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Starcaller''s Splintered Clutches'),
(3150001,260003,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Unbroken Stiletto of Frozen Road'),
(3150001,260152,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Argent Templar''s Waistband'),
(3150001,260179,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | First Keeper''s Charm of the Plague Wing'),
(3150001,260397,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Long Hide Legguards'),
(3150001,260399,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Lost King''s Furious Wristbands'),
(3150001,260522,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Frozen Queen''s Trousers'),
(3150001,260687,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Raider Locket of Black Flight'),
(3150001,260691,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Gravekeeper''s Living Spaulders'),
(3150001,260718,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Loop of Icecrown Citadel'),
(3150001,260727,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Last Knight''s Brooch of the Frostwolf Clan'),
(3150001,260747,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Coil, Rime Light'),
(3150001,260815,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Death Storm Mantle'),
(3150001,260876,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Witchkeeper''s Strap'),
(3150001,260949,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Jerkin of Emerald Path'),
(3150001,280015,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Waistband of the Hollow King'),
(3150001,280034,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Rimeforged Warcloak of the Iron March'),
(3150001,280095,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Lightlord''s Skullforged Seal'),
(3150001,280197,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Spellscarred Royal Band of the Wild Hunt'),
(3150001,280304,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Jeweled Seer Staff of the Searing Gorge'),
(3150001,280349,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Baneful Charm'),
(3150001,280364,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Epaulets of the Twilight Crown'),
(3150001,280381,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Feathered Leggings of Pale Flame'),
(3150001,280389,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ruthless Capelet'),
(3150001,280535,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Tunic of the First Watch'),
(3150001,280551,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Dawnsteel Breeches'),
(3150001,280658,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Morningstar of Freya Garden'),
(3150001,280744,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Obsidian Leggings'),
(3150001,280780,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shaman Staff of the Iron Giant'),
(3150001,280843,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Gray Footwraps of Holy Watch'),
(3150001,280950,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Brutish Epaulets, Old Knight''s Oath'),
(3150001,280992,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Merciless Mantle, Moonkeeper''s Oath'),
(3150001,320305,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Spirit Legacy Veil'),
(3150001,320321,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Scarlet Greatcloak'),
(3150001,320422,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Mystic Trousers of Crimson Flame'),
(3150001,320428,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Dawn Breaker Scepter'),
(3150001,320485,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Helm of the Forgotten Road'),
(3150001,320514,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Knobbed Mace of Star Watch'),
(3150001,320578,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Nightbound Tunic'),
(3150001,320715,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Mask of the Fallen Crown'),
(3150001,320773,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shoulderpads of the Black Ice'),
(3150001,320792,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Demon Hail Collar'),
(3150001,320796,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wolfwarden''s Bleak Shoulderguards'),
(3150001,320856,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Vest, Fire Guard'),
(3150001,320953,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Deep Watch Shoulderguards'),
(3150001,320980,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Mantle, Unquiet Grip'),
(3150001,320993,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shadowmarked Jerkin'),
(3150001,340046,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Old Knight''s Weathered Locket'),
(3150001,340084,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Battlemaiden''s Shoes'),
(3150001,340140,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Titanic Tunic of Moon Watch'),
(3150001,340141,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Plaguewarden''s Titanbound Gloves'),
(3150001,340275,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wyrm King''s Mitts of the Rune Crown'),
(3150001,340412,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Shoulder Cape of the Shadow Vault'),
(3150001,340574,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ironthane Boots'),
(3150001,340580,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | War Dagger of Kirin Tor'),
(3150001,340647,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Lost Keeper''s Pants of the Wyrm King'),
(3150001,340751,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | First Queen''s Shoulderwraps'),
(3150001,340794,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Bleak Claw Cord'),
(3150001,340852,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ravenkeeper''s Handwraps'),
(3150001,340893,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Watchkeeper''s Leggings'),
(3150001,340994,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Dire Woe Tiara'),
(3150001,360036,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Crusader''s Highborne Wristwraps'),
(3150001,360057,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Ironkeeper''s Circlet'),
(3150001,360155,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Whitegold Raiment of the Broken Blade'),
(3150001,360174,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Duskkeeper''s Headdress'),
(3150001,360239,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Boneclad Epaulets of the Shadow Forge'),
(3150001,360330,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Wolf Arrow Bracelets'),
(3150001,360464,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Argent Knight''s Epaulets'),
(3150001,360544,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Boots, Crimson Hail'),
(3150001,360976,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Sun Tongue Footwraps'),
(3150001,380032,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Pitiless Vest'),
(3150001,380140,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Radiant Legguards of the Ashen Pact'),
(3150001,380156,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Warmaster Carapace of Thorim Arena'),
(3150001,380218,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Stonehammer, Forge Seed'),
(3150001,380321,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Sun Queen''s Torc of the Venture Bay'),
(3150001,380364,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Manaforged Seer Staff of Burning Shadow'),
(3150001,380365,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Eye of Drak Tharon Keep'),
(3150001,380491,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Spell Flame Trousers'),
(3150001,380595,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Legguards, Serpent Creed'),
(3150001,380622,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Tombwarden''s Runehammer'),
(3150001,380694,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Bloodmage''s Trousers of the Dragonblight'),
(3150001,380723,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Winterforged Collar'),
(3150001,380759,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Frostbound Mask of the Titan Watch'),
(3150001,380774,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | The Bronzed Gloves'),
(3150001,380834,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Leggings, Drake Bringerless'),
(3150001,380926,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Highlord''s Starsteel Ring'),
(3150001,380929,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 trash | Froststeel Veil of the Black Harvest');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150002,200102,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Ancient Queen''s Waistchain'),
(3150002,200864,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Girdle of the Wind Watch'),
(3150002,220242,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Starbound Handguards of the Burning Shadow'),
(3150002,220360,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Fang Axe, Plague Seal'),
(3150002,240124,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Plagueforged Mask'),
(3150002,240809,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Dalaran Insignia'),
(3150002,260169,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Bladeguard''s Boots'),
(3150002,260386,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Spellknife, Deep Skull'),
(3150002,260503,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Clouded Bracers'),
(3150002,260794,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Ashen Queen''s Circle'),
(3150002,280818,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Spectral Waistband'),
(3150002,320237,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Frozen Knight''s Frostworn Ringlet'),
(3150002,320569,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Deathmask of the Pit of Saron'),
(3150002,340371,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Stormscarred Mitts of Great Bear'),
(3150002,340904,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Bright Dusk Shoulder Cape'),
(3150002,360123,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | First Queen''s Effigy of the Burning Crown'),
(3150002,380826,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000220 | Bloodforged Totem of the Valiance Keep');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150003,200051,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Argent Saber'),
(3150003,200306,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | The Veiled Surcoat'),
(3150003,200310,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | The Silvered Circle'),
(3150003,220148,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Wristguards of Wyrm King'),
(3150003,220252,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Circle, Thorn Fall'),
(3150003,220409,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Gloves of Dread Crown'),
(3150003,220864,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Footguards of the Great Eagle'),
(3150003,240010,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Shieldbearer''s Hateful Gloves'),
(3150003,240035,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Hollow Fate Hand Cannon'),
(3150003,240279,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Warmaster Warder Cloak, Blood King''s Oath'),
(3150003,240320,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Zealous Footguards, Darkrider''s Oath'),
(3150003,240898,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Demon Sun Waistband'),
(3150003,260168,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Warder Cloak of the Wild Crown'),
(3150003,260600,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Northman''s Profane Idol'),
(3150003,280059,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Headdress, Prime Skull'),
(3150003,280638,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Silent King''s Bracelets'),
(3150003,320409,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Shoulderguards of the Death March'),
(3150003,320845,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Spell Stave of Final March'),
(3150003,340354,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Radiant Footwraps of Broken Crown'),
(3150003,340376,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Frostmage''s Raiment'),
(3150003,340815,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Drake Decree Handwraps'),
(3150003,340943,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Brand, Darkfire Seed'),
(3150003,360558,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | The Stormforged Vest'),
(3150003,380438,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Scarlet Forge Headdress'),
(3150003,380567,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | Stormforged Strap'),
(3150003,380801,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000221 | The Rootwoven Shoulderwraps');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150004,220065,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | Hauberk, Rime Quarrel'),
(3150004,240206,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | Shadowmage''s Insignia'),
(3150004,240611,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | Argent Defender''s Tunic of the Ebon Crown'),
(3150004,320694,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | The Stormmarked Shoulderwraps'),
(3150004,360054,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | Worldkeeper''s Kilt'),
(3150004,380003,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000222 | Breeches of the Ashen Pact');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150005,200546,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | The Warden Mirror'),
(3150005,220231,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Ash Rune Shoulder Guards'),
(3150005,220877,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Ivory Boots of the Ancient Oak'),
(3150005,260683,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Brittle Deathmask of Emerald Moon'),
(3150005,280311,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Figurine of River Heart'),
(3150005,320997,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Runering of the Forgotten King'),
(3150005,340222,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Rune Band of the Broken Spear'),
(3150005,340605,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Sepulchral Sword'),
(3150005,360346,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | The Skyforged Armbands'),
(3150005,360484,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | The Heavy Circlet'),
(3150005,380544,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000224 | Sunbound Flanged Mace of the Red Flight');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150006,200375,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Twilight Cry Girdle'),
(3150006,200478,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Last Queen''s Hexed Warboots'),
(3150006,220008,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Gloomed War Leggings of Ice King'),
(3150006,220150,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Sacred Wrist Chains of the Blood Tide'),
(3150006,240485,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Forsworn Cowl of the Frozen Promise'),
(3150006,280328,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Sandals, Shattered Spire'),
(3150006,320248,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Deathless Neckguard of the Fallen Lord'),
(3150006,320407,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Strap, Dire Watch'),
(3150006,320863,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Heavenforged Headdress of Violet Flame'),
(3150006,340739,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Drakebound Battle Staff of Scourge Lord'),
(3150006,340838,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Chillborn Kilt'),
(3150006,360010,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Sunlit Treads'),
(3150006,360315,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Mantle, Far Rend'),
(3150006,360984,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Mage Staff of Red Dragonflight'),
(3150006,380602,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Scale-bound Treads'),
(3150006,380786,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000225 | Spiritbound Legguards of Sunwell');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3150007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3150007,220490,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000226 | Sunwarden''s Manawoven Footguards'),
(3150007,240180,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000226 | Tombforged Hoop of the Wyrm King'),
(3150007,280541,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000226 | Witchcaller''s Chestwrap of the Wyrm Crown'),
(3150007,320630,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000226 | Deathmarked Cinch of the Crimson Dawn'),
(3150007,380904,0,0,0,1,1,1,1,'Generated map_48_difficulty_0 boss_000226 | Frozen Shard Cinch');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4887 AND `Item` = 1 AND `Reference` = 3150000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4887,1,3150000,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000219');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4798 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4798,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4799 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4799,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4805 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4805,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4807 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4807,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4809 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4809,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4810 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4810,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4811 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4811,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4812 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4812,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4813 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4813,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4814 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4814,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4815 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4815,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4818 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4818,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4819 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4819,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4820 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4820,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4821 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4821,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4822 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4822,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4823 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4823,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4824 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4824,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4825 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4825,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4827 AND `Item` = 1 AND `Reference` = 3150001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4827,1,3150001,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4831 AND `Item` = 1 AND `Reference` = 3150002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4831,1,3150002,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000220');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6243 AND `Item` = 1 AND `Reference` = 3150003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6243,1,3150003,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000221');

DELETE FROM `creature_loot_template` WHERE `Entry` = 12902 AND `Item` = 1 AND `Reference` = 3150004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(12902,1,3150004,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000222');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4830 AND `Item` = 1 AND `Reference` = 3150005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4830,1,3150005,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000224');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4832 AND `Item` = 1 AND `Reference` = 3150006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4832,1,3150006,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000225');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4829 AND `Item` = 1 AND `Reference` = 3150007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4829,1,3150007,2,0,1,0,1,1,'Generated encounter attachment | map_48_difficulty_0 | boss_000226');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160000,200014,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Gloves of the Storm Pact'),
(3160000,200373,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Ironkeeper''s Grips'),
(3160000,200721,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Runeguard''s Warmarked Handguards'),
(3160000,200910,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Stargazer''s Chausses of the Rune Crown'),
(3160000,220006,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Shattered Colossal Maul'),
(3160000,220026,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Plaguelord''s Nightcloak'),
(3160000,220329,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Battle Hammer, Rime Brand'),
(3160000,220497,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Coil, Nether Scream'),
(3160000,240377,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Torque of Star Watch'),
(3160000,240779,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Bloodknight''s Pendant of the Cold Hearth'),
(3160000,260373,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Veil of Endless Road'),
(3160000,280608,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | The Wyrmscale Armbands'),
(3160000,280635,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Wyrm King''s Gilded Skirt'),
(3160000,280907,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Brooch of the Golden Banner'),
(3160000,280908,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Highlord''s Tiara of the Frozen Dead'),
(3160000,320858,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Bloodguard''s Legwraps'),
(3160000,340536,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Bonekeeper''s Wildbound Grips'),
(3160000,340633,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Wolfsworn Armbands of the Arcane Star'),
(3160000,340644,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Frostveined Diadem of Frozen Throne'),
(3160000,340711,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Cryptlord''s Dusty Kilt'),
(3160000,340807,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | The Adamant Skullcap'),
(3160000,340992,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Moon King''s Graspers'),
(3160000,360202,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Argent Void Mantle'),
(3160000,360437,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Emberforged Battlecloak'),
(3160000,380037,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Starlit Archmage Staff of Blood Crown'),
(3160000,380662,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000547 | Rune-carved Coil');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160001,200016,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Oathring of Old Gods'),
(3160001,200018,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Harness, Violet Glaive'),
(3160001,200020,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Unyielding War Cleaver of the Lost King'),
(3160001,200031,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Death Bolt Skull Axe'),
(3160001,200048,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Forsworn Shroud of Dread Crown'),
(3160001,200070,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Fireforged Wrap'),
(3160001,200093,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wrathful Faceguard'),
(3160001,200118,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Vambraces of Runed Path'),
(3160001,200185,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Gleaming Chainmail of the Wintergrasp'),
(3160001,200210,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Chainmail of the Void Watch'),
(3160001,200254,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Handplates, Prime Void'),
(3160001,200295,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ironclad Greaves'),
(3160001,200301,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Forgotten Keeper''s Sunbound Handguards'),
(3160001,200341,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Waistguard of the Emerald Dream'),
(3160001,200347,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Spaulders of the Frostguard'),
(3160001,200348,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Epaulets, Hallowed Rage'),
(3160001,200385,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Everfrost Casque'),
(3160001,200443,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Froststeel War Mantle'),
(3160001,200448,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Last Piercer Leggings'),
(3160001,200459,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Leggings of Dead March'),
(3160001,200472,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Cryptlord''s Sunhallowed War Cleaver'),
(3160001,200490,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Arcanized Warhelm'),
(3160001,200493,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runesteel Broadsword of Silver Flame'),
(3160001,200496,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Blighted Nightcloak'),
(3160001,200562,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Sun Queen''s Sacred War Mantle'),
(3160001,200612,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Great Hauberk of Golden Moon'),
(3160001,200639,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Farseer''s Luminous Mail'),
(3160001,200646,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Handguards of the Ancient Watcher'),
(3160001,200651,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wyrmguard''s Wyrmbound Faceguard'),
(3160001,200710,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frost Queen''s Gemmed Band'),
(3160001,200741,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Silverforged Shoulder Drape'),
(3160001,200761,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Ironclad Girdle'),
(3160001,200815,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Sinister Casque of Black Flight'),
(3160001,200835,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Soulcaller''s Ashen Greathelm'),
(3160001,200842,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bracers, Bitter Brand'),
(3160001,200867,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Epaulets of the Lost Road'),
(3160001,200894,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Twilightcaller''s Hauberk of the Grim Host'),
(3160001,200896,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Mantle of Utgarde Keep'),
(3160001,200947,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frost King''s Spaulders of the Earthshaper'),
(3160001,200949,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Mantle of the Valiance Keep'),
(3160001,200967,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Star Caller Grips'),
(3160001,220023,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Footguards of Bronzebeard Clan'),
(3160001,220076,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Brooch of the Argent Vanguard'),
(3160001,220080,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Boots of the Amphitheater'),
(3160001,220135,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Cracked Skullsplitter of Death Lord'),
(3160001,220138,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Silent Knight''s Leggings'),
(3160001,220162,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Leggings, Ember Covenant'),
(3160001,220241,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Mantle of Fallen Star'),
(3160001,220277,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Lightkeeper''s Plagueborn Runeblade'),
(3160001,220303,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadow Thorn Bracers'),
(3160001,220309,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mail of Wyrm Crown'),
(3160001,220381,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Fierce Whisper Skullcrusher'),
(3160001,220403,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warscarred Shoulderguards of Black Anvil'),
(3160001,220444,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Chainmail, Ember Wing'),
(3160001,220447,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Argent Marshal''s Merciless Cudgel'),
(3160001,220484,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shoulder Guards of Grim Watch'),
(3160001,220493,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Girdle, Ash Shield'),
(3160001,220521,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Titanblade, Lionheart Chill'),
(3160001,220526,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Earthcaller''s Badge'),
(3160001,220529,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Mantle of Blue Flight'),
(3160001,220560,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wildwoven Faceguard of the Scarlet Bastion'),
(3160001,220564,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Soulshard Hand Great Hauberk'),
(3160001,220589,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dreaming Greatcloak of Endless Path'),
(3160001,220599,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Moonlit Titan Axe of Twilight Crown'),
(3160001,220637,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Greaves, Holy Bane'),
(3160001,220652,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Girdle of the Stratholme'),
(3160001,220681,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frostfire Reach Band'),
(3160001,220702,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dreamwarden''s Waistguard'),
(3160001,220721,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frostmage''s Chausses'),
(3160001,220739,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Duskwoven Wargrips of the Endless March'),
(3160001,220783,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rimebound Gorget'),
(3160001,220810,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Legguards of Northern Forge'),
(3160001,220843,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bearded Axe of the Raven Queen'),
(3160001,220869,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Girdle of the Deep Forge'),
(3160001,220902,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rime-coated Warhelm of Black Harvest'),
(3160001,220926,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Axe of White Moon'),
(3160001,220945,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Broken Spaulders, Winterguard''s Oath'),
(3160001,220968,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rugged Waistchain of Sun Crown'),
(3160001,220993,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Old King''s Glasslike Wristguards'),
(3160001,220999,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Footguards, Earth Leaf'),
(3160001,240020,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Deathless Deathmask of Frost Watch'),
(3160001,240027,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodbound Handguards'),
(3160001,240067,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Execution Axe, Wildfire Woe'),
(3160001,240084,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shoulder Drape, Night Sun'),
(3160001,240086,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runesmith''s Leggings'),
(3160001,240090,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Chestpiece of Last Watch'),
(3160001,240201,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Cloak, Wyrm Claw'),
(3160001,240212,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rune Queen''s Helm'),
(3160001,240295,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bracers, Dawn Shard'),
(3160001,240313,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Treads of Endless March'),
(3160001,240357,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodkeeper''s Deathmarked Wristguards'),
(3160001,240363,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Soul Cry Runeaxe'),
(3160001,240364,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Lightwarden''s Strap'),
(3160001,240373,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rootwoven Signet Ring of Borean Expanse'),
(3160001,240398,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Silverforged Greataxe of the Dawnwatch'),
(3160001,240435,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodguard''s Longbow of the Nexus'),
(3160001,240472,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Highlord''s Coldbound Legwraps'),
(3160001,240501,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Treads of Engine of Makers'),
(3160001,240531,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Chain of the Temple of Storms'),
(3160001,240545,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Torque, Fel Vine'),
(3160001,240552,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frostmage''s Grips'),
(3160001,240568,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mystic Striders of the Ancient Titan'),
(3160001,240632,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Twilight Chestpiece of the Avalanche'),
(3160001,240651,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ironkeeper''s Chestguard of the Violet Star'),
(3160001,240654,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Emberforged Claws'),
(3160001,240670,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Silver Queen''s Lightblessed Vial'),
(3160001,240671,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grimlord''s Headguard'),
(3160001,240698,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Spiritcaller''s Icetouched Waistband'),
(3160001,240752,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warlord''s Treads of the Ancient Watch'),
(3160001,240773,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Hoarfrost Pendant Chain'),
(3160001,240843,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Starsteel Strap'),
(3160001,240911,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Coal-black Wargrips, Northwarden''s Oath'),
(3160001,240927,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wrap of Dread Watch'),
(3160001,240965,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Stalkers of the Dragon Queen'),
(3160001,240985,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dawncaller''s Chain of the Great North'),
(3160001,260022,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Duskwoven Legwraps of the Frostborn'),
(3160001,260040,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Chestguard of Eternal Watch'),
(3160001,260120,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Claws of the Lordaeron Guard'),
(3160001,260129,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Sun King''s Handguards of the Dying Light'),
(3160001,260131,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shieldguard''s Spaulders of the Sunwell'),
(3160001,260158,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mirror of the Frozen Crown'),
(3160001,260206,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Legguards of War Crown'),
(3160001,260216,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips, Ember Breaker'),
(3160001,260220,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Woeful Clutches of the Cold Watch'),
(3160001,260237,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wristguards, Green Bolt'),
(3160001,260250,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dire Belt of the Violet Watch'),
(3160001,260446,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rimewalker''s Shoulderguards'),
(3160001,260468,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Clasp of Pale Flame'),
(3160001,260480,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Jerkin of Last Light'),
(3160001,260485,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadow King''s Grips'),
(3160001,260526,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wildkeeper''s Deathly Cowl'),
(3160001,260546,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | War Dagger of Deep Roads'),
(3160001,260548,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadowsteel Cinch'),
(3160001,260565,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mystic Blade'),
(3160001,260647,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Tunic of Last Dawn'),
(3160001,260649,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Armored Talisman of Rainspeaker Canopy'),
(3160001,260670,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Embersteel Bone Bow of Wyrmskull'),
(3160001,260672,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Raider Capelet of the Hidden King'),
(3160001,260740,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ironthane Ring of the Demon Watch'),
(3160001,260804,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Old Great Cape'),
(3160001,260807,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shoulderguards of the Alterac Mountains'),
(3160001,260816,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Voidkeeper''s Jerkin'),
(3160001,260821,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Carver of the Shadow Forge'),
(3160001,260823,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Barbed Trousers of Rime Crown'),
(3160001,260828,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Voidforged Mask of the Shadowmoon Valley'),
(3160001,260832,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Voidlord''s Ringlet'),
(3160001,260836,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Rotting Girdle'),
(3160001,260868,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Beastbound Mask'),
(3160001,260921,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Silent Spaulders'),
(3160001,260933,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rimeforged Stone of Death Gate'),
(3160001,260990,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Waistband of the Raven Spirit'),
(3160001,280064,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Stoneguard''s Cloak of the Astral Gate'),
(3160001,280127,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Frostveined Shoulder Cape'),
(3160001,280133,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Calm Chain of Moon Guard'),
(3160001,280171,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Beastbound Binding of Dragonblight'),
(3160001,280208,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hammerlord''s Mantle'),
(3160001,280220,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Nightsteel Cuffs of Holy Guard'),
(3160001,280271,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Blood Prince''s Trousers of the Dalaran'),
(3160001,280283,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Winterwarden''s Dreamwoven Cord'),
(3160001,280306,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Spiritbound Vestments of the Blighted Land'),
(3160001,280314,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Nether Dawn Tablet'),
(3160001,280331,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Gilded Trousers of Kamagua'),
(3160001,280351,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips of Forge of Souls'),
(3160001,280356,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Forgekeeper''s Sash'),
(3160001,280367,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ritual Wand, Grave Anvil'),
(3160001,280398,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Snowforged Breeches'),
(3160001,280414,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Kingsworn Legwraps of the Violet Watch'),
(3160001,280445,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Tombforged Headdress'),
(3160001,280483,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Epaulets, Argent Snow'),
(3160001,280495,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Plaguewarden''s Gloves'),
(3160001,280496,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Raiment, Voidshard Warden'),
(3160001,280500,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Scale-bound Handwraps of the Netherstorm'),
(3160001,280506,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Stormmarked Focus'),
(3160001,280507,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warband of Unending Watch'),
(3160001,280512,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Circle of the Ghost Moon'),
(3160001,280513,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Locket of the Grim Host'),
(3160001,280549,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Boots, Hollow Wyrm'),
(3160001,280591,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadowguard''s Headdress'),
(3160001,280592,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Rotting Focus'),
(3160001,280703,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Age-darkened Bracelets'),
(3160001,280745,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Plague Reaver Crusher'),
(3160001,280781,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Crimson Headdress'),
(3160001,280823,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wolf Rider Epaulets'),
(3160001,280865,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Unhallowed Vest of the Light Watch'),
(3160001,280874,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Scourgeforged Warstaff of the Yogg Prison'),
(3160001,280900,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wolfmarked Loop of the Wildheart'),
(3160001,280902,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Jagged Seal'),
(3160001,320023,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hallowed Hymn Trousers'),
(3160001,320069,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runed Mail'),
(3160001,320084,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wild Cinch'),
(3160001,320102,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Amulet of Last Vigil'),
(3160001,320140,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Girdle of Freya Garden'),
(3160001,320142,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ironthane''s Trousers of the Winter Memory'),
(3160001,320150,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Leggings of the Emerald Grove'),
(3160001,320176,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hateful Capelet'),
(3160001,320178,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hearthwarden''s Deepforged Vest'),
(3160001,320185,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Beastmarked Striders of Iron Oath'),
(3160001,320216,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shoulderpads of Burning Blood'),
(3160001,320225,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dawnkeeper''s Claws of the Death Rise'),
(3160001,320254,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warguard''s Wristguards'),
(3160001,320304,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodied Wristbands'),
(3160001,320337,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Reaver of Moon Flame'),
(3160001,320341,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Titan Keeper''s Arcanized Headguard'),
(3160001,320342,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Clutches of Sons of Hodir'),
(3160001,320401,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Skull Ward Bracers'),
(3160001,320412,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Waistguard, Ghostfire Night'),
(3160001,320441,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hidden Twilight Crusher'),
(3160001,320443,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Cowl of the Great Bear'),
(3160001,320444,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Highkeeper''s Chestguard'),
(3160001,320495,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mask, Coldfire Singer'),
(3160001,320558,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wyrmcaller''s Hammered Rune Dagger'),
(3160001,320559,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frostworn Neckguard'),
(3160001,320562,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Spellbound Leggings of the Lost Promise'),
(3160001,320571,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Windforged Waistguard, Forgekeeper''s Oath'),
(3160001,320580,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wildkeeper''s Clutches of the Frozen Throne'),
(3160001,320581,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Consecrated Stalkers of Twilight Watch'),
(3160001,320591,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Helm, Voidshard Spark'),
(3160001,320613,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Northman''s Runering of the Grim March'),
(3160001,320622,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Relentless Carapace'),
(3160001,320702,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Savage Torment Shoulderpads'),
(3160001,320703,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Cracked Mask'),
(3160001,320751,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mark of Great Forge'),
(3160001,320795,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Belt, Hallowed Crown'),
(3160001,320843,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadowlord''s Wristbands'),
(3160001,320871,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Headdress, Ebon Twilight'),
(3160001,320887,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shadowwoven Gloves'),
(3160001,320916,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runering of the Fel Ritual'),
(3160001,320977,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Charred Headguard'),
(3160001,320981,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runekeeper''s Longcloak of the Thunder King'),
(3160001,320982,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grand Mace, Ice Reckoning'),
(3160001,340025,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Argent Leaf Icon'),
(3160001,340026,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips of the Orgrimmar Guard'),
(3160001,340056,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Argent Knight''s Locket'),
(3160001,340075,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Snowbound Skirt of Forgotten Dead'),
(3160001,340085,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Mournful Pants'),
(3160001,340086,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips, Void Talon'),
(3160001,340111,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips of the Rime King'),
(3160001,340116,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Drakewarden''s Chain of the White Crown'),
(3160001,340134,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Gloves of the Stone Forge'),
(3160001,340227,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Gilded Footwraps of the Wildhammer Clan'),
(3160001,340319,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rime Mail Promise'),
(3160001,340370,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ebon Breath Grips'),
(3160001,340382,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Earthbound Capelet'),
(3160001,340417,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips, Lost Spirit'),
(3160001,340444,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rimelord''s Assassin Blade'),
(3160001,340458,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Moonlit Fingerband'),
(3160001,340522,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bonewarden''s Trousers'),
(3160001,340552,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Blighted Sandals of the Makers Terrace'),
(3160001,340579,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runewarden''s Cutlass'),
(3160001,340620,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runemaster''s Skirt of the Burning Star'),
(3160001,340634,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | First Warden''s Waistband'),
(3160001,340639,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Icekeeper''s Stormmarked Shoes'),
(3160001,340671,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Flamekeeper''s Raiment'),
(3160001,340702,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Epaulets, Blood Chill'),
(3160001,340727,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warband of the Mage Tower'),
(3160001,340796,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Grips of Sable Moon'),
(3160001,340799,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Storm Sigil Rondel'),
(3160001,340819,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Windkeeper''s Mage Staff of the Plague Lord'),
(3160001,340845,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Saronite Waistband of Gundrak'),
(3160001,340979,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dragoncaller''s Regalia'),
(3160001,340997,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ivory Runestone'),
(3160001,360020,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ancient Keeper''s Burial Torque'),
(3160001,360089,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frostlord''s Leggings'),
(3160001,360115,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Colossal Cinch of Emerald Moon'),
(3160001,360151,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Ritual Cap'),
(3160001,360175,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Briarwoven Battlecloak'),
(3160001,360250,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Waistband, Dusk Vengeance'),
(3160001,360262,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Nightcloak, Sun Warden'),
(3160001,360276,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Deathmarked Grips of Red Moon'),
(3160001,360282,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Seal Ring, Wind Covenant'),
(3160001,360373,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wolfheart Rend Shoes'),
(3160001,360379,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Corrupted Rune Band'),
(3160001,360412,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bonekeeper''s Shoulder Cape'),
(3160001,360474,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Last Warden''s Cap of the Moon Pact'),
(3160001,360479,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Lightkeeper''s Greatcloak'),
(3160001,360489,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Lost Skirt'),
(3160001,360491,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dreamkeeper''s Warforged Brand'),
(3160001,360512,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Armored Runering'),
(3160001,360516,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Hearthkeeper''s Runebands'),
(3160001,360538,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bitter Binding of Temple of Storms'),
(3160001,360539,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runebands, Arcane Fang'),
(3160001,360550,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Darkkeeper''s Shadowforged Bindings'),
(3160001,360566,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Titan Keeper''s Trousers'),
(3160001,360587,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ashkeeper''s Cinch of the Northwatch'),
(3160001,360604,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Vestments of Bone March'),
(3160001,360631,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mana Bolt Diadem'),
(3160001,360638,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Rootbound Epaulets of Wind Crown'),
(3160001,360648,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Shoulder Drape of Final Watch'),
(3160001,360727,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Binding of the Titan Crown'),
(3160001,360733,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Pants of Scourge March'),
(3160001,360769,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Diadem, Silent Leaf'),
(3160001,360794,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Headdress, Wolfheart Pact'),
(3160001,360844,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Primal Seal Ring, Moonkeeper''s Oath'),
(3160001,360849,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Lost King''s Tiara of the Bone Ritual'),
(3160001,360865,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Highkeeper''s Siegebound Icon'),
(3160001,360921,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodguard''s Fireforged Cinch'),
(3160001,360963,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ironwarden''s Heroic Treads'),
(3160001,380046,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ancient Gloom Wristbands'),
(3160001,380097,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Radiant Chestpiece of Iron King'),
(3160001,380119,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bracers of the Grizzlemaw'),
(3160001,380164,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wristbands of the Storm Banner'),
(3160001,380176,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wristguards of the Ashen March'),
(3160001,380199,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Primeval Clutches'),
(3160001,380216,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Deathly Warcloak of the High King'),
(3160001,380223,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Merciless Jerkin of the Light Guard'),
(3160001,380252,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Frozen Queen''s Rune-carved Warcloak'),
(3160001,380256,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Titan-carved Longcloak'),
(3160001,380289,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Forgemaster''s Sunsteel Harness'),
(3160001,380315,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Icekeeper''s Chestpiece'),
(3160001,380350,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Stonewarden''s War Mace of the Deep Vault'),
(3160001,380358,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wristguards of Avalanche'),
(3160001,380370,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Sainted Gloves of Mana Tide'),
(3160001,380372,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Drape of the Crimson Banner'),
(3160001,380380,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Handguards, Hollow Flame'),
(3160001,380406,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Runering, Mana Clutch'),
(3160001,380434,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Winterborn Runemaul of the Moon Spirit'),
(3160001,380436,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Runewoven Shoulderwraps'),
(3160001,380439,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Spiritforged Girdle of the White Flame'),
(3160001,380464,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Armguards of War Forge'),
(3160001,380480,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Last King''s Walkers of the Emerald Star'),
(3160001,380494,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Warcloak of the Hallowed Ground'),
(3160001,380519,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Helm, Light Flare'),
(3160001,380528,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Nightshrouded Drape of the Golden Dawn'),
(3160001,380549,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodstained Leggings'),
(3160001,380607,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Fierce Song Clutches'),
(3160001,380635,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wolfbound Branch of Ironforge Mountain'),
(3160001,380688,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Druid Staff, Coldfire Memory'),
(3160001,380701,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wargrips of the Midnight Crown'),
(3160001,380713,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Wyrm King''s Royal Band'),
(3160001,380760,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Ancient King''s Gloves'),
(3160001,380784,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Deathwarden''s Chestpiece'),
(3160001,380788,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Legwraps of the Arcane Eye'),
(3160001,380793,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | North Requiem Staff'),
(3160001,380798,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Stormbound Clublike Mace of Raven Queen'),
(3160001,380827,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | The Doomforged Armguards'),
(3160001,380845,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Dragonsteel Boots of Violet Crown'),
(3160001,380907,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Darkrider''s Gloves'),
(3160001,380911,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Treads of the Plague Wing'),
(3160001,380959,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Mantle, Demon Leaf'),
(3160001,380961,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Crusader''s Chestpiece'),
(3160001,380982,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Bloodbound Vest'),
(3160001,380995,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 trash | Skullwarden''s Waistguard');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160002,200208,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Worldworn Great Runeaxe of Light Watch'),
(3160002,200334,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Stoneguard''s Legmail'),
(3160002,200503,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Cracked Belt of Blighted Land'),
(3160002,200781,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Helm, Bloodfire Vengeance'),
(3160002,200807,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Rootbound Treads of the Mage Lord'),
(3160002,200918,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Headguard of Black Harvest'),
(3160002,220342,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Grips of the War Banner'),
(3160002,220572,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Enduring Cloak, Ancient Knight''s Oath'),
(3160002,220717,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Whitefrost Waistchain of Drake Rider'),
(3160002,240006,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Silent Warden''s Greatbow'),
(3160002,240226,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Deepfrost Charmstone'),
(3160002,240271,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Wildforged Shoulderwraps'),
(3160002,240380,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Sunhallowed Chestpiece of Star Grove'),
(3160002,240405,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Hidden Singer Legwraps'),
(3160002,240427,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Dawncaller''s Boots of the Skorn'),
(3160002,240430,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Walkers, Broken Rage'),
(3160002,240500,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Vrykul Choker of the Violet Flame'),
(3160002,240630,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Frost-rimed Deathmask of the Makers Will'),
(3160002,240682,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Voidsteel Wristbands of Ice King'),
(3160002,240794,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Band, Emerald Knuckle'),
(3160002,240914,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Old King''s Wargrips of the Scale Lord'),
(3160002,240972,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Duskcaller''s Scourged Mantle'),
(3160002,260161,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Serrated Pendant Chain'),
(3160002,260243,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Manawoven Assassin Blade'),
(3160002,260660,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Argent Knight''s Harness of the Gjalerbron'),
(3160002,280162,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Devout Spell Stave of Blue Flight'),
(3160002,280321,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Frostforged Insignia of Soul Watch'),
(3160002,280407,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Mitts, Earth Shot'),
(3160002,280490,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Rotting Raiment of the Howling North'),
(3160002,280502,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Dawnsteel Skullcap'),
(3160002,280710,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Moonforged Runic Rod'),
(3160002,320043,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Bloodsoaked Idol of the Wild Watch'),
(3160002,320126,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Boneforged Girdle of White Flame'),
(3160002,320196,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Druid Staff, Mystic Dawn'),
(3160002,320396,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Bloodkeeper''s Wrap'),
(3160002,320427,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Lightlord''s Druid Staff'),
(3160002,320475,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Thorned Longcloak of the Earthshaper'),
(3160002,320579,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Chestguard of Wind Crown'),
(3160002,320985,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Waistband of Death Knight'),
(3160002,340094,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Cuffs, Grey Spirit'),
(3160002,340139,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Raiment of Raven Spirit'),
(3160002,340209,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Cursed Battle Staff of Valgarde'),
(3160002,340214,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Everfrost Locket'),
(3160002,340219,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Everfrost Robe of the Gundrak Temple'),
(3160002,340503,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Grim Bringerless Waistband'),
(3160002,360096,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Arcane Mark'),
(3160002,360112,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Runecaller''s Runebands of the Frostborn'),
(3160002,360196,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Ashen Lord''s Boots'),
(3160002,360679,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | The Snowy Kilt'),
(3160002,360899,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Footwraps, North Starfall'),
(3160002,380235,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Feathered Branch of Blood Oath'),
(3160002,380275,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Darksteel Tunic of the Astral Gate'),
(3160002,380432,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Wyrm Queen''s Undying Shawl'),
(3160002,380492,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Vest of the Alterac Mountains'),
(3160002,380591,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Starcaller''s Goldbound Harness'),
(3160002,380605,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Splintered Chestpiece'),
(3160002,380626,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Stormshard Ash Shoulderpads'),
(3160002,380975,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000548 | Shaman Staff of Burning Sky');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160003,200273,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Faceguard of the Dark Ritual'),
(3160003,200436,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Wrist Chains of Ancient Night'),
(3160003,200736,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Steelforged Armguards'),
(3160003,200975,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | War Mantle of the Silent Crown'),
(3160003,220081,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | The Saronite Legmail'),
(3160003,220995,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Coif of Grim Watch'),
(3160003,260703,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Rimeforged Handblade of the Bone Wastes'),
(3160003,260943,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | The Gray Spaulders'),
(3160003,280429,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Spiritwarden''s Ring'),
(3160003,280493,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Baleful Cuffs'),
(3160003,280504,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Violet Mystic Wand'),
(3160003,320085,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Dawn Seal Stalkers'),
(3160003,320090,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Bitter Dusk Greatcloak'),
(3160003,320281,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Flamebound Fingerband, Archmage''s Oath'),
(3160003,320430,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Wind March Wargrips'),
(3160003,320612,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Cruel Waistguard of the Drak Tharon Keep'),
(3160003,320830,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Arcanist''s Grips'),
(3160003,340423,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Handwraps of White Crown'),
(3160003,340748,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Necrotic Longcloak of the Howling Fjord'),
(3160003,340928,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Rimelord''s Mossbound Shoulderpads'),
(3160003,360813,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | Cryptborn Signet Ring'),
(3160003,380006,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | The Stalwart Legwraps'),
(3160003,380805,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000549 | The Barbed Mantle');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160004,200702,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Glittering Greaves of the Violet Citadel'),
(3160004,220300,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Sollerets of Red Dragon'),
(3160004,260402,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Drake Promise Mantle'),
(3160004,260489,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Eternal Mask'),
(3160004,260806,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Dawnkeeper''s Mantle of the Frost Giant'),
(3160004,280607,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Sash of Golden Dawn'),
(3160004,320908,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Titan-carved Chestguard of Broken Banner'),
(3160004,340993,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Twilight-forged Hood'),
(3160004,360014,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Mage Wand of the Pit of Saron'),
(3160004,360228,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000551 | Scourged Hourglass of the Thunder Forge');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160005,280526,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Scarlet Templar''s Enduring Circle'),
(3160005,280775,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Rune Queen''s Loop'),
(3160005,340132,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | The Warscarred Vestments'),
(3160005,340199,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Titanforged Wrap'),
(3160005,340462,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Phylactery, Icefang Lord'),
(3160005,340589,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Ironwarden''s Cord of the Broken Promise'),
(3160005,380210,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Bloodsoaked Carapace, Lightcaller''s Oath'),
(3160005,380281,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Iron Mace of the Sun Watch'),
(3160005,380983,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000552 | Darkfire Flare Neckchain');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3160006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3160006,200109,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Signet Ring of the Plague Wing'),
(3160006,240029,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | War Mantle of Ebon Watch'),
(3160006,240166,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Rune King''s Coif'),
(3160006,240349,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Deathcaller''s Shadowsteel Leggings'),
(3160006,260383,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Shoulderpads of the Rime Forge'),
(3160006,260693,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Earthforged Pants of Light Crown'),
(3160006,280875,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Key of the Crimson Banner'),
(3160006,320683,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Gauntlets of the Black Ritual'),
(3160006,380100,0,0,0,1,1,1,1,'Generated map_70_difficulty_0 boss_000553 | Corrupted Bone of Ebon Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6910 AND `Item` = 1 AND `Reference` = 3160000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6910,1,3160000,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000547');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4847 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4847,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4848 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4848,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4849 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4849,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4850 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4850,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4851 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4851,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4852 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4852,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4853 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4853,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4855 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4855,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4860 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4860,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4861 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4861,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4863 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4863,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6907 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6907,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6908 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6908,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7012 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7012,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7022 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7022,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7023 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7023,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7030 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7030,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7175 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7175,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7290 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7290,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7320 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7320,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7321 AND `Item` = 1 AND `Reference` = 3160001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7321,1,3160001,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6906 AND `Item` = 1 AND `Reference` = 3160002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6906,1,3160002,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000548');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7228 AND `Item` = 1 AND `Reference` = 3160003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7228,1,3160003,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000549');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7206 AND `Item` = 1 AND `Reference` = 3160004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7206,1,3160004,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000551');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7291 AND `Item` = 1 AND `Reference` = 3160005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7291,1,3160005,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000552');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4854 AND `Item` = 1 AND `Reference` = 3160006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4854,1,3160006,2,0,1,0,1,1,'Generated encounter attachment | map_70_difficulty_0 | boss_000553');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3170000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3170000,240134,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Shieldguard''s Mantle of the Frozen Crown'),
(3170000,240269,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Cinch of Dragon Crown'),
(3170000,240481,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Legwraps, Nether Dawn'),
(3170000,240617,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Razor-edged Wrap of the Fel Ritual'),
(3170000,240673,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Worldworn Cap'),
(3170000,280812,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Stormforged Wrap'),
(3170000,340267,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Dragonstalker''s Charm'),
(3170000,340405,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Windkeeper''s Pants of the Stormwind Keep'),
(3170000,360120,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Shoulder Cape of Titan Vault'),
(3170000,360501,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Duskwarden''s Unhallowed Promise'),
(3170000,380353,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000378 | Headdress of the Fallen Lord');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3170001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3170001,200015,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Consecrated Warhelm'),
(3170001,200073,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Chausses of Shadow Vault'),
(3170001,200077,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Lost Knight''s Primeval Headguard'),
(3170001,200096,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ivory Casque of the Silent Road'),
(3170001,200122,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Northwind Bone Crossbow'),
(3170001,200164,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | War Leggings, Crypt Reckoning'),
(3170001,200196,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bloodfang Hand Waistchain'),
(3170001,200223,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wildcaller''s Gloves'),
(3170001,200251,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Fanged Treads'),
(3170001,200309,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Archmage''s Coif of the Bear Spirit'),
(3170001,200331,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Last King''s Casque'),
(3170001,200333,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Desecrated War Leggings of the Grim King'),
(3170001,200381,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Deathwarden''s Boots of the Prime Design'),
(3170001,200453,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Great Cape of the Thunder Forge'),
(3170001,200468,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Crimson Shot Casque'),
(3170001,200520,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Gauntlets of Golden Dawn'),
(3170001,200545,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Ashen Footguards'),
(3170001,200591,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Rimeforged Waistchain of the Frozen King'),
(3170001,200738,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wristguards, Dream Spirit'),
(3170001,200988,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Hand Cleaver of Ebon Flame'),
(3170001,220000,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Calm Medallion'),
(3170001,220034,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Frost Queen''s Gloves of the Ivory Crown'),
(3170001,220069,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Scourge Wolf Legmail'),
(3170001,220181,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Frost Queen''s Darkforged Armguards'),
(3170001,220211,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Vrykul Seal'),
(3170001,220236,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Eternal Chestguard of the Golden Dawn'),
(3170001,220258,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | First Knight''s Torc'),
(3170001,220263,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Deathcaller''s Cerulean Great Hauberk'),
(3170001,220320,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Belt of the Black Temple'),
(3170001,220328,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Rimeforged Warcloak of Hallowed Watch'),
(3170001,220346,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Engraved Wristguards'),
(3170001,220359,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Nightwatcher''s Coif'),
(3170001,220395,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Coif of Twilight Reach'),
(3170001,220435,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Headguard of the Ebon Pact'),
(3170001,220485,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ironbound Warbelt of the Crimson Dawn'),
(3170001,220504,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Abyss Ripper Fingerband'),
(3170001,220549,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Armored Chain'),
(3170001,220598,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Baleful Surcoat of Sun Crown'),
(3170001,220839,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stormwrought Chestguard of Icecrown'),
(3170001,220847,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ghostcaller''s Everfrost Neckguard'),
(3170001,220878,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Night Leaf Leggings'),
(3170001,220951,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Coin of Iron Banner'),
(3170001,220959,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Coif, Bright Cry'),
(3170001,220976,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Brilliant Chestguard of Scourge Lord'),
(3170001,240025,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Harness of the Celestial Gate'),
(3170001,240119,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Footguards, Void Spire'),
(3170001,240145,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Valiant Talisman'),
(3170001,240157,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Faithful Nightcloak of the Scholomance'),
(3170001,240213,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Frozen King''s Unquiet Bindings'),
(3170001,240291,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Boots of the Scarlet Keep'),
(3170001,240387,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Everfrost Clasp'),
(3170001,240438,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Carapace of the Mystic Gate'),
(3170001,240440,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Eternal Lance'),
(3170001,240464,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stormkeeper''s Dire Execution Blade'),
(3170001,240479,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulderpads, South Ice'),
(3170001,240515,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cinch of Death Rise'),
(3170001,240602,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cursed Harpoon'),
(3170001,240641,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Winterborn Trousers of Broken Road'),
(3170001,240678,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Forsworn Crystal, Brightwarden''s Oath'),
(3170001,240725,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bloodcaller''s Jerkin'),
(3170001,240727,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulder Drape of the Ebon Banner'),
(3170001,240753,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulderwraps of Pit of Saron'),
(3170001,240785,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Icecaller''s Waistguard of the Makers Hand'),
(3170001,240820,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Harness of Dawn Light'),
(3170001,240875,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Drakescale Charm of the Azjol Nerub'),
(3170001,240891,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Nerubian Great Cape'),
(3170001,240963,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Armorsmith''s Warcloak'),
(3170001,260058,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Duskbound Cowl'),
(3170001,260063,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Firecaller''s Wristguards'),
(3170001,260076,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Warden''s Trousers of the Wyrm Forge'),
(3170001,260081,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wristguards, Scarlet Spire'),
(3170001,260082,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Duskkeeper''s Glacial Shoulderpads'),
(3170001,260089,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Treads of Ancient Storm'),
(3170001,260099,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Sanctified Fingerband'),
(3170001,260123,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Rune Queen''s Girdle of the Bone Gate'),
(3170001,260150,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cap of the Sacred Dawn'),
(3170001,260258,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Warden Wristguards'),
(3170001,260312,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Girdle, Long Whisper'),
(3170001,260376,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Scale-bound Shoulderguards'),
(3170001,260385,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Dwarven Jerkin'),
(3170001,260447,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Primal Pendant Chain'),
(3170001,260456,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Rimebound Wargrips'),
(3170001,260479,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Polished Cowl of Forgotten Memory'),
(3170001,260508,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Tempered Wristguards, Darkwarden''s Oath'),
(3170001,260642,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Spellforged Mask'),
(3170001,260662,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stormforged Wristbands of the Titan Vault'),
(3170001,260665,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulderguards of Violet Hold'),
(3170001,260701,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Breeches of Altar of Sseratus'),
(3170001,260731,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Striders of Star Crown'),
(3170001,260746,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Pale-blue Boots, Battlelord''s Oath'),
(3170001,260771,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Thorn Doom Battle Mace'),
(3170001,260834,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Carver of Frozen Memory'),
(3170001,260919,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Doomforged Chestguard'),
(3170001,260926,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bindings of Silver Watch'),
(3170001,260956,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Fireforged Key'),
(3170001,260980,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Wildwoven Girdle'),
(3170001,280003,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wolf Rebuke Rod'),
(3170001,280033,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stonekeeper''s Gloves'),
(3170001,280061,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoes of Pale King'),
(3170001,280111,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Frozen Key'),
(3170001,280166,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Azure Diadem of the Storm Spirit'),
(3170001,280257,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Spirit Staff of Ancient Oak'),
(3170001,280272,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Witchcaller''s Umbral Brooch'),
(3170001,280294,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Battlesage''s Breeches'),
(3170001,280309,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cowl of the Dread Crown'),
(3170001,280339,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Furious Waistwrap of Bronze Dragon'),
(3170001,280340,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Drape of the Star Watch'),
(3170001,280392,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Mantle of the Ancient Grove'),
(3170001,280464,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips of Sky King'),
(3170001,280527,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Storm Wrath Treads'),
(3170001,280539,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Scarlet Glacier Walking Staff'),
(3170001,280545,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Forgeblessed Branch of the Light Watch'),
(3170001,280586,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Dreamkeeper''s Austere Lens'),
(3170001,280590,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Rootbound Vestments'),
(3170001,280597,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulderwraps of Emerald Star'),
(3170001,280610,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips of Violet Gate'),
(3170001,280788,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Stormscarred Graspers'),
(3170001,280851,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Footwraps, Azure Forge'),
(3170001,280884,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Regalia of Blackened Sky'),
(3170001,280891,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Unyielding Figurine of Frozen Memory'),
(3170001,280899,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wolfheart Flare Vest'),
(3170001,280997,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Charm, Bone Quarrel'),
(3170001,320009,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Lost Queen''s Scepter'),
(3170001,320036,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Brilliant Iron Axe of Golden Dawn'),
(3170001,320128,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulderpads, Stormshard Mark'),
(3170001,320183,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Tombbound Shoulderwraps'),
(3170001,320293,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Star Helm Scarab'),
(3170001,320302,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ash Light Mirror'),
(3170001,320364,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Legwraps, Shield Doom'),
(3170001,320397,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ring, Wolf Reaver'),
(3170001,320433,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stonekeeper''s Trousers'),
(3170001,320468,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Pale-blue Shoulderguards'),
(3170001,320526,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips, Holy Tooth'),
(3170001,320534,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Warforged Armguards of Ancient Watch'),
(3170001,320701,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Gloves, Spirit Whisper'),
(3170001,320709,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Steadfast Waistguard'),
(3170001,320782,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Harness of Dark Moon'),
(3170001,320805,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cap, Abyss Strike'),
(3170001,320872,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Unholy Scale'),
(3170001,340020,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Resolute Circlet of the Dragon Guard'),
(3170001,340049,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Tiara, Sky Creed'),
(3170001,340050,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ironkeeper''s Drape'),
(3170001,340061,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Dusty Sash of Ebon Vanguard'),
(3170001,340102,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Nightmare Robes'),
(3170001,340161,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Runewarden''s Longcloak of the Wild Grove'),
(3170001,340180,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Walkers, Cold Ash'),
(3170001,340274,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoulder Cape of Coldarra'),
(3170001,340572,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Breeches of the Light Crown'),
(3170001,340577,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Circlet, Nightfang Grave'),
(3170001,340616,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Duskbound Skinner'),
(3170001,340660,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Legwraps, Dragon Fall'),
(3170001,340686,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Ancestral Signet'),
(3170001,340744,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Falcon Singer Vestments'),
(3170001,340758,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Cursed Cap'),
(3170001,340792,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Doomed Scepter of the Storm Pact'),
(3170001,340839,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Hoop of the Argent Tournament'),
(3170001,340961,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Dusk Howl Tunic'),
(3170001,340972,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Austere Pendant of Thunder Bluff'),
(3170001,360048,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Charm of the Last King'),
(3170001,360065,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bloodstained Shoulder Cape of Star Caller'),
(3170001,360074,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Blessed Raiment of the Valiance Keep'),
(3170001,360103,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Robes of Wyrm King'),
(3170001,360117,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Warpriest''s Footwraps'),
(3170001,360162,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Lost King''s Forgeblessed Shoulderwraps'),
(3170001,360219,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Epaulets, Spell Punch'),
(3170001,360304,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Loop, Deep Dirge'),
(3170001,360313,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Baneful Edge'),
(3170001,360352,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Tunic, Titan Bloom'),
(3170001,360438,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Waistband of the Ebon Vanguard'),
(3170001,360492,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Skull Oath Shoulder Drape'),
(3170001,360546,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Sanctified Boots, Gravewarden''s Oath'),
(3170001,360685,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Regalia of the Autumn Wind'),
(3170001,360740,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Blacksmith''s Fetish of the Stormwind Keep'),
(3170001,360828,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Warped Kilt'),
(3170001,360833,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Wintersteel Footwraps of the Zul Drak'),
(3170001,360902,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Goldsteel Skullcap of the Winter Watch'),
(3170001,360944,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Argent Templar''s Rune Band'),
(3170001,360989,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Shoes of Blade Edge'),
(3170001,360995,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | The Stormwrought Regalia'),
(3170001,360997,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Spider Vow Great Stave'),
(3170001,380058,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Titan Keeper''s Collar'),
(3170001,380070,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Colossal Maul, Lost Death'),
(3170001,380129,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Stalkers of Unquiet King'),
(3170001,380179,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips of Crypt Watch'),
(3170001,380228,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Strap, Plague Grave'),
(3170001,380303,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Ironlord''s Dragonsteel Skinner'),
(3170001,380326,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Clutches of Dalaran Watch'),
(3170001,380466,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips of the Karazhan'),
(3170001,380641,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bloodbound Legwraps of the Storm Spirit'),
(3170001,380683,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Grips of Silver Hand'),
(3170001,380756,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Warlord''s Loop'),
(3170001,380767,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Spellforged Legguards of Blue Dragon'),
(3170001,380852,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Forgekeeper''s Leggings of the Crypt Watch'),
(3170001,380854,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Frost King''s Undying Cinch'),
(3170001,380860,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Promise of Winter Crown'),
(3170001,380862,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Armorsmith''s Token'),
(3170001,380915,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Soulfire Cold Helm'),
(3170001,380984,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Bracers of the Rime Crown'),
(3170001,380986,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 trash | Deepforged Clutches of Frozen Halls');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3170002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3170002,200433,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Manaforged Legguards of Wild Spirit'),
(3170002,220256,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Helm, Obsidian Winter'),
(3170002,220281,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Ancestral Cape'),
(3170002,220472,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | The Bloodbound Token'),
(3170002,220786,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | War Leggings of the Onslaught Harbor'),
(3170002,240412,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Cap of Sons of Hodir'),
(3170002,240755,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Gray Howl Strap'),
(3170002,240918,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Footguards, Bitter Vine'),
(3170002,260013,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Circle of Arcane Moon'),
(3170002,260310,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Seal of Grim Dawn'),
(3170002,280616,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Mournbound Signet, Northman''s Oath'),
(3170002,280872,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Lost Queen''s Capelet'),
(3170002,320286,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Crusader''s Helm of the Blue Flame'),
(3170002,320842,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Sky Flare Armguards'),
(3170002,320883,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Dreamwoven Guard of the Azure Flame'),
(3170002,340911,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Stormcaller''s Greatcloak'),
(3170002,360793,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Frozen Knight''s Sword'),
(3170002,380552,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000380 | Voidcaller''s Maul of the Searing Gorge');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3170003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3170003,200449,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | First Queen''s Gray Handguards'),
(3170003,200876,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Spell Snow Necklace'),
(3170003,220758,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Wildkeeper''s Casque'),
(3170003,220833,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | The Glittering Footguards'),
(3170003,240022,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Cap of High Watch'),
(3170003,240249,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Scarlet Inquisitor''s Frost-rimed Mantle'),
(3170003,240877,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Earthkeeper''s Walkers of the Blood Memory'),
(3170003,260105,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Legguards of the Grim Watch'),
(3170003,260404,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Waistband of Silver Banner'),
(3170003,280715,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Sash, Sky Sorrow'),
(3170003,280761,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Spear Reaver Vestments'),
(3170003,280770,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Warsage''s Graveforged Trousers'),
(3170003,280829,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | The Warlord Graspers'),
(3170003,340500,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Old Keeper''s Skullforged Mitts'),
(3170003,340978,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Wolfguard''s Cuffs'),
(3170003,360080,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Sacred Runebands'),
(3170003,360272,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Runebands of the Star Grove'),
(3170003,360753,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Emberwarden''s Gloves'),
(3170003,380093,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Sorrowful Chestguard of Light Crown'),
(3170003,380525,0,0,0,1,1,1,1,'Generated map_90_difficulty_0 boss_000381 | Stormcaller''s Silent Chestpiece');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7079 AND `Item` = 1 AND `Reference` = 3170000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7079,1,3170000,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | boss_000378');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6206 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6206,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6207 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6207,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6211 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6211,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6212 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6212,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6218 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6218,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6219 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6219,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6220 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6220,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6223 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6223,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6224 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6224,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6225 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6225,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6226 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6226,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6227 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6227,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6228 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6228,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6230 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6230,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6232 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6232,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6233 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6233,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6234 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6234,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6329 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6329,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6391 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6391,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6392 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6392,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6407 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6407,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7603 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7603,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7849 AND `Item` = 1 AND `Reference` = 3170001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7849,1,3170001,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6235 AND `Item` = 1 AND `Reference` = 3170002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6235,1,3170002,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | boss_000380');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6229 AND `Item` = 1 AND `Reference` = 3170003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6229,1,3170003,2,0,1,0,1,1,'Generated encounter attachment | map_90_difficulty_0 | boss_000381');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3180000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3180000,200613,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Carapace of the Silent Crown'),
(3180000,200619,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Last Warden''s Starforged Brooch'),
(3180000,200732,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Emberkeeper''s Greaves of the Death Lord'),
(3180000,220116,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Drakecaller''s Greaves'),
(3180000,220921,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Girdle of the Scarlet Monastery'),
(3180000,220960,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Spear Grasp Legguards'),
(3180000,240439,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Treads of the Walking Dead'),
(3180000,240562,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Dawnforged Long Crossbow of the Dusk Watch'),
(3180000,240846,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Belt of Emerald Dream'),
(3180000,240946,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | The Brutal Shortbow'),
(3180000,260196,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Tunic, Dread Decree'),
(3180000,260336,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | The Sanctified Waistband'),
(3180000,260420,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Wyrmwarden''s Graveforged Pants'),
(3180000,260646,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Coldfire Knightblade of Old Road'),
(3180000,260761,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Nightmare Strap'),
(3180000,260905,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | North Dream Pendant Chain'),
(3180000,260925,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Seal Ring, Ivory Piercer'),
(3180000,280006,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Grim Echo Trousers'),
(3180000,280120,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Sash, Blade Shadow'),
(3180000,280225,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Earthcaller''s Splintered Waistband'),
(3180000,280385,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Spirit Spire Sash'),
(3180000,280963,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Violet Treads of the Frenzyheart Hill'),
(3180000,320276,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Wyrm Edge Backcloth'),
(3180000,320368,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Chainmail of Lost Road'),
(3180000,320615,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Rimekeeper''s Runic Wargrips'),
(3180000,340771,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Vigilant Pants of the Gundrak'),
(3180000,360286,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Scourge Dawn Compass'),
(3180000,360672,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Wildcaller''s Scepter'),
(3180000,360805,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Mitts, Steel Ice'),
(3180000,380117,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Shoulderpads of Bone March'),
(3180000,380330,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Spiritforged Wristbands of Red Dragon'),
(3180000,380359,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Jerkin of Wind Spirit'),
(3180000,380428,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Spellbinder''s Band of the Soul Crown'),
(3180000,380502,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | First Keeper''s Wristbands'),
(3180000,380715,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | Battlemage''s Bonebound Carapace'),
(3180000,380967,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000485 | South Storm Claws');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3180001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3180001,200002,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Gorget of Dragon Forge'),
(3180001,200079,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wildbound Sabatons'),
(3180001,200140,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nameless Warden''s Cuirass'),
(3180001,200183,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Kingsworn Warblade of the Crimson Dawn'),
(3180001,200261,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spellforged Pauldrons of Blackened Sky'),
(3180001,200272,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Furious Longcloak of Lich King'),
(3180001,200277,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deathbound Greaves, Gravekeeper''s Oath'),
(3180001,200288,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Armguards, Rune Singer'),
(3180001,200357,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Greaves of the Frost Queen'),
(3180001,200376,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warped Cloak of the Ancient Memory'),
(3180001,200384,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Everfrost Visor'),
(3180001,200387,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Deathforged Battle Girdle'),
(3180001,200389,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sainted Signet of the Void Watch'),
(3180001,200403,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Armguards, Eternal Bane'),
(3180001,200425,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Hammerlord''s Earthen-forged War Leggings'),
(3180001,200429,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ashwarden''s Helm of the Titan Pact'),
(3180001,200430,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Argent Knight''s Nightsteel Warbelt'),
(3180001,200432,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Sunhallowed Rider Blade'),
(3180001,200486,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ironclad Stone of Dragon Throne'),
(3180001,200507,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Boneguard''s War Greaves of the Death Lord'),
(3180001,200523,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Worldwarden''s Beads'),
(3180001,200524,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bloodforged Gorget'),
(3180001,200537,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Waistguard of the Unquiet King'),
(3180001,200539,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Winterguard''s Charm of the Astral Gate'),
(3180001,200540,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warscarred Sabatons of the Ghost Watch'),
(3180001,200576,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Charmstone of the Final Dawn'),
(3180001,200587,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ferocious Wristplates of the Hidden Vault'),
(3180001,200611,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Visor of Argent Vanguard'),
(3180001,200633,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legplates, Wolf Shine'),
(3180001,200679,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | War Pauldrons of Storm King'),
(3180001,200699,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Blademaster''s Legguards'),
(3180001,200714,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rimelord''s Cuirass of the Bone Throne'),
(3180001,200726,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Titan King''s Runeforged Great Gauntlets'),
(3180001,200733,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Argent Flame Feather'),
(3180001,200768,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Spellforged Highblade'),
(3180001,200773,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legplates, Soulfire Wake'),
(3180001,200775,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Fingerband of Broken Gate'),
(3180001,200818,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wolfhide Footplates of the Endless March'),
(3180001,200869,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deepfrost Chestplate of the Bone Lord'),
(3180001,200942,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sunblessed Pauldrons'),
(3180001,200965,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runeforged Greathelm'),
(3180001,200984,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Crimson Eye'),
(3180001,220001,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soulcaller''s Wintertouched Pavise'),
(3180001,220004,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Crimson Footplates'),
(3180001,220037,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wild Mantle of Iron Council'),
(3180001,220045,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sollerets of the Oculus'),
(3180001,220051,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Goldbound Battleplate Legguards'),
(3180001,220057,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ancestor''s Shawl of the Mage Lord'),
(3180001,220062,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wolfguard''s Prayerbound Gauntlets'),
(3180001,220199,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soul Roar Great Cape'),
(3180001,220205,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Blessed Battleplate Legguards, Seer''s Oath'),
(3180001,220212,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Savage War Pauldrons of the Storm Queen'),
(3180001,220226,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Deathbound Greaves'),
(3180001,220293,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Devout Great Pauldrons of Borean Expanse'),
(3180001,220333,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Arcanized Battlehelm of the Rune Watch'),
(3180001,220375,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Reinforced Bracers'),
(3180001,220394,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Stormguard''s Faded Bracers'),
(3180001,220406,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rune-carved Greaves of Endless Vigil'),
(3180001,220446,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Drakekeeper''s Brutish Gauntlets'),
(3180001,220453,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Vambraces of the Dark Moon'),
(3180001,220456,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Footplates of Stone King'),
(3180001,220465,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Armored Carapace'),
(3180001,220466,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Fearsome Breastplate'),
(3180001,220491,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Forgeblessed Great Pauldrons'),
(3180001,220513,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legguards of Brunnhildar Village'),
(3180001,220527,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Dawnsteel Warbelt'),
(3180001,220528,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bloodknight''s Greatcloak'),
(3180001,220590,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Breastplate of the Crimson Flame'),
(3180001,220605,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Witchbound Handguards'),
(3180001,220649,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Titanwarden''s Glittering Footplates'),
(3180001,220660,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Orb, Pale Doom'),
(3180001,220697,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shroud, Fel Hunter'),
(3180001,220765,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Great Pauldrons of Dread Crown'),
(3180001,220769,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dread Mail Emblem'),
(3180001,220779,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lost King''s Crimson War Leggings'),
(3180001,220782,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Wolfmarked Warbelt'),
(3180001,220819,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Defiant Bearded Axe of the Zangarmarsh'),
(3180001,220820,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Circle of Silent Crypt'),
(3180001,220832,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Pike, Crypt Gloom'),
(3180001,220851,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frost King''s Legplates of the Moon Grove'),
(3180001,220854,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Battle Girdle, Coldfire Knuckle'),
(3180001,220901,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Silvered Oathring'),
(3180001,220905,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Voulge of the Wind Crown'),
(3180001,220919,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Winterlord''s Armguards of the Wolf Spirit'),
(3180001,220920,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shattered Breastplate'),
(3180001,220922,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scarlet Inquisitor''s Frozen Warband'),
(3180001,220927,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Armplates of the Black Harvest'),
(3180001,220944,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ebon Knight''s Band of the Wintergrasp'),
(3180001,220985,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Iron Boots, Long Scream'),
(3180001,220994,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Siegebound Pauldrons'),
(3180001,240007,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Windcaller''s Starwoven Bracers'),
(3180001,240034,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Titan-carved Wrist Chains'),
(3180001,240065,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Plagueforged Greaves'),
(3180001,240109,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bronzed Armguards of the Golden Flame'),
(3180001,240118,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Doomforged War Mantle of Final March'),
(3180001,240194,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Helm of Dead Memory'),
(3180001,240217,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Fingerband of Ebon March'),
(3180001,240224,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shadowcaller''s Waistguard'),
(3180001,240232,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Duskwarden''s Wolfbound Chestguard'),
(3180001,240244,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Starcaller''s Helm of the Deep Hall'),
(3180001,240270,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Arcane Headguard of Valgarde'),
(3180001,240296,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shieldbearer''s Frozen Boots'),
(3180001,240301,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Moon Queen''s Boneclad Repeating Rifle'),
(3180001,240302,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Crusader Capelet of the Borean Tundra'),
(3180001,240309,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Stormguard''s Torque of the Eagle Spirit'),
(3180001,240318,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Silent Glacier Shoulder Guards'),
(3180001,240330,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frozen Warden''s Leggings'),
(3180001,240346,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Charm, Sunfire Reaver'),
(3180001,240348,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Aged Leggings of Light Watch'),
(3180001,240350,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lost Queen''s Coldhearted Harness'),
(3180001,240428,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Chillborn War Axe'),
(3180001,240437,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Unyielding Backcloth of Forgotten King'),
(3180001,240490,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Starfang Singer Handguards'),
(3180001,240510,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Coif of the Ice Moon'),
(3180001,240520,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legmail, Holy Hymn'),
(3180001,240522,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deathcaller''s Virtuous Hauberk'),
(3180001,240523,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wrathful War Mantle'),
(3180001,240543,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Battlelord''s Tomahawk of the Storm Watch'),
(3180001,240564,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Beastbound Pendant'),
(3180001,240607,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runebow, Red Spell'),
(3180001,240636,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Waistguard of the Rimefang'),
(3180001,240649,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | War Mantle, Ash Ruin'),
(3180001,240662,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warchief''s Wristguards'),
(3180001,240674,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Darkcaller''s Carbine'),
(3180001,240676,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Luminous Treads'),
(3180001,240744,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | War Leggings of Frostwolf Clan'),
(3180001,240747,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lightwarden''s Hornbow of the Blood Memory'),
(3180001,240768,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Hearthkeeper''s Belt'),
(3180001,240792,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sunkeeper''s Brazen Grips'),
(3180001,240800,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Archmage''s Spaulders of the Burning Shadow'),
(3180001,240817,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Crimson Claw Charm'),
(3180001,240885,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rimecaller''s Girdle'),
(3180001,240983,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Bloodforged Legmail'),
(3180001,240993,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scale of Violet Eye'),
(3180001,240998,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dragonforged Beads'),
(3180001,260004,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dragonforged Circle'),
(3180001,260035,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warcaller''s Astral Legguards'),
(3180001,260039,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Merciless Shoulderpads of Hidden King'),
(3180001,260054,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ringlet of Sky Watch'),
(3180001,260070,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulderguards, Holy Legacy'),
(3180001,260078,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Hammered Battle Claw of Utgarde Pinnacle'),
(3180001,260087,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | South Thirst Wristguards'),
(3180001,260097,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dragoncaller''s Kingsblade'),
(3180001,260127,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Walkers, Bleak Reaver'),
(3180001,260145,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Thornwoven Bracers of Dragon Forge'),
(3180001,260146,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rimecaller''s Wristguards'),
(3180001,260167,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Windcaller''s Pale-blue Bracers'),
(3180001,260178,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Heroic Mantle of Dark Star'),
(3180001,260180,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Tooth of Burning Sky'),
(3180001,260182,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Relentless Pendant of Amphitheater'),
(3180001,260191,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Chestguard of Astral Watch'),
(3180001,260207,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ghoststeel Jerkin of the Iron Gate'),
(3180001,260209,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Firecaller''s Ripper'),
(3180001,260221,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runewarden''s Striders'),
(3180001,260246,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Gleaming Vest'),
(3180001,260247,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scourged Medallion'),
(3180001,260295,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Prayerbound Footguards'),
(3180001,260301,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Sunlit Fang'),
(3180001,260308,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Seal, Bright Slayer'),
(3180001,260315,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rune Anvil Wargrips'),
(3180001,260316,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Headdress of Dawn Star'),
(3180001,260359,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ashen Wristbands'),
(3180001,260362,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Titan Promise Waistguard'),
(3180001,260364,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runewoven Shoulderpads, Battlemage''s Oath'),
(3180001,260433,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Waistband of the Divine Watch'),
(3180001,260437,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lost Keeper''s Legguards of the Dread March'),
(3180001,260461,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warped Jerkin of Divine Watch'),
(3180001,260469,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ebon Warden''s Footguards'),
(3180001,260472,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ring of the Wintergarde'),
(3180001,260494,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Skyforged Claws'),
(3180001,260498,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sky Hunter Breeches'),
(3180001,260513,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spellbinder''s Cap'),
(3180001,260529,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Mooncaller''s Clutches of the Pale King'),
(3180001,260535,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Mystic Gloves of Stone Watch'),
(3180001,260542,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scarlet Templar''s Knuckles'),
(3180001,260574,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Fanged Brand'),
(3180001,260575,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Manaforged Waistguard'),
(3180001,260592,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Leggings of Scarlet Bastion'),
(3180001,260625,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shadowsteel Chestguard'),
(3180001,260644,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spaulders of the Winter Court'),
(3180001,260654,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runeforged Claws of Golden Dawn'),
(3180001,260673,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Jerkin of Ice Crown'),
(3180001,260679,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nether Thorn Neckguard'),
(3180001,260711,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sunforged Shoulderpads of Frozen Banner'),
(3180001,260717,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dawnsteel Claws of Ancient Pact'),
(3180001,260720,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Icebound Armguards of the Rime Forge'),
(3180001,260739,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Moon Queen''s Harness'),
(3180001,260767,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Emberwrought Promise'),
(3180001,260789,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Long Piercer Ring'),
(3180001,260799,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runed Pants of Hallowed Flame'),
(3180001,260817,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cerulean Gemmed Band of Wintergarde'),
(3180001,260850,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warband of the Frostborn'),
(3180001,260866,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Sunhallowed Belt'),
(3180001,260889,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ancient Knight''s Headguard'),
(3180001,260893,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runed Talisman of the Silver Hand'),
(3180001,260895,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Highkeeper''s Eternal Harness'),
(3180001,260912,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Calm Spaulders of the Titan Watch'),
(3180001,260939,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rugged Striders'),
(3180001,280063,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dragonkeeper''s Stone'),
(3180001,280137,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Northforged Footwraps of Storm Oath'),
(3180001,280152,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ghost Shard Walkers'),
(3180001,280155,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Plaguekeeper''s Ironclad Seal'),
(3180001,280185,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Wyrmlord''s Cowl'),
(3180001,280211,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | South Fist Graspers'),
(3180001,280223,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Coin of Black Dragon'),
(3180001,280227,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Sacred Rod'),
(3180001,280243,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Armored Vest of Lich King'),
(3180001,280264,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Skullcrusher of Thunder Watch'),
(3180001,280371,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scarlet Mantle'),
(3180001,280391,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deathknight''s Rugged Mitts'),
(3180001,280396,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Old Graspers of Wild Spirit'),
(3180001,280405,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Moonforged Kilt, Earthcaller''s Oath'),
(3180001,280415,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Regalia of Titan Watcher'),
(3180001,280430,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Blood Woe Cuffs'),
(3180001,280474,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dreamcaller''s Binding'),
(3180001,280508,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scourgeforged Brooch of Deep Vault'),
(3180001,280552,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Draconic Pendant of Drowned Hall'),
(3180001,280571,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Winterborn Graspers of Ebon Banner'),
(3180001,280609,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rune Band of Warsong Clan'),
(3180001,280615,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Stormcaller''s Warborn Insignia'),
(3180001,280625,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Embercaller''s Bindings'),
(3180001,280646,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bright Shard Footwraps'),
(3180001,280671,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Archmage Staff, Obsidian Flame'),
(3180001,280735,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Kingsworn Druid Staff of the Demon Watch'),
(3180001,280741,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Pants of the Celestial Gate'),
(3180001,280750,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sun Queen''s Ringlet'),
(3180001,280755,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Graspers of Violet Watch'),
(3180001,280757,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Skirt of Frost Moon'),
(3180001,280768,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Robe of Titan Watch'),
(3180001,280782,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Jeweled Lens of the Searing Gorge'),
(3180001,280783,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frostforged Circlet of Brunnhildar Village'),
(3180001,280840,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rangemaster''s Moonwoven Sash'),
(3180001,280853,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cowl of the Wild Heart'),
(3180001,280898,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Seer Staff of Midnight Moon'),
(3180001,280918,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ashen Skullcap'),
(3180001,280923,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Far Shot Vestments'),
(3180001,280948,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Walkers, Eagle Spire'),
(3180001,280999,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ring, Bear Grave'),
(3180001,320012,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Ghoststeel Chain'),
(3180001,320015,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Fierce Girdle of the Distant Memory'),
(3180001,320042,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Silver Queen''s Brazen War Leggings'),
(3180001,320089,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spellforged Leggings of Emerald Wilds'),
(3180001,320116,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scarlet Marshal''s Choker of the Storm King'),
(3180001,320135,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ghoststeel Battle Mace of Sky King'),
(3180001,320175,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Tombbound Amulet of Wildhammer Clan'),
(3180001,320200,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulder Guards, Sunfire Bite'),
(3180001,320202,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Darksteel Cape of Nameless Dead'),
(3180001,320220,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Rune Band of Dragon Queen'),
(3180001,320240,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nightcloak of the Grizzlemaw'),
(3180001,320278,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deepfrost Bracers of the Ghost Watch'),
(3180001,320279,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forgotten King''s Mantle'),
(3180001,320296,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulderguards, Spirit Banner'),
(3180001,320319,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legguards, Necro Vow'),
(3180001,320353,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Drake Ember Mace'),
(3180001,320381,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frostbound Girdle'),
(3180001,320386,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Chausses, Bitter Vow'),
(3180001,320418,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Golden Mail of the Emerald Grove'),
(3180001,320435,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Crusader''s Wyrmhide Waistchain'),
(3180001,320446,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warhelm of the Broken Spear'),
(3180001,320478,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ivory Legguards, Bearwarden''s Oath'),
(3180001,320482,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Crook of Winter Memory'),
(3180001,320532,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Steadfast Wristguards of the Ebon Blade'),
(3180001,320543,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Belt of Light Eternal'),
(3180001,320574,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Starsteel Leggings of the Great Wolf'),
(3180001,320646,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Thunderforged Gloves of the Ancient Storm'),
(3180001,320668,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulder Guards of the Hallowed Flame'),
(3180001,320674,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soul Fist Coil'),
(3180001,320691,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forgotten King''s Vambraces'),
(3180001,320693,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frostwarden''s Wildforged Legmail'),
(3180001,320706,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Leafwoven Armguards of Makers Vault'),
(3180001,320738,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Prayerbound Mail of the Howling Fjord'),
(3180001,320904,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deathknight''s Ebon Bodkin'),
(3180001,320913,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Brilliant Charmstone of the Far North'),
(3180001,320918,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lightkeeper''s Mark of the Stone Crown'),
(3180001,320924,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Scarlet Crusher, Bloodguard''s Oath'),
(3180001,320930,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warbelt, Soulshard Will'),
(3180001,320959,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Corroded Fetish'),
(3180001,320966,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dreamkeeper''s War Leggings'),
(3180001,340003,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulderwraps of Blackrock Mountain'),
(3180001,340008,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lightkeeper''s Brittle Gloves'),
(3180001,340019,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Great Cape of the Burning Sky'),
(3180001,340035,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runebound Royal Cloak'),
(3180001,340072,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dreadforged Longsword of the Blood Ritual'),
(3180001,340128,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ashcaller''s Cord'),
(3180001,340129,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Earthwoven Leggings'),
(3180001,340158,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Leggings, Gold Reaver'),
(3180001,340202,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Grave Flame Vest'),
(3180001,340204,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warsage''s Dragonbound Gemmed Band'),
(3180001,340211,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ironthane Binding of Mimiron Forge'),
(3180001,340213,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Tempered Runering of the Sunwell'),
(3180001,340294,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Greatcloak of the Undercity Depths'),
(3180001,340311,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Purified Regalia of the Conquest Hold'),
(3180001,340323,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Skullforged Epaulets'),
(3180001,340324,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forgekeeper''s Arctic Cord'),
(3180001,340359,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sainted Skirt of the Golden Flame'),
(3180001,340373,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Titan King''s Blazing Sash'),
(3180001,340439,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Darkrider''s Starlit Vest'),
(3180001,340516,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runemarked Shoulderwraps of Silent King'),
(3180001,340521,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Razor-edged Boots of Bone Lord'),
(3180001,340564,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoes, Abyss Roar'),
(3180001,340595,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Abyss Storm Hoop'),
(3180001,340617,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forgotten Queen''s Cinch'),
(3180001,340648,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Raven Rune Boots'),
(3180001,340694,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Highlord''s Icetouched Skirt'),
(3180001,340740,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soulshard Ritual Promise'),
(3180001,340745,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warlord''s Scourged Veil'),
(3180001,340797,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spirit Staff, Red Freeze'),
(3180001,340801,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Frostscarred Promise'),
(3180001,340817,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ironlord''s Barbed Binding'),
(3180001,340821,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Sable Ember Kilt'),
(3180001,340889,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Stormcaller''s Gloves of the Great Bear'),
(3180001,340898,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lost Horn Mantle'),
(3180001,340910,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nether Forge Shoulderpads'),
(3180001,340912,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Handwraps of Dread Host'),
(3180001,340925,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runecaller''s Shoulderwraps'),
(3180001,340969,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Bitter Spellrod'),
(3180001,360021,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Twilight Oath Shoes'),
(3180001,360076,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forge Edge Cinch'),
(3180001,360084,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Witchkeeper''s Cuffs'),
(3180001,360105,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Thunderkeeper''s Royal Cuffs'),
(3180001,360146,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Earthbound Token of Ancient Grove'),
(3180001,360164,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Moonwarden''s Relic'),
(3180001,360167,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ironkeeper''s Trousers'),
(3180001,360190,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shoulder Cape of Drowned King'),
(3180001,360220,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cord of Shadow Vault'),
(3180001,360235,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Howling Kilt of Gundrak Temple'),
(3180001,360249,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Stonebound Diadem'),
(3180001,360255,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Shadowcaller''s Mantle'),
(3180001,360331,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nightcaller''s Rune Band of the Wyrmrest'),
(3180001,360382,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Blackguard''s Doomforged Great Stave'),
(3180001,360389,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lost Warden''s Boots of the Ruby Sanctum'),
(3180001,360401,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frostworn Mitts, Silver Queen''s Oath'),
(3180001,360414,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Dreaming Cowl'),
(3180001,360425,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Pants, Ancient Cold'),
(3180001,360431,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Runemaster''s Bloodforged Sandals'),
(3180001,360434,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cuffs, Crypt Sun'),
(3180001,360495,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Mooncaller''s Starwoven Locket'),
(3180001,360509,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Collar of the Pit of Saron'),
(3180001,360553,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Fallen Root Bindings'),
(3180001,360561,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Brassbound Shoulder Cape'),
(3180001,360562,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Timeworn Diadem of the Frozen Watch'),
(3180001,360574,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Hexing Rod of the Winter Forge'),
(3180001,360622,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Plaguewarden''s Hammered Graspers'),
(3180001,360645,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bleak Judgment Tunic'),
(3180001,360717,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Ghostly Waistband'),
(3180001,360728,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Spear Wake Regalia'),
(3180001,360731,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frostguard''s Stormscarred Waistband'),
(3180001,360750,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Deathly Binding, Wildkeeper''s Oath'),
(3180001,360778,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Battle Staff of the Altar of Sseratus'),
(3180001,360784,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Earthbound Brooch of Ancient Night'),
(3180001,360834,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Vestments of the Wild Watch'),
(3180001,360850,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ravenbound Cord, First Keeper''s Oath'),
(3180001,360853,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frozen Warden''s Bindings of the Death Rise'),
(3180001,360854,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Nameless Warden''s Manawoven Cord'),
(3180001,360857,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Headdress of Blood Ritual'),
(3180001,360870,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Worldforged Shoulderpads'),
(3180001,360910,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Binding of Silent Moon'),
(3180001,360937,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Last Knight''s Briarwoven Breeches'),
(3180001,360956,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Starbound Medallion of the Gundrak'),
(3180001,380050,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Frozen Queen''s Legguards'),
(3180001,380074,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Flamebound Longcloak'),
(3180001,380104,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Bloodcaller''s Mantle of the Moonwell'),
(3180001,380137,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Gleaming Gorget, Shadowguard''s Oath'),
(3180001,380143,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Waistguard, Wyrm Rebuke'),
(3180001,380167,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Ferocious Bindings'),
(3180001,380168,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Emberwrought Grips of the Cold Hearth'),
(3180001,380202,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Pants of the First King'),
(3180001,380204,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Ebon Heart Shaman Staff'),
(3180001,380263,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Mournful Spaulders of Wild Crown'),
(3180001,380274,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Coal-black Runering'),
(3180001,380291,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Striders of Endless Path'),
(3180001,380340,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soulcaller''s Tempered Jerkin'),
(3180001,380383,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | The Northforged Shawl'),
(3180001,380386,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cowl, Eternal Curse'),
(3180001,380488,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Saronite Waistband of Ivory Crown'),
(3180001,380532,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Waistband of the Amphitheater'),
(3180001,380645,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Warband of the Mage Lord'),
(3180001,380647,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Belt of the Shadow Vault'),
(3180001,380666,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Mask of Azure Moon'),
(3180001,380697,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Forsaken Heart'),
(3180001,380705,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Clublike Mace, White Night'),
(3180001,380717,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Blade Ray Breeches'),
(3180001,380789,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Cinch, Titan Fury'),
(3180001,380797,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Legguards, Ghost Starfall'),
(3180001,380808,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Flamekeeper''s Signet Ring'),
(3180001,380820,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Jeweled Harness, Ghostcaller''s Oath'),
(3180001,380876,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Soulforged Legguards of Second Dawn'),
(3180001,380937,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Starfang Anchor Trousers'),
(3180001,380987,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Broken Mark Armguards'),
(3180001,380997,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 trash | Lance, Bear Dancer');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3180002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3180002,200739,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Drakebound Helm of the Ancient Pact'),
(3180002,200930,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | The Stalwart Shawl'),
(3180002,220361,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Unquiet Star Warbracers'),
(3180002,220389,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Shoulder Drape, Ghostfire Vault'),
(3180002,240741,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Darkfire Banner Seal'),
(3180002,240871,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Watchful Spaulders of the Blighted Land'),
(3180002,260128,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | The Voidsteel Scepter'),
(3180002,260298,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Whitefrost Seal of the Grim King'),
(3180002,260361,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Ravenkeeper''s Cinch'),
(3180002,260763,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Runemaster''s Belt of the Dragonblight'),
(3180002,280214,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Wolfheart March Skirt'),
(3180002,280419,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Highlord''s Cap'),
(3180002,320162,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Sunsteel Gauntlets of the Winter Crown'),
(3180002,340611,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Moon Ward Seal Ring'),
(3180002,360232,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Armbands of K3'),
(3180002,360337,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | The Ghostly Mitts'),
(3180002,360808,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Shadowwarden''s Shoulderwraps'),
(3180002,360869,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000486 | Weathered Wristwraps of Drake Rider');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3180004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3180004,200198,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | War Axe, Green Edge'),
(3180004,200647,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Kingsworn Warhelm of the Bone Throne'),
(3180004,220058,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Armorsmith''s Warplate'),
(3180004,260200,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Coldfire Spear Signet'),
(3180004,260204,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Cap, East Lord'),
(3180004,260551,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Long Fall Legwraps'),
(3180004,280688,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000488 | Storm Queen''s Sorcerous Tiara');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3180007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3180007,200276,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Warbelt, West Decree'),
(3180007,200370,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Bright Helm Tablet'),
(3180007,200577,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Corroded Gauntlets'),
(3180007,220192,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Greatcloak of the Hidden Path'),
(3180007,220279,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Ironwarden''s Unhallowed Breastplate'),
(3180007,220373,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Crimson Medallion'),
(3180007,220411,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Old King''s War Greaves'),
(3180007,240106,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Veteran Warder Cloak'),
(3180007,240384,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Hardened Leggings, Duskwarden''s Oath'),
(3180007,240576,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Berserker Traveling Cloak of the Wyrmskull'),
(3180007,260069,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Boneclad Spaulders'),
(3180007,260303,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Unquiet Shoulderguards'),
(3180007,260314,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Necrotic Legguards'),
(3180007,260698,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Jerkin of Ebon Watch'),
(3180007,260738,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Shadowkeeper''s Wargrips'),
(3180007,260750,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Dreadbound Chestguard of Endless Night'),
(3180007,260753,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Sunsteel Choker'),
(3180007,260824,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Cap, Light Judgment'),
(3180007,280117,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Mantle of the Raven Court'),
(3180007,280192,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Leggings of the Raven Court'),
(3180007,280239,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Gloves of the Raven Court'),
(3180007,280402,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Cowl of the Raven Court'),
(3180007,280763,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Resolute Seal Ring of the Earthen King'),
(3180007,280830,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Robes of the Raven Court'),
(3180007,320000,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Soulbound Coil'),
(3180007,320138,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Northguard''s Rune-etched Ringlet'),
(3180007,320598,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Deepfrost Headguard of the Frozen Heart'),
(3180007,320678,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Casque of the Northern Forge'),
(3180007,320978,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Greatcloak of Pale King'),
(3180007,320989,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Broken War Mantle'),
(3180007,340144,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Sandals of Warsong Clan'),
(3180007,340167,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Pitiless Bindings'),
(3180007,340734,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Silver Breaker Spellknife'),
(3180007,360137,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Northborn Boots of Broken Blade'),
(3180007,360445,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Cruel Vestments'),
(3180007,360529,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Blessed Seal'),
(3180007,360790,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Clouded Circlet of the Blade Edge'),
(3180007,380392,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Stalkers of Ancient Thorn'),
(3180007,380685,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Old King''s Shadowforged Waistguard'),
(3180007,380833,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | The Carrion Armguards'),
(3180007,380900,0,0,0,1,1,1,1,'Generated map_109_difficulty_0 boss_000493 | Waistguard of Iron Gate');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8580 AND `Item` = 1 AND `Reference` = 3180000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8580,1,3180000,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | boss_000485');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5226 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5226,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5228 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5228,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5256 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5256,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5259 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5259,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5263 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5263,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5267 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5267,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5269 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5269,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5270 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5270,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5271 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5271,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5273 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5273,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5277 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5277,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5280 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5280,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5283 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5283,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5291 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5291,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5708 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5708,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5711 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5711,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5712 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5712,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5713 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5713,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5714 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5714,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5715 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5715,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5716 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5716,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5717 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5717,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8319 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8319,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8384 AND `Item` = 1 AND `Reference` = 3180001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8384,1,3180001,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5721 AND `Item` = 1 AND `Reference` = 3180002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5721,1,3180002,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | boss_000486');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5710 AND `Item` = 1 AND `Reference` = 3180004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5710,1,3180004,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | boss_000488');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5709 AND `Item` = 1 AND `Reference` = 3180007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5709,1,3180007,2,0,1,0,1,1,'Generated encounter attachment | map_109_difficulty_0 | boss_000493');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3190000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3190000,200278,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | Glasslike Pendant Chain'),
(3190000,200746,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | Bonekeeper''s Broad Axe'),
(3190000,320285,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | Last Ritual Legguards'),
(3190000,340364,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | The Serrated Runebands'),
(3190000,360326,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | Ice Shine Shoulderpads'),
(3190000,380886,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000435 | Dream Grave Grips');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3190001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3190001,200041,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Lost Queen''s Longcloak of the Iron Watch'),
(3190001,200061,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Duskcaller''s Blackened Band'),
(3190001,200137,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Royal Cloak, West Watch'),
(3190001,200146,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Great Hauberk, High Fist'),
(3190001,200177,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Frozen Keeper''s Silvered Hauberk'),
(3190001,200201,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Burial Leggings of the Alterac Mountains'),
(3190001,200207,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Astral Handguards'),
(3190001,200224,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Mail of Plague Watch'),
(3190001,200247,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bloodforged Tower Shield of Dread Crown'),
(3190001,200308,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Gauntlets of Star King'),
(3190001,200314,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ghostfire Snow Shoulder Guards'),
(3190001,200317,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Skullwarden''s Runering of the Ebon March'),
(3190001,200340,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rimewalker''s Heroic Band'),
(3190001,200372,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Luminous War Mantle of the Silent Crown'),
(3190001,200528,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Obsidian Lord Coil'),
(3190001,200572,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Undying Legguards of Star Crown'),
(3190001,200641,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Warrior-forged Compass of the Dread March'),
(3190001,200652,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stonelord''s Wrist Chains of the Blood Tide'),
(3190001,200703,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Earthkeeper''s Shoulderguards'),
(3190001,200724,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Wolfmarked War Mantle'),
(3190001,200760,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Frostmage''s Hauberk'),
(3190001,200792,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | War Leggings of the Bone Ritual'),
(3190001,200798,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Kingsguard Great Hauberk of Dark Crown'),
(3190001,200821,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shadowcaller''s Sable Epaulets'),
(3190001,200878,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Deathforged Waistguard'),
(3190001,200881,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sainted Skullsplitter of the Ancient Frost'),
(3190001,200886,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wild Spirit Coif'),
(3190001,200897,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Grimkeeper''s Great Hauberk'),
(3190001,200927,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ashcaller''s Leggings of the Amphitheater'),
(3190001,200961,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spiritwarden''s Plaguetouched Headguard'),
(3190001,200980,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Chausses, Bone Clutch'),
(3190001,220013,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Gloves of Death Rise'),
(3190001,220020,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ruthless Chestguard of Frost Forge'),
(3190001,220059,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Pendant Chain of the Rime King'),
(3190001,220066,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Armguards of Kirin Tor'),
(3190001,220079,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Drakeforged Leggings'),
(3190001,220102,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wyrmwarden''s Witchbound Signet Ring'),
(3190001,220152,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Woeful Waistchain of Warriors Promise'),
(3190001,220382,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Mail of the Kirin Tor'),
(3190001,220428,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bloodguard''s Wargrips'),
(3190001,220501,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Coif of the Oculus'),
(3190001,220505,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Fetish of the Warsong Hold'),
(3190001,220544,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Stalwart Great Hauberk'),
(3190001,220554,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spaulders of the Frost Forge'),
(3190001,220650,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Razor-edged Skullcrusher'),
(3190001,220655,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Legguards, Sky Reach'),
(3190001,220682,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dragon Queen''s Calm Legmail'),
(3190001,220747,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shoulder Drape of the Wild Spirit'),
(3190001,220753,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ravenbound Girdle of Silent Watch'),
(3190001,220813,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sorcerous Warboots'),
(3190001,220821,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wildcaller''s Flameforged Waistguard'),
(3190001,220891,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Darksteel War Leggings of Westguard Keep'),
(3190001,220983,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Greaves, Red Grave'),
(3190001,240030,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Desecrated Wristbands'),
(3190001,240033,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Firecaller''s Moonforged Wrap'),
(3190001,240057,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Soullord''s Dreambound Compass'),
(3190001,240092,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Mask, Drake Wall'),
(3190001,240094,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Adamant Legguards of the Violet Crown'),
(3190001,240127,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shoulderguards of the War Banner'),
(3190001,240138,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Hunter Crossbow of the Hallowed Crown'),
(3190001,240146,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Greatcloak of the Dragon Rider'),
(3190001,240181,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Starkeeper''s Spaulders'),
(3190001,240184,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wyrmguard''s Grips'),
(3190001,240233,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Harpoon of Sky Forge'),
(3190001,240359,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wyrmbound Mask'),
(3190001,240383,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Walkers of Makers Vault'),
(3190001,240462,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Night Grave Bindings'),
(3190001,240565,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Nightforged Carbine of Bone March'),
(3190001,240585,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Moonfire Wyrm Leggings'),
(3190001,240596,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Gloomed Bracers'),
(3190001,240690,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Coldfire Treads of Dawn Star'),
(3190001,240721,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Argent Knight''s Windforged Warband'),
(3190001,240724,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Austere Legwraps'),
(3190001,240756,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ashen Striders of the Titan Forge'),
(3190001,240763,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Doomed Gloves'),
(3190001,240802,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Void Doom Battlecloak'),
(3190001,240827,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rune-etched Titan Axe of Scale Queen'),
(3190001,240861,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shadowmarked Helm of the Terokkar'),
(3190001,240895,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Striders of Sholazar'),
(3190001,240986,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Cracked Vest of Shattered Crown'),
(3190001,260018,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ancient Leggings of Warsong Hold'),
(3190001,260030,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wolf Ice Stonehammer'),
(3190001,260033,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Winterkeeper''s Mask'),
(3190001,260062,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bonekeeper''s Blazing Grips'),
(3190001,260080,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Merciless Tunic'),
(3190001,260113,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Armored Shroud'),
(3190001,260181,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wristguards of Grim March'),
(3190001,260217,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Pants of the Ashen March'),
(3190001,260333,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Lightbound Shoulderguards'),
(3190001,260347,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Mask of Kings Promise'),
(3190001,260348,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Scourgeforged Cowl of Ice King'),
(3190001,260369,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Golden Tunic of Storm Forge'),
(3190001,260550,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ebon Crusader''s Cinch of the Kings Promise'),
(3190001,260556,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Silverwarden''s Dread Girdle'),
(3190001,260671,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Titanforger''s Frostscarred Coil'),
(3190001,260715,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wristbands of Light Guard'),
(3190001,260732,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Trousers of the Dying Light'),
(3190001,260744,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wristguards, Sun Bane'),
(3190001,260745,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Battlemage''s Striders of the Frozen North'),
(3190001,260751,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Last Queen''s Shadowsteel Amulet'),
(3190001,260758,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Violet Guardian''s Crusader Headdress'),
(3190001,260797,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Footguards, Wild Seal'),
(3190001,260848,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Gravekeeper''s Nightbound Hammer'),
(3190001,260902,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Harness of the Emerald Moon'),
(3190001,260931,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ravenkeeper''s Seal'),
(3190001,280008,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wrap of Holy Watch'),
(3190001,280018,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shoulderpads, Blade Howl'),
(3190001,280056,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Gloves, Titan Clutch'),
(3190001,280104,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Highguard''s Cuffs'),
(3190001,280129,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ravenlord''s Gloves'),
(3190001,280132,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rod of the Westguard Keep'),
(3190001,280134,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Emberforged Rune Band'),
(3190001,280165,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bronzed Tiara of Sky Forge'),
(3190001,280217,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Vest of White Crown'),
(3190001,280221,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dragonmarked Tunic of Deep Hall'),
(3190001,280259,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Gloves, Storm Stone'),
(3190001,280376,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Mist Spire Cord'),
(3190001,280400,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spire of the Scale Queen'),
(3190001,280455,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Cape of the Sky Forge'),
(3190001,280488,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Warpriest''s Legwraps'),
(3190001,280548,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Drakewarden''s Tunic of the Howling North'),
(3190001,280558,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rune Queen''s Effigy'),
(3190001,280583,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Forsaken Greatcloak'),
(3190001,280585,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Twilight Pendant of Scale Queen'),
(3190001,280593,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Lightlord''s Bone'),
(3190001,280624,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Walkers of the Light Watch'),
(3190001,280640,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Royal Band of the Stone Forge'),
(3190001,280693,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Armbands of the Iron Giant'),
(3190001,280722,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Plagueborn Hood'),
(3190001,280737,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stoneguard''s Cap of the Grizzly Hills'),
(3190001,280764,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Forgotten Runebands of Burning Shadow'),
(3190001,280795,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Obsidian Warcloak'),
(3190001,280805,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dream Guard Coin'),
(3190001,280816,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Runering, Ebon Whisper'),
(3190001,280856,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wyrmcaller''s Sash of the Light Eternal'),
(3190001,280864,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Regalia of the Blackened Sky'),
(3190001,280888,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Holy Graspers of Ancient Watch'),
(3190001,280910,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Nightlord''s Silverblessed Warband'),
(3190001,280937,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Duskrun Tiara of the Scarlet Keep'),
(3190001,280986,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sandals of Dusk Watch'),
(3190001,320013,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Drakecaller''s Tunic'),
(3190001,320020,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wildguard''s Keepsake of the Ancient Memory'),
(3190001,320035,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wildforged Cinch of Void Crown'),
(3190001,320097,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Drakelord''s Frostmarked Chestguard'),
(3190001,320113,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rune-carved Girdle, Wyrmlord''s Oath'),
(3190001,320127,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Veteran Leggings'),
(3190001,320130,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stormscarred Girdle of the Ghost Moon'),
(3190001,320173,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Collar of the Blood Watch'),
(3190001,320255,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Cracked Breeches of Mana Tide'),
(3190001,320338,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Headdress of Black Anvil'),
(3190001,320359,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wristbands of Great Eagle'),
(3190001,320361,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Walkers, Spear Shot'),
(3190001,320375,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Resolute Longcloak of the Stormcaller'),
(3190001,320398,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Ravenbound Spaulders'),
(3190001,320480,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Chestpiece of Blood Moon'),
(3190001,320499,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Devout Legwraps'),
(3190001,320525,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Cinch, Nether Bringerless'),
(3190001,320593,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Harness of Dragon Rider'),
(3190001,320594,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dragon Queen''s Sunbound Royal Band'),
(3190001,320640,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Darkened Gauntlet'),
(3190001,320645,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Unholy Rune Band'),
(3190001,320685,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Kingskeeper''s Legguards'),
(3190001,320690,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dustbound Trousers'),
(3190001,320714,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Winter Storm Mantle'),
(3190001,320718,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Tombkeeper''s Nightmare Strap'),
(3190001,320761,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Leggings, Pale Lord'),
(3190001,320778,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shadowforged Battlecloak of Demon Watch'),
(3190001,320788,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Chain, Ghost Judgment'),
(3190001,320789,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Carapace of the Frozen Heart'),
(3190001,320851,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Anvilkeeper''s Horn'),
(3190001,320876,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stonecarved Carapace of Lost Crown'),
(3190001,320972,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Carapace, Scarlet Dawn'),
(3190001,340215,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ashen King''s Dalaran Warder Cloak'),
(3190001,340247,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Robe of the Pale Crown'),
(3190001,340308,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Fetish of the North Road'),
(3190001,340342,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Coil, Blood Forge'),
(3190001,340346,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Mystic Knife'),
(3190001,340362,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Warped Trousers of Red Flight'),
(3190001,340397,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Primal Shoulder Cape of Emerald Grove'),
(3190001,340413,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sunfire Spell Great Cape'),
(3190001,340447,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Whitegold Leggings of Storm Queen'),
(3190001,340460,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Serpent Quarrel Tunic'),
(3190001,340465,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Icy Cord of Dragon Aspect'),
(3190001,340546,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Embersteel Robes'),
(3190001,340584,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sandals of the Fel Watch'),
(3190001,340597,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Burnished Warcloak'),
(3190001,340685,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Deathmarked Boots'),
(3190001,340697,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rangemaster''s Diadem of the Green Dragon'),
(3190001,340713,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ghoststeel Loop of Pale Winter'),
(3190001,340718,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Rotting Runebands of Thor Modan'),
(3190001,340737,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Solemn Royal Band'),
(3190001,340741,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | West Rend Traveling Cloak'),
(3190001,340767,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Silent King''s Draconic Runebands'),
(3190001,340832,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Storm Queen''s Crook of the Crimson Banner'),
(3190001,340850,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Oath Keeper Boots'),
(3190001,340877,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Unhallowed Raiment of Grim Watch'),
(3190001,340895,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Thunderwarden''s Shaman Staff'),
(3190001,340949,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Dragonstalker''s Battlecloak'),
(3190001,340977,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Dawnlit Tiara'),
(3190001,360004,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Forgemaster''s Cord'),
(3190001,360006,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Primal Night Ritual Wand'),
(3190001,360033,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Beastmarked Pants, Wyrm King''s Oath'),
(3190001,360090,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Infused Leggings of the Sholazar'),
(3190001,360165,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Collar, Green Vine'),
(3190001,360183,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Cursed Spell Stave'),
(3190001,360210,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Kingskeeper''s Skirt of the Pit of Saron'),
(3190001,360225,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Sinister Grips'),
(3190001,360236,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Seal Ring of the Raven Spirit'),
(3190001,360242,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Headdress of the Titan King'),
(3190001,360271,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Charred Great Cape of Scarlet Watch'),
(3190001,360319,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Beastbound Diadem of the Broken Banner'),
(3190001,360338,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Titan King''s Winterborn Epaulets'),
(3190001,360378,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Siegebound Warcloak of the Fallen Lord'),
(3190001,360424,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bloodmage''s Breeches of the Crimson Banner'),
(3190001,360551,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Fanged Cinch of the White Crown'),
(3190001,360564,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sandals of the Titan Forge'),
(3190001,360655,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stonecaller''s Ironforged Raiment'),
(3190001,360658,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Woeful Falchion of Mana Tide'),
(3190001,360669,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Old Charm'),
(3190001,360764,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Kingskeeper''s Headdress'),
(3190001,360780,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Highlord''s Icetouched Waistband'),
(3190001,360786,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Fang of Dawn Guard'),
(3190001,360803,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Veil, Mystic Glacier'),
(3190001,360860,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Obsidian Tunic of the Deep Vault'),
(3190001,360908,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spellforged Trousers'),
(3190001,360973,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Dreadforged Staff'),
(3190001,380001,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bloodbound Branch of Dawnwatch'),
(3190001,380011,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shadowkeeper''s Treads of the Void Ritual'),
(3190001,380024,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Siegebound Wristbands of Makers Vault'),
(3190001,380057,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Sable Branch Runemaul'),
(3190001,380133,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Crusader Grips of the Storm Watch'),
(3190001,380154,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Pillar of Burning Star'),
(3190001,380206,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Legguards, Earth Rime'),
(3190001,380207,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Hearthwarden''s Legwraps of the Bear Spirit'),
(3190001,380244,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Frostforged Belt'),
(3190001,380280,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Neckchain of the Dragon Spirit'),
(3190001,380312,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Longstaff of the Warsong Hold'),
(3190001,380314,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ashen Headguard of the Ancestor Spirit'),
(3190001,380319,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Burial Waistband'),
(3190001,380325,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Graveborn Girdle of the Sable Moon'),
(3190001,380331,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bindings of the Khaz Modan'),
(3190001,380333,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Celestial Storm Mantle'),
(3190001,380400,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spellbound Helm of Scale Queen'),
(3190001,380426,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Great Cape of Last King'),
(3190001,380446,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Battlesage''s Legwraps of the Shadowbinder'),
(3190001,380452,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wolfsworn Shard'),
(3190001,380485,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Warguard''s Raider Vest'),
(3190001,380501,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stalkers of Blood Price'),
(3190001,380522,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Berserker Breeches'),
(3190001,380526,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Winterlord''s Lightblessed Shaman Staff'),
(3190001,380546,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Wyrmforged Mage Staff of the Black Anvil'),
(3190001,380612,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Brassbound Claws of Second Dawn'),
(3190001,380678,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Argent Defender''s Strap of the Deep Forge'),
(3190001,380708,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Grimdark Pillar of the Final Watch'),
(3190001,380749,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Witchcaller''s Brutal Clutches'),
(3190001,380751,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | The Reinforced Jerkin'),
(3190001,380782,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Stormmarked Scale of the Star King'),
(3190001,380822,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Undying Claws of the Dawnwatch'),
(3190001,380843,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Shadow Queen''s Eternal Bindings'),
(3190001,380859,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Ghost Tongue Leggings'),
(3190001,380888,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Spiritcaller''s Seal of the Netherstorm'),
(3190001,380899,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Forgehammer of Bone Crown'),
(3190001,380913,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Fingerband of the Dragon Pact'),
(3190001,380931,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Bloodbound Forgehammer of the Dragon Rider'),
(3190001,380949,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 trash | Moonwarden''s Spaulders of the Hidden Road');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3190002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3190002,200755,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | The Dreaming Fingerband'),
(3190002,220367,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Verdant Chainmail, Tombkeeper''s Oath'),
(3190002,240214,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Walkers of the Nexus'),
(3190002,240294,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Verdant Long Recurve'),
(3190002,240486,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | The Tarnished Helm'),
(3190002,240550,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Legguards, Wind Spire'),
(3190002,240830,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Bear Grave Royal Band'),
(3190002,240849,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Pants, Dream Winter'),
(3190002,280219,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Barbed Branch of the Rune Watch'),
(3190002,280668,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Soulmarked Handwraps of Ancient Banner'),
(3190002,280832,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Totem, Rune Wing'),
(3190002,280995,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Hourglass, Lion Rime'),
(3190002,320434,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Ironwarden''s Striders'),
(3190002,340971,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Bodkin of Astral Gate'),
(3190002,360872,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Nameless Breeches'),
(3190002,380720,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000436 | Grips of Lost Vanguard');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3190003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3190003,200069,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Ashen Hauberk'),
(3190003,200104,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Forgotten Treads of the Frozen Moon'),
(3190003,200150,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Spaulders, Silver Shade'),
(3190003,200255,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Witchlord''s Treads'),
(3190003,200282,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Deepwarden''s Warhelm of the Scholomance'),
(3190003,200480,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Bracers, Coldfire Ruin'),
(3190003,200555,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | War Leggings of the Dragonblight'),
(3190003,200582,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Ancient Queen''s Twilight-forged Chestguard'),
(3190003,200663,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Dreambound Shoulderguards'),
(3190003,200833,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Ringlet of Star Grove'),
(3190003,200906,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Hearthwarden''s Warhelm of the Astral Gate'),
(3190003,220042,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Bright Breastplate'),
(3190003,220072,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Argent Defender''s Handplates'),
(3190003,220239,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Warhelm of the Deep Hall'),
(3190003,220243,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Bright Rune Band of Sholazar'),
(3190003,220264,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Spaulders, Obsidian Slayer'),
(3190003,220495,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Obsidian Leggings of the High King'),
(3190003,220579,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Wrap, Bright Echo'),
(3190003,220691,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Old Keeper''s Loop'),
(3190003,220794,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Graven Epaulets of Moon Guard'),
(3190003,220876,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Old King''s Maul'),
(3190003,220907,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Hellforged Traveling Cloak'),
(3190003,240155,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Compass of the New Agamand'),
(3190003,240715,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Rime-coated Harness'),
(3190003,240776,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Stormwrought Shawl'),
(3190003,240922,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Blessed Legwraps of Moon Guard'),
(3190003,260057,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Tarnished Spaulders of Thorim Arena'),
(3190003,260353,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Corpsebound Shadowblade of Wyrmskull'),
(3190003,260429,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Shadowforged Stiletto'),
(3190003,260432,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Cabalistic Harness'),
(3190003,260519,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Spiritbound Belt of the Damned Host'),
(3190003,260770,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Ancient Keeper''s Brooch of the Star Crown'),
(3190003,260855,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Windwarden''s Pale Warband'),
(3190003,280149,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Runebands, Stormshard Piercer'),
(3190003,280150,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Winterforged Phylactery of Last Vigil'),
(3190003,280650,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Armbands of Prime Design'),
(3190003,280656,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Effigy of the Dark Forge'),
(3190003,280659,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Scourged Mantle of Grim Crown'),
(3190003,280709,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Icekeeper''s Maul'),
(3190003,280758,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Deathguard''s Cord'),
(3190003,280817,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Gravelord''s Drakeforged Mantle'),
(3190003,280915,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Longstaff, Spear Veil'),
(3190003,320167,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Bonekeeper''s Charmstone'),
(3190003,320394,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Chausses of Drowned King'),
(3190003,320494,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Grave Maw Striders'),
(3190003,320666,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Wintersteel Mask, Nightwatcher''s Oath'),
(3190003,320988,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Necrotic Pants'),
(3190003,340107,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Fingerband of the Winter Watch'),
(3190003,340317,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Binding, Ebon Rime'),
(3190003,340328,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Tiara, Forgotten Rebuke'),
(3190003,340344,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Gravekeeper''s Shoes'),
(3190003,340539,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Rootwoven Skullcap'),
(3190003,340596,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Icewarden''s Wolfmarked Loop'),
(3190003,340651,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Headdress of the Wind Crown'),
(3190003,340843,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Wolfbound Rod'),
(3190003,340876,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Battlesage''s Diadem of the Astral Crown'),
(3190003,360035,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Weathered Shoulder Cape'),
(3190003,360241,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Cabalistic Signet of Bone March'),
(3190003,360257,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Ironthane Medallion of the Dark Star'),
(3190003,360339,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Mitts, Starfire Fury'),
(3190003,360496,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Leafbound Wand of the Twilight Reach'),
(3190003,360704,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Nightforged Great Stave of the Old Kingdom'),
(3190003,360755,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Robes, Bright Dusk'),
(3190003,360759,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Warpriest''s Stalwart Shoulderpads'),
(3190003,360772,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | The Forgotten Keepsake'),
(3190003,360821,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Waistwrap of Fel Flame'),
(3190003,360876,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Dwarven Treads'),
(3190003,380053,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Frostguard''s Tablet of the Soul Forge'),
(3190003,380159,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Bracers of the Pale Crown'),
(3190003,380171,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Duskrun Traveling Cloak'),
(3190003,380271,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Crypt Bolt Battlecloak'),
(3190003,380394,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Shadow Gaze Shroud'),
(3190003,380417,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Crown Cry Chestpiece'),
(3190003,380458,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Deathknight''s Wristguards'),
(3190003,380559,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Boots of the Winter King'),
(3190003,380586,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Glacial Backcloth of Endless Road'),
(3190003,380615,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Serpent Bite Headdress'),
(3190003,380659,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Grim Mark'),
(3190003,380700,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Warped Mantle'),
(3190003,380811,0,0,0,1,1,1,1,'Generated map_129_difficulty_0 boss_000437 | Silverblessed Girdle, Drakelord''s Oath');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7357 AND `Item` = 1 AND `Reference` = 3190000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7357,1,3190000,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | boss_000435');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7327 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7327,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7328 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7328,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7329 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7329,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7332 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7332,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7335 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7335,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7337 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7337,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7341 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7341,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7342 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7342,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7345 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7345,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7347 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7347,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7348 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7348,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7352 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7352,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7353 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7353,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7354 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7354,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14686 AND `Item` = 1 AND `Reference` = 3190001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14686,1,3190001,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8567 AND `Item` = 1 AND `Reference` = 3190002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8567,1,3190002,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | boss_000436');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7358 AND `Item` = 1 AND `Reference` = 3190003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7358,1,3190003,2,0,1,0,1,1,'Generated encounter attachment | map_129_difficulty_0 | boss_000437');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200000,200569,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Shadowcaller''s Fanged Hand Hammer'),
(3200000,200623,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Tower Shield of the Lost Watch'),
(3200000,220105,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Handguards of Frost Crown'),
(3200000,280560,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Patient Trousers'),
(3200000,340510,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Ravenlord''s Feather'),
(3200000,340962,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000444 | Thorned Brooch, Blood King''s Oath');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200001,200097,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Iceforged Wristguards of Northern Light'),
(3200001,200099,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cold Wrath Seal'),
(3200001,200264,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Earthbound Key of Blackened Sky'),
(3200001,200407,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Treads, Unquiet Ash'),
(3200001,200416,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Sainted Warbelt'),
(3200001,200529,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Stone of the Void Flame'),
(3200001,200542,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Iceforged Cape'),
(3200001,200635,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Blood Prince''s Brooch'),
(3200001,200740,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Golden Greaves'),
(3200001,200765,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cloak, Holy Bane'),
(3200001,200858,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Dread Grips of Ancient Earth'),
(3200001,200859,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Warped Warbelt'),
(3200001,200861,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Stormforged Greatcloak of the Soul Reaper'),
(3200001,200936,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Dwarven Faceguard, Stormlord''s Oath'),
(3200001,200953,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Nightshrouded Legguards'),
(3200001,220007,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Deepwarden''s Insignia'),
(3200001,220012,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Windkeeper''s Feathered Wristguards'),
(3200001,220070,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legguards of Gilded Crown'),
(3200001,220125,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Warhelm of Frost Queen'),
(3200001,220163,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Girdle, Hidden Forge'),
(3200001,220177,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shattered Star Great Claymore'),
(3200001,220321,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shoulder Guards of the Fallen Crown'),
(3200001,220332,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ironwarden''s Bronzed Defender'),
(3200001,220402,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Deathkeeper''s Circle'),
(3200001,220518,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Seal Ring, Sun Plate'),
(3200001,220656,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Witchforged Epaulets of the Iron Pact'),
(3200001,220749,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Traveling Cloak of the Dragon Spirit'),
(3200001,220754,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Frostscarred Headguard'),
(3200001,220766,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Stonefather''s Grips'),
(3200001,220816,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Pendant Chain, Bone Hex'),
(3200001,220835,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Flameforged Leggings of Demon Watch'),
(3200001,220846,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Necklace, Thunder Feather'),
(3200001,220848,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Runewoven Eye'),
(3200001,220954,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Darkkeeper''s Deathbound Chausses'),
(3200001,220971,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ashen Spaulders'),
(3200001,220982,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Purified Crystal of Dead Memory'),
(3200001,240037,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Boneguard''s Flameforged Trousers'),
(3200001,240042,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cinch of the Wolf Spirit'),
(3200001,240064,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Bracers, Bear Night'),
(3200001,240169,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legguards of the Titan Archive'),
(3200001,240173,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Armguards of Bone Lord'),
(3200001,240183,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Everfrost Headguard'),
(3200001,240273,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ancient Warden''s Pendant Chain'),
(3200001,240378,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ruthless Harness'),
(3200001,240394,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Marauding Chestpiece'),
(3200001,240431,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Scarlet Seed Waistguard'),
(3200001,240506,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Boomstick, Frozen Whisper'),
(3200001,240525,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Icekeeper''s Steelbound Mantle'),
(3200001,240661,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shoulderguards of Stratholme'),
(3200001,240734,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Baleful Grips of the Arathi Highlands'),
(3200001,240783,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Deathmask, Low Anchor'),
(3200001,240795,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Promise of the War Banner'),
(3200001,240919,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legguards, Soulshard Wake'),
(3200001,240928,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Sainted Legwraps of Lost Oath'),
(3200001,240949,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Battleworn Walkers of the Dead March'),
(3200001,260187,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Boots, Titan Walker'),
(3200001,260219,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Nightsteel Shoulder Drape'),
(3200001,260302,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cap of Pit of Saron'),
(3200001,260563,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Faithful Claws of the Star Grove'),
(3200001,260579,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Warwarden''s Carapace'),
(3200001,260611,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Vicious Headdress'),
(3200001,260639,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Warmaster Handguards of Last Vigil'),
(3200001,260666,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legwraps of the Fallen Watch'),
(3200001,260697,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Spellscarred Tunic'),
(3200001,260707,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Lost Mark Pendant'),
(3200001,260778,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Scarlet Grave Walkers'),
(3200001,260851,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Highlord''s Breeches'),
(3200001,260970,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ghostwarden''s Legguards of the Red Dawn'),
(3200001,260991,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Flawless Jerkin of the Lordaeron Guard'),
(3200001,280098,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shoulderwraps of Halls of Stone'),
(3200001,280101,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Jagged Waistwrap'),
(3200001,280183,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Manawoven Shoulderpads'),
(3200001,280230,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Jagged Orb'),
(3200001,280312,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Graspers of Blood Memory'),
(3200001,280437,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Treads, Holy Ritual'),
(3200001,280471,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Backcloth of Freya Garden'),
(3200001,280522,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Thornbound Legwraps'),
(3200001,280531,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legwraps of the Ice Moon'),
(3200001,280562,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Permafrost Loop'),
(3200001,280711,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Brilliant Sandals'),
(3200001,280719,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Winter King''s Mantle'),
(3200001,280769,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cracked Pendant Chain of Utgarde Pinnacle'),
(3200001,280787,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Rimecaller''s Grips'),
(3200001,280850,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Plaguetouched Shoulderwraps'),
(3200001,280862,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Old Knight''s Stonecarved Longcloak'),
(3200001,280958,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ironthane Ring'),
(3200001,280978,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shadowbound Tiara'),
(3200001,320045,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Treads of the Mana Wyrm'),
(3200001,320153,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Mantle of the Kings Promise'),
(3200001,320159,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Ancestor''s Clutches of the Spellweaver'),
(3200001,320295,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cruel Band'),
(3200001,320301,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Wargrips, South Covenant'),
(3200001,320306,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Frostfire Vine Leggings'),
(3200001,320472,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Legguards, Cold Wake'),
(3200001,320608,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Starfang Pact Spaulders'),
(3200001,320634,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Grips of the Scarlet Monastery'),
(3200001,320724,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Deathmask, Grim Watch'),
(3200001,320810,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Brightsteel Key of the Silver Flame'),
(3200001,320850,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Siegebound Ring'),
(3200001,320855,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Lightlord''s Rootwoven Royal Band'),
(3200001,320951,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Runemarked Wristguards, Frostkeeper''s Oath'),
(3200001,340013,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Verdant Necklace'),
(3200001,340079,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Northman''s Ornate Neckchain'),
(3200001,340163,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Vestments, Soulfire Skull'),
(3200001,340232,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Dread Brand Gorget'),
(3200001,340262,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shoulderpads of the Gjalerbron'),
(3200001,340320,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Chestwrap of the Cold Watch'),
(3200001,340327,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cord of Twilight Flame'),
(3200001,340366,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Voidbound Mitts of Moon Watch'),
(3200001,340450,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Darkfire Ray Vest'),
(3200001,340484,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Stonecaller''s Fingerband'),
(3200001,340548,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Hourglass, Doom Ember'),
(3200001,340553,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Primal Edge Quarterstaff'),
(3200001,340622,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Warchief''s Promise'),
(3200001,340669,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Breeches of Frozen Halls'),
(3200001,340673,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Bonecaller''s Steelbound Waistband'),
(3200001,340677,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Dawnwarden''s Charm of the Holy Guard'),
(3200001,340687,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Walkers of the Violet Crown'),
(3200001,340704,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Crypt Scar Gloves'),
(3200001,340738,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Silverblessed Sash'),
(3200001,340853,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Deathless Vest of the Wyrm Queen'),
(3200001,340947,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Sandals, Dusk Seal'),
(3200001,360028,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Undying Shoulderpads'),
(3200001,360029,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Band of Ice Moon'),
(3200001,360292,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Mantle of Ancient Earth'),
(3200001,360341,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Bracelets, Cold Promise'),
(3200001,360371,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Grimdark Vestments'),
(3200001,360386,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shattered Vengeance Mantle'),
(3200001,360441,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cruel Spike'),
(3200001,360540,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Greatstaff of the Altar of Sseratus'),
(3200001,360565,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Spiritcaller''s Gloves'),
(3200001,360692,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Hammerlord''s Breeches'),
(3200001,360699,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Lightkeeper''s Tablet'),
(3200001,360746,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Wristwraps of the Kings Road'),
(3200001,360830,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Neckguard of the Final March'),
(3200001,360839,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Longstaff, Rime Scream'),
(3200001,360889,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Sorcerous Handwraps'),
(3200001,380026,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shattered Pendant of the Westguard Keep'),
(3200001,380040,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Boar Reaver Footguards'),
(3200001,380044,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Sorrowful Lens of Astral Watch'),
(3200001,380105,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Moonfire Legacy Headdress'),
(3200001,380132,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Bonebound Walkers, Silent King''s Oath'),
(3200001,380264,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Carapace, Red Carver'),
(3200001,380343,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | The Wildbound Cape'),
(3200001,380409,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Shoulderwraps of Moonwell'),
(3200001,380487,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Furious Siege Hammer of Winter Memory'),
(3200001,380506,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Dreadforged Stalkers, Drakelord''s Oath'),
(3200001,380520,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Last King''s Darkforged Knobbed Mace'),
(3200001,380687,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Handguards, Icefang Woe'),
(3200001,380696,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Mystic Amulet of Storm Peaks'),
(3200001,380836,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Voidkeeper''s Mountainborn Compass'),
(3200001,380980,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 trash | Cerulean Belt of Burning Sky');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200002,220262,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Wolfhide Charmstone of Sacred Flame'),
(3200002,240546,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Striders of Shadow Watch'),
(3200002,240594,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Polished Helm of Light Guard'),
(3200002,240667,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Argent Defender''s Nightsteel Legwraps'),
(3200002,260326,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Silent Knight''s Wargrips'),
(3200002,280202,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Earthwoven Shoulderpads of Pale Moon'),
(3200002,280448,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Bloodbound Greatstaff of Pale Watch'),
(3200002,280452,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Scarlet Epaulets of the Iron Banner'),
(3200002,320919,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Wildwoven Waistguard of the Shadow Forge'),
(3200002,340398,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Deep Hammer Hourglass'),
(3200002,360063,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Gorget, Storm Thirst'),
(3200002,380013,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Moonkeeper''s Sepulchral Legwraps'),
(3200002,380328,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000445 | Winterworn Tunic');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200003,200359,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Sunwarden''s Dreamwoven Chausses'),
(3200003,200554,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Sanctified Helm of Frozen Memory'),
(3200003,200649,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Royal Cloak of Ancestor Spirit'),
(3200003,200789,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Terrible Gauntlets'),
(3200003,200863,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Legmail, Blade Snow'),
(3200003,200911,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Crusader''s Greaves of the Ebon Watch'),
(3200003,200917,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Silent Leggings of Dark Star'),
(3200003,220019,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Wyrm King''s Bracers of the Burning Steppes'),
(3200003,220053,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | War Leggings of Frost Giant'),
(3200003,220120,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Handguards of Last Watch'),
(3200003,220160,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Whitefrost Torc'),
(3200003,220209,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Light Rider Warbelt'),
(3200003,220283,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Violet Mage''s Rune Band'),
(3200003,220351,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Icy War Pike of Dying Light'),
(3200003,220419,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Earthcaller''s Runebound Helm'),
(3200003,220536,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Waistchain, Coldfire Song'),
(3200003,220548,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Mana Hide Warhelm'),
(3200003,220571,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Forgeblessed Handaxe'),
(3200003,220678,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Bone Seed Feather'),
(3200003,220975,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Drakebound Greatsword of Deep Vault'),
(3200003,240073,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Strap, Sable Scream'),
(3200003,240120,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Royal Cloak of Bitter Memory'),
(3200003,240218,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Armored Treads'),
(3200003,240253,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Dragonkeeper''s Cinch'),
(3200003,240465,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Defiant Cowl of the Frozen Gate'),
(3200003,240498,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Ancient King''s Shroud'),
(3200003,240656,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Cruel Pants'),
(3200003,240728,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Frostkeeper''s Tarnished Breeches'),
(3200003,240770,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Earth Hunter Waistband'),
(3200003,240787,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Verdant Harness of Holy Crown'),
(3200003,240892,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Headdress of Black Ritual'),
(3200003,240924,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Bloodkeeper''s Mask of the Sky Crown'),
(3200003,260025,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Scourged Skullcrusher of the Silver Flame'),
(3200003,260238,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Tunic of Eternal Watch'),
(3200003,260427,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Wristbands, Mana Whisper'),
(3200003,260430,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Titanforger''s Shroud of the Argent Dawn'),
(3200003,260553,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Unbroken Fang Signet Ring'),
(3200003,260645,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Scarlet Inquisitor''s Belt'),
(3200003,260803,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Nightsteel Spaulders of Black Flight'),
(3200003,260955,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Cinch of the Zim Torga'),
(3200003,260977,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Battleworn Claws of Naxxramas'),
(3200003,260999,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Whispering Runestone of Winter Watch'),
(3200003,280116,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Flamewarden''s Rimeforged Vest'),
(3200003,280228,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Beads of Zul Drak'),
(3200003,280336,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Sable Greatstaff of the Sun Spirit'),
(3200003,280534,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Heavy Chestwrap'),
(3200003,280924,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Bearhide Mantle'),
(3200003,280934,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Starsteel Headdress, Wyrmguard''s Oath'),
(3200003,320021,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Plaguekeeper''s Fierce Headdress'),
(3200003,320022,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Dragonhide Capelet'),
(3200003,320048,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Silverkeeper''s Chestpiece'),
(3200003,320253,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Boots of the Storm Spirit'),
(3200003,320320,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Lightcaller''s Vest'),
(3200003,320374,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Night Breath Strap'),
(3200003,320400,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Rime-coated Mantle of Frozen Banner'),
(3200003,320501,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Forgotten Warden''s Silverforged Mask'),
(3200003,320555,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Fingerband, Fallen Talon'),
(3200003,320774,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Shoulderpads of the Light Crown'),
(3200003,340231,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Pale Grips'),
(3200003,340293,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Diadem of the Titan King'),
(3200003,340710,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Silverblessed Sash of Shadow Forge'),
(3200003,340747,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Cruel Treads of Bone March'),
(3200003,340814,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Wildguard''s Feathered Hoop'),
(3200003,340825,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Permafrost Shoulderpads of Fallen Star'),
(3200003,340881,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Worldkeeper''s Lens of the Soul Watch'),
(3200003,340886,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Ring, Frozen Ember'),
(3200003,360086,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Shoulderwraps of the Green Dragon'),
(3200003,360122,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Gloomed Handwraps'),
(3200003,360128,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Bracelets of Wind Spirit'),
(3200003,360205,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Prayerbound Tunic'),
(3200003,360227,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Dawnforged Pants'),
(3200003,360237,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Haunted Shoulderpads of Last Stand'),
(3200003,360388,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Wildcaller''s Greenwood Breeches'),
(3200003,360472,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Borean Tunic'),
(3200003,360499,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Lightcaller''s Ornate Nightcloak'),
(3200003,360571,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Horn of the Twilight Crown'),
(3200003,360576,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Circlet, Ghost Song'),
(3200003,360626,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Earthcaller''s Sunhallowed Legwraps'),
(3200003,360666,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Ringlet of the Lich King'),
(3200003,360787,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Ominous Shoulder Cape'),
(3200003,360842,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | The Dragonbound Relic'),
(3200003,380318,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Spire, Moonfire Pact'),
(3200003,380397,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Bonewarden''s Cabalistic Boots'),
(3200003,380422,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Wolf Echo Headdress'),
(3200003,380691,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Argent Champion''s Earthforged Great Lance'),
(3200003,380985,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000446 | Titan-carved Boots');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200004,200032,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Icecaller''s Cabalistic Coif'),
(3200004,200705,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Moonforged Chausses'),
(3200004,240039,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Wolfsworn Claws'),
(3200004,240329,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Jerkin of Winter Memory'),
(3200004,240805,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Bonecaller''s Loop of the Red Dragon'),
(3200004,260650,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Boneclad Waistband of the Lost Watch'),
(3200004,280441,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Silent Branch of Scarlet Bastion'),
(3200004,320244,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Luminous Mantle'),
(3200004,320643,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Calm Trousers'),
(3200004,320893,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Stormwarden''s Harness of the Black Dragon'),
(3200004,340150,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Dire Bolt Tiara'),
(3200004,340486,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Brightmoon Mitts of the Abyssal Gate'),
(3200004,340514,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Windlord''s Pants of the Moonwell'),
(3200004,340756,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Shoulderpads of the Fallen Crown'),
(3200004,340777,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Baneful Tooth'),
(3200004,360248,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | Sacred Shoulder Drape of Black Temple'),
(3200004,360851,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Age-darkened Totem'),
(3200004,380311,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Deepfrost Trousers'),
(3200004,380338,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000447 | The Fearsome Band');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200005,200240,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Sunblessed Epaulets of Sholazar'),
(3200005,200313,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Iceforged Girdle of Broken Hall'),
(3200005,200420,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Berserker War Leggings of Death Watch'),
(3200005,220039,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Spectral Gauntlets of the First Flame'),
(3200005,220134,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Legguards of the Ancient Banner'),
(3200005,220237,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Titanguard''s Darksteel Surcoat'),
(3200005,220730,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Moon King''s Boots'),
(3200005,220937,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Sunkeeper''s Wargrips'),
(3200005,240182,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Stonekeeper''s Runebound Gloves'),
(3200005,240526,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Silverguard''s Stone'),
(3200005,240991,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Prime Spire Spaulders'),
(3200005,260016,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Drakecaller''s Wristguards'),
(3200005,260085,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | The Stormbound Clublike Mace'),
(3200005,260417,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Strap of the Abyssal Flame'),
(3200005,260476,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Windwarden''s Choker of the Frost King'),
(3200005,260501,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Brazen Shoulderpads of the Thunder Forge'),
(3200005,260589,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Highborn''s Nameless Neckguard'),
(3200005,260996,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Carapace of the Forge of Souls'),
(3200005,280158,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Titan Keeper''s Chestwrap'),
(3200005,280200,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Dreamcaller''s Binding of the Bleak Shore'),
(3200005,280335,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Darkwarden''s Grips of the Last Watch'),
(3200005,280765,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Binding, Ancient Song'),
(3200005,340108,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Night Dancer Amulet'),
(3200005,340237,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | The Ironthane Traveling Cloak'),
(3200005,340433,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | The Rootwoven Bone'),
(3200005,340810,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Kilt, Fire Lord'),
(3200005,360420,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Hood of the Shadow Moon'),
(3200005,380334,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Ravenwarden''s Great Cape of the Avalanche'),
(3200005,380653,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000448 | Mournful Footguards of War Forge');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200006,220796,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000449 | Highborne Wargrips of the Corpse Scar'),
(3200006,240766,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000449 | Legguards of Frozen Crown'),
(3200006,340636,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000449 | Footwraps of the Long Road');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3200007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3200007,200899,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Stormsteel Spear of the Nesingwary Camp'),
(3200007,220778,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Iron Queen''s Winterworn Girdle'),
(3200007,280265,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Shoes, Icefang Ray'),
(3200007,320005,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Rimeforged Battle Mace of the Scale Queen'),
(3200007,320177,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Icecaller''s Shield'),
(3200007,340430,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Icekeeper''s Consecrated Walkers'),
(3200007,360297,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Raiment of Moonwarden'),
(3200007,360737,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | The Runewoven Wristwraps'),
(3200007,380124,0,0,0,1,1,1,1,'Generated map_189_difficulty_0 boss_000450 | Spaulders, Wolf Judgment');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3983 AND `Item` = 1 AND `Reference` = 3200000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3983,1,3200000,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000444');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3976 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3976,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4283 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4283,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4286 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4286,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4287 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4287,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4288 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4288,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4289 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4289,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4290 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4290,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4291 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4291,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4292 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4292,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4293 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4293,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4294 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4294,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4295 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4295,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4296 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4296,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4297 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4297,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4298 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4298,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4299 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4299,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4300 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4300,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4301 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4301,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4302 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4302,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4303 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4303,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4304 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4304,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4306 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4306,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4308 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4308,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4540 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4540,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6426 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6426,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6427 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6427,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6488 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6488,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6489 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6489,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6490 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6490,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14693 AND `Item` = 1 AND `Reference` = 3200001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14693,1,3200001,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4543 AND `Item` = 1 AND `Reference` = 3200002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4543,1,3200002,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000445');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3974 AND `Item` = 1 AND `Reference` = 3200003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3974,1,3200003,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000446');

DELETE FROM `creature_loot_template` WHERE `Entry` = 6487 AND `Item` = 1 AND `Reference` = 3200004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(6487,1,3200004,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000447');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3975 AND `Item` = 1 AND `Reference` = 3200005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3975,1,3200005,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000448');

DELETE FROM `creature_loot_template` WHERE `Entry` = 4542 AND `Item` = 1 AND `Reference` = 3200006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4542,1,3200006,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000449');

DELETE FROM `creature_loot_template` WHERE `Entry` = 3977 AND `Item` = 1 AND `Reference` = 3200007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3977,1,3200007,2,0,1,0,1,1,'Generated encounter attachment | map_189_difficulty_0 | boss_000450');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210000,200098,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Waistguard, Frost Covenant'),
(3210000,200181,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Mistbound Wristplates'),
(3210000,200336,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Deepwarden''s Wristplates'),
(3210000,200501,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | War Arbalest, Black Root'),
(3210000,200565,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Rune Wound Headplate'),
(3210000,200589,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Wildforged Waistguard'),
(3210000,200684,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Bloodsoaked Warplate'),
(3210000,200778,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Wildfire Hymn Legguards'),
(3210000,200904,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Chestplate of the Blood Watch'),
(3210000,200960,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shadowcaller''s Worldworn Waistguard'),
(3210000,220088,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Hoary Waistguard'),
(3210000,220224,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Lost War Greaves of Ice Queen'),
(3210000,220295,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Dawnwarden''s Waistplate'),
(3210000,220299,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Thunderforged Wrap'),
(3210000,220673,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Unbroken Vambraces'),
(3210000,220874,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Carapace of Death Knight'),
(3210000,220941,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | First Knight''s Azure Armplates'),
(3210000,220986,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Dalaran Greaves of the Moon Grove'),
(3210000,240050,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Cape of the Tirisfal Glades'),
(3210000,240114,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Soldierly Armguards of Cold Watch'),
(3210000,240148,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Lightkeeper''s Executioner'),
(3210000,240223,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shoulderguards, Winter Tooth'),
(3210000,240423,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Belt of the Earth Spirit'),
(3210000,240685,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Boomstick of the Old Kingdom'),
(3210000,240699,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Harness of the Wyrm King'),
(3210000,260349,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Silent Knight''s Frozen Pants'),
(3210000,260357,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Mask of the Bone Lord'),
(3210000,260439,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Pale Legguards'),
(3210000,260474,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Bloodwarden''s Wristbands'),
(3210000,260488,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Footguards of the Twilight Flame'),
(3210000,260533,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Unbroken Thirst Pants'),
(3210000,260618,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Headguard of the Twilight Crown'),
(3210000,280032,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Greatcloak of the Amberpine Lodge'),
(3210000,280241,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Hollow Binding of the Sacred Dawn'),
(3210000,280532,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Icecaller''s Shadowwoven Promise'),
(3210000,280643,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Northman''s Armbands'),
(3210000,280730,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Froststeel Skirt of the Mana Wyrm'),
(3210000,320014,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Scourgebound Key'),
(3210000,320451,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shroud, Dusk Talon'),
(3210000,320540,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Wargrips of Raven Spirit'),
(3210000,320583,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Nightcloak of Deep Forge'),
(3210000,320631,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Spaulders of the Rime Crown'),
(3210000,320894,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Dragon King''s Waistguard of the Dark Star'),
(3210000,320909,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Chausses, Demon Grasp'),
(3210000,340339,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Mitts, Skull Keeper'),
(3210000,340415,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Handwraps of Ancient Storm'),
(3210000,340459,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Robes of the Westguard Keep'),
(3210000,340515,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Armbands of the Wind King'),
(3210000,340888,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Dragonlord''s Froststeel Gloves'),
(3210000,340914,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Last King''s Warforged Leggings'),
(3210000,340940,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Trousers of the Golden Moon'),
(3210000,360071,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Brilliant Boots'),
(3210000,360130,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Signet Ring, Pale Punch'),
(3210000,360161,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Mystic Regalia of the Storm Forge'),
(3210000,360411,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Cowl of Violet Hold'),
(3210000,360662,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shadow King''s Charm of the Golden Moon'),
(3210000,360675,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Scarlet Marshal''s Runebands of the Sunwell'),
(3210000,360714,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Greenwood Staff of Makers Vault'),
(3210000,360820,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Deepforged Great Stave'),
(3210000,360923,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Darkkeeper''s Mantle'),
(3210000,380022,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Rune-carved Armguards of the Violet Gate'),
(3210000,380257,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shadowmage''s Consecrated Medallion'),
(3210000,380304,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Torque of the Unquiet King'),
(3210000,380323,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Merciless Footguards of the Black Flight'),
(3210000,380411,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | The Purified Wristbands'),
(3210000,380425,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Ghostkeeper''s Grips'),
(3210000,380565,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Calm Walkers of Death Lord'),
(3210000,380671,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Mask, Sable Ember'),
(3210000,380921,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Shoulderguards, Red Judgment'),
(3210000,380977,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000593 | Circle of the Ebon Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210001,220149,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Duskbound Pauldrons of Silent Moon'),
(3210001,220464,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Stonekeeper''s Ancient Pauldrons'),
(3210001,280313,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Brooch of Exodar Crystal'),
(3210001,280939,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | The Northborn Breeches'),
(3210001,320111,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Ironthane Helm, Frozen Queen''s Oath'),
(3210001,320906,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Violet Guardian''s Bloodstained Helm'),
(3210001,340350,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Armorsmith''s Gloves of the Light Eternal'),
(3210001,340700,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Gravewarden''s Tunic'),
(3210001,340752,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Kilt of the Ice King'),
(3210001,360453,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Wolfsworn Waistband, Highlord''s Oath'),
(3210001,360635,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Moonlit Nightcloak'),
(3210001,360757,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Borean Icon, Battlelord''s Oath'),
(3210001,360819,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Wyrm King''s Legwraps of the Burning Crown'),
(3210001,380144,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Circle of Alterac Mountains'),
(3210001,380703,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 trash | Shadowguard''s Darksteel Wargrips');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210002,200010,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Wargrips of Blue Dragon'),
(3210002,200129,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Legplates of Scale Queen'),
(3210002,200173,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Lion Helm Great Gauntlets'),
(3210002,200182,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Ash Sorrow Forgehammer'),
(3210002,200242,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Manaforged Poleblade'),
(3210002,200302,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Wyrmscale Torque'),
(3210002,200551,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Cruel Torc of the Dragon Spirit'),
(3210002,200670,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Tarnished Bracers'),
(3210002,200764,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Illusory Waistplate'),
(3210002,200933,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Boneguard''s Frostbitten Waistguard'),
(3210002,200946,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Sollerets of Forgotten Memory'),
(3210002,200985,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Tempered Handguards of the North Wind'),
(3210002,220126,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Thunder Creed Legplates'),
(3210002,220195,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Everfrost Shoulderplates'),
(3210002,220221,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Starwoven Armguards'),
(3210002,220377,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Ancient Warden''s Gauntlets'),
(3210002,220436,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Shadowsteel Handguards of Searing Gorge'),
(3210002,220556,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Greatblade of the Iron Council'),
(3210002,220613,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Obsidian Armplates'),
(3210002,220664,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Bell of the Ebon Vanguard'),
(3210002,220680,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Veteran Legplates of Dying Light'),
(3210002,220771,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Ebon Knight''s Headplate of the Fallen King'),
(3210002,220862,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Crimson Great Gauntlets of the Fel Flame'),
(3210002,240028,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Battle Bow of Fallen Crown'),
(3210002,240151,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Blood King''s Legmail of the Golden Flame'),
(3210002,240372,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | The Jeweled Helm'),
(3210002,240389,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Mystic Steel Crossbow of the Holy Oath'),
(3210002,240497,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Frostforged War Leggings of Avalanche'),
(3210002,240529,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Footguards, Spell Requiem'),
(3210002,240688,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Warboots, Rime Keeper'),
(3210002,240693,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Dragonsteel Handguards of the Mage Tower'),
(3210002,240873,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Dragonwarden''s Brooch of the Void Watch'),
(3210002,240882,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Blacksmith''s Stormforged Hauberk'),
(3210002,240888,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Capelet of the Titan Forge'),
(3210002,240960,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Spiritkeeper''s Harness'),
(3210002,260034,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Ruthless Shoulderguards'),
(3210002,260163,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Deathknight''s Ashen Chestguard'),
(3210002,260391,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Voidsteel Chestguard'),
(3210002,260631,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Tunic, Blood Warden'),
(3210002,260706,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Talisman of the Last Memory'),
(3210002,260752,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Darkforged Carapace'),
(3210002,280005,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Old Warden''s Morningstar of the Dead King'),
(3210002,280199,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Celestial Talon Sash'),
(3210002,280432,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | The Winterborn Shawl'),
(3210002,280525,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Graspers of the Dawn Guard'),
(3210002,280666,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Walkers, Green Shield'),
(3210002,320026,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Nameless Warbelt'),
(3210002,320268,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | War Leggings of Tirisfal Glades'),
(3210002,320376,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Umbral Cape'),
(3210002,320765,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Forgemaster''s Mantle of the Yogg Prison'),
(3210002,320776,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Moon King''s Key of the Earthen Watch'),
(3210002,340568,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Shadowsteel Binding of Sacred Flame'),
(3210002,340731,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Wayfarer''s Epaulets'),
(3210002,360031,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Headdress of the Coldarra'),
(3210002,360100,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Crook of the Quel Thalas'),
(3210002,360251,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Wolfmarked Pants of Blood Ritual'),
(3210002,360324,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Royal Band, Lost Shard'),
(3210002,360343,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Beads of Frozen Throne'),
(3210002,360349,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Hoop, Dragon Bane'),
(3210002,360387,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Runelord''s Magebound Crook'),
(3210002,360594,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Death Twilight Vest'),
(3210002,360895,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Epaulets of the Star Forge'),
(3210002,380020,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Stoic Pendant Chain of the Mimiron Forge'),
(3210002,380146,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | The Hexed Legwraps'),
(3210002,380232,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Spell Stave, Wild Whisper'),
(3210002,380570,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Vest of the Silver Watch'),
(3210002,380829,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Scythe, Wind Branch'),
(3210002,380932,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000595 | Nameless Chestguard of the Golden Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210003,200019,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Illusory Battleplate Legguards'),
(3210003,200022,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Firecaller''s Mournful Greaves'),
(3210003,200047,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Visor, Unbroken Hail'),
(3210003,200158,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Silversteel Wargrips'),
(3210003,200188,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Ice Rend War Leggings'),
(3210003,200305,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Wyrm Queen''s Starbound Warbelt'),
(3210003,200497,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Highguard''s Neckchain of the Soul Watch'),
(3210003,200716,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Graveborn Loop'),
(3210003,200883,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Footplates of Wild Heart'),
(3210003,200978,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Stormwrought Bracers'),
(3210003,220336,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Highblade of the Midnight Crown'),
(3210003,220340,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Shard, Wild Oath'),
(3210003,220387,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Ivory Signet of the Bloodguard'),
(3210003,220604,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Astral Brooch of the Bone Throne'),
(3210003,220930,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Argent Defender''s Sorrowful Aegis'),
(3210003,220967,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Lost Warden''s Griefbound Waistplate'),
(3210003,240002,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Greaves of Silver Covenant'),
(3210003,240177,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Claymore of the Shadowmoon Valley'),
(3210003,240208,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Handguards of the Cold Watch'),
(3210003,240241,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Bearhide Mail'),
(3210003,240292,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Holy Torque of Drake Rider'),
(3210003,240338,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Pale-blue Waistchain'),
(3210003,240339,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Marauding Shoulderguards'),
(3210003,240703,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Warcloak of the Ulduar'),
(3210003,240764,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Frostworn Capelet'),
(3210003,240932,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Runed Clasp'),
(3210003,260010,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Edge of the Fire Spirit'),
(3210003,260107,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Warmarked Warhammer'),
(3210003,260111,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Darkened Treads'),
(3210003,260381,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Stormwarden''s Wristguards'),
(3210003,260435,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Strap of Dark Forge'),
(3210003,260617,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Deathly Girdle'),
(3210003,260689,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Jerkin, Wild Woe'),
(3210003,260762,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Winterworn Signet of the Storm Crown'),
(3210003,260801,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Pale-blue Shoulderpads, Crusader''s Oath'),
(3210003,260835,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Ominous Signet of Iron Banner'),
(3210003,260837,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Pale Mantle of Grim March'),
(3210003,260840,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Howling Treads'),
(3210003,280274,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Moon Wand of Nightwatch'),
(3210003,280447,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Great Stave of the Silent Road'),
(3210003,280461,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Mitts of the Thunder Watch'),
(3210003,280580,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Stormscarred Robe'),
(3210003,280684,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Bone of Shadow Ritual'),
(3210003,280776,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Anvilkeeper''s Sash'),
(3210003,320311,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Nightshrouded War Mantle'),
(3210003,320391,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Gloves of Utgarde'),
(3210003,320464,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Jeweled Helm of the Ancient Oak'),
(3210003,320560,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Hardened Ring'),
(3210003,320609,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Highkeeper''s Helm'),
(3210003,320705,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Star Scar Leggings'),
(3210003,320879,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Crusher of the Titan Crown'),
(3210003,320897,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Rune Band of Grim Crown'),
(3210003,320914,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Wolfhide Grips of Yogg Prison'),
(3210003,320992,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Sunforged Treads, First Keeper''s Oath'),
(3210003,340014,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Vestments of the Dragon Wastes'),
(3210003,340077,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Frostcaller''s Choker'),
(3210003,340124,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Weathered Waistband'),
(3210003,340276,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Charm of Ulduar'),
(3210003,340298,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Cord, Skull Sorrow'),
(3210003,340379,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Infused Waistwrap'),
(3210003,340469,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Seer''s Flamebound Medallion'),
(3210003,340558,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Dire Beads of the Emerald Moon'),
(3210003,340665,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Warscarred Capelet'),
(3210003,340804,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Fire Blade Shoes'),
(3210003,340816,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Hidden Woe Cuffs'),
(3210003,360098,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Shoes of Gjalerbron'),
(3210003,360147,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Tombkeeper''s Voidbound Robes'),
(3210003,360209,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Headdress, Bloodfire Ash'),
(3210003,360252,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Eye, Wyrm Rime'),
(3210003,360362,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Fierce Bloom Cuffs'),
(3210003,360589,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Cryptkeeper''s Circle of the Amber Ledge'),
(3210003,360732,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Stormguard''s Vestments of the Old Kingdom'),
(3210003,360917,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | The Voidforged Shoulder Cape'),
(3210003,380035,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Hand Hammer of Twilight Reach'),
(3210003,380120,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Black Star Fang'),
(3210003,380155,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Wargrips, Argent Hymn'),
(3210003,380182,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Stonehammer of the Spellweaver'),
(3210003,380294,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Emberwarden''s Legwraps of the Scarlet Dawn'),
(3210003,380300,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Last Queen''s Corroded Maul'),
(3210003,380427,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Rimecaller''s Strap'),
(3210003,380448,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Rune King''s Dragonbound Girdle'),
(3210003,380460,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Nightforged Clutches of Wintergrasp'),
(3210003,380693,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Flame Memory Shoulderwraps'),
(3210003,380764,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Siege Hammer of Dragon Forge'),
(3210003,380773,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Darkcaller''s Scourged Claws'),
(3210003,380795,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000596 | Gravelord''s Helm');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210004,220364,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Illusory Medallion of Stone Crown'),
(3210004,280605,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Blademaster''s Hand Hammer'),
(3210004,280892,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Vengeful Torc'),
(3210004,320060,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Kingsguard''s Casque'),
(3210004,340106,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Everfrost Handwraps of the Great Forge'),
(3210004,340454,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Bearhide Hood of the Raven Spirit'),
(3210004,360413,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | The Vigilant Vest'),
(3210004,360715,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Silver Queen''s Eternal Skinner'),
(3210004,380505,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000597 | Waistband of the Black Moon');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3210005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3210005,200609,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Warlord''s Wyrmscale Ringlet'),
(3210005,220401,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Grey Ray Nightcloak'),
(3210005,260094,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Harness, Soulfire Torment'),
(3210005,320506,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Leggings of Mage Tower'),
(3210005,340565,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Binding of the Unending Watch'),
(3210005,380992,0,0,0,1,1,1,1,'Generated map_209_difficulty_0 boss_000600 | Nightshrouded Spaulders');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7795 AND `Item` = 1 AND `Reference` = 3210000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7795,1,3210000,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | boss_000593');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5648 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5648,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5649 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5649,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 5650 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(5650,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7246 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7246,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7247 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7247,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7268 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7268,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7274 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7274,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7604 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7604,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7605 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7605,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7606 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7606,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7608 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7608,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7797 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7797,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8095 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8095,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8120 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8120,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10080 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10080,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10081 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10081,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10082 AND `Item` = 1 AND `Reference` = 3210001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10082,1,3210001,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8127 AND `Item` = 1 AND `Reference` = 3210002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8127,1,3210002,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | boss_000595');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7272 AND `Item` = 1 AND `Reference` = 3210003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7272,1,3210003,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | boss_000596');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7271 AND `Item` = 1 AND `Reference` = 3210004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7271,1,3210004,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | boss_000597');

DELETE FROM `creature_loot_template` WHERE `Entry` = 7267 AND `Item` = 1 AND `Reference` = 3210005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(7267,1,3210005,2,0,1,0,1,1,'Generated encounter attachment | map_209_difficulty_0 | boss_000600');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220000,220399,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000267 | Visor, Unholy Flare'),
(3220000,340974,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000267 | Pants of the Wyrmrest'),
(3220000,360706,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000267 | Moonsteel Idol of the Drak Tharon');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220001,200166,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Warlord Armplates'),
(3220001,200280,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Silverblessed War Pauldrons'),
(3220001,200413,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Anvilkeeper''s Relicbound Chestplate'),
(3220001,200424,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Baneful Beads'),
(3220001,200488,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Breastplate of Last Stand'),
(3220001,200585,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Handplates, Grim Seal'),
(3220001,220016,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Rune King''s Battlecloak'),
(3220001,220068,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Dusklit Visor of Star King'),
(3220001,220278,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Fire Horn Heart'),
(3220001,220310,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Spellbinder''s Brassbound Iron Boots'),
(3220001,220610,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Woeful Seal of Bronze Dragon'),
(3220001,220648,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Sabatons of the Light Eternal'),
(3220001,220686,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Shadowcaller''s Mountainborn Visor'),
(3220001,240593,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Plague Twilight Greaves'),
(3220001,240595,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Watchful War Leggings'),
(3220001,240896,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Steadfast Belt of Wintergrasp'),
(3220001,260682,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Warblade, Moon Vow'),
(3220001,260787,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Great Cape, Thorn Voice'),
(3220001,280154,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Walkers, Fierce Starfall'),
(3220001,280201,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Gravebound Gloves'),
(3220001,280216,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Bloodwarden''s Shoulderpads'),
(3220001,280467,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Moonfire Winter Pillar'),
(3220001,280520,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Plagueforged Rune Band of Winter Court'),
(3220001,280645,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Kilt, South Shadow'),
(3220001,280870,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Talisman of the Red Dragon'),
(3220001,300093,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Battleplate Legguards, Bright Ray'),
(3220001,300437,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Ebon Crusader''s Greathelm'),
(3220001,300576,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Fierce Claymore'),
(3220001,300622,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Forgeblessed Pauldrons, Voidwarden''s Oath'),
(3220001,300660,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Witchcaller''s Icebound Stone Relic'),
(3220001,300811,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Forsaken Vial'),
(3220001,320041,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Warhelm of Dark Rider'),
(3220001,320191,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Warmarked Warboots of Drowned Hall'),
(3220001,320274,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Mistbound Spaulders'),
(3220001,320462,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Flamewarden''s Girdle of the Northern Watch'),
(3220001,320465,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Cracked Surcoat of Winter Memory'),
(3220001,320517,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Hardened Iron Axe'),
(3220001,320588,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | War Mantle of the Frozen Heart'),
(3220001,320660,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Heavy Ring'),
(3220001,320853,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Northforged Chestguard, Lightcaller''s Oath'),
(3220001,340042,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Northwarden''s Trousers of the Frost Giant'),
(3220001,340240,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Shadow Woe Robe'),
(3220001,340322,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Doomforged Gloves, Argent Crusader''s Oath'),
(3220001,340554,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Pants of Sky Forge'),
(3220001,340576,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Dragonmarked Greatcloak'),
(3220001,340582,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Rune King''s Stalwart Mage Staff'),
(3220001,340783,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Stormforged Icon'),
(3220001,360172,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Frostbitten Seal Ring'),
(3220001,360192,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | West Rage Handwraps'),
(3220001,360355,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Blademaster''s Cinch'),
(3220001,360377,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Skirt, Bone Fall'),
(3220001,360409,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Eye of the Dragon Pact'),
(3220001,360535,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Longstaff, White Echo'),
(3220001,380087,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Sunforged Medallion of the Last Vigil'),
(3220001,380288,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Storm Queen''s Hateful Mark'),
(3220001,380465,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Coal-black Shoulderpads of Ironforge Guard'),
(3220001,380476,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | The Silverblessed Sigil'),
(3220001,380534,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | First Queen''s Relicbound Cinch'),
(3220001,380538,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Sacred Reaver Clutches'),
(3220001,380672,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 trash | Wind Beacon War Relic');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220002,220978,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | The Fel Fingerband'),
(3220002,240297,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | The Shadowsteel Great Cape'),
(3220002,360152,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | The Runed Shoulder Cape'),
(3220002,360344,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | Bindings of Wind Watch'),
(3220002,360430,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | Forgotten Keeper''s Figurine'),
(3220002,380187,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000268 | Lost Vigil Shoulder Drape');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220003,220834,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Cuirass, Emerald Stone'),
(3220003,240413,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Treads of the Nagrand'),
(3220003,260344,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Darksteel Jerkin'),
(3220003,260636,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Signet Ring of Nagrand'),
(3220003,280578,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | The Gleaming Longstaff'),
(3220003,280667,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Gemmed Band of the Dark Iron Clan'),
(3220003,320203,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | Knife of the Iron Giant'),
(3220003,360527,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000269 | The Age-darkened Binding');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220004,220240,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000270 | The Worldworn Cuirass'),
(3220004,280395,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000270 | Soldierly Tunic');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220005,260543,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000272 | Wolfhide Pants of Earthshaper'),
(3220005,380541,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000272 | The Whispering Shoulder Drape');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220006,200907,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000274 | Clasp of Ice King'),
(3220006,240286,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000274 | Dreadforged Dragonbow'),
(3220006,280822,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000274 | Starfang Rider Pendant'),
(3220006,320210,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000274 | Starlit Warboots'),
(3220006,320797,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000274 | Frostworn Shoulderguards');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220007,200000,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Scourgebound Waistplate of Dragonblight'),
(3220007,200238,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Last Keeper''s Bracers'),
(3220007,200417,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | The Wyrmhide Armplates'),
(3220007,220478,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | War Leggings of the Azjol Nerub'),
(3220007,240140,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Scout Bow, Holy Star'),
(3220007,240385,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Iron Queen''s Murderous Warcloak'),
(3220007,240524,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | The Royal Steel Crossbow'),
(3220007,240951,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Stoneward Boots of Kings Promise'),
(3220007,260227,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Headguard of the Deep Forge'),
(3220007,260856,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Clouded Medallion of the Rune Watch'),
(3220007,280931,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | The Boneclad Mage Staff'),
(3220007,300388,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Sollerets of Storm Crown'),
(3220007,300777,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Wristplates of Makers Hand'),
(3220007,340426,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Obsidian Vengeance Talisman'),
(3220007,340932,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Royal Bracelets'),
(3220007,360335,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Deathknight''s Corroded Runering'),
(3220007,360400,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Wyrmwarden''s Doomforged Skirt'),
(3220007,360513,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Tunic, Fel Breath'),
(3220007,380163,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Skullwarden''s Azure Shroud'),
(3220007,380874,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Thorned Carapace of the Light Eternal'),
(3220007,380889,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000275 | Thunderkeeper''s Wyrmcarved Deathmask');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3220008;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3220008,200851,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Flask of Emerald Wilds'),
(3220008,220733,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Starcaller''s Runeaxe'),
(3220008,240457,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Unyielding Surcoat of Dark Crown'),
(3220008,280433,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | The Stonehewn Walkers'),
(3220008,300314,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Wyrmkeeper''s Vambraces of the Shadow Vault'),
(3220008,300570,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Greaves of the Black Ritual'),
(3220008,300826,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Armguards of the Violet Citadel'),
(3220008,340363,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Whitegold Footwraps of Pale Crown'),
(3220008,340491,0,0,0,1,1,1,1,'Generated map_229_difficulty_0 boss_000276 | Sainted Bindings');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9196 AND `Item` = 1 AND `Reference` = 3220000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9196,1,3220000,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000267');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9096 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9096,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9097 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9097,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9098 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9098,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9197 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9197,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9216 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9216,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9217 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9217,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9218 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9218,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9219 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9219,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9239 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9239,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9240 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9240,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9241 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9241,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9257 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9257,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9258 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9258,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9259 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9259,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9260 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9260,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9261 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9261,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9262 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9262,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9263 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9263,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9264 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9264,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9265 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9265,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9266 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9266,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9267 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9267,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9268 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9268,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9269 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9269,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9583 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9583,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9596 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9596,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9692 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9692,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9693 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9693,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9716 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9716,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9717 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9717,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9718 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9718,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9817 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9817,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9818 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9818,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9819 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9819,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10083 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10083,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10263 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10263,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10317 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10317,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10318 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10318,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10319 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10319,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10366 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10366,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10372 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10372,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10374 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10374,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10376 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10376,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10447 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10447,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10509 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10509,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10762 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10762,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10814 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10814,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10899 AND `Item` = 1 AND `Reference` = 3220001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10899,1,3220001,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9236 AND `Item` = 1 AND `Reference` = 3220002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9236,1,3220002,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000268');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9237 AND `Item` = 1 AND `Reference` = 3220003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9237,1,3220003,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000269');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10596 AND `Item` = 1 AND `Reference` = 3220004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10596,1,3220004,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000270');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9736 AND `Item` = 1 AND `Reference` = 3220005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9736,1,3220005,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000272');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10220 AND `Item` = 1 AND `Reference` = 3220006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10220,1,3220006,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000274');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9568 AND `Item` = 1 AND `Reference` = 3220007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9568,1,3220007,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000275');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9816 AND `Item` = 1 AND `Reference` = 3220008;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9816,1,3220008,2,0,1,0,1,1,'Generated encounter attachment | map_229_difficulty_0 | boss_000276');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230000,200035,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Lion Seed Titan Hammer'),
(3230000,200467,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Gleaming Greaves of Blood Pact'),
(3230000,220276,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Death Leaf Tomahawk'),
(3230000,220546,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Wargrips of Soul Forge'),
(3230000,220595,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Legguards of the Light Eternal'),
(3230000,240172,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Pendant, Rune Grip'),
(3230000,240746,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Necrotic Chausses'),
(3230000,260653,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Pale Lady''s Leggings of the New Agamand'),
(3230000,280226,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Dawncaller''s Grips'),
(3230000,280404,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Charmstone of the Shadow Pact'),
(3230000,360217,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | The Violet Walkers'),
(3230000,360502,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Runeblade, Arcane Rebuke'),
(3230000,360625,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Pants of Spider Wing'),
(3230000,360707,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Bindings of Mana Tide'),
(3230000,380183,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Talisman, Moon Brand'),
(3230000,380898,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Chestpiece of Moon Crown'),
(3230000,380960,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000227 | Ancient Grips of the Final Oath');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230001,200228,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Legguards of Fallen Watch'),
(3230001,200253,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Silent Arrow Longcloak'),
(3230001,200286,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Darkkeeper''s Guard'),
(3230001,200299,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Rune-carved Handaxe'),
(3230001,200318,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Astral Handplates'),
(3230001,200392,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Gleaming Drape'),
(3230001,200440,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Burnished Great Battleaxe of Raven Queen'),
(3230001,200441,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Visor of the Wind Crown'),
(3230001,200512,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Bronze Storm Greathelm'),
(3230001,200534,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Moon Pact Great Gauntlets'),
(3230001,200588,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Duskkeeper''s Cudgel'),
(3230001,200622,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Scarab, White Winter'),
(3230001,200642,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Last Keeper''s Siegebound Forgehammer'),
(3230001,200658,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | War Greaves, Serpent Dancer'),
(3230001,200677,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Forgemaster''s Berserker Vambraces'),
(3230001,200686,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Soul Shield Sollerets'),
(3230001,200744,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wyrmwarden''s Legguards of the Hollow King'),
(3230001,200776,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dragonlord''s Handplates'),
(3230001,200786,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Old Queen''s Bracers of the Azjol Nerub'),
(3230001,200800,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Windkeeper''s Stormmarked War Greaves'),
(3230001,200827,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ashen Lord''s Breastplate'),
(3230001,200882,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Last Spark Greaves'),
(3230001,200939,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wind Glyph Legplates'),
(3230001,200963,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Ominous Greaves'),
(3230001,220025,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warplate, Abyss Hide'),
(3230001,220054,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Last King''s War Leggings'),
(3230001,220083,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Shoulderplates, Dream Edge'),
(3230001,220104,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dawnwarden''s Torque'),
(3230001,220139,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Girdle of the Dark Iron Clan'),
(3230001,220159,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightkeeper''s Coldhearted Poleblade'),
(3230001,220164,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Forgeblessed Vambraces of the Final Dawn'),
(3230001,220204,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Northborn Band of Black Citadel'),
(3230001,220323,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warbracers of the Bronze Dragon'),
(3230001,220350,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ironlord''s Relentless Gauntlets'),
(3230001,220427,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Hearthwarden''s Greaves'),
(3230001,220448,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Drakescale Stone Relic of Ice Queen'),
(3230001,220498,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Shadowwarden''s Great Pauldrons'),
(3230001,220543,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Pauldrons of the Stratholme'),
(3230001,220550,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Unquiet Carapace'),
(3230001,220552,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Legguards, Nether Voice'),
(3230001,220606,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warplate of Star King'),
(3230001,220651,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Sorrowful Battleplate of the Howling Wind'),
(3230001,220667,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Locket of Shattered Crown'),
(3230001,220668,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Targe, Winter Bolt'),
(3230001,220689,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Legguards, Dire Glaive'),
(3230001,220728,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Titan-carved Sabatons of Ancient Banner'),
(3230001,220837,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Legplates of the First Flame'),
(3230001,220917,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Cryptkeeper''s Vambraces of the Frozen Pact'),
(3230001,220974,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Engraved Sabatons of the Cold Memory'),
(3230001,240031,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stormguard''s Blighted Great Hauberk'),
(3230001,240107,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Calm Warbelt'),
(3230001,240108,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Bright Legguards'),
(3230001,240128,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Lightcaller''s Pendant'),
(3230001,240188,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Icecaller''s Razor-edged War Leggings'),
(3230001,240265,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | War Mantle of Dread Host'),
(3230001,240272,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Dreadforged Rune Band'),
(3230001,240300,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rotting Footguards, Ashen Lord''s Oath'),
(3230001,240328,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Leafwoven Keepsake'),
(3230001,240352,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Spear Torment Shoulder Guards'),
(3230001,240415,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ghostly Casque'),
(3230001,240425,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wintersteel Battle Rifle of Bleak Shore'),
(3230001,240540,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Seal Ring of Black Temple'),
(3230001,240561,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Deathly Gemmed Band of the Northwatch'),
(3230001,240599,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Spiritbound Neckchain'),
(3230001,240629,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Spider Shine Treads'),
(3230001,240631,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Pale Lady''s Hammered Siege Gun'),
(3230001,240687,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Lost Warden''s Fingerband of the Rime Forge'),
(3230001,240758,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Icecaller''s War Leggings'),
(3230001,240765,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Spiritwarden''s Chain'),
(3230001,240815,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Obsidian Torment Ringlet'),
(3230001,240838,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stonefather''s Bloodstained Wrist Chains'),
(3230001,240853,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Chillborn Mail'),
(3230001,240980,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warhelm of Blood Ritual'),
(3230001,240997,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Doomed Casque'),
(3230001,260012,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Strap, Sacred Briar'),
(3230001,260019,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Mask of the Crimson Banner'),
(3230001,260047,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightkeeper''s Carapace'),
(3230001,260065,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rotting Mask'),
(3230001,260077,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Jagged Fingerband'),
(3230001,260109,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Last Keeper''s Piercer'),
(3230001,260124,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Blood Guard Jerkin'),
(3230001,260139,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Hammerlord''s Pale Bracers'),
(3230001,260144,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Frostbound Footguards'),
(3230001,260156,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dagger of the Dragon Throne'),
(3230001,260232,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Corroded Clasp'),
(3230001,260253,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stoneguard''s Earthforged Cap'),
(3230001,260279,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Darkened Walkers of Celestial Gate'),
(3230001,260280,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Deathly Wargrips of Kings Promise'),
(3230001,260291,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Shoulderwraps of Brunnhildar Village'),
(3230001,260319,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Gray Gloves of the Blood Moon'),
(3230001,260371,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Bright Charm'),
(3230001,260467,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Sinister Rune Dagger'),
(3230001,260559,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stormkeeper''s Hateful Tunic'),
(3230001,260716,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Bloodguard''s Shroud of the Dead Memory'),
(3230001,260768,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Earthbound Treads of Frozen Gate'),
(3230001,260786,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Argent Cowl'),
(3230001,260875,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Astral Ember Shoulderwraps'),
(3230001,260920,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rune King''s Belt of the Earthshaper'),
(3230001,260923,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Icekeeper''s Bracers of the Shadow King'),
(3230001,260928,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Lost Warden''s Cabalistic Wargrips'),
(3230001,280030,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Grim Vest'),
(3230001,280041,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Windbound Binding of the Wyrm Forge'),
(3230001,280066,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ironthane''s Sandals'),
(3230001,280073,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Drakescale Traveling Cloak'),
(3230001,280125,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Titanic Shoes'),
(3230001,280164,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Ominous Legwraps'),
(3230001,280169,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Mystic Cry Promise'),
(3230001,280242,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Icebound Chestwrap of the Blood Memory'),
(3230001,280288,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Footwraps of the Demon Lord'),
(3230001,280346,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Gravekeeper''s Brightmoon Signet Ring'),
(3230001,280466,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Forsaken Signet'),
(3230001,280478,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Moonwoven Hourglass'),
(3230001,280487,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Crusader Waistband'),
(3230001,280554,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Raiment, Far Bolt'),
(3230001,280561,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Mitts, Argent Steel'),
(3230001,280639,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ironlord''s Chestwrap of the Winter Court'),
(3230001,280653,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Amulet, Dawn Guard'),
(3230001,280665,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Twilightkeeper''s Shaman Staff'),
(3230001,280669,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dawncaller''s Gloves of the Avalanche'),
(3230001,280677,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Soldierly Pendant Chain'),
(3230001,280716,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wolfmarked Gloves of Violet Citadel'),
(3230001,280725,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Doomed Footwraps'),
(3230001,280784,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Sunkeeper''s Bracelets of the Hodir Hall'),
(3230001,280916,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Bloodguard''s Aged Robes'),
(3230001,280921,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Deathless Diadem'),
(3230001,280929,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Boots of the Black Anvil'),
(3230001,280964,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Gloves of Scourge Host'),
(3230001,280980,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Glacial Idol'),
(3230001,320051,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Waistchain, Ivory Ice'),
(3230001,320054,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dragonforged Warboots of the Soul Watch'),
(3230001,320075,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Briarwoven Seal'),
(3230001,320096,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wyrmlord''s Chain'),
(3230001,320158,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ashcaller''s Cerulean Greaves'),
(3230001,320208,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Violet Warden''s War Mantle'),
(3230001,320267,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wildfire Woe Warhelm'),
(3230001,320269,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Footguards of the Holy Flame'),
(3230001,320344,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Forgotten Knight''s Violet Collar'),
(3230001,320372,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dragonstalker''s Helm of the War Forge'),
(3230001,320379,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | War Hatchet of the Northern Light'),
(3230001,320414,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stoic Wargrips of the Blighted Land'),
(3230001,320438,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Eternal Warstaff of the Ancient Grove'),
(3230001,320439,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ferocious Waistchain, Lost Warden''s Oath'),
(3230001,320455,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Permafrost Coif'),
(3230001,320457,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stoneguard''s Stonehewn Gloves'),
(3230001,320476,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Deathwarden''s Coif'),
(3230001,320544,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warhelm, Earth Judgment'),
(3230001,320601,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Brazen Helm of the Lost Memory'),
(3230001,320664,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Chestguard of the Last Stand'),
(3230001,320689,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Coldfire Shard Relic'),
(3230001,320747,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Stormsteel Gauntlets'),
(3230001,320767,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Arctic Seal Ring of the Mana Forge'),
(3230001,320790,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Obsidian Heart Fingerband'),
(3230001,320817,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Horn, Wind Bite'),
(3230001,320818,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Grips, Eagle Crown'),
(3230001,320833,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Watchful Chausses'),
(3230001,320852,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rimecaller''s Poniard'),
(3230001,320864,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Storm Queen''s Hourglass of the Kaskala'),
(3230001,320870,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Terrible Rune, Silverkeeper''s Oath'),
(3230001,320947,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Deathforged War Leggings of the Last King'),
(3230001,320975,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightcaller''s Wargrips of the Silent Moon'),
(3230001,320991,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Greatcloak, White Thorn'),
(3230001,340004,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Vrykul Totem'),
(3230001,340036,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightforged Walking Staff'),
(3230001,340078,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Darkcaller''s Mournful Capelet'),
(3230001,340099,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wyrmguard''s Insignia'),
(3230001,340117,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Night Vengeance Hoop'),
(3230001,340143,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Cowl of Great Eagle'),
(3230001,340170,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Soulkeeper''s Charm of the Demon Lord'),
(3230001,340225,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ravenkeeper''s Feathered Cinch'),
(3230001,340313,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Boots of the Dawn Guard'),
(3230001,340334,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Bonebound Warcloak'),
(3230001,340461,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Battlelord''s Wristwraps'),
(3230001,340719,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Shadowbound Wristwraps'),
(3230001,340753,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Chestwrap, Dream Bane'),
(3230001,340760,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Vest, Sunfire Pledge'),
(3230001,340841,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Boneguard''s Locket'),
(3230001,340905,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Heroic Kilt of Ancient Spirit'),
(3230001,340907,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Trousers of the Restless Dead'),
(3230001,340959,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wildforged Legwraps of the Rime Crown'),
(3230001,340986,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Mournbound Cord'),
(3230001,360013,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Cryptlord''s Sandals of the Makers Overlook'),
(3230001,360022,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Tombkeeper''s Vest of the Sunwell'),
(3230001,360043,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Wolfsworn Walkers'),
(3230001,360047,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Flamecaller''s Everfrost Walking Staff'),
(3230001,360053,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Crown Bolt Longsword'),
(3230001,360072,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Branch of the Shadow Crown'),
(3230001,360077,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Whitegold Raiment of the Wild King'),
(3230001,360110,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Green Ember Skullcap'),
(3230001,360166,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ravenlord''s Flamebound Great Stave'),
(3230001,360375,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Titanforger''s Hoop of the Ashen Vale'),
(3230001,360408,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Patient Nightcloak of Grave Watch'),
(3230001,360504,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Legwraps of the Shadow Ritual'),
(3230001,360525,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nerubian Cord of Broken Promise'),
(3230001,360557,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Binding of Shadowbinder'),
(3230001,360659,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Far Vengeance Cloak'),
(3230001,360687,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Highkeeper''s Sash of the Endless Night'),
(3230001,360708,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Duskwarden''s Hammered Armbands'),
(3230001,360738,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | High Gloom Sash'),
(3230001,360749,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightbound Star Wand'),
(3230001,360756,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Blackened Bell'),
(3230001,360783,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Binding of Ancient Night'),
(3230001,360855,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Faded Cowl of the Walking Dead'),
(3230001,360874,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Lightlord''s Faithful Ring'),
(3230001,360890,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rune-etched Binding of Dragon Crown'),
(3230001,360894,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ice Witch''s Grips of the Hidden Road'),
(3230001,360898,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Boots of Blood Tide'),
(3230001,360958,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Howling Robes of the Lost Promise'),
(3230001,360969,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Wolfsworn Talisman'),
(3230001,360988,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Waistband of the Dragon Guard'),
(3230001,380000,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dreamwoven Pants'),
(3230001,380009,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightsteel Beads of the Wild Hunt'),
(3230001,380043,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Trousers of the Pale Flame'),
(3230001,380056,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ghostwarden''s Whitefrost Bracers'),
(3230001,380083,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Stonecarved Walkers of Silver Banner'),
(3230001,380084,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Cap of the Fel Watch'),
(3230001,380096,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Eye of the Endless Night'),
(3230001,380170,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | The Wolfsworn Pants'),
(3230001,380173,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Greatstaff, Gray Hunter'),
(3230001,380200,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Warchief''s Carapace of the Broken Shield'),
(3230001,380217,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Thunderlord''s Warmaster Runering'),
(3230001,380269,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Tunic of Titan Watcher'),
(3230001,380278,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Chestguard, Gray Judgment'),
(3230001,380357,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Armored Boots of Final Promise'),
(3230001,380387,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Nightmare Mantle'),
(3230001,380461,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Moonkeeper''s Moonwoven Warband'),
(3230001,380467,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Voidshard Wall Armguards'),
(3230001,380479,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Ashen Wristbands of Hallowed Crown'),
(3230001,380481,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dreadbound Wristbands'),
(3230001,380576,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Voidforged Walkers'),
(3230001,380590,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Totem of the Frozen Throne'),
(3230001,380609,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wristbands of the Tempest Keep'),
(3230001,380739,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Charm, Red Voice'),
(3230001,380779,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Arcanist''s Circle'),
(3230001,380823,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Dragonstalker''s Charred Shoulderwraps'),
(3230001,380848,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Sunbound Breeches of Storm Spirit'),
(3230001,380901,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Rune-carved Great Hammer of Blue Dragon'),
(3230001,380905,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Wristguards, Spell Shine'),
(3230001,380922,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 trash | Heart of the Dark Star');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230002,200091,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | The Spiritforged Kingsblade'),
(3230002,200184,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Nightcaller''s Collar of the Wind Spirit'),
(3230002,200248,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Battleplate Legguards of Emerald Grove'),
(3230002,200819,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Chestplate, Celestial Vine'),
(3230002,220304,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Everfrost Handplates of the Wild Crown'),
(3230002,220344,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | The Blazing Sabatons'),
(3230002,220799,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Infused Handguards of the Last Vigil'),
(3230002,240250,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Storm Rend Fetish'),
(3230002,240814,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Moon Sigil Raider Greataxe'),
(3230002,240854,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Collar of the Titan Watcher'),
(3230002,260121,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Emberforged Signet Ring'),
(3230002,260567,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Warlord Helm of the Azure Moon'),
(3230002,260777,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Ravenous Gloves of Iron Council'),
(3230002,260811,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Corrupted Spaulders, Mooncaller''s Oath'),
(3230002,260979,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Storm Queen''s Ebon Shoulderguards'),
(3230002,280587,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Titan Keeper''s Snowbound Breeches'),
(3230002,320121,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Bear Storm Fang Axe'),
(3230002,320939,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Drakebound Wristguards of Borean Tundra'),
(3230002,340496,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Frost Starfall Signet'),
(3230002,360082,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Fallen Vow Runed Staff'),
(3230002,360825,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Weathered Charmstone of the Drake Rider'),
(3230002,380456,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Sorcerous Claws'),
(3230002,380459,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | The Frostbitten Trousers'),
(3230002,380512,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Ashen Grips of the Crimson Flame'),
(3230002,380638,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Ivory Bane Wristguards'),
(3230002,380802,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000228 | Headdress of the Bear Spirit');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230003,200809,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Sinister Effigy'),
(3230003,200998,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | The Ancient Broadsword'),
(3230003,220469,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Footplates, Dire Vigil'),
(3230003,220842,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Luminous Waistplate of Deep Hall'),
(3230003,240152,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Stormcaller''s Wargrips'),
(3230003,260440,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Stalkers of Moon Pact'),
(3230003,280048,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Marauding Trousers'),
(3230003,280844,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | The Blackened Lens'),
(3230003,360176,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | The Darkmoon Longcloak'),
(3230003,360260,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000229 | Forgotten Leggings');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230004,240447,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000231 | Gloves of the Terokkar'),
(3230004,260149,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000231 | Clutches, Blood Arrow'),
(3230004,280672,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000231 | Graven Cap'),
(3230004,320289,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000231 | Runering, Rime Fall'),
(3230004,380796,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000231 | Argent Templar''s Mark');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230005,280013,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000232 | Shadowguard''s Promise of the Titan Watcher'),
(3230005,340220,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000232 | Moonlord''s Circlet');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230007,200214,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Battlesage''s Corrupted Faceguard'),
(3230007,220455,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Helm of the Silver Flame'),
(3230007,240083,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Soulbound Mail of the Twilight Watch'),
(3230007,260122,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Titan-carved Bindings'),
(3230007,280384,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Coal-black Shoulder Cape of Plague Watch'),
(3230007,340119,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Charred Seal Ring'),
(3230007,340615,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Breeches, Grave Hand'),
(3230007,360868,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000234 | Spiritforged Mage Staff of the Cold Hearth');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230008;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230008,200972,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Battleplate, Earth Edge'),
(3230008,220022,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Twilightkeeper''s Siegebound Breastplate'),
(3230008,220027,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Gemmed Band of the Wind Spirit'),
(3230008,220183,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Rime Lord Vambraces'),
(3230008,220246,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Ancient Queen''s Wildwoven Great Lance'),
(3230008,220313,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Crusader''s Vambraces'),
(3230008,220414,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Wristplates of the Blue Flight'),
(3230008,220884,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | The Hoarfrost Warbelt'),
(3230008,240964,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Runecaller''s Backcloth of the Holy Crown'),
(3230008,260061,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Stalkers, Demon Talon'),
(3230008,260861,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Wolf Anvil War Claw'),
(3230008,260988,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Prime Spire Leggings'),
(3230008,280577,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Leggings of Makers Forge'),
(3230008,280767,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Runemarked Cinch'),
(3230008,280803,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Sandals of the Crimson Moon'),
(3230008,280813,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Gold Spirit Cord'),
(3230008,280848,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Shoulderwraps, Far Glyph'),
(3230008,320410,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Highguard''s Mail'),
(3230008,320962,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Oathwarden''s Wargrips of the Scarlet Keep'),
(3230008,340329,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | The Glasslike Treads'),
(3230008,340802,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | The Glittering Choker'),
(3230008,360253,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Drakekeeper''s Clasp'),
(3230008,360468,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Regalia of the Ghost Watch'),
(3230008,360582,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Moonsteel Cuffs of the Runekeeper'),
(3230008,360754,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Ancestor''s Tombforged Cord'),
(3230008,360932,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Stormlord''s Signet'),
(3230008,380313,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Frostlord''s Runering'),
(3230008,380503,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Great Cape, Emerald Star'),
(3230008,380866,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000235 | Silver King''s Rune of the Hallowed Watch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230009;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230009,200929,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Sabatons of the Midnight Moon'),
(3230009,240143,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Stormforged Waistguard of Silent Road'),
(3230009,240489,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Legguards of the Fel Flame'),
(3230009,240707,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Watchful War Mantle'),
(3230009,260475,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Lost Keeper''s Gloves of the Ancient Thorn'),
(3230009,280146,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | The Age-darkened Shaman Staff'),
(3230009,280589,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Worldwarden''s Cord of the Scourge Lord'),
(3230009,300253,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Icetouched Locket of Storm Forge'),
(3230009,340786,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | First Knight''s Raiment'),
(3230009,380371,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Bonecaller''s Legguards of the Violet Crown'),
(3230009,380403,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Stalkers of the Old Gods'),
(3230009,380669,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000236 | Earthen Clutches');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230010;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230010,240812,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000237 | Flamekeeper''s Hollow Casque');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230012;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230012,200200,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Headsman Axe, Fire Fist'),
(3230012,200445,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Legplates of Lich King'),
(3230012,220021,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Relic of Ashen Oath'),
(3230012,240345,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Surcoat of Plague Watch'),
(3230012,240549,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Gemmed Band of the Dawn Light'),
(3230012,240586,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Blighted Handguards'),
(3230012,240867,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Serpent Gloom Thunderstick'),
(3230012,240943,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Hollow Chill Wristguards'),
(3230012,260225,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Shadowforged Helm'),
(3230012,260395,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Low Flame Shoulderwraps'),
(3230012,260781,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Shadowguard''s Warped Spellblade'),
(3230012,280804,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Warcaller''s Quarterstaff of the Mystic Eye'),
(3230012,280852,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Cudgel of the Star Watch'),
(3230012,320484,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Greatcloak of the Frost Forge'),
(3230012,340057,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | The Cruel Cord'),
(3230012,340263,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Merciless Circlet of the Mana Tide'),
(3230012,340696,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Iron Torment Bindings'),
(3230012,340761,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Warscarred Vest'),
(3230012,360274,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Shoulderwraps, Lionheart Glyph'),
(3230012,360368,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Medallion of the Fallen Watch'),
(3230012,360702,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Coldhearted Signet of Blood Crown'),
(3230012,380517,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | The Eternal Tunic'),
(3230012,380584,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000239 | Blessed Wrap');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230014;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230014,200597,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Lost Keeper''s Handplates of the Red Dawn'),
(3230014,240793,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Ancient Wrist Chains'),
(3230014,240955,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Crimson Hide Casque'),
(3230014,260857,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Grips, Light Wyrm'),
(3230014,320677,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Wrap of Golden Light'),
(3230014,320869,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Prime Snow Headguard'),
(3230014,340432,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Chestwrap of Scarlet Crusade'),
(3230014,340835,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Legwraps of the Ironforge Guard'),
(3230014,360214,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Raven Veil Regalia'),
(3230014,380125,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | The Ethereal Breeches'),
(3230014,380787,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000242 | Arcane Gloves of Silver Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230015;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230015,220577,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000244 | Faceguard of the Freya Garden'),
(3230015,240260,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000244 | Shoulderguards, West Creed'),
(3230015,360005,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000244 | Shoulderwraps of Crusaders Coliseum'),
(3230015,360799,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000244 | Ancient Queen''s Crook of the Sacred Dawn'),
(3230015,380174,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000244 | Argent Templar''s Pendant of the Dread Host');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3230016;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3230016,200464,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Polished Pauldrons of K3'),
(3230016,220989,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Last Glow Warbelt'),
(3230016,240082,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Duskcaller''s Warbelt of the Silver Dawn'),
(3230016,240452,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Legmail of the Blood Watch'),
(3230016,240590,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Great Crossbow of Frozen Banner'),
(3230016,240874,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Gloves of Green Flame'),
(3230016,260271,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Bracers of Terokkar'),
(3230016,280105,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Winterlord''s Headdress of the War King'),
(3230016,280434,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Thundersteel Breeches'),
(3230016,280547,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Grips of Dread Watch'),
(3230016,300227,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Medallion of the Moon Crown'),
(3230016,300661,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Nightcloak of Ancient Banner'),
(3230016,300753,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | War Pauldrons, Rune Crush'),
(3230016,320425,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Harness of the Star Grove'),
(3230016,340022,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Stormguard''s Feathered Vest'),
(3230016,340088,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | The Frostmarked Cowl'),
(3230016,340242,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Emerald Snow Signet'),
(3230016,340606,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Wild Spark Cinch'),
(3230016,380378,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Shroud of the Searing Gorge'),
(3230016,380628,0,0,0,1,1,1,1,'Generated map_230_difficulty_0 boss_000245 | Battlemage''s Leggings');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9018 AND `Item` = 1 AND `Reference` = 3230000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9018,1,3230000,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000227');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8889 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8889,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8890 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8890,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8891 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8891,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8892 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8892,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8893 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8893,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8894 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8894,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8895 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8895,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8897 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8897,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8898 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8898,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8899 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8899,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8903 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8903,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8905 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8905,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8906 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8906,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8907 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8907,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8908 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8908,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8909 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8909,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8910 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8910,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8911 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8911,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8912 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8912,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8913 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8913,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8914 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8914,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8923 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8923,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8929 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8929,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9042 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9042,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9541 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9541,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9545 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9545,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9554 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9554,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9677 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9677,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9678 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9678,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9680 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9680,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9681 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9681,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9956 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9956,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10043 AND `Item` = 1 AND `Reference` = 3230001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10043,1,3230001,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9025 AND `Item` = 1 AND `Reference` = 3230002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9025,1,3230002,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000228');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9319 AND `Item` = 1 AND `Reference` = 3230003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9319,1,3230003,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000229');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9024 AND `Item` = 1 AND `Reference` = 3230004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9024,1,3230004,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000231');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9017 AND `Item` = 1 AND `Reference` = 3230005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9017,1,3230005,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000232');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9056 AND `Item` = 1 AND `Reference` = 3230007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9056,1,3230007,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000234');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9016 AND `Item` = 1 AND `Reference` = 3230008;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9016,1,3230008,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000235');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9033 AND `Item` = 1 AND `Reference` = 3230009;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9033,1,3230009,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000236');

DELETE FROM `creature_loot_template` WHERE `Entry` = 8983 AND `Item` = 1 AND `Reference` = 3230010;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(8983,1,3230010,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000237');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9502 AND `Item` = 1 AND `Reference` = 3230012;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9502,1,3230012,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000239');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9156 AND `Item` = 1 AND `Reference` = 3230014;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9156,1,3230014,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000242');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9938 AND `Item` = 1 AND `Reference` = 3230015;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9938,1,3230015,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000244');

DELETE FROM `creature_loot_template` WHERE `Entry` = 9019 AND `Item` = 1 AND `Reference` = 3230016;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(9019,1,3230016,2,0,1,0,1,1,'Generated encounter attachment | map_230_difficulty_0 | boss_000245');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3240000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3240000,200171,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Northkeeper''s Darkened Visor'),
(3240000,200225,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Warbracers of Sunreaver Host'),
(3240000,200427,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Lion Bane Waistguard'),
(3240000,220087,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Voidwarden''s Pauldrons'),
(3240000,220506,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Visor of Dread Wyrm'),
(3240000,220583,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Legguards, Spell Piercer'),
(3240000,240100,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Brightmoon Waistguard of the Khaz Modan'),
(3240000,240141,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Frozen Warden''s Illusory Great Runeblade'),
(3240000,240441,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Grim Vengeance Chainmail'),
(3240000,240480,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Frozen War Leggings of the Azjol Nerub'),
(3240000,240837,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Bloodstained Chestguard of the Storm Forge'),
(3240000,260007,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Spike, Star Whisper'),
(3240000,260135,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Winterforged Choker of the Bone Lord'),
(3240000,260137,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Silverwarden''s Frostmarked Chestguard'),
(3240000,260306,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Runemaster''s Skull of the Black Anvil'),
(3240000,260451,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Rider Blade, Deep Rend'),
(3240000,260634,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Twilightwarden''s Striders'),
(3240000,260686,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Bleak Flare Figurine'),
(3240000,280078,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Blacksmith''s Pants'),
(3240000,280142,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Arcane Wall Legwraps'),
(3240000,280480,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Blacksmith''s Regalia'),
(3240000,280509,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Lightbound Armbands of the Blackened Sky'),
(3240000,280718,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Stonecaller''s Mantle of the Makers Will'),
(3240000,280951,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Earthshard Warden Epaulets'),
(3240000,280960,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Wyrm King''s Robe'),
(3240000,300022,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Calm Greaves of the Iron Gate'),
(3240000,300026,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Silverkeeper''s Saronite Great Gauntlets'),
(3240000,300038,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Chestplate, Grim Hammer'),
(3240000,300175,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Deathmarked Wristplates of the Stone Giant'),
(3240000,300205,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Pauldrons, Star Arrow'),
(3240000,300218,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Cursed Royal Cloak of the Final Watch'),
(3240000,300238,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Abyss Banner Waistplate'),
(3240000,300272,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | The Silverforged Circle'),
(3240000,300305,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Mystic Breath Neckchain'),
(3240000,300330,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Rotting War Leggings, Lost Keeper''s Oath'),
(3240000,300338,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | War Leggings of Howling Fjord'),
(3240000,300356,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Void Hide Battlehelm'),
(3240000,300409,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | War Leggings, Scourge Grave'),
(3240000,300457,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Earthforged Waistguard of Eternal Watch'),
(3240000,300463,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Ancestor''s Stormforged Handguards'),
(3240000,300513,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | The Deathly Battleplate'),
(3240000,300598,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Bloodguard''s Compass'),
(3240000,300650,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Lost Keeper''s Valiant Cleaver'),
(3240000,300735,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Pitiless Wristplates of the Sun Crown'),
(3240000,300814,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Icewarden''s War Leggings'),
(3240000,300818,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Silvered Legguards'),
(3240000,300922,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Runesteel Faceguard of Sun Watch'),
(3240000,300992,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | The Runed Amulet'),
(3240000,320124,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Stone Relic of Runekeeper'),
(3240000,320144,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Silverwarden''s Bronzed Knuckle'),
(3240000,320383,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Last Knight''s Collar'),
(3240000,320584,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Grips of the Old Kingdom'),
(3240000,320787,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Plague Chain Grips'),
(3240000,320811,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Nightkeeper''s Hauberk'),
(3240000,320941,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Footguards, Wild Lament'),
(3240000,320999,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Soldierly Backcloth of the Last Promise'),
(3240000,340280,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Dreaming Warcloak of the Sacred Watch'),
(3240000,340406,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Sandals, Bright Bolt'),
(3240000,340776,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Forgotten Keeper''s Burial Graspers'),
(3240000,360603,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Hardened Bracelets of Shadow Vault'),
(3240000,360930,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Titanguard''s Seal of the Arcane Moon'),
(3240000,360941,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Ebon Crusader''s Ring of the Storm King'),
(3240000,380055,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Starwarden''s Seal Ring'),
(3240000,380121,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Duskbound Headguard of Scourge Watch'),
(3240000,380211,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | The Sinister Stonehammer'),
(3240000,380702,0,0,0,2,1,1,1,'Generated map_249_difficulty_1 boss_000707 | Hexed Shoulderpads of the Sacred Flame');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36538 AND `Item` = 1 AND `Reference` = 3240000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36538,1,3240000,2,0,2,0,1,1,'Generated encounter attachment | map_249_difficulty_1 | boss_000707');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250000,200707,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Mana Flare Chestplate'),
(3250000,240436,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Consecrated Handguards of the Frost King'),
(3250000,260800,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Ebon Knight''s Draconic Leggings'),
(3250000,280802,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Deep Whisper Treads'),
(3250000,300751,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Band of Zim Torga'),
(3250000,320392,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Dreamwoven Bodkin'),
(3250000,320880,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Divine Chausses of Dark Iron Clan'),
(3250000,380601,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000452 | Thunderforged Bindings, Cryptlord''s Oath');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250001,200105,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Runic Runeblade'),
(3250001,200179,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Thunderkeeper''s Hollow Cuirass'),
(3250001,200204,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Legplates of the Void Crown'),
(3250001,200346,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Bonewarden''s Cuirass of the Dread March'),
(3250001,200358,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Resolute Gorget of Ice Queen'),
(3250001,200706,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Whispering Nightcloak'),
(3250001,200759,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Farseer''s Hellforged Faceguard'),
(3250001,200844,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Vigilant Chestplate'),
(3250001,200903,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Breastplate of the Corpse Scar'),
(3250001,200982,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Frozen Keeper''s Chestplate'),
(3250001,220033,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Ghost Scream Visor'),
(3250001,220071,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Forgemaster''s Skull of the Emerald Grove'),
(3250001,220099,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Bladeguard''s Headplate of the Golden King'),
(3250001,220114,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Brightsteel Chestplate'),
(3250001,220227,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Neckchain, Ancient Storm'),
(3250001,220255,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Grand Mace of the Ebon Watch'),
(3250001,220286,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Grimdark Gemmed Band of the Moon Crown'),
(3250001,220330,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Legguards of the Old Kingdom'),
(3250001,220398,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Pale Warplate of Wyrm King'),
(3250001,220422,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Fire Twilight Gorget'),
(3250001,220634,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Deathguard''s Hollow Battle Girdle'),
(3250001,220788,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Stalwart Breastplate'),
(3250001,220904,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Faceguard, Twilight Singer'),
(3250001,240043,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Worldkeeper''s Shroud of the Argent Crusade'),
(3250001,240267,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Nameless Oathring'),
(3250001,240710,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Coldbound Orb'),
(3250001,240909,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Leggings of Blood Pact'),
(3250001,260031,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Bloodguard''s Cinch'),
(3250001,260066,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Berserker Wargrips of Ebon Hold'),
(3250001,260141,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Old Clutches of Winter Memory'),
(3250001,260240,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Firekeeper''s Darkmoon Necklace'),
(3250001,260394,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Goldbound Chestguard of the Void Ritual'),
(3250001,280039,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Sable Epaulets'),
(3250001,280096,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Ritual Wand of Blood Moon'),
(3250001,280173,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Forgotten Keeper''s Runebands'),
(3250001,280247,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Reinforced Cinch'),
(3250001,280252,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Amulet, Violet Doom'),
(3250001,280262,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Warden Walkers'),
(3250001,280303,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Armbands, Starfang Glacier'),
(3250001,280399,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Mossbound Boots'),
(3250001,280529,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Longcloak, Deep Wall'),
(3250001,280895,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Sepulchral Vest of the Mage Tower'),
(3250001,280974,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Runewarden''s Frostscarred Sash'),
(3250001,300074,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Umbral Mantle of the Dying Promise'),
(3250001,300117,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Warcloak, Hallowed Crown'),
(3250001,300298,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Dragoncaller''s Charmstone'),
(3250001,300430,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Pauldrons, Forgotten Pact'),
(3250001,300750,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Astral Twilight War Leggings'),
(3250001,320031,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Spectral Greaves of the Burning Blood'),
(3250001,320172,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Briarbound Chausses'),
(3250001,320262,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Soulbound Shoulder Drape of the Blood Tide'),
(3250001,320343,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Legmail, Wildfire Grasp'),
(3250001,320432,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Epaulets of the Frost Queen'),
(3250001,320504,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Relicbound Shoulderguards'),
(3250001,320659,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Gloves of the Azjol Nerub'),
(3250001,320819,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Shadow Glyph Grips'),
(3250001,320952,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Defiant Chausses'),
(3250001,340125,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Stargazer''s Leggings'),
(3250001,340212,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Azure Dawn Robes'),
(3250001,340223,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Thunderforged Sash of the Scourge Lord'),
(3250001,340277,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Drakebound Warband'),
(3250001,340291,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Wristwraps of the Skorn'),
(3250001,340400,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Ashen Lord''s Trousers'),
(3250001,340675,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Titanguard''s Mitts of the Emerald Watch'),
(3250001,360134,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Diadem of Grave Watch'),
(3250001,360159,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Deepforged Epaulets of Forge of Souls'),
(3250001,360328,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Chillborn Shoes of the Last Promise'),
(3250001,360381,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Winterkeeper''s Arcane Scepter'),
(3250001,360471,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Runic Shoulder Cape'),
(3250001,360526,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Stormforged Waistwrap of Arcane Eye'),
(3250001,360671,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Thornwoven Raiment, Rimelord''s Oath'),
(3250001,360814,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Bonecaller''s Battlecloak'),
(3250001,380060,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Soulwarden''s Grips'),
(3250001,380447,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | The Moonbound Walking Staff'),
(3250001,380482,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Vest, Soulshard Roar'),
(3250001,380510,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Legguards of the Zul Drak'),
(3250001,380686,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Bonebound Stalkers of Iron Dwarf'),
(3250001,380765,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Gray Leaf Runestone'),
(3250001,380950,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 trash | Ancient Voice Chestguard');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250002,240149,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | Seal of the Bleak Shore'),
(3250002,260577,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | Soul Fang Striders'),
(3250002,300731,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | Runeguard''s Legguards of the Drake Rider'),
(3250002,300902,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | Warcloak of the Northern Watch'),
(3250002,360998,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | Runic Waistband, Shadow Queen''s Oath'),
(3250002,380166,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000453 | The Soulforged Warband');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250004,320509,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000455 | Plaguetouched Belt of Shadow King'),
(3250004,320650,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000455 | Stargazer''s Deathbound Treads');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250006,340252,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000457 | Pale Dawn Pants'),
(3250006,380667,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000457 | Duskwoven Legwraps');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3250012;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3250012,200335,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000463 | Silent Fingerband of the Grim Dawn'),
(3250012,200983,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000463 | Dawnkeeper''s Wristplates'),
(3250012,360770,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000463 | Rune Band, Emerald Snowfall'),
(3250012,380027,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000463 | Silversteel Leggings of Ivory Crown'),
(3250012,380838,0,0,0,1,1,1,1,'Generated map_289_difficulty_0 boss_000463 | Glasslike War Maul of the Star Forge');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10503 AND `Item` = 1 AND `Reference` = 3250000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10503,1,3250000,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | boss_000452');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10469 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10469,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10470 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10470,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10471 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10471,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10476 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10476,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10477 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10477,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10478 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10478,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10481 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10481,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10486 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10486,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10487 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10487,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10488 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10488,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10489 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10489,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10491 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10491,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10495 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10495,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10498 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10498,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10499 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10499,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10500 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10500,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11257 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11257,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11551 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11551,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11582 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11582,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14695 AND `Item` = 1 AND `Reference` = 3250001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14695,1,3250001,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11622 AND `Item` = 1 AND `Reference` = 3250002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11622,1,3250002,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | boss_000453');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10432 AND `Item` = 1 AND `Reference` = 3250004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10432,1,3250004,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | boss_000455');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10505 AND `Item` = 1 AND `Reference` = 3250006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10505,1,3250006,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | boss_000457');

DELETE FROM `creature_loot_template` WHERE `Entry` = 1853 AND `Item` = 1 AND `Reference` = 3250012;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(1853,1,3250012,2,0,1,0,1,1,'Generated encounter attachment | map_289_difficulty_0 | boss_000463');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270000,200221,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Breastplate of Blood Price'),
(3270000,240642,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Ebon Epaulets of Last Watch'),
(3270000,260726,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Icecaller''s Fanged Pants'),
(3270000,260743,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Northkeeper''s Ivory Trousers'),
(3270000,260812,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Armguards of Iron Giant'),
(3270000,280505,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Heavenforged Cuffs'),
(3270000,280756,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Shoes of the Titan King'),
(3270000,280876,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Cord, Wyrm Grip'),
(3270000,320003,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Frozen King''s Vambraces'),
(3270000,320827,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Witchkeeper''s Hauberk'),
(3270000,320903,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Argent Crusader''s Living Great Hauberk'),
(3270000,320990,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Leggings of Great Hunt'),
(3270000,340109,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Pants, Falcon Fall'),
(3270000,340151,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Armbands, Gray Moon'),
(3270000,340156,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Drakekeeper''s Cowl of the Drowned Hall'),
(3270000,360188,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | The Serrated Headdress'),
(3270000,380045,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Boneforged Hoop of Wild King'),
(3270000,380157,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Medallion, Scourge Creed'),
(3270000,380177,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Clouded Bone of the Black Temple'),
(3270000,380297,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Flameforged Libram'),
(3270000,380668,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000472 | Black Dirge Stonehammer');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270001,200103,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Rimewalker''s Armguards'),
(3270001,200194,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Icewarden''s Girdle'),
(3270001,200491,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Choker of the Sky King'),
(3270001,200516,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Deathguard''s Silverforged Legplates'),
(3270001,200700,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Wargrips of Crimson Crown'),
(3270001,200909,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Coldbound War Leggings'),
(3270001,200964,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Hearthkeeper''s Icon of the Sindragosa Fall'),
(3270001,220003,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Battleplate Legguards, Dream Root'),
(3270001,220314,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Scale of the Thorim Arena'),
(3270001,220443,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Coldfire Broadsword'),
(3270001,220568,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Vambraces of the Spider Wing'),
(3270001,220789,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Baleful Emblem'),
(3270001,220793,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Wildfire Knuckle Breastplate'),
(3270001,240304,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Gray Warbelt of Hidden Path'),
(3270001,240314,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Rimebound Great Hauberk'),
(3270001,240761,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Warboots, High Ward'),
(3270001,240790,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Undying Chausses'),
(3270001,240848,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Belt, Starfang Hex'),
(3270001,240994,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Effigy of the Grim King'),
(3270001,260330,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Legguards, Astral Howl'),
(3270001,260509,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Ashen Grips'),
(3270001,260705,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Bright Bolt War Bow'),
(3270001,260982,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Battlesage''s Legguards'),
(3270001,280002,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Ritual Shoulder Cape'),
(3270001,280420,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Grips, Icefang Heart'),
(3270001,280885,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Duskcaller''s Seal Ring of the Violet Eye'),
(3270001,280959,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Earth Edge Shoes'),
(3270001,300166,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Goldsteel Headsman Axe of the Fallen Lord'),
(3270001,300568,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Grim Warden''s Hellforged Maul'),
(3270001,300640,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Mournful Wristplates of Broken Shield'),
(3270001,300831,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Anvilkeeper''s Battleplate'),
(3270001,300906,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Bright War Pauldrons of Violet Flame'),
(3270001,320849,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Lion Pact Epaulets'),
(3270001,340258,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Mystic Cry Spellstaff'),
(3270001,340261,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Royal Band of Moon Pact'),
(3270001,340279,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Plaguecaller''s Witchforged Footwraps'),
(3270001,340509,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Old Keeper''s Robe'),
(3270001,340537,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Robes, Blade Guard'),
(3270001,340571,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Brutal Regalia of Hollow King'),
(3270001,340707,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Gorget of the Ebon March'),
(3270001,340782,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Waistband of the Mystic Gate'),
(3270001,340791,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Windcaller''s Hammered Walkers'),
(3270001,340867,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Archmage''s Warrior-forged Breeches'),
(3270001,360044,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Coldforged Cuffs of the Void Flame'),
(3270001,360066,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Rimecaller''s Deathless Grips'),
(3270001,360075,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Battlelord''s Rimeforged Armbands'),
(3270001,360581,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Bloodcaller''s Circlet'),
(3270001,360698,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Robes of the Mage Tower'),
(3270001,380142,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | The Heavy Oathring'),
(3270001,380560,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Farseer''s Footguards'),
(3270001,380598,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Warforged Stone Relic of Violet Hold'),
(3270001,380737,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 trash | Ashcaller''s Neckchain');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270002,260406,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Shoulderguards, Low Rime'),
(3270002,280024,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | The Vicious Clasp'),
(3270002,280345,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Chestwrap of Frozen Sea'),
(3270002,280687,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Argent Templar''s Hourglass'),
(3270002,320676,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Last Keeper''s Legmail of the Icecrown'),
(3270002,320809,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Dragonsteel Chausses of the Wild Heart'),
(3270002,360568,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Emberkeeper''s Sunsteel Cinch'),
(3270002,360744,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | The Coldhearted Signet'),
(3270002,380066,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000473 | Aged Headdress of Ice King');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270003,220119,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Coldfire War Leggings'),
(3270003,220653,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Spiritbound Emblem'),
(3270003,260171,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Argent Templar''s Mantle of the Ebon Watch'),
(3270003,280983,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Crown Rune Cord'),
(3270003,340420,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Vest of Twilight Reach'),
(3270003,360555,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Dusk Forge Leggings'),
(3270003,380261,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000474 | Lost Knight''s Wargrips of the White Banner');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270004,200397,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Blademaster''s Kingsworn Legplates'),
(3270004,200442,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Warsage''s Shoulderplates of the Dawn Star'),
(3270004,200870,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Bronzed Helm of the Ghost Moon'),
(3270004,220180,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Wrap of Twilight Reach'),
(3270004,220791,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Vambraces of the Dark Crown'),
(3270004,280778,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Scarlet Champion''s Hoop'),
(3270004,300649,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Runebound Clasp'),
(3270004,360519,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Walkers of the Golden Dawn'),
(3270004,360621,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Scale, Grim Judgment'),
(3270004,360848,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Raiment, Wind Bolt'),
(3270004,380348,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000475 | Wyrmkeeper''s Warmaster Torque');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270005,220219,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000476 | Frozen Keeper''s Moonforged War Leggings'),
(3270005,260534,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000476 | The Sable Wristguards'),
(3270005,300512,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000476 | Ancient Greaves of the War Banner'),
(3270005,340017,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000476 | Handwraps of Mana Forge');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270006,260389,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000477 | Worldkeeper''s Tablet'),
(3270006,260944,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000477 | Ebon Crusader''s Jerkin of the Bone Ritual');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270007,200011,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Doomforged Wargrips of Valiance Keep'),
(3270007,220928,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Icecaller''s Relic'),
(3270007,260525,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Mystic Clutches'),
(3270007,320070,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Soul Watch Grips'),
(3270007,360590,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Soulshard Rider Battle Staff'),
(3270007,360628,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Cryptlord''s Sash'),
(3270007,360918,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Waistband of the Burning Steppes'),
(3270007,380064,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000479 | Medallion of the Rainspeaker Canopy');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270009;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270009,200943,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | Circle, Night Breath'),
(3270009,220356,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | Argent Crusader''s Devout Legplates'),
(3270009,300425,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | The Wyrmbound Gauntlets'),
(3270009,300997,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | Heavy Bracers of Crusaders Coliseum'),
(3270009,340604,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | Wildguard''s Walkers'),
(3270009,360800,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000481 | The Hammered Greatcloak');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270010;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270010,200973,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Frostmarked Waistplate of Dawnwatch'),
(3270010,220175,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Ghostfire Dusk Warhelm'),
(3270010,220426,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Frozen Warden''s Veil'),
(3270010,240041,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | War Leggings of Sky King'),
(3270010,240473,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Argent Templar''s Bracers'),
(3270010,240731,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Siegebow of the Halls of Lightning'),
(3270010,240847,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Fel Void Spear'),
(3270010,240915,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Ashen King''s Longblade'),
(3270010,280022,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Charm of Scale Lord'),
(3270010,280473,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Witchlord''s Mallet of the Violet Flame'),
(3270010,280834,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Hoarfrost Mallet of Forgotten Watch'),
(3270010,300066,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Gravecaller''s War Leggings'),
(3270010,300150,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Golden Faceguard'),
(3270010,300397,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Skullbound Faceguard'),
(3270010,300606,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Chestplate of the Alterac Mountains'),
(3270010,300659,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Cabalistic Warhelm of Wildhammer Clan'),
(3270010,300882,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Flamewarden''s Woe-bound Cuirass'),
(3270010,320290,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Runed Greaves of Grim Host'),
(3270010,320448,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Staff of Broken Banner'),
(3270010,320473,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Wargrips, Icefang Breaker'),
(3270010,320590,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Wrathful Hauberk'),
(3270010,320753,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Bloodied Coif, Bladeguard''s Oath'),
(3270010,320896,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Shadowbound Skull of Frost King'),
(3270010,340229,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Soldierly Regalia of the Wild Grove'),
(3270010,360957,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Diadem of Ancient Storm'),
(3270010,380091,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 boss_000482 | Legwraps of Sky Watch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3270013;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3270013,260992,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Footguards of Dark Forge'),
(3270013,300106,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | War Greaves of Orgrimmar Guard'),
(3270013,320672,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Scarlet Casque of the Frost King'),
(3270013,320900,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Grim Chill Mirror'),
(3270013,340153,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Lightforged Backcloth'),
(3270013,340795,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Sunsteel Veil'),
(3270013,340922,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Mage Staff of the Hallowed Crown'),
(3270013,380260,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Infused Fingerband of Iron Gate'),
(3270013,380699,0,0,0,1,1,1,1,'Generated map_329_difficulty_0 script_HandleBothDead | Lightcaller''s Mantle');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10516 AND `Item` = 1 AND `Reference` = 3270000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10516,1,3270000,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000472');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10381 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10381,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10382 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10382,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10384 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10384,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10385 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10385,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10390 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10390,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10391 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10391,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10393 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10393,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10398 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10398,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10399 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10399,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10400 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10400,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10405 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10405,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10406 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10406,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10407 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10407,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10408 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10408,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10409 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10409,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10412 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10412,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10413 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10413,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10414 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10414,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10416 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10416,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10417 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10417,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10418 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10418,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10419 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10419,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10420 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10420,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10421 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10421,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10422 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10422,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10423 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10423,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10424 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10424,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10425 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10425,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10426 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10426,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10463 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10463,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10464 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10464,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10809 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10809,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11043 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11043,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14684 AND `Item` = 1 AND `Reference` = 3270001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14684,1,3270001,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10558 AND `Item` = 1 AND `Reference` = 3270002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10558,1,3270002,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000473');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10808 AND `Item` = 1 AND `Reference` = 3270003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10808,1,3270003,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000474');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10997 AND `Item` = 1 AND `Reference` = 3270004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10997,1,3270004,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000475');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11032 AND `Item` = 1 AND `Reference` = 3270005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11032,1,3270005,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000476');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10811 AND `Item` = 1 AND `Reference` = 3270006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10811,1,3270006,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000477');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10436 AND `Item` = 1 AND `Reference` = 3270007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10436,1,3270007,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000479');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10438 AND `Item` = 1 AND `Reference` = 3270009;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10438,1,3270009,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000481');

DELETE FROM `creature_loot_template` WHERE `Entry` = 10435 AND `Item` = 1 AND `Reference` = 3270010;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(10435,1,3270010,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | boss_000482');

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 17919 AND `Item` = 1 AND `Reference` = 3270013;

INSERT INTO `gameobject_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(17919,1,3270013,2,0,1,0,1,1,'Generated encounter attachment | map_329_difficulty_0 | script_HandleBothDead');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3280000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3280000,200024,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Wyrmforged Circle'),
(3280000,220947,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Briarbound Carapace'),
(3280000,220965,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Warscarred Great Cape'),
(3280000,260737,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Wargrips of the Stone Watch'),
(3280000,280731,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Drape of the Light Watch'),
(3280000,340302,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Voidforged Shoulder Cape'),
(3280000,380077,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Sky Ward Handguards'),
(3280000,380592,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000422 | Northwind Stalkers');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3280003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3280003,220092,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000424 | Iron Boots of the Cold Flame'),
(3280003,240686,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000424 | Bearded Axe, West Thirst'),
(3280003,360965,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000424 | Age-darkened Tunic of Blood Price'),
(3280003,380388,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000424 | Forgemaster''s Skull of the Howling Fjord');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3280004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3280004,200028,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Duskkeeper''s Warplate of the Wind Spirit'),
(3280004,240638,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Manawoven Warboots of Eternal Flame'),
(3280004,260071,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Ashcaller''s Talisman of the Mount Hyjal'),
(3280004,260874,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Iron Mace of Celestial Gate'),
(3280004,280912,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | The Snowy Backcloth'),
(3280004,320257,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | The Savage Casque'),
(3280004,340870,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Nightshrouded Chestwrap'),
(3280004,360070,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Demon Maw Gloves'),
(3280004,360457,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Charmstone of the Oculus'),
(3280004,380451,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000425 | Darkwarden''s Trousers');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3280005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3280005,260604,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000426 | Leggings, Raven Seal'),
(3280005,260734,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000426 | Starlit Wristbands of Crimson Crown');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3280008;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3280008,220193,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Nerubian Wargrips'),
(3280008,240505,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Plaguecaller''s Coin'),
(3280008,280042,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Wyrm Queen''s Collar of the Silent Moon'),
(3280008,340095,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Starforged Skullcap'),
(3280008,340152,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Scale of Ruby Sanctum'),
(3280008,360207,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Titan Queen''s Raiment'),
(3280008,360718,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Goldsteel Circle of Abyssal Gate'),
(3280008,380603,0,0,0,1,1,1,1,'Generated map_349_difficulty_0 boss_000429 | Moonlord''s Bracers');

DELETE FROM `creature_loot_template` WHERE `Entry` = 13282 AND `Item` = 1 AND `Reference` = 3280000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(13282,1,3280000,2,0,1,0,1,1,'Generated encounter attachment | map_349_difficulty_0 | boss_000422');

DELETE FROM `creature_loot_template` WHERE `Entry` = 12236 AND `Item` = 1 AND `Reference` = 3280003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(12236,1,3280003,2,0,1,0,1,1,'Generated encounter attachment | map_349_difficulty_0 | boss_000424');

DELETE FROM `creature_loot_template` WHERE `Entry` = 12225 AND `Item` = 1 AND `Reference` = 3280004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(12225,1,3280004,2,0,1,0,1,1,'Generated encounter attachment | map_349_difficulty_0 | boss_000425');

DELETE FROM `creature_loot_template` WHERE `Entry` = 12203 AND `Item` = 1 AND `Reference` = 3280005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(12203,1,3280005,2,0,1,0,1,1,'Generated encounter attachment | map_349_difficulty_0 | boss_000426');

DELETE FROM `creature_loot_template` WHERE `Entry` = 12201 AND `Item` = 1 AND `Reference` = 3280008;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(12201,1,3280008,2,0,1,0,1,1,'Generated encounter attachment | map_349_difficulty_0 | boss_000429');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3290000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3290000,220063,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Sable Lord Battlecloak'),
(3290000,220218,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Starforged Waistchain of the Divine Watch'),
(3290000,260791,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Plagueborn Wristbands of Blood Tide'),
(3290000,260916,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Fearsome Grips of Argent Vanguard'),
(3290000,320232,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Wildwarden''s Mantle of the Scourge Host'),
(3290000,340338,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Darkrider''s Handwraps of the Dawn Star'),
(3290000,360348,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Lost King''s Thunderforged Robe'),
(3290000,380110,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Solemn Gorget of the Hidden Vault'),
(3290000,380722,0,0,0,1,1,1,1,'Generated map_389_difficulty_0 boss_000431 | Walkers of Frozen Promise');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11520 AND `Item` = 1 AND `Reference` = 3290000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11520,1,3290000,2,0,1,0,1,1,'Generated encounter attachment | map_389_difficulty_0 | boss_000431');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310000,200801,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Clasp of the Dying Light'),
(3310000,220801,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Skullbound Amulet of Scarlet Keep'),
(3310000,260444,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Spell Vault Boots'),
(3310000,260511,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Emerald Hex Wristbands'),
(3310000,280881,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Bloodguard''s Cowl'),
(3310000,320076,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Greaves of Frost Forge'),
(3310000,320766,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Deepfrost Coil of the Icecrown'),
(3310000,340442,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Bloodguard''s Wristwraps'),
(3310000,360592,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Dragonsteel Kilt, Blackguard''s Oath'),
(3310000,380162,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000343 | Goldbound Shawl of Dark Moon');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310001,200092,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Solemn Wargrips'),
(3310001,200232,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Chain of Wyrm Crown'),
(3310001,200279,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | First Queen''s Wristplates'),
(3310001,200447,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Blacksmith''s Bulwark'),
(3310001,200506,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Rune-etched Breastplate'),
(3310001,200774,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Wolfkeeper''s Rune Band'),
(3310001,200814,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Firekeeper''s Breastplate'),
(3310001,200914,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Traveling Cloak, Forgotten Bite'),
(3310001,200950,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | War Cleaver of Gjalerbron'),
(3310001,200979,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Northforged Armplates'),
(3310001,220041,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Gauntlets, Emerald Ruin'),
(3310001,220158,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Rune-carved War Leggings of Zul Drak'),
(3310001,220165,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Grim Warden''s Highblade of the Star Grove'),
(3310001,220296,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Forge Talon Carapace'),
(3310001,220451,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Bear Talon Glaive'),
(3310001,220487,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Greaves of the Storm King'),
(3310001,220592,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Scourged Warhelm'),
(3310001,220935,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Ghostcaller''s Wargrips'),
(3310001,240079,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Arcane Brooch of Great Forge'),
(3310001,240168,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Firecaller''s Bronzed Brooch'),
(3310001,240229,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Collar of the Sun Spirit'),
(3310001,240379,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Torque, Savage Bane'),
(3310001,240448,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Emberwrought Waistchain of Bleak Shore'),
(3310001,240509,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Forgotten Warden''s Soldierly Legmail'),
(3310001,240612,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Pale Legmail'),
(3310001,240653,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Hauberk of Titan Watch'),
(3310001,240739,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Charred Leggings of the Shattered Crown'),
(3310001,240781,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Deepwarden''s Shawl of the Wyrm Watch'),
(3310001,240835,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Briarbound Faceguard'),
(3310001,260134,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Undying Waistband of Rune Crown'),
(3310001,260769,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Shieldbearer''s Headguard'),
(3310001,260853,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Azure Wyrm Gauntlet'),
(3310001,260859,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Bloodbound Tunic of Winter Court'),
(3310001,260879,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Legwraps, Soul Fall'),
(3310001,280106,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Bracelets of the High Watch'),
(3310001,280110,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Doomed Treads'),
(3310001,280212,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Signet Ring of Dead Watch'),
(3310001,280218,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Darkkeeper''s Skirt of the Frozen Gate'),
(3310001,280251,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Clasp of the Crusader Watch'),
(3310001,280292,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Fanged Skullcap of the Scarlet Keep'),
(3310001,280329,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Wolfbound Kilt'),
(3310001,280374,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Hoarfrost Skirt of Storm Queen'),
(3310001,280521,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Flamebound Handwraps of the Pale King'),
(3310001,280581,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Wrap, Frostfire Ice'),
(3310001,280700,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Cursed Runebands'),
(3310001,280734,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Shadowguard''s Whispering Breeches'),
(3310001,280792,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Circlet of the Ice Moon'),
(3310001,280806,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Nightcaller''s Celestial Bracelets'),
(3310001,280819,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Pitiless Binding'),
(3310001,280988,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Tombkeeper''s Regalia'),
(3310001,300120,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Battleplate of the Halls of Lightning'),
(3310001,300197,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Ashen King''s Waistplate'),
(3310001,300199,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Battleplate Legguards of the Earth Spirit'),
(3310001,300258,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Living Legguards of the Dawnwatch'),
(3310001,300414,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Voidshard Verse Footplates'),
(3310001,300417,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Breastplate, Mystic Ward'),
(3310001,300423,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Sunwarden''s Carapace of the Bone Gate'),
(3310001,300469,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Marauding Feather of the Endless March'),
(3310001,300531,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Decapitator, Falcon Hand'),
(3310001,300605,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Seal of the Storm Peaks'),
(3310001,300612,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Sun Queen''s Armplates'),
(3310001,300734,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Battleplate Legguards of the Blood Promise'),
(3310001,300935,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Warmaster Breastplate'),
(3310001,320098,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Stonebound Warboots'),
(3310001,320146,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Great Hauberk, Bleak Talon'),
(3310001,320213,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Nightwoven Legmail'),
(3310001,320283,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Warlord Gloves of the Black Citadel'),
(3310001,320413,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Darkforged Warhelm'),
(3310001,320437,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Wyrm Queen''s Wargrips'),
(3310001,320510,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | War Leggings of the Sky Forge'),
(3310001,320519,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Forgekeeper''s Rootwoven Shoulderguards'),
(3310001,320536,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Moon King''s Wrathful Girdle'),
(3310001,320550,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Footguards of Iron Banner'),
(3310001,320614,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Brightsteel Phylactery of the Sable Moon'),
(3310001,320653,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Casque, Moon Wrath'),
(3310001,320712,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Pendant of the Crimson Watch'),
(3310001,320727,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Dalaran Charm of Silver Light'),
(3310001,320808,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Chestguard, Ice Hunter'),
(3310001,320826,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Voidcaller''s Glittering Veil'),
(3310001,320885,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Tombbound Cleaver of Blood Price'),
(3310001,340120,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Warguard''s Neckchain of the Hidden Road'),
(3310001,340168,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Gloves, Stone Spark'),
(3310001,340205,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Grey Root Arcane Scepter'),
(3310001,340269,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Winterborn Boots of Dusk Watch'),
(3310001,340300,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Cuffs of the Broken Spear'),
(3310001,340472,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Plaguetouched Staff'),
(3310001,340588,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Wyrm King''s Sash of the Titan Keeper'),
(3310001,340649,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Tombforged Epaulets of the Pale King'),
(3310001,340872,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Sunblessed Shawl'),
(3310001,360045,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Seal Ring, Holy Hammer'),
(3310001,360049,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Ironlord''s Gravebound Cowl'),
(3310001,360051,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Firekeeper''s Leggings'),
(3310001,360081,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | East Briar Waistwrap'),
(3310001,360092,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Plagueforged Breeches of Hidden Path'),
(3310001,360142,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Ironforged Gloves'),
(3310001,360150,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Mossbound Wand'),
(3310001,360169,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Northman''s Robe of the Golden Light'),
(3310001,360224,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Dreadbound Shoes'),
(3310001,360243,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Polished Coil of the Dusk Watch'),
(3310001,360280,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Furious Kilt'),
(3310001,360357,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Dawnwarden''s Regalia'),
(3310001,360530,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Rimeforged Sash'),
(3310001,360656,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | The Doomed Mystic Wand'),
(3310001,360689,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Rootwoven Skirt'),
(3310001,360768,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Conduit, Crimson Shot'),
(3310001,360806,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Lost Chestwrap of the Star Watch'),
(3310001,360880,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Duskbound Circlet of White Crown'),
(3310001,360940,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Coil, Mana Strike'),
(3310001,360987,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Ethereal Pendant Chain'),
(3310001,380149,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Harness of the Silver Covenant'),
(3310001,380189,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Deepdelver Spaulders'),
(3310001,380259,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Winterwarden''s Crystal'),
(3310001,380308,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Stalkers, Serpent Starfall'),
(3310001,380324,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Azure Deathmask, Argent Champion''s Oath'),
(3310001,380354,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Headguard, East Piercer'),
(3310001,380402,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Shoulderpads of the Demon Lord'),
(3310001,380514,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | First Queen''s Dreadforged Carapace'),
(3310001,380892,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Icecaller''s Wargrips'),
(3310001,380908,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 trash | Wyrmkeeper''s Waistguard of the North Road');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310004,220143,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000346 | The Draconic Warhelm'),
(3310004,220822,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000346 | Terrible Greathelm of the Earth Spirit'),
(3310004,380329,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000346 | Hearthwarden''s Gleaming Feather');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310005,200337,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000347 | Raider Cuirass'),
(3310005,240055,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000347 | Thunderwarden''s Handguards'),
(3310005,240640,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000347 | Coif of Last King'),
(3310005,340664,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000347 | Bright Grips of the Sunreaver Host'),
(3310005,380337,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000347 | Gloves of Sun Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310006,240774,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000348 | Silverkeeper''s Great Hauberk'),
(3310006,240947,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000348 | Anvilkeeper''s Pendant Chain'),
(3310006,260969,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000348 | Handguards of the Storm Crown'),
(3310006,280774,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000348 | Stonehewn Vest of the Deep Vault'),
(3310006,300651,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000348 | Sollerets of Sholazar');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310008;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310008,240527,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | Ancient Keeper''s Lost Faceguard'),
(3310008,260337,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | The Faded Headguard'),
(3310008,260396,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | Capelet, Mist Forge'),
(3310008,320621,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | Dream Warden Greatshield'),
(3310008,360536,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | The Dreadbound Charm'),
(3310008,380925,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000350 | Runecaller''s Loop');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310010;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310010,220593,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000362 | The Wildwoven Warbelt'),
(3310010,280067,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000362 | Witchbound Mantle, Farseer''s Oath'),
(3310010,320264,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000362 | The Wrathful Belt'),
(3310010,320730,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000362 | The Thorned Crusher');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310011;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310011,220082,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000364 | Dragon King''s Aged Greaves'),
(3310011,300574,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000364 | Sunhallowed Legplates'),
(3310011,340115,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000364 | Hood, Ancient Wind');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3310013;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3310013,220043,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000366 | Forgotten Warden''s Hollow Cuirass'),
(3310013,240775,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000366 | Chainmail, Stormshard Spark'),
(3310013,260512,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000366 | Ghostkeeper''s Stoic Carapace'),
(3310013,340989,0,0,0,1,1,1,1,'Generated map_429_difficulty_0 boss_000366 | Heroic Tiara of the Wild Watch');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11490 AND `Item` = 1 AND `Reference` = 3310000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11490,1,3310000,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000343');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11451 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11451,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11452 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11452,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11453 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11453,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11454 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11454,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11455 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11455,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11456 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11456,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11457 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11457,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11458 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11458,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11459 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11459,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11462 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11462,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11464 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11464,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11467 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11467,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11469 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11469,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11470 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11470,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11471 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11471,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11472 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11472,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11473 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11473,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11475 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11475,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11480 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11480,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11483 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11483,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11484 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11484,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 13021 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(13021,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 13036 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(13036,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 13196 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(13196,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14303 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14303,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14349 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14349,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14398 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14398,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14399 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14399,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14690 AND `Item` = 1 AND `Reference` = 3310001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14690,1,3310001,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11492 AND `Item` = 1 AND `Reference` = 3310004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11492,1,3310004,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000346');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11488 AND `Item` = 1 AND `Reference` = 3310005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11488,1,3310005,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000347');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11487 AND `Item` = 1 AND `Reference` = 3310006;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11487,1,3310006,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000348');

DELETE FROM `creature_loot_template` WHERE `Entry` = 11489 AND `Item` = 1 AND `Reference` = 3310008;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(11489,1,3310008,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000350');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14326 AND `Item` = 1 AND `Reference` = 3310010;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14326,1,3310010,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000362');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14321 AND `Item` = 1 AND `Reference` = 3310011;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14321,1,3310011,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000364');

DELETE FROM `creature_loot_template` WHERE `Entry` = 14325 AND `Item` = 1 AND `Reference` = 3310013;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(14325,1,3310013,2,0,1,0,1,1,'Generated encounter attachment | map_429_difficulty_0 | boss_000366');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3340007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3340007,200338,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Drakecaller''s Necklace of the Silver Oath'),
(3340007,200586,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Moonlord''s Watchful Shoulderplates'),
(3340007,200607,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | War Leggings, Gray Vigil'),
(3340007,200994,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Stormwarden''s Duskbound Shoulderplates'),
(3340007,220140,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | The Consecrated Greathelm'),
(3340007,240026,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Medallion of Shadow Ritual'),
(3340007,240936,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | The Mystwoven Longbow'),
(3340007,260084,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Gloves of Silent Road'),
(3340007,260973,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Spellscarred Headguard of Long Night'),
(3340007,280277,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Mana Roar Stone'),
(3340007,280457,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Signet, Storm Sorrow'),
(3340007,280785,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Ravenwarden''s Epaulets'),
(3340007,280871,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Shoes of War Watch'),
(3340007,280909,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Mana Vigil Cinch'),
(3340007,300006,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Voidwarden''s Harsh Knightblade'),
(3340007,300196,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Storm Queen''s Fetish'),
(3340007,320061,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Hexed Wrist Chains of Rimefang'),
(3340007,320123,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Shoulderguards of Death Lord'),
(3340007,320552,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Pendant Chain of the Old Gods'),
(3340007,320675,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Frostcaller''s Kingsguard Grips'),
(3340007,320831,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Necrotic Legguards of Demon Lord'),
(3340007,320834,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Treads of the Ancient Promise'),
(3340007,340206,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Ancient Queen''s Weathered Talisman'),
(3340007,340735,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Brightsteel Mitts of Emerald Dream'),
(3340007,360578,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Winterwarden''s Shawl of the Thunder Forge'),
(3340007,380521,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Clawmarked Clutches of Dark Portal'),
(3340007,380766,0,0,0,1,1,1,1,'Generated map_531_difficulty_0 boss_000717 | Vest of Bloodguard');

DELETE FROM `creature_loot_template` WHERE `Entry` = 15727 AND `Item` = 1 AND `Reference` = 3340007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(15727,1,3340007,2,0,1,0,1,1,'Generated encounter attachment | map_531_difficulty_0 | boss_000717');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3360005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3360005,280966,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000685 | Northforged Iron Mace'),
(3360005,300357,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000685 | The Tombbound Cuirass'),
(3360005,300756,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000685 | Warplate of Moon Grove');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3360013;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3360013,200083,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Sunsteel Breastplate of the Northern Forge'),
(3360013,200345,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Token, Scourge Dawn'),
(3360013,200363,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Faceguard of Ironforge Mountain'),
(3360013,200383,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Gray Dancer Handplates'),
(3360013,200396,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Great Pauldrons, Scarlet Feather'),
(3360013,200828,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Armplates of the Ancient Promise'),
(3360013,220050,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Bonecaller''s Magebound Emblem'),
(3360013,220824,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Crusader''s Warbelt'),
(3360013,240281,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Goldbound Waistchain'),
(3360013,240845,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Griefbound Mark of the Utgarde Keep'),
(3360013,240905,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Rune Queen''s Kingsguard Neckchain'),
(3360013,240926,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Silver King''s Bracers of the Black Ritual'),
(3360013,260165,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Grips of Blood Promise'),
(3360013,260289,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Watchful Wargrips'),
(3360013,260497,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Silent Keeper''s Raider Chestguard'),
(3360013,260527,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Plagueforged Chestguard of Zul Drak'),
(3360013,260569,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Sorcerous Trousers of the Rime Forge'),
(3360013,260774,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | The Obsidian Cap'),
(3360013,260938,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Tunic of Golden Dawn'),
(3360013,260940,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Breeches, Light Punch'),
(3360013,280361,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Grimdark Neckguard of Lost King'),
(3360013,300312,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Hardened Pauldrons'),
(3360013,300376,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Fire Moon Lens'),
(3360013,300588,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | The Froststeel Warbracers'),
(3360013,300855,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Warplate of the Winter Forge'),
(3360013,300943,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Twilight Heart Warbracers'),
(3360013,300955,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | War Leggings of Dead Watch'),
(3360013,320477,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Celestial Maw Legmail'),
(3360013,320847,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Frostbound Clawblade of the Golden Moon'),
(3360013,340307,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Mooncaller''s Coin of the Golden Light'),
(3360013,340325,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Wyrmkeeper''s Rugged Kilt'),
(3360013,340520,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Northforged Runebands of Silent King'),
(3360013,340834,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Plaguewarden''s Diadem'),
(3360013,360289,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Hidden Doom Tunic'),
(3360013,380196,0,0,0,1,1,1,1,'Generated map_533_difficulty_0 boss_000704 | Chilled Legguards of Deep Forge');

DELETE FROM `creature_loot_template` WHERE `Entry` = 16011 AND `Item` = 1 AND `Reference` = 3360005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(16011,1,3360005,2,0,1,0,1,1,'Generated encounter attachment | map_533_difficulty_0 | boss_000685');

DELETE FROM `creature_loot_template` WHERE `Entry` = 15990 AND `Item` = 1 AND `Reference` = 3360013;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(15990,1,3360013,2,0,1,0,1,1,'Generated encounter attachment | map_533_difficulty_0 | boss_000704');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3370000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3370000,200259,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Thunderkeeper''s Promise'),
(3370000,200456,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Executioner, Wyrm Hex'),
(3370000,220480,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Moonfire Bloom Armguards'),
(3370000,240538,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Stoneguard''s Epaulets'),
(3370000,240551,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Great Hauberk, Ghostfire Doom'),
(3370000,260878,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Compass, Ash Snowfall'),
(3370000,280481,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Shieldbearer''s Northforged Cinch'),
(3370000,300149,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Furious Cuirass of the Emerald Grove'),
(3370000,300256,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | The Faded Sollerets'),
(3370000,300601,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Warsage''s Stoneward Iron Boots'),
(3370000,300668,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Battlesage''s Stonehewn Greathelm'),
(3370000,320406,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Dragon Queen''s Leggings of the Iron Gate'),
(3370000,320781,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Moonlit Legguards of the Violet Eye'),
(3370000,340271,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Mark, Dread Wind'),
(3370000,340627,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Thornbound Shoulder Cape of the Bone March'),
(3370000,360606,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Frozen Keeper''s Walkers'),
(3370000,360861,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Winterguard''s Medallion of the Netherstorm'),
(3370000,380769,0,0,0,2,1,1,1,'Generated map_533_difficulty_1 boss_000673 | Nightkeeper''s Royal Band of the Pale Flame');

DELETE FROM `creature_loot_template` WHERE `Entry` = 29249 AND `Item` = 1 AND `Reference` = 3370000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(29249,1,3370000,2,0,2,0,1,1,'Generated encounter attachment | map_533_difficulty_1 | boss_000673');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3390000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3390000,260443,0,0,0,1,1,1,1,'Generated map_540_difficulty_0 boss_000407 | Legwraps of the Divine Watch'),
(3390000,300982,0,0,0,1,1,1,1,'Generated map_540_difficulty_0 boss_000407 | Footplates of the Iron Watch'),
(3390000,340357,0,0,0,1,1,1,1,'Generated map_540_difficulty_0 boss_000407 | Mark, Titan Skull'),
(3390000,380731,0,0,0,1,1,1,1,'Generated map_540_difficulty_0 boss_000407 | Icefang Shadow Wargrips'),
(3390000,380994,0,0,0,1,1,1,1,'Generated map_540_difficulty_0 boss_000407 | Kingskeeper''s Boots of the Arcane Eye');

DELETE FROM `creature_loot_template` WHERE `Entry` = 16807 AND `Item` = 1 AND `Reference` = 3390000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(16807,1,3390000,2,0,1,0,1,1,'Generated encounter attachment | map_540_difficulty_0 | boss_000407');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3400000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3400000,200062,0,0,0,2,1,1,1,'Generated map_540_difficulty_1 boss_000407 | The Shadowbound Greaves'),
(3400000,280595,0,0,0,2,1,1,1,'Generated map_540_difficulty_1 boss_000407 | Unwavering Shoes of Plague Watch'),
(3400000,380646,0,0,0,2,1,1,1,'Generated map_540_difficulty_1 boss_000407 | Wyrmwarden''s Ironthane Legguards');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20568 AND `Item` = 1 AND `Reference` = 3400000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20568,1,3400000,2,0,2,0,1,1,'Generated encounter attachment | map_540_difficulty_1 | boss_000407');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3420002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3420002,220112,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | The Bloodforged Heart'),
(3420002,220911,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Worldworn Legplates of Deep Vault'),
(3420002,260487,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Holy Boots of the Bitter Memory'),
(3420002,260530,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | The Cerulean Signet'),
(3420002,300267,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Drakekeeper''s Shadowwoven Faceguard'),
(3420002,300400,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | The Heavenforged Bearded Axe'),
(3420002,300870,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Briarwoven Relic'),
(3420002,340304,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Scourgeforged Signet of Tempest Keep'),
(3420002,360829,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Ironkeeper''s Deathmarked Kilt'),
(3420002,380758,0,0,0,2,1,1,1,'Generated map_542_difficulty_1 boss_000405 | Vigilant Wristguards of the Wild Path');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18607 AND `Item` = 1 AND `Reference` = 3420002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18607,1,3420002,2,0,2,0,1,1,'Generated encounter attachment | map_542_difficulty_1 | boss_000405');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3440001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3440001,200193,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Icy Warbracers, Ironkeeper''s Oath'),
(3440001,200454,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | The Brightmoon Rune Band'),
(3440001,200916,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | The Frostscarred Wrap'),
(3440001,220078,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Great Pauldrons of Bone Wastes'),
(3440001,220343,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | The Siegebound Warplate'),
(3440001,260412,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Frostcaller''s Stoneforged Shoulder Drape'),
(3440001,260606,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Rune Band of Forgotten Watch'),
(3440001,260852,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Moon Queen''s Dirk of the Second Dawn'),
(3440001,300853,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Bloodcaller''s Medallion'),
(3440001,320027,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | The Cracked Hauberk'),
(3440001,340164,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | The Kingsguard Shoulder Drape'),
(3440001,380286,0,0,0,2,1,1,1,'Generated map_543_difficulty_1 boss_000394 | Cowl, Dragon Claw');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18433 AND `Item` = 1 AND `Reference` = 3440001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18433,1,3440001,2,0,2,0,1,1,'Generated encounter attachment | map_543_difficulty_1 | boss_000394');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3460000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3460000,240392,0,0,0,1,1,1,1,'Generated map_545_difficulty_0 boss_000314 | Chain of Light Breach'),
(3460000,280231,0,0,0,1,1,1,1,'Generated map_545_difficulty_0 boss_000314 | Nightlord''s Chain of the Titan Keeper'),
(3460000,380745,0,0,0,1,1,1,1,'Generated map_545_difficulty_0 boss_000314 | Ancient Queen''s Armguards');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3460001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3460001,220290,0,0,0,1,1,1,1,'Generated map_545_difficulty_0 boss_000316 | Warhelm of the Bronze Flight');

DELETE FROM `creature_loot_template` WHERE `Entry` = 17797 AND `Item` = 1 AND `Reference` = 3460000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(17797,1,3460000,2,0,1,0,1,1,'Generated encounter attachment | map_545_difficulty_0 | boss_000314');

DELETE FROM `creature_loot_template` WHERE `Entry` = 17796 AND `Item` = 1 AND `Reference` = 3460001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(17796,1,3460001,2,0,1,0,1,1,'Generated encounter attachment | map_545_difficulty_0 | boss_000316');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3470000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3470000,240072,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | Legmail of the Ancient Storm'),
(3470000,240303,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | Dreamwarden''s Brutish Legguards'),
(3470000,300932,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | Corpsebound Great Chopper of Black Dragon'),
(3470000,320103,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | The Wyrmbound Shoulder Guards'),
(3470000,340162,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | Duskrun Trousers, Silent Warden''s Oath'),
(3470000,340449,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000314 | The Wyrmhide Shoes');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3470001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3470001,300077,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000316 | Harsh Highblade of Deadwind Pass'),
(3470001,380955,0,0,0,2,1,1,1,'Generated map_545_difficulty_1 boss_000316 | The Ravenous Royal Cloak');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20629 AND `Item` = 1 AND `Reference` = 3470000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20629,1,3470000,2,0,2,0,1,1,'Generated encounter attachment | map_545_difficulty_1 | boss_000314');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20630 AND `Item` = 1 AND `Reference` = 3470001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20630,1,3470001,2,0,2,0,1,1,'Generated encounter attachment | map_545_difficulty_1 | boss_000316');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3520000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3520000,220413,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | Warcloak of Wild Hunt'),
(3520000,220537,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | Deathguard''s Voidbound Greathelm'),
(3520000,300876,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | Rimeforged Helm, Thunderkeeper''s Oath'),
(3520000,320656,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | Wyrmhide Shoulder Guards of the Deep Vault'),
(3520000,320836,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | Chainmail of Amberpine Lodge'),
(3520000,340192,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000623 | The Clawmarked Cinch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3520001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3520001,220626,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Sanctified War Leggings'),
(3520001,220885,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Worldwarden''s Greenwood War Leggings'),
(3520001,240869,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Coif of the Moon Flame'),
(3520001,260282,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Necklace of the Second Dawn'),
(3520001,260355,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Bloodcaller''s Lightbound Heart'),
(3520001,260622,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Rime-coated Belt of the Ivory Crown'),
(3520001,280301,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Cryptlord''s Mystic Charmstone'),
(3520001,300072,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Dragonkeeper''s Coldbound Waistguard'),
(3520001,300395,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Spider Hide Warbracers'),
(3520001,300526,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Earthbound Charm of Silver Banner'),
(3520001,300809,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | The Divine Visor'),
(3520001,320047,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Relic of Star Caller'),
(3520001,320816,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Mystic Helm of Bear Spirit'),
(3520001,340259,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | The Shadowwoven Walkers'),
(3520001,340306,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Cinch, Crypt Leaf'),
(3520001,360556,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Flamebound Runebands of Valgarde'),
(3520001,380695,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Breeches, Scourge Hymn'),
(3520001,380711,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Battlemaiden''s Bracers'),
(3520001,380837,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 trash | Lost King''s Carapace of the Dark Star');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3520002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3520002,300095,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000625 | Old Warden''s Cuirass'),
(3520002,340684,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000625 | Moon King''s Defiant Charm'),
(3520002,380574,0,0,0,1,1,1,1,'Generated map_548_difficulty_0 boss_000625 | Deathly Cowl');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21216 AND `Item` = 1 AND `Reference` = 3520000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21216,1,3520000,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | boss_000623');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21218 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21218,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21220 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21220,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21221 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21221,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21224 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21224,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21225 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21225,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21226 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21226,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21227 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21227,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21228 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21228,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21229 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21229,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21230 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21230,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21231 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21231,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21232 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21232,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21246 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21246,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21251 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21251,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21263 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21263,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21298 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21298,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21299 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21299,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21301 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21301,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21339 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21339,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21863 AND `Item` = 1 AND `Reference` = 3520001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21863,1,3520001,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 21215 AND `Item` = 1 AND `Reference` = 3520002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(21215,1,3520002,2,0,1,0,1,1,'Generated encounter attachment | map_548_difficulty_0 | boss_000625');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3530000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3530000,200473,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Silver Queen''s Briarwoven Great Pauldrons'),
(3530000,200926,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | The Warmaster Breastplate'),
(3530000,220194,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Medallion, Deep Steel'),
(3530000,220531,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | War Pauldrons, Wild Anchor'),
(3530000,220798,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Headplate, Stormshard Judgment'),
(3530000,260959,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Dire Judgment Claws'),
(3530000,280148,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Dragonwarden''s Snowforged Trousers'),
(3530000,280203,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Ashen Queen''s Waistband of the Titan Crown'),
(3530000,280256,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | South March Wristwraps'),
(3530000,280922,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | The Warlord Waistband'),
(3530000,300219,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Earthen Great Gauntlets of Dalaran Watch'),
(3530000,300296,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | The Wyrmbound Girdle'),
(3530000,300334,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Runesteel Capelet of the Storm Spirit'),
(3530000,300442,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | High Torment Clasp'),
(3530000,300451,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Waistplate of Ice King'),
(3530000,300782,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Cuirass of the Argent Crusade'),
(3530000,300799,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Shadowkeeper''s Earthbound Pauldrons'),
(3530000,300810,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Dragonwarden''s Girdle of the Frost Forge'),
(3530000,300899,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Coldforged Coil of Western Plaguelands'),
(3530000,320154,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Crimson Gloves'),
(3530000,320297,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Star Ash Backcloth'),
(3530000,320740,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | The Flawless Warhelm'),
(3530000,320748,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Gravecaller''s Gauntlets of the Wind King'),
(3530000,340374,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Ancient Talon Backcloth'),
(3530000,340603,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Prayerbound Runestaff of Nexus'),
(3530000,340610,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Battlelord''s Skullforged Sash'),
(3530000,360283,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Firecaller''s Breeches'),
(3530000,360317,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Froststeel Leggings of Blood Crown'),
(3530000,380500,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000730 | Clouded Runed Staff');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3530002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3530002,200120,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000731 | The Stormmarked Girdle'),
(3530002,200267,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000731 | Pendant Chain, Gray Rime'),
(3530002,240013,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000731 | Hidden Crown Handguards'),
(3530002,300666,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000731 | Greathelm of Pit of Saron');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3530003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3530003,200962,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | Deathbound Hoop'),
(3530003,260037,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | The Frostveined Mantle'),
(3530003,260292,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | Shoulderwraps of Drowned King'),
(3530003,280678,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | Walking Staff, Ivory Storm'),
(3530003,320369,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | Epaulets of Crypt Watch'),
(3530003,340416,0,0,0,1,1,1,1,'Generated map_550_difficulty_0 boss_000732 | Graspers of the Bear Spirit');

DELETE FROM `creature_loot_template` WHERE `Entry` = 19514 AND `Item` = 1 AND `Reference` = 3530000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(19514,1,3530000,2,0,1,0,1,1,'Generated encounter attachment | map_550_difficulty_0 | boss_000730');

DELETE FROM `creature_loot_template` WHERE `Entry` = 19516 AND `Item` = 1 AND `Reference` = 3530002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(19516,1,3530002,2,0,1,0,1,1,'Generated encounter attachment | map_550_difficulty_0 | boss_000731');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18805 AND `Item` = 1 AND `Reference` = 3530003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18805,1,3530003,2,0,1,0,1,1,'Generated encounter attachment | map_550_difficulty_0 | boss_000732');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3600000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3600000,300037,0,0,0,1,1,1,1,'Generated map_555_difficulty_0 boss_000208 | Runewoven Choker of the Azure Flame');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3600002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3600002,200796,0,0,0,1,1,1,1,'Generated map_555_difficulty_0 boss_000210 | Thorned Warplate'),
(3600002,380101,0,0,0,1,1,1,1,'Generated map_555_difficulty_0 boss_000210 | Arcanized Runemaul of Golden Light'),
(3600002,380407,0,0,0,1,1,1,1,'Generated map_555_difficulty_0 boss_000210 | Forgekeeper''s Glasslike Pillar');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18731 AND `Item` = 1 AND `Reference` = 3600000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18731,1,3600000,2,0,1,0,1,1,'Generated encounter attachment | map_555_difficulty_0 | boss_000208');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18732 AND `Item` = 1 AND `Reference` = 3600002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18732,1,3600002,2,0,1,0,1,1,'Generated encounter attachment | map_555_difficulty_0 | boss_000210');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3610000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3610000,320052,0,0,0,2,1,1,1,'Generated map_555_difficulty_1 boss_000208 | Tombbound Gauntlets');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3610002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3610002,280523,0,0,0,2,1,1,1,'Generated map_555_difficulty_1 boss_000210 | Kilt of the Shadowmoon Valley'),
(3610002,320145,0,0,0,2,1,1,1,'Generated map_555_difficulty_1 boss_000210 | Mail of the Venture Bay');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20636 AND `Item` = 1 AND `Reference` = 3610000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20636,1,3610000,2,0,2,0,1,1,'Generated encounter attachment | map_555_difficulty_1 | boss_000208');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20653 AND `Item` = 1 AND `Reference` = 3610002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20653,1,3610002,2,0,2,0,1,1,'Generated encounter attachment | map_555_difficulty_1 | boss_000210');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3620000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3620000,260162,0,0,0,1,1,1,1,'Generated map_556_difficulty_0 boss_000206 | Steel Crossbow of the Ancient Thorn');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3620001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3620001,220184,0,0,0,1,1,1,1,'Generated map_556_difficulty_0 boss_000207 | Wolfcaller''s Traveling Cloak'),
(3620001,360788,0,0,0,1,1,1,1,'Generated map_556_difficulty_0 boss_000207 | Bloodsoaked Mitts of Titan Keeper');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18472 AND `Item` = 1 AND `Reference` = 3620000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18472,1,3620000,2,0,1,0,1,1,'Generated encounter attachment | map_556_difficulty_0 | boss_000206');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18473 AND `Item` = 1 AND `Reference` = 3620001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18473,1,3620001,2,0,1,0,1,1,'Generated encounter attachment | map_556_difficulty_0 | boss_000207');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3630000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3630000,200462,0,0,0,2,1,1,1,'Generated map_556_difficulty_1 boss_000206 | The Sunhallowed Battle Greatsword'),
(3630000,260917,0,0,0,2,1,1,1,'Generated map_556_difficulty_1 boss_000206 | Striders, Pale Keeper'),
(3630000,340645,0,0,0,2,1,1,1,'Generated map_556_difficulty_1 boss_000206 | Wolfmarked Mitts');

DELETE FROM `creature_loot_template` WHERE `Entry` = 20690 AND `Item` = 1 AND `Reference` = 3630000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(20690,1,3630000,2,0,2,0,1,1,'Generated encounter attachment | map_556_difficulty_1 | boss_000206');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3640001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3640001,200001,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | First Knight''s Wolfsworn Carapace'),
(3640001,200006,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shoulderplates, Star Moon'),
(3640001,200029,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Ancestral Waistplate'),
(3640001,200033,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Charmstone, Red Spark'),
(3640001,200044,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Twilightwarden''s Greaves of the Cold Watch'),
(3640001,200064,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Blackguard''s Borean Sollerets'),
(3640001,200071,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Storm Decree Medallion'),
(3640001,200088,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Forge Hand Helm'),
(3640001,200106,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ebon Knight''s Ringlet of the Storm Forge'),
(3640001,200123,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sepulchral Girdle, Stargazer''s Oath'),
(3640001,200139,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gravecaller''s Signet'),
(3640001,200165,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gray Figurine'),
(3640001,200186,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Handguards, Starfire Spear'),
(3640001,200212,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Plaguelord''s Loop'),
(3640001,200271,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sun Strike War Greaves'),
(3640001,200294,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Pale Wing Great Gauntlets'),
(3640001,200311,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Faithful Steelblade of Red Dragonflight'),
(3640001,200328,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Thunderlord''s Warbelt of the Blood Ritual'),
(3640001,200352,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildlord''s Greathelm'),
(3640001,200421,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostscarred Gauntlets of the Shadow King'),
(3640001,200463,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gauntlets, Skull Chain'),
(3640001,200495,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Moonwarden''s Twilight Bearded Axe'),
(3640001,200498,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Footplates of the River Heart'),
(3640001,200505,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Blade Pact War Greaves'),
(3640001,200526,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Moonfire Dirge Medallion'),
(3640001,200548,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Handguards of Blue Dragon'),
(3640001,200579,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Rimecaller''s Bracers of the Silver Flame'),
(3640001,200617,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Legguards of Undercity Depths'),
(3640001,200709,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Vanguard''s Northborn Battle Girdle'),
(3640001,200725,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Iron Queen''s Feather'),
(3640001,200730,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Heavenforged Armguards of Frostwolf Clan'),
(3640001,200748,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildkeeper''s Bracers'),
(3640001,200804,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Stoneguard''s Runering of the Final Stand'),
(3640001,200823,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Battle Girdle of the Sun Watch'),
(3640001,200832,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wargrips of the Final Promise'),
(3640001,200840,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sorcerous Greaves of Bone March'),
(3640001,200868,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Runewoven Waistplate'),
(3640001,200920,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Veil of the Exodar Crystal'),
(3640001,200945,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bright Dream Handplates'),
(3640001,200970,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Handguards, Skull Glaive'),
(3640001,220044,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostworn Bearded Axe of Stone Giant'),
(3640001,220046,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tombforged Ringlet'),
(3640001,220086,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Old Warden''s Crusader Slasher'),
(3640001,220172,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Goldbound Battleplate'),
(3640001,220178,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Halberd, Demon Helm'),
(3640001,220208,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Windkeeper''s Armored Pauldrons'),
(3640001,220210,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mooncaller''s Cerulean Warband'),
(3640001,220228,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Fel Rend Greaves'),
(3640001,220232,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Northforged Battlehelm'),
(3640001,220257,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Greaves of Winter Crown'),
(3640001,220287,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Duskrun Faceguard of the Bronze Flight'),
(3640001,220308,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sorcerous Clasp of the Titan Crown'),
(3640001,220368,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sabatons, Silver Vengeance'),
(3640001,220452,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Stonelord''s Maul of the Silver Hand'),
(3640001,220462,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Calm Wristplates'),
(3640001,220503,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Legguards of Black Forge'),
(3640001,220576,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ebon Warden''s Titanic Armplates'),
(3640001,220622,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | War Leggings, Stormshard Scar'),
(3640001,220631,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Argent Marshal''s Battleplate'),
(3640001,220642,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cloak, Boar Tooth'),
(3640001,220645,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Greaves, Savage Cry'),
(3640001,220700,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Moonfire Hide Chestplate'),
(3640001,220701,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Waistguard of the Earthen King'),
(3640001,220719,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Northforged Gorget'),
(3640001,220732,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Moonwarden''s Earthforged Sollerets'),
(3640001,220756,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Scarlet Inquisitor''s Sable War Leggings'),
(3640001,220764,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Crusader Handguards of the Azjol Nerub'),
(3640001,220815,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Helm of the Dread March'),
(3640001,220855,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Archmage''s Grimdark Cuirass'),
(3640001,220870,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Visor of the Stone Giant'),
(3640001,220873,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Warped Veil'),
(3640001,220886,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostfire Wake Scepter'),
(3640001,220900,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Stoneward Broad Axe'),
(3640001,220932,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Old Keeper''s Battleplate Legguards'),
(3640001,220933,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gauntlets of the Iron March'),
(3640001,220938,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmlord''s Battleplate Legguards'),
(3640001,220991,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Iron Queen''s Gauntlets'),
(3640001,240016,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Starlit Great Hauberk'),
(3640001,240066,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Defiant Warboots'),
(3640001,240071,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Eye, Doom Mist'),
(3640001,240088,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Great Warbow, Mystic Reckoning'),
(3640001,240147,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Veiled War Leggings'),
(3640001,240164,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ancestral Seal Ring of the Kings Promise'),
(3640001,240237,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Polished Boots of Sky King'),
(3640001,240305,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dire Spaulders, Wolfwarden''s Oath'),
(3640001,240316,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Stoneforged Treads'),
(3640001,240410,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Eagle Ember Totem'),
(3640001,240417,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Kingsguard''s Bloodbound Handguards'),
(3640001,240422,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ivory Bolt Thrower of the Soul Watch'),
(3640001,240456,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Runestone, Scarlet Glow'),
(3640001,240502,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Draconic Great Hauberk of Golden Banner'),
(3640001,240528,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Green Maw Surcoat'),
(3640001,240603,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tombbound Great Hauberk of the Silent Road'),
(3640001,240622,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Torque of the Last Light'),
(3640001,240625,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Unbroken Judgment Surcoat'),
(3640001,240658,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ironthane Seal Ring of Forgotten Dead'),
(3640001,240679,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mark of the Frost Crown'),
(3640001,240716,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Burial Gauntlets of Rune Forge'),
(3640001,240720,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Duskkeeper''s Greaves'),
(3640001,240788,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Aged Spaulders of the Burning Star'),
(3640001,240804,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dragon Queen''s Legmail of the Wild Hunt'),
(3640001,240839,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Chestguard of the Stone Forge'),
(3640001,240870,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Ravenbound War Leggings'),
(3640001,240903,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Vambraces of the Iron Dwarf'),
(3640001,240925,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Battle Glaive of the Light Eternal'),
(3640001,240975,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Unholy Arrow Crossbow'),
(3640001,240984,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Duskkeeper''s Armguards'),
(3640001,260011,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frost King''s Helm of the Silver Pact'),
(3640001,260048,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Pale Gloves, Old Queen''s Oath'),
(3640001,260118,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Skullbound Deathmask of the Sable Moon'),
(3640001,260174,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cap of the Autumn Wind'),
(3640001,260193,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Harness of the Cold Watch'),
(3640001,260205,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ashen King''s Corrupted Clutches'),
(3640001,260242,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Doomforged Treads of the Sacred Flame'),
(3640001,260257,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Warscarred Cinch of the Void Crown'),
(3640001,260285,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Zealous Capelet'),
(3640001,260288,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Graveborn Grips of Emerald Path'),
(3640001,260290,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Royal Cloak of the Dread Wyrm'),
(3640001,260325,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Scarlet Marshal''s Brittle Shoulderpads'),
(3640001,260328,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Lost Queen''s Headdress'),
(3640001,260343,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Verdant Cowl of Stormcaller'),
(3640001,260346,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostscarred Vest of the Broken Shield'),
(3640001,260351,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tunic of the Frost Moon'),
(3640001,260536,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Darkcaller''s Nightforged Cowl'),
(3640001,260540,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gemmed Band of Demon Watch'),
(3640001,260558,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Embersteel Cap'),
(3640001,260590,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Battlemaiden''s Fang'),
(3640001,260651,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Drakelord''s Moonsteel Helm'),
(3640001,260676,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dire Glyph Grips'),
(3640001,260723,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bright Hymn Shoulderwraps'),
(3640001,260798,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Clublike Mace of the Sunwell'),
(3640001,260843,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wristguards, Coldfire Covenant'),
(3640001,260886,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Firekeeper''s Shoulderguards'),
(3640001,260904,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Repeater of the Dragon Guard'),
(3640001,260967,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Highborn''s Legguards'),
(3640001,260972,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Death Grip Carapace'),
(3640001,280040,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Deathmarked Shoulder Cape'),
(3640001,280082,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Rootbound Breeches'),
(3640001,280099,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bloodstained Waistband of Hallowed Ground'),
(3640001,280103,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Vestments of the Hidden Road'),
(3640001,280126,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bone Dusk Armbands'),
(3640001,280130,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ivory Arcane Scepter of the Holy Guard'),
(3640001,280246,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Walkers, Unbroken Wall'),
(3640001,280297,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Earthen Gloves'),
(3640001,280319,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mark, Prime Brand'),
(3640001,280322,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Unquiet Grips of Death March'),
(3640001,280323,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Resolute Rune Band'),
(3640001,280386,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mark of Forgotten Depths'),
(3640001,280397,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Vestments, Grave Watch'),
(3640001,280436,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Forgotten Walkers'),
(3640001,280440,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Light Vine Coil'),
(3640001,280537,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Whitegold Binding'),
(3640001,280542,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Chestwrap of Ebon Watch'),
(3640001,280582,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bloodsoaked Grips of Grave Watch'),
(3640001,280584,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Chain of the Sun Watch'),
(3640001,280596,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ravenbound Rune Band of Prime Design'),
(3640001,280606,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostbitten Tunic'),
(3640001,280652,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Stonehewn Collar of the Ebon March'),
(3640001,280689,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frost Queen''s Hallowed Trousers'),
(3640001,280695,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Duskwoven Hexing Rod'),
(3640001,280863,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mournbound Robes of Holy Flame'),
(3640001,280866,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dreaming Headdress of the Ebon Vanguard'),
(3640001,280927,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shadowguard''s Veteran Robes'),
(3640001,280955,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wristwraps, Shattered Guard'),
(3640001,280962,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cryptlord''s Gloves'),
(3640001,300005,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Relicbound Iron Boots'),
(3640001,300007,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Relentless Helm of the Argent Crusade'),
(3640001,300023,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ancient Warden''s Greaves'),
(3640001,300032,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mark of Wild Moon'),
(3640001,300048,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Adamant Promise'),
(3640001,300090,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Worldwarden''s Cuirass'),
(3640001,300091,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cursed Signet of the Shadow Watch'),
(3640001,300138,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Lost Knight''s Colossal Maul'),
(3640001,300163,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Warbelt, Wolf Twilight'),
(3640001,300180,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Faceguard, Dawn Whisper'),
(3640001,300203,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Visor of Ancient Memory'),
(3640001,300236,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Patient Tablet'),
(3640001,300349,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Argent Crusader''s Waistplate'),
(3640001,300351,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Handplates of Scourge Lord'),
(3640001,300352,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Flamecaller''s Windbound Battlehelm'),
(3640001,300364,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Deathkeeper''s Headplate of the Ashen Vale'),
(3640001,300375,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sorcerous Totem of the Far North'),
(3640001,300381,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildcaller''s Warbelt'),
(3640001,300393,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shadow Cry Girdle'),
(3640001,300408,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Legplates, Earthshard Cleaver'),
(3640001,300418,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Deepfrost Token, Ebon Warden''s Oath'),
(3640001,300449,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Armplates of Dark Star'),
(3640001,300461,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Nightshrouded Headplate'),
(3640001,300468,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | War Leggings of Arcane Moon'),
(3640001,300492,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostguard''s Bracers'),
(3640001,300521,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Umbral Brooch of the Dread March'),
(3640001,300533,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Green Sigil Battle Girdle'),
(3640001,300536,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Thunderwarden''s Ivory Bracers'),
(3640001,300540,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Warplate, Voidshard Rider'),
(3640001,300578,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Arcanist''s Falchion of the Frozen Dead'),
(3640001,300664,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Witchforged Battleplate Legguards'),
(3640001,300667,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Hallowed Hammer War Greaves'),
(3640001,300680,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ravenlord''s Girdle of the Dragon Crown'),
(3640001,300710,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Waistplate of the Light Breach'),
(3640001,300736,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Spellbound Warsword of Frostwolf Clan'),
(3640001,300741,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dragonbound Carapace of Rime Watch'),
(3640001,300746,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Handguards of the Dead March'),
(3640001,300754,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Compass, Rune Glacier'),
(3640001,300764,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Colossal Sabatons of the Mimiron Forge'),
(3640001,300790,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | War Leggings, Bronze Forge'),
(3640001,300817,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Helm of Lost Promise'),
(3640001,300822,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Starwarden''s Waistplate'),
(3640001,300838,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cruel Legguards, Bonecaller''s Oath'),
(3640001,300896,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Spiritforged Chain'),
(3640001,300911,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Steelforged Sword of Light Breach'),
(3640001,300918,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildwoven Waistguard of the Frost Giant'),
(3640001,300926,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Thornwoven Girdle'),
(3640001,300956,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Lost Queen''s Charmstone'),
(3640001,300999,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shadowcaller''s Veil'),
(3640001,320032,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Waistchain, Deep Blade'),
(3640001,320040,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Forsaken Girdle'),
(3640001,320092,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dragonbound Coif'),
(3640001,320137,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Legmail of Dragon Flame'),
(3640001,320166,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Sorcerous Surcoat'),
(3640001,320214,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | First Warden''s Carved Waistchain'),
(3640001,320242,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bloodfire Rime Spellknife'),
(3640001,320266,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Graven Faceguard of Dread Host'),
(3640001,320272,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildkeeper''s Northborn Warhammer'),
(3640001,320273,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Knife of Shadow Forge'),
(3640001,320307,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Spaulders, Bleak Hide'),
(3640001,320358,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wargrips, Death Punch'),
(3640001,320363,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | High Hymn Greaves'),
(3640001,320367,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Skull Bolt Circle'),
(3640001,320377,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Starwoven War Claw'),
(3640001,320395,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Coldforged Longcloak of the Kaskala'),
(3640001,320436,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Old Warden''s Wallshield'),
(3640001,320445,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Embercaller''s Everfrost Greaves'),
(3640001,320454,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Dusk Pact Handguards'),
(3640001,320469,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Waistchain of the Forgotten Road'),
(3640001,320491,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Warden Casque of the Wyrm King'),
(3640001,320512,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Falcon Sorrow Bodkin'),
(3640001,320520,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Treads, Shattered Death'),
(3640001,320566,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Forsworn Wristguards of the Star Caller'),
(3640001,320567,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gold Thirst Mallet'),
(3640001,320573,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Magebound Scale'),
(3640001,320595,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ebon Crusader''s Crook of the Bronze Flight'),
(3640001,320620,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Spaulders, Blade Vow'),
(3640001,320639,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Amulet, Shattered Forge'),
(3640001,320648,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Rangemaster''s Faded Torque'),
(3640001,320657,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Idol of the Earthshaper'),
(3640001,320661,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shoulder Drape, Sacred Hand'),
(3640001,320670,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Lionheart Curse Coil'),
(3640001,320717,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Gravewarden''s Hollow Grips'),
(3640001,320725,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shoulder Drape, Spear Glaive'),
(3640001,320756,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmguard''s Howling Headguard'),
(3640001,320793,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bladeguard''s Mail of the Deep Roads'),
(3640001,320828,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmforged Gauntlets of Scarlet Bastion'),
(3640001,320862,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Fanged Vambraces of Void Flame'),
(3640001,320912,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Forgotten Keeper''s Greatstaff'),
(3640001,320955,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Helm of Iron March'),
(3640001,320969,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Warscarred Spaulders'),
(3640001,340005,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Skirt, Grave Vengeance'),
(3640001,340015,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Fanged Pendant'),
(3640001,340037,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmlord''s Rime-coated Graspers'),
(3640001,340066,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Razor-edged Great Stave'),
(3640001,340154,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Brutish Warcloak'),
(3640001,340239,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cryptlord''s Cuffs'),
(3640001,340257,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Warcaller''s Tiara of the Howling Fjord'),
(3640001,340265,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Waistwrap of Silent Crown'),
(3640001,340278,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Starwarden''s Shoulderwraps'),
(3640001,340336,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tunic, Pale Crown'),
(3640001,340394,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bloodkeeper''s Promise'),
(3640001,340421,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ghostly Breeches'),
(3640001,340427,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Soul Singer Cape'),
(3640001,340455,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frozen Knight''s Robes of the Silver Moon'),
(3640001,340598,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Greatcloak of the Ice King'),
(3640001,340599,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Breeches of the Frozen Watch'),
(3640001,340654,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Soulforged Headdress'),
(3640001,340679,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Leggings, Necro Mist'),
(3640001,340692,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ravenlord''s Titanic Collar'),
(3640001,340712,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ice Witch''s Pale-blue Shaman Staff'),
(3640001,340717,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Dragonbound Headdress'),
(3640001,340790,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Assassin Blade, Ash Wall'),
(3640001,340800,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Enduring Graspers'),
(3640001,340822,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Mist Veil Loop'),
(3640001,340833,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Brightsteel Tiara of Old Road'),
(3640001,340906,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Nightsteel Seer Staff'),
(3640001,340936,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Skullkeeper''s Spirit Staff'),
(3640001,340991,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Sunblessed Vestments'),
(3640001,340995,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cinch of Searing Gorge'),
(3640001,360040,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Winterlord''s Royal Band'),
(3640001,360052,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Serrated Hoop of Ashen March'),
(3640001,360060,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Spellscarred Grips'),
(3640001,360116,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Rune-etched Fingerband of the Kamagua'),
(3640001,360127,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Stormwrought Cowl'),
(3640001,360141,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Argent Knight''s Binding'),
(3640001,360163,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wrap, Ember Bolt'),
(3640001,360186,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bright Talon Pants'),
(3640001,360201,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Runestaff, Bloodfire Seal'),
(3640001,360238,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ashcaller''s Starlit Flask'),
(3640001,360406,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Plagueforged Charm of Lost Crown'),
(3640001,360416,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frostguard''s Mitts'),
(3640001,360442,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Celestial Thirst Graspers'),
(3640001,360476,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Mournful Vest'),
(3640001,360482,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Twilightwarden''s Shawl of the Lost Promise'),
(3640001,360552,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Coldforged Kilt'),
(3640001,360624,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Doomed Rune Band of Ice King'),
(3640001,360684,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Burial Sash of the Silent Crypt'),
(3640001,360730,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ancestor''s Pants of the First King'),
(3640001,360818,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Runed Armbands'),
(3640001,360858,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmkeeper''s Defiant Mantle'),
(3640001,360877,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Deathguard''s Wristwraps'),
(3640001,360886,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Runebands of Wintergrasp'),
(3640001,360900,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Deepfrost Choker of Dragon Rider'),
(3640001,360911,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Windforged Grips'),
(3640001,360945,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tablet, Sun Dream'),
(3640001,360962,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Binding of Light Crown'),
(3640001,380004,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Strap of Frenzyheart Hill'),
(3640001,380012,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildkeeper''s Profane Jerkin'),
(3640001,380023,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ancient King''s Warband of the Frost Watch'),
(3640001,380075,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Plaguetouched Wargrips'),
(3640001,380076,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ring of Emerald Watch'),
(3640001,380112,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Ironlord''s Bindings of the Silver Promise'),
(3640001,380148,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Graven Walkers of the Wyrm Forge'),
(3640001,380188,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Argent Knight''s Spire'),
(3640001,380192,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Eternal Steel Torc'),
(3640001,380208,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Charmstone, Hallowed Roar'),
(3640001,380212,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | High Hail Breeches'),
(3640001,380213,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Jagged Shoulderpads'),
(3640001,380293,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Shattered Cap'),
(3640001,380351,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Bonebound Neckchain of the Ashen Pact'),
(3640001,380381,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Frost Queen''s Infused Bracers'),
(3640001,380408,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Tombforged Tunic of Bronze Dragon'),
(3640001,380416,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Celestial Pact Shoulderpads'),
(3640001,380445,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Rune, Dream Storm'),
(3640001,380454,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Relic, Far Breaker'),
(3640001,380499,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Far Dancer Girdle'),
(3640001,380571,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | The Cruel Cinch'),
(3640001,380680,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Shawl of Abyssal Flame'),
(3640001,380706,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wayfarer''s Amulet'),
(3640001,380743,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wildfire Mail Cudgel'),
(3640001,380817,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Runesteel Wristbands of the Stormcaller'),
(3640001,380830,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Wyrmforged Headdress'),
(3640001,380851,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Crimson Flare Heart'),
(3640001,380882,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Cinch, Astral Seal'),
(3640001,380948,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Soul Chill Bindings'),
(3640001,380953,0,0,0,1,1,1,1,'Generated map_557_difficulty_0 trash | Neckchain, High Seal');

DELETE FROM `creature_loot_template` WHERE `Entry` = 18314 AND `Item` = 1 AND `Reference` = 3640001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(18314,1,3640001,2,0,1,0,1,1,'Generated encounter attachment | map_557_difficulty_0 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 19306 AND `Item` = 1 AND `Reference` = 3640001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(19306,1,3640001,2,0,1,0,1,1,'Generated encounter attachment | map_557_difficulty_0 | trash');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3650001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3650001,220168,0,0,0,2,1,1,1,'Generated map_557_difficulty_1 trash | Worldwarden''s Duskrun Execution Blade'),
(3650001,240460,0,0,0,2,1,1,1,'Generated map_557_difficulty_1 trash | Cursed Legmail of the Fallen Crown'),
(3650001,260616,0,0,0,2,1,1,1,'Generated map_557_difficulty_1 trash | Wyrm Queen''s Winterworn Beads'),
(3650001,320442,0,0,0,2,1,1,1,'Generated map_557_difficulty_1 trash | Boneguard''s Fel Wristguards'),
(3650001,340945,0,0,0,2,1,1,1,'Generated map_557_difficulty_1 trash | Saronite Graspers of Unquiet Dead');

DELETE FROM `creature_loot_template` WHERE `Entry` = 19306 AND `Item` = 1 AND `Reference` = 3650001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(19306,1,3650001,2,0,2,0,1,1,'Generated encounter attachment | map_557_difficulty_1 | trash');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3720000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3720000,200743,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Sunblessed Sollerets'),
(3720000,200951,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Rimecaller''s Ancient Waistguard'),
(3720000,220106,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Armplates, Low Ruin'),
(3720000,220176,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Coldfire Echo Gauntlets'),
(3720000,220280,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Battleworn Wargrips'),
(3720000,220396,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Voidwarden''s Vrykul Icon'),
(3720000,220437,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Stormwarden''s Legplates of the Pale Moon'),
(3720000,240276,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | War Leggings of Frozen Heart'),
(3720000,280100,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Doomforged Rune Band'),
(3720000,280179,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Darkrider''s Griefbound Trousers'),
(3720000,280612,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Silent Dusk Bracelets'),
(3720000,280842,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Deathwarden''s Clawmarked Runed Staff'),
(3720000,300216,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Ravenwarden''s Kingsblade'),
(3720000,300333,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Lion Branch Thunder Hammer'),
(3720000,300572,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | The Shadowmarked Great Gauntlets'),
(3720000,320340,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Duskwarden''s Bleak Handguards'),
(3720000,320596,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | The Astral Backcloth'),
(3720000,340410,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Circlet, Obsidian Legacy'),
(3720000,340518,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Stormguard''s Stiletto of the Kamagua'),
(3720000,340759,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Emerald Mist Spellrod'),
(3720000,360444,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Runelord''s Relentless Shoulder Cape'),
(3720000,380007,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Glacial Cinch'),
(3720000,380540,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000778 | Shoulderwraps, Skull Bane');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3720004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3720004,200234,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Warbracers, Dream Fury'),
(3720004,300027,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | The Warborn Bracers'),
(3720004,300787,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Seal, Moonfire Fall'),
(3720004,320750,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Demon Claw Girdle'),
(3720004,340133,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Oathforged Mitts'),
(3720004,340286,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Leggings of the Iron Crown'),
(3720004,340384,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000782 | Seal Ring, Last Brand');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3720005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3720005,200030,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | The Fel Iron Boots'),
(3720005,200499,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Deathwarden''s Warbelt'),
(3720005,240282,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Plaguecaller''s Gauntlets of the Last Light'),
(3720005,260382,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Hardened Chestguard'),
(3720005,260504,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Snowforged Stalkers'),
(3720005,300262,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Spiritbound Runic Greataxe'),
(3720005,300648,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Bracers of the Soul Watch'),
(3720005,300699,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Warbelt of Frostguard'),
(3720005,320195,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Faceguard, Gray Grave'),
(3720005,320585,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Northguard''s Nerubian Leggings'),
(3720005,340448,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Dragonforged Waistwrap of High Watch'),
(3720005,340637,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Wintersteel Crystal Wand of Silver Hand'),
(3720005,360993,0,0,0,1,1,1,1,'Generated map_568_difficulty_0 boss_000783 | Walkers of the Halls of Stone');

DELETE FROM `creature_loot_template` WHERE `Entry` = 23574 AND `Item` = 1 AND `Reference` = 3720000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(23574,1,3720000,2,0,1,0,1,1,'Generated encounter attachment | map_568_difficulty_0 | boss_000778');

DELETE FROM `creature_loot_template` WHERE `Entry` = 24239 AND `Item` = 1 AND `Reference` = 3720004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(24239,1,3720004,2,0,1,0,1,1,'Generated encounter attachment | map_568_difficulty_0 | boss_000782');

DELETE FROM `creature_loot_template` WHERE `Entry` = 23863 AND `Item` = 1 AND `Reference` = 3720005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(23863,1,3720005,2,0,1,0,1,1,'Generated encounter attachment | map_568_difficulty_0 | boss_000783');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3740000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3740000,220881,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000571 | Visor of Dragon Wastes'),
(3740000,280123,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000571 | Ebon Champion''s Bindings'),
(3740000,300776,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000571 | Frost Punch Pauldrons'),
(3740000,360325,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000571 | The Unquiet Boots'),
(3740000,380267,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000571 | The Mystic Footguards');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3740003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3740003,300490,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000575 | Winterguard''s Badge'),
(3740003,300590,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000575 | Demon Edge Warbracers'),
(3740003,320424,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000575 | Stormsteel Girdle of Dragon Throne'),
(3740003,340245,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000575 | Hood, Ice Flare'),
(3740003,360947,0,0,0,2,1,1,1,'Generated map_574_difficulty_1 boss_000575 | Epaulets of Crusader Watch');

DELETE FROM `creature_loot_template` WHERE `Entry` = 30748 AND `Item` = 1 AND `Reference` = 3740000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(30748,1,3740000,2,0,2,0,1,1,'Generated encounter attachment | map_574_difficulty_1 | boss_000571');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31673 AND `Item` = 1 AND `Reference` = 3740003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31673,1,3740003,2,0,2,0,1,1,'Generated encounter attachment | map_574_difficulty_1 | boss_000575');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3750000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3750000,220956,0,0,0,1,1,1,1,'Generated map_575_difficulty_0 boss_000579 | Conqueror Collar of the Ancient Frost');

DELETE FROM `creature_loot_template` WHERE `Entry` = 26687 AND `Item` = 1 AND `Reference` = 3750000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(26687,1,3750000,2,0,1,0,1,1,'Generated encounter attachment | map_575_difficulty_0 | boss_000579');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3760000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3760000,200543,0,0,0,2,1,1,1,'Generated map_575_difficulty_1 boss_000579 | Wargrips of the Silver Covenant'),
(3760000,300143,0,0,0,2,1,1,1,'Generated map_575_difficulty_1 boss_000579 | The Age-darkened Headplate'),
(3760000,320651,0,0,0,2,1,1,1,'Generated map_575_difficulty_1 boss_000579 | Whitegold Harness'),
(3760000,360531,0,0,0,2,1,1,1,'Generated map_575_difficulty_1 boss_000579 | Stonecarved Runering of Demon Lord');

DELETE FROM `creature_loot_template` WHERE `Entry` = 30774 AND `Item` = 1 AND `Reference` = 3760000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(30774,1,3760000,2,0,2,0,1,1,'Generated encounter attachment | map_575_difficulty_1 | boss_000579');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3780001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3780001,240239,0,0,0,2,1,1,1,'Generated map_576_difficulty_1 boss_000520 | Soldierly Armguards of the Last Stand'),
(3780001,320754,0,0,0,2,1,1,1,'Generated map_576_difficulty_1 boss_000520 | Shadowkeeper''s Battlecloak'),
(3780001,340628,0,0,0,2,1,1,1,'Generated map_576_difficulty_1 boss_000520 | Warchief''s Duskwoven Longsword');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3780004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3780004,280128,0,0,0,2,1,1,1,'Generated map_576_difficulty_1 boss_000526 | Frozen Keeper''s Silverforged Breeches'),
(3780004,300727,0,0,0,2,1,1,1,'Generated map_576_difficulty_1 boss_000526 | Deepfrost War Leggings of the Wind Spirit');

DELETE FROM `creature_loot_template` WHERE `Entry` = 30510 AND `Item` = 1 AND `Reference` = 3780001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(30510,1,3780001,2,0,2,0,1,1,'Generated encounter attachment | map_576_difficulty_1 | boss_000520');

DELETE FROM `creature_loot_template` WHERE `Entry` = 30540 AND `Item` = 1 AND `Reference` = 3780004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(30540,1,3780004,2,0,2,0,1,1,'Generated encounter attachment | map_576_difficulty_1 | boss_000526');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3790000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3790000,200595,0,0,0,1,1,1,1,'Generated map_578_difficulty_0 boss_000528 | Dragon Queen''s Signet'),
(3790000,300803,0,0,0,1,1,1,1,'Generated map_578_difficulty_0 boss_000528 | Rangemaster''s Seal of the Deep Anvil'),
(3790000,360827,0,0,0,1,1,1,1,'Generated map_578_difficulty_0 boss_000528 | The Sorrowful Clasp'),
(3790000,380106,0,0,0,1,1,1,1,'Generated map_578_difficulty_0 boss_000528 | Shoulderwraps, Shattered Chain');

DELETE FROM `creature_loot_template` WHERE `Entry` = 27654 AND `Item` = 1 AND `Reference` = 3790000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(27654,1,3790000,2,0,1,0,1,1,'Generated encounter attachment | map_578_difficulty_0 | boss_000528');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3800000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3800000,220562,0,0,0,2,1,1,1,'Generated map_578_difficulty_1 boss_000528 | Skullcrusher of Dragon Queen'),
(3800000,260626,0,0,0,2,1,1,1,'Generated map_578_difficulty_1 boss_000528 | Scarab of Iron Pact'),
(3800000,340337,0,0,0,2,1,1,1,'Generated map_578_difficulty_1 boss_000528 | Silverkeeper''s Celestial Trousers');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31558 AND `Item` = 1 AND `Reference` = 3800000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31558,1,3800000,2,0,2,0,1,1,'Generated encounter attachment | map_578_difficulty_1 | boss_000528');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3840000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3840000,200728,0,0,0,1,1,1,1,'Generated map_595_difficulty_0 boss_000293 | Handplates, Long Howl'),
(3840000,220056,0,0,0,1,1,1,1,'Generated map_595_difficulty_0 boss_000293 | Great Cape of the Golden Flame'),
(3840000,360068,0,0,0,1,1,1,1,'Generated map_595_difficulty_0 boss_000293 | Cap, North Requiem'),
(3840000,380587,0,0,0,1,1,1,1,'Generated map_595_difficulty_0 boss_000293 | Belt of the Burning Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 26529 AND `Item` = 1 AND `Reference` = 3840000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(26529,1,3840000,2,0,1,0,1,1,'Generated encounter attachment | map_595_difficulty_0 | boss_000293');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3850000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3850000,300131,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 boss_000293 | Saronite Greaves'),
(3850000,300391,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 boss_000293 | Duskkeeper''s Wargrips');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3850001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3850001,220048,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 trash | Spiritwarden''s Cutlass of the Cold Memory'),
(3850001,240446,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 trash | The Hardened War Mantle'),
(3850001,360586,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 trash | Mitts of the Searing Gorge'),
(3850001,380227,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 trash | Wyrmwarden''s Bindings of the Ice Queen');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3850004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3850004,320453,0,0,0,2,1,1,1,'Generated map_595_difficulty_1 script_DamageTaken | Silver Queen''s Belt of the Construct Wing');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31211 AND `Item` = 1 AND `Reference` = 3850000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31211,1,3850000,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | boss_000293');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31178 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31178,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31179 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31179,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31187 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31187,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31199 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31199,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31200 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31200,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31201 AND `Item` = 1 AND `Reference` = 3850001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31201,1,3850001,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | trash');

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 24589 AND `Item` = 1 AND `Reference` = 3850004;

INSERT INTO `gameobject_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(24589,1,3850004,2,0,2,0,1,1,'Generated encounter attachment | map_595_difficulty_1 | script_DamageTaken');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3860000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3860000,220494,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Runesteel Pendant of the Golden King'),
(3860000,220795,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Ethereal Grand Mace of Demon Lord'),
(3860000,240582,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Legguards of the Star Watch'),
(3860000,240806,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Silver King''s Vambraces of the Avalanche'),
(3860000,260014,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Wolfwarden''s Bindings'),
(3860000,280070,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Blighted Pendant Chain'),
(3860000,280664,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Vest of Dragon Spirit'),
(3860000,280810,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Skirt of the Blood Memory'),
(3860000,300337,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Ironthane Medallion of the Sky Forge'),
(3860000,300551,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Blacksmith''s Titanblade'),
(3860000,300962,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Kingsblade of the Shadow Crown'),
(3860000,320179,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Frostveined Footguards of the Grim Dawn'),
(3860000,320929,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Chainmail of Frozen Star'),
(3860000,360994,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Trousers of the Wind Crown'),
(3860000,380098,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Cap of Ancient Frost'),
(3860000,380161,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Blood Queen''s Valiant Forgehammer'),
(3860000,380518,0,0,0,1,1,1,1,'Generated map_599_difficulty_0 boss_000563 | Violet Piercer Grips');

DELETE FROM `creature_loot_template` WHERE `Entry` = 27977 AND `Item` = 1 AND `Reference` = 3860000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(27977,1,3860000,2,0,1,0,1,1,'Generated encounter attachment | map_599_difficulty_0 | boss_000563');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3870000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3870000,240469,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000563 | War Mantle of Bitter Memory'),
(3870000,240495,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000563 | Titan-carved Siege Gun of Stone King'),
(3870000,280476,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000563 | Shoulderpads of the Kings Road'),
(3870000,320001,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000563 | Wolfsworn Talisman of Altar of Sseratus'),
(3870000,360039,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000563 | Silent Regalia of the Grim Host');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3870003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3870003,380036,0,0,0,2,1,1,1,'Generated map_599_difficulty_1 boss_000569 | Warmaster Treads of the Dragon Spirit');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31381 AND `Item` = 1 AND `Reference` = 3870000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31381,1,3870000,2,0,2,0,1,1,'Generated encounter attachment | map_599_difficulty_1 | boss_000563');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31386 AND `Item` = 1 AND `Reference` = 3870003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31386,1,3870003,2,0,2,0,1,1,'Generated encounter attachment | map_599_difficulty_1 | boss_000569');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3890000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3890000,300265,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 boss_000369 | Coldhearted Battleplate Legguards'),
(3890000,300289,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 boss_000369 | First Knight''s Thorned Faceguard'),
(3890000,300924,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 boss_000369 | Starforged Pauldrons of Shadow Ritual'),
(3890000,320487,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 boss_000369 | Runed Warbelt of Frozen Promise');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3890001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3890001,240709,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 trash | Windwarden''s Plaguebound Collar'),
(3890001,300155,0,0,0,2,1,1,1,'Generated map_600_difficulty_1 trash | Runemarked Fetish of the Star Grove');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31362 AND `Item` = 1 AND `Reference` = 3890000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31362,1,3890000,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | boss_000369');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31336 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31336,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31337 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31337,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31338 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31338,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31339 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31339,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31340 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31340,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31342 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31342,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31343 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31343,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31345 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31345,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31347 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31347,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31351 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31351,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31352 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31352,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31354 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31354,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31355 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31355,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31357 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31357,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31359 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31359,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31360 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31360,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31363 AND `Item` = 1 AND `Reference` = 3890001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31363,1,3890001,2,0,2,0,1,1,'Generated encounter attachment | map_600_difficulty_1 | trash');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3910000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3910000,280644,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000216 | Starcaller''s Bracelets'),
(3910000,300927,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000216 | The Blighted Knobbed Mace');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3910003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3910003,240982,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000218 | War Mantle of the Holy Watch'),
(3910003,300306,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000218 | Ice Witch''s Symbol'),
(3910003,300544,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000218 | Cuirass of the Deep Earth'),
(3910003,300889,0,0,0,2,1,1,1,'Generated map_601_difficulty_1 boss_000218 | Warmaster''s Weathered Raider Axe');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31612 AND `Item` = 1 AND `Reference` = 3910000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31612,1,3910000,2,0,2,0,1,1,'Generated encounter attachment | map_601_difficulty_1 | boss_000216');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31610 AND `Item` = 1 AND `Reference` = 3910003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31610,1,3910003,2,0,2,0,1,1,'Generated encounter attachment | map_601_difficulty_1 | boss_000218');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3930000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3930000,220808,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000555 | Undying Phylactery of the Sacred Dawn'),
(3930000,260656,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000555 | Stoneward Shoulderpads of the Storm Pact'),
(3930000,300130,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000555 | Silver King''s Carapace'),
(3930000,360637,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000555 | Ghostkeeper''s Mystwoven Crystal Wand');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3930004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3930004,240053,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000561 | Moonbound Legguards of Thunder Forge'),
(3930004,300482,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000561 | The Holy Waistguard'),
(3930004,300543,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000561 | Wildkeeper''s Pauldrons of the Argent Watch'),
(3930004,360891,0,0,0,2,1,1,1,'Generated map_602_difficulty_1 boss_000561 | The Glasslike Epaulets');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31533 AND `Item` = 1 AND `Reference` = 3930000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31533,1,3930000,2,0,2,0,1,1,'Generated encounter attachment | map_602_difficulty_1 | boss_000555');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31538 AND `Item` = 1 AND `Reference` = 3930004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31538,1,3930004,2,0,2,0,1,1,'Generated encounter attachment | map_602_difficulty_1 | boss_000561');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3940000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3940000,200664,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Light Branch Battle Girdle'),
(3940000,260463,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Traveling Cloak, Astral Carver'),
(3940000,280136,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Deathbound Skullcap'),
(3940000,300527,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Emerald Seed Sabatons'),
(3940000,300718,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Shield Strike Battle Girdle'),
(3940000,300759,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Wristplates of the Hallowed Watch'),
(3940000,300784,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Wyrmforged Wargrips'),
(3940000,300981,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Crystal of the Tirisfal Glades'),
(3940000,340114,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Mantle of the Ebon Hold'),
(3940000,340356,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Ominous Boots of the Northwatch'),
(3940000,340880,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Lost Queen''s Knife'),
(3940000,360185,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 boss_000744 | Medallion, Bronze Branch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3940006;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3940006,200175,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Gravekeeper''s Battleplate Legguards'),
(3940006,200260,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Beastbound Cuirass'),
(3940006,220934,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Band of Stone Forge'),
(3940006,240726,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Warden''s Brutish Wargrips'),
(3940006,280712,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Dustbound Treads'),
(3940006,300058,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Gold Dusk Iron Boots'),
(3940006,320380,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Frostfire Gaze Girdle'),
(3940006,340775,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Gloves, Primal Moon'),
(3940006,360050,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Veil of Old Memory'),
(3940006,360807,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Blazing Robe of Void Crown'),
(3940006,380509,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Wyrmkeeper''s Charm of the Scourge Lord'),
(3940006,380606,0,0,0,1,1,1,1,'Generated map_603_difficulty_0 script_UpdateAI | Wildwoven Mantle');

DELETE FROM `creature_loot_template` WHERE `Entry` = 33113 AND `Item` = 1 AND `Reference` = 3940000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(33113,1,3940000,2,0,1,0,1,1,'Generated encounter attachment | map_603_difficulty_0 | boss_000744');

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27086 AND `Item` = 1 AND `Reference` = 3940006;

INSERT INTO `gameobject_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(27086,1,3940006,2,0,1,0,1,1,'Generated encounter attachment | map_603_difficulty_0 | script_UpdateAI');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3950000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3950000,200127,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Shoulderplates of Makers Hand'),
(3950000,200231,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Battle Girdle, Hammer Wall'),
(3950000,200584,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | The Veteran Handaxe'),
(3950000,200691,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Feral Wristplates of Mount Hyjal'),
(3950000,200692,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Ironthane Shoulderplates of Frozen Star'),
(3950000,200974,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Firewarden''s Bracers of the Titan Crown'),
(3950000,220187,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Plaguewarden''s Seal of the Earthen King'),
(3950000,220220,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Wildwarden''s Gravebound Crusher'),
(3950000,220711,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Iron Queen''s Sacred Great Pauldrons'),
(3950000,220977,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | First Warden''s Whispering Falchion'),
(3950000,240054,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Faceguard of the Long Night'),
(3950000,240280,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Lens of Wyrm Lord'),
(3950000,240360,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Gemmed Band of the Far North'),
(3950000,240613,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Nightfang Bane Coif'),
(3950000,240791,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Ancient Keeper''s Wristguards'),
(3950000,240971,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Old King''s Handguards'),
(3950000,260119,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Deathmarked Legguards of the Moon Watch'),
(3950000,260375,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Spiritkeeper''s Thornbound Trousers'),
(3950000,260517,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Unbroken Greatcloak'),
(3950000,260748,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Wildfire Thorn Strap'),
(3950000,260754,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Ashen Queen''s Snowbound Longcloak'),
(3950000,280115,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Obsidian Sash of Azjol Nerub'),
(3950000,280330,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Stormcaller''s Walkers'),
(3950000,280450,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Bindings, Ancient Plate'),
(3950000,280489,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Runic Circlet'),
(3950000,280614,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Vengeful Kilt of the Holy Crown'),
(3950000,280796,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Snowforged Walkers of the Broken Promise'),
(3950000,280849,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Runebands, Wyrm Voice'),
(3950000,280969,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Highkeeper''s Witchbound Longcloak'),
(3950000,300057,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | War Cleaver of Astral Crown'),
(3950000,300105,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Spiritcaller''s Chain of the Freya Garden'),
(3950000,300182,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Battleplate, Night Ritual'),
(3950000,300231,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Sacred Battleplate of the Makers Will'),
(3950000,300257,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Warbracers, Hollow Fist'),
(3950000,300275,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | First Keeper''s Cuirass'),
(3950000,300287,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Holy Great Pauldrons of the Titan Watcher'),
(3950000,300297,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Nightwoven Legplates of the Venture Bay'),
(3950000,300373,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Calm Promise of the Wild Pact'),
(3950000,300426,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | War Cleaver, Forgotten Hex'),
(3950000,300610,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Graveborn Collar of Bronze Dragon'),
(3950000,300617,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Great Gauntlets of Winter Moon'),
(3950000,300952,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Warbelt, Bleak Mail'),
(3950000,300967,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | The Verdant Coin'),
(3950000,320352,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Coldfire Warband'),
(3950000,320757,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Argent Mist Warbelt'),
(3950000,320927,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Wyrm King''s Surcoat'),
(3950000,340402,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Moonlit Mitts of Restless Dead'),
(3950000,340551,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Pitiless Capelet, Ironwarden''s Oath'),
(3950000,340823,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | The Steadfast Seal Ring'),
(3950000,340963,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Robe, Savage Claw'),
(3950000,340966,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Embersteel Torque'),
(3950000,360145,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Pendant Chain of Distant Memory'),
(3950000,360177,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Spell Stave of Moon Flame'),
(3950000,360354,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Ashen Lord''s Runed Wand'),
(3950000,360459,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Beastmarked Cape, Silent King''s Oath'),
(3950000,380092,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | The Brightsteel Vest'),
(3950000,380529,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Pale Lady''s Hammered Jerkin'),
(3950000,380637,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Ironwarden''s Vrykul Veil'),
(3950000,380927,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000744 | Wristguards of Endless Night');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3950001;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3950001,200112,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Battlesage''s Neckchain'),
(3950001,200547,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Ancestral War Pauldrons of the North Road'),
(3950001,220710,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Stoneguard''s Forgotten Handguards'),
(3950001,280092,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Winterworn Cape of Endless Night'),
(3950001,280143,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Darkkeeper''s Gloves of the Violet Eye'),
(3950001,300281,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Forgehammer of Tempest Keep'),
(3950001,300767,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Baleful Battlehelm of the Celestial Gate'),
(3950001,300929,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Pauldrons, Spirit Echo'),
(3950001,300960,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | High March Raider Greataxe'),
(3950001,360091,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Spiritkeeper''s Sash'),
(3950001,360180,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Mantle, Fire Stone'),
(3950001,360801,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Leggings, Plague Reach'),
(3950001,360948,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Ghostfire Steel Warsword'),
(3950001,380363,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Eternal Hand Hammer of the High King'),
(3950001,380550,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | First Warden''s Bracers'),
(3950001,380741,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000745 | Shieldbearer''s Consecrated Keepsake');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3950003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3950003,200068,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Rootwoven Warcloak'),
(3950003,200215,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | The Watchful Iron Boots'),
(3950003,200452,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Silver Queen''s Pauldrons'),
(3950003,200901,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Frostbound Shoulderplates'),
(3950003,240080,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Crusader Chainmail of Eastern Plaguelands'),
(3950003,260189,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Rune-carved Walkers of Tirisfal Glades'),
(3950003,280564,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Longcloak of Storm King'),
(3950003,280630,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Tombwarden''s Shawl of the Broken Banner'),
(3950003,300049,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Cuirass of Soul King'),
(3950003,300109,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Witchlord''s Bloodforged Legguards'),
(3950003,300129,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Ashen King''s Loop of the River Heart'),
(3950003,300335,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Dragonmarked Stone'),
(3950003,300422,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Nightmare Battlehelm'),
(3950003,300483,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Runemaster''s Handplates'),
(3950003,300587,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Siegebound Gauntlets of the Endless Road'),
(3950003,300615,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Voidcaller''s Shoulderplates'),
(3950003,300631,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | The Stoic Waistplate'),
(3950003,300692,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Shoulderplates of the Dread Host'),
(3950003,300726,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Legguards of the Light Crown'),
(3950003,300730,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Gauntlets of Titan King'),
(3950003,300760,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Moonlit Warband of Mystic Gate'),
(3950003,300780,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Handplates, Earth Grasp'),
(3950003,300806,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Obsidian Vault Sabatons'),
(3950003,300939,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Frostmage''s Sunsteel Steelblade'),
(3950003,300984,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Plaguebound Collar of the Ancient Pact'),
(3950003,320037,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Starkeeper''s Leafwoven Treads'),
(3950003,320335,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Wildfire Ice Pendant Chain'),
(3950003,320854,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Frozen Warden''s War Leggings'),
(3950003,340883,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Fanged Waistwrap'),
(3950003,360316,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Chilled Skirt of North Road'),
(3950003,360591,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Nightsteel Cord of the Last Promise'),
(3950003,380080,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Gravekeeper''s Dawnlit Deathmask'),
(3950003,380241,0,0,0,2,1,1,1,'Generated map_603_difficulty_1 boss_000747 | Harsh Spaulders of Blackrock Mountain');

DELETE FROM `creature_loot_template` WHERE `Entry` = 34003 AND `Item` = 1 AND `Reference` = 3950000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(34003,1,3950000,2,0,2,0,1,1,'Generated encounter attachment | map_603_difficulty_1 | boss_000744');

DELETE FROM `creature_loot_template` WHERE `Entry` = 33190 AND `Item` = 1 AND `Reference` = 3950001;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(33190,1,3950001,2,0,2,0,1,1,'Generated encounter attachment | map_603_difficulty_1 | boss_000745');

DELETE FROM `creature_loot_template` WHERE `Entry` = 33885 AND `Item` = 1 AND `Reference` = 3950003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(33885,1,3950003,2,0,2,0,1,1,'Generated encounter attachment | map_603_difficulty_1 | boss_000747');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3960002;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3960002,200034,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Legguards of Eastern Plaguelands'),
(3960002,200111,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormguard''s Fingerband'),
(3960002,200187,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blazing Medallion of the Hallowed Watch'),
(3960002,200191,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bitter Promise of Void Crown'),
(3960002,200354,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ice Witch''s Runeblade'),
(3960002,200362,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Lightforged Faceguard'),
(3960002,200410,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wargrips of the Grim Crown'),
(3960002,200422,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Vrykul Iron Boots of the Titan Watch'),
(3960002,200471,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bloodmage''s Battleplate'),
(3960002,200522,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Rangemaster''s Great Gauntlets'),
(3960002,200530,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Great Pauldrons of the Broken Blade'),
(3960002,200556,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormkeeper''s Scale'),
(3960002,200590,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Northman''s Ringlet'),
(3960002,200659,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Cuirass of the First King'),
(3960002,200687,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Emberwarden''s Legguards'),
(3960002,200689,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Drape of the Sunreaver Host'),
(3960002,200701,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Vambraces of Eagle Spirit'),
(3960002,200839,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | High Skull Breastplate'),
(3960002,200847,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shadowlord''s Gauntlets of the White Crown'),
(3960002,200853,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Thunderforged Greatcloak of Plague Lord'),
(3960002,200856,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Saronite Signet'),
(3960002,200857,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Dire Battleplate Legguards'),
(3960002,200900,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormwarden''s Sunhallowed War Leggings'),
(3960002,200923,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blood King''s Sabatons of the Great Eagle'),
(3960002,200928,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | High Beacon Bracers'),
(3960002,200955,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Cape of Sindragosa Fall'),
(3960002,200991,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wayfarer''s Tempered Warblade'),
(3960002,200992,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blademaster''s Duskbound Battle Girdle'),
(3960002,220005,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Mossbound Battle Girdle of the North Wind'),
(3960002,220064,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bracers of the Ironforge Guard'),
(3960002,220103,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frozen Keeper''s Stonehammer'),
(3960002,220136,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Gemmed Band, Moonfire Frost'),
(3960002,220146,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Locket of the Moon Pact'),
(3960002,220217,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blacksteel Greaves of Shadow Oath'),
(3960002,220265,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Coldhearted Battleplate Legguards'),
(3960002,220315,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ashen Queen''s Berserker Token'),
(3960002,220334,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Earthwoven Gauntlets'),
(3960002,220355,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Gleaming Cuirass'),
(3960002,220420,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | War Pauldrons, Void Twilight'),
(3960002,220429,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Breastplate of the Light Oath'),
(3960002,220433,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Runeguard''s Stonehewn Great Pauldrons'),
(3960002,220434,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Waistguard, Argent Howl'),
(3960002,220519,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Greaves, Ash Oath'),
(3960002,220597,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Northforged Vambraces of Frozen Halls'),
(3960002,220625,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ember Grasp Warband'),
(3960002,220654,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Silent Legguards'),
(3960002,220669,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Iron Boots of Ghost Moon'),
(3960002,220708,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stonefather''s Spirit Relic'),
(3960002,220722,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ironlord''s Dalaran Warhelm'),
(3960002,220776,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Eye of Iron Giant'),
(3960002,220814,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Grim Vial of the Unquiet King'),
(3960002,220826,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | War Leggings of Winter Moon'),
(3960002,220853,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Heavy War Pauldrons, Runelord''s Oath'),
(3960002,220861,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Plaguebound Phylactery'),
(3960002,220868,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Veteran Neckchain of Unquiet Dead'),
(3960002,220914,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Sledge, Eagle Freeze'),
(3960002,240068,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Gladiatorial War Mantle of the Cold Moon'),
(3960002,240069,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Deepforged Shoulderguards'),
(3960002,240077,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Scarlet Inquisitor''s Wrap'),
(3960002,240142,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Highkeeper''s Dreaming Helm'),
(3960002,240203,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Forgemaster''s Nightsteel Greaves'),
(3960002,240205,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Rimewarden''s Warcloak'),
(3960002,240243,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wolfheart Tooth Handguards'),
(3960002,240369,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Faithful Helm of the Ice Forge'),
(3960002,240421,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | War Leggings, Obsidian Song'),
(3960002,240512,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Coldhearted Footguards'),
(3960002,240541,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Bearhide Great Hauberk'),
(3960002,240605,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ebon Helm'),
(3960002,240825,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shortbow, Dream String'),
(3960002,240836,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Stoneforged Legguards'),
(3960002,240872,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Forgeblessed Gauntlets'),
(3960002,240989,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warsage''s Froststeel Leggings'),
(3960002,240996,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Grim Legguards, Frostguard''s Oath'),
(3960002,260000,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Vest of the Western Plaguelands'),
(3960002,260046,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Northborn Headdress of the Sky King'),
(3960002,260075,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wildbound Shoulderwraps'),
(3960002,260175,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shadowforged Cap of the Broken Shield'),
(3960002,260198,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Deathguard''s Gloves of the Quel Thalas'),
(3960002,260287,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Boots of Iron Banner'),
(3960002,260339,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bloodkeeper''s Shadowwoven Battle Fist'),
(3960002,260345,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frostkeeper''s Crystal of the Kings Road'),
(3960002,260367,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Shadowmarked Cestus'),
(3960002,260372,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Last King''s Vial'),
(3960002,260448,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Consecrated Jerkin of Astral Gate'),
(3960002,260483,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Girdle, Drake Wolf'),
(3960002,260507,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ring of Final Stand'),
(3960002,260583,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Lightkeeper''s Manawoven Walkers'),
(3960002,260659,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ironwarden''s Spiritbound Stalkers'),
(3960002,260661,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ironlord''s Chestguard of the Silent Watch'),
(3960002,260675,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Boneclad Trousers of the Broken Crown'),
(3960002,260688,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Scourge Reaver Clutches'),
(3960002,260710,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Celestial Breeches'),
(3960002,260846,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Boots, Holy Cold'),
(3960002,280168,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frozen Queen''s Mantle of the Stone Watch'),
(3960002,280253,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hoary Shoulderwraps of Wildheart'),
(3960002,280269,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Skirt of the Blood Promise'),
(3960002,280421,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Deathly Handwraps of Shadow Pact'),
(3960002,280454,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Trousers of the Dragon Crown'),
(3960002,280544,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Trousers of Twilight Crown'),
(3960002,280654,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Chestwrap, Sacred Hail'),
(3960002,280705,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Cowl, Shattered Covenant'),
(3960002,280729,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Howling Shoulderwraps of the Endless Vigil'),
(3960002,280773,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dawnforged Shoulder Cape'),
(3960002,280801,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Unquiet Wound Gloves'),
(3960002,280859,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Scalebound Handwraps of Valiance Keep'),
(3960002,280861,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Violet Mage''s Goldbound Spellwand'),
(3960002,280920,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wintercaller''s Faded Vest'),
(3960002,280933,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blackguard''s Veteran Walkers'),
(3960002,280940,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Circlet, Primal Shadow'),
(3960002,280961,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frozen Queen''s Pants'),
(3960002,280991,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Deathforged Coin'),
(3960002,300000,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frostmage''s Vambraces'),
(3960002,300012,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dawnkeeper''s Thornbound Headplate'),
(3960002,300030,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Watchful War Pauldrons'),
(3960002,300036,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wolfguard''s Warbelt'),
(3960002,300051,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Amulet, Crypt Watch'),
(3960002,300097,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Voidwarden''s Handplates'),
(3960002,300099,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Mooncaller''s Great Cape'),
(3960002,300191,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Idol of Mana Forge'),
(3960002,300204,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Moon Queen''s Ornate Longcloak'),
(3960002,300224,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Visor, Titan Fate'),
(3960002,300233,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Soulbound Cuirass of Lost King'),
(3960002,300241,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormwrought Crusher of Runed Path'),
(3960002,300247,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Wyrmcarved Warplate'),
(3960002,300250,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Battle Girdle, Sacred Fang'),
(3960002,300263,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dreamwoven Gauntlets'),
(3960002,300269,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ghoststeel Fetish'),
(3960002,300282,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormforged War Pauldrons'),
(3960002,300286,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Iceforged War Greaves'),
(3960002,300299,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormlord''s Warmaster Inscription'),
(3960002,300301,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Spiritkeeper''s Waistplate'),
(3960002,300307,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Drakescale Warhelm'),
(3960002,300319,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Legplates, Crypt Lament'),
(3960002,300325,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Runewarden''s Armguards of the High Citadel'),
(3960002,300331,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warmarked Battleplate, Dragon Queen''s Oath'),
(3960002,300332,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Terrible Chestplate'),
(3960002,300341,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Greaves of Moon Grove'),
(3960002,300347,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Broken War Pauldrons of Pale Winter'),
(3960002,300359,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Spell Ward Ritual Relic'),
(3960002,300410,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Sollerets, Stormshard Dusk'),
(3960002,300412,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Silent King''s Ancestral Visor'),
(3960002,300415,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Rune-carved Wrap'),
(3960002,300421,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Blood Prince''s Warhelm of the Shadow Crown'),
(3960002,300428,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wildguard''s Handguards'),
(3960002,300429,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | War Mace, Doom Blade'),
(3960002,300445,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Great Pauldrons of the Endless March'),
(3960002,300464,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stoneward Waistguard of the Frostwolf Clan'),
(3960002,300505,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Cryptborn Signet Ring'),
(3960002,300523,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shoulderplates of Dawn Vanguard'),
(3960002,300535,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Maul of the Moon Flame'),
(3960002,300589,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Spear Thorn Cuirass'),
(3960002,300593,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Graveborn Footplates'),
(3960002,300596,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warbracers of Zim Torga'),
(3960002,300618,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Rimekeeper''s Shoulder Drape'),
(3960002,300621,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frozen Doom Battleplate Legguards'),
(3960002,300623,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Moonbound Greaves of the Coldarra'),
(3960002,300643,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Spell Rune Greathelm'),
(3960002,300658,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wyrmscale Greaves of the Shadow Vault'),
(3960002,300676,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Thunder Fury Battleplate Legguards'),
(3960002,300725,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Brutish Battle Girdle'),
(3960002,300763,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Runecaller''s Battleworn Great Gauntlets'),
(3960002,300828,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | First Queen''s Warhelm'),
(3960002,300883,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Consecrated Royal Band'),
(3960002,300892,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shroud, Dragon Ash'),
(3960002,300894,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormkeeper''s Gauntlets'),
(3960002,300904,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Brightsteel Torque of Forgotten Road'),
(3960002,300909,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Battle Girdle of Fallen Crown'),
(3960002,300916,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dawnforged Cuirass of the Emerald Dream'),
(3960002,300937,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shadow Queen''s Flameforged Necklace'),
(3960002,320008,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dawn Breath Battle Hammer'),
(3960002,320079,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Valiant Wrist Chains'),
(3960002,320080,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Twilight Spaulders'),
(3960002,320101,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Coif of Dark Ritual'),
(3960002,320118,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Timeworn Harness of Frozen Road'),
(3960002,320151,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Scale-bound War Mantle of Great Hunt'),
(3960002,320169,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ancient Cape of the White Moon'),
(3960002,320221,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Belt of the Shattered Crown'),
(3960002,320298,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Unwavering Longcloak of the Wild Hunt'),
(3960002,320349,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Rugged Drape of the Wind King'),
(3960002,320404,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Nightshrouded Shoulder Guards'),
(3960002,320423,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Ghost Forge War Mantle'),
(3960002,320511,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Torc, Sun Creed'),
(3960002,320597,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Firewarden''s Coif of the Earthen Watch'),
(3960002,320667,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Wyrmcaller''s Beads'),
(3960002,320698,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Starforged Faceguard of Silver Banner'),
(3960002,320865,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hallowed Treads of Plague Lord'),
(3960002,320901,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Silver Knuckle Chainmail'),
(3960002,320925,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Flameforged Tomahawk of Silver Banner'),
(3960002,320964,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warbelt, Last Arrow'),
(3960002,320974,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bonebound War Mantle of Endless Road'),
(3960002,340027,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Poniard of Shadow Vault'),
(3960002,340055,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Pendant Chain, Crypt Seed'),
(3960002,340071,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Argent Champion''s Shoulderpads'),
(3960002,340083,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Howling Collar of the Red Dragon'),
(3960002,340110,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Windcaller''s Duskrun Medallion'),
(3960002,340149,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Beastmarked Vestments of the Winter Memory'),
(3960002,340250,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hood of the Wild Hunt'),
(3960002,340254,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Earthcaller''s Robe'),
(3960002,340419,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warborn Footwraps of the Ancient Thorn'),
(3960002,340453,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hellforged Walking Staff'),
(3960002,340471,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Froststeel Trousers of Grizzly Hills'),
(3960002,340476,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Emerald Glow Tunic'),
(3960002,340525,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Seal of the Great Bear'),
(3960002,340538,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dwarven Nightcloak of Fallen Lord'),
(3960002,340590,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Vanguard''s Sash'),
(3960002,340602,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Sash of the Scarlet Watch'),
(3960002,340614,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Vest of the Scourge Host'),
(3960002,340656,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Great Cape of the Scourge March'),
(3960002,340691,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Signet Ring of the Restless Dead'),
(3960002,340809,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormwrought Tablet'),
(3960002,340829,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Waistband of Wyrm King'),
(3960002,340896,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Sable Signet Ring'),
(3960002,340897,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Last King''s Treads'),
(3960002,340935,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Ethereal Legwraps'),
(3960002,340973,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Plagueforged Breeches of the Black Flight'),
(3960002,360024,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Frostfire Breaker Nightcloak'),
(3960002,360038,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Handwraps of Moon Flame'),
(3960002,360093,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Mist Void Pants'),
(3960002,360132,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Unquiet Caller Pants'),
(3960002,360148,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Warborn Waistwrap of the Moon Pact'),
(3960002,360157,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bindings of the Titan King'),
(3960002,360234,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hood of Ghost Watch'),
(3960002,360318,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Virtuous Binding'),
(3960002,360549,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Black Light Spirit Staff'),
(3960002,360588,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Engraved Diadem of the Burning Steppes'),
(3960002,360596,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Earthwarden''s Grips'),
(3960002,360680,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bloodguard''s Cord of the Sacred Oath'),
(3960002,360712,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Bindings of Long Night'),
(3960002,360734,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Infused Battle Staff of the Endless Path'),
(3960002,360809,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Stormforged Vestments of Titan Pact'),
(3960002,360845,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Rune Queen''s Boots of the Prime Design'),
(3960002,360867,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Moonforged Cinch'),
(3960002,360939,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Hearthwarden''s Stormbound Blade'),
(3960002,360960,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Black Forge Cowl'),
(3960002,360968,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Thunderforged Binding of Storm Watch'),
(3960002,380103,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Clouded Runestaff'),
(3960002,380322,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Last King''s Northwind Ringlet'),
(3960002,380367,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Legguards, Stone Knuckle'),
(3960002,380396,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | The Scourged Shoulderpads'),
(3960002,380398,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Shadow King''s Illusory Dragon Spear'),
(3960002,380545,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Voidkeeper''s Cap of the Grizzly Hills'),
(3960002,380547,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Armguards of the Gjalerbron'),
(3960002,380572,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Cracked Waistguard of the Sacred Flame'),
(3960002,380679,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Legwraps, North Ice'),
(3960002,380689,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Dragonstalker''s Girdle'),
(3960002,380757,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Permafrost Trousers of the Sun Flame'),
(3960002,380939,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Cap of the K3'),
(3960002,380989,0,0,0,1,1,1,1,'Generated map_604_difficulty_0 boss_000390 | Marauding Talisman of Ancient Grove');

DELETE FROM `creature_loot_template` WHERE `Entry` = 29306 AND `Item` = 1 AND `Reference` = 3960002;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(29306,1,3960002,2,0,1,0,1,1,'Generated encounter attachment | map_604_difficulty_0 | boss_000390');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3970000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3970000,300242,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | The Dreambound Battleplate Legguards'),
(3970000,300774,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Graveborn Battleplate Legguards'),
(3970000,300973,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | The Wildwoven Carapace'),
(3970000,340493,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Runeforged Pants of the Great Hunt'),
(3970000,340983,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Cap of the Titan Pact'),
(3970000,360912,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Razor-edged Raiment of the Astral Watch'),
(3970000,380599,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Eternal War Dagger of the Frozen Forge'),
(3970000,380966,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000383 | Moonlit Stalkers');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3970003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3970003,200274,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000390 | The Profane Waistplate'),
(3970003,260945,0,0,0,2,1,1,1,'Generated map_604_difficulty_1 boss_000390 | Armored Strap of Bone Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31370 AND `Item` = 1 AND `Reference` = 3970000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31370,1,3970000,2,0,2,0,1,1,'Generated encounter attachment | map_604_difficulty_1 | boss_000383');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31368 AND `Item` = 1 AND `Reference` = 3970003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31368,1,3970003,2,0,2,0,1,1,'Generated encounter attachment | map_604_difficulty_1 | boss_000390');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 3990000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3990000,220672,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | Helm of Utgarde Pinnacle'),
(3990000,240382,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | Oathkeeper''s Tombforged Great Cape'),
(3990000,260775,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | Dawn Hammer Wristbands'),
(3990000,300070,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | Warborn Capelet'),
(3990000,300193,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | Iceforged Cuirass, Lost Warden''s Oath'),
(3990000,300839,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000541 | The Burial Armguards');

DELETE FROM `reference_loot_template` WHERE `Entry` = 3990003;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(3990003,240433,0,0,0,2,1,1,1,'Generated map_608_difficulty_1 boss_000545 | Flamewarden''s Grips of the Raven Spirit');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31507 AND `Item` = 1 AND `Reference` = 3990000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31507,1,3990000,2,0,2,0,1,1,'Generated encounter attachment | map_608_difficulty_1 | boss_000541');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31506 AND `Item` = 1 AND `Reference` = 3990003;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31506,1,3990003,2,0,2,0,1,1,'Generated encounter attachment | map_608_difficulty_1 | boss_000545');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4000000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4000000,220259,0,0,0,1,1,1,1,'Generated map_615_difficulty_0 boss_000742 | The Duskwoven Warbelt'),
(4000000,300285,0,0,0,1,1,1,1,'Generated map_615_difficulty_0 boss_000742 | Gauntlets of Argent Tournament'),
(4000000,300796,0,0,0,1,1,1,1,'Generated map_615_difficulty_0 boss_000742 | Blacksmith''s Legplates');

DELETE FROM `creature_loot_template` WHERE `Entry` = 28860 AND `Item` = 1 AND `Reference` = 4000000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(28860,1,4000000,2,0,1,0,1,1,'Generated encounter attachment | map_615_difficulty_0 | boss_000742');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4010000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4010000,200144,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Burial Armguards of Alterac Mountains'),
(4010000,200437,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Watchful Warbelt'),
(4010000,200790,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Earthforged War Leggings'),
(4010000,200822,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Ritual Sabatons of the Zul Drak'),
(4010000,220201,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Rime-coated Sollerets'),
(4010000,240402,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Golden Rifle, Vanguard''s Oath'),
(4010000,240458,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Bloodstained Partisan of Iron Banner'),
(4010000,240548,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Chestguard of the Shadowmoon Valley'),
(4010000,260275,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | The Merciless Shoulderwraps'),
(4010000,260602,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Veiled Deathmask of Arcane Eye'),
(4010000,260942,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Far Shine Strap'),
(4010000,280738,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Glittering Rod, Highkeeper''s Oath'),
(4010000,300112,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Star Spear Neckguard'),
(4010000,300383,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Snowy Greaves of Deep Vault'),
(4010000,300384,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Hoary Brooch of Red Moon'),
(4010000,300489,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Zealous Cuirass, Nightkeeper''s Oath'),
(4010000,300552,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Ashen Lord''s Circle of the Iron Dwarf'),
(4010000,300569,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Warden''s Dreamwoven Headplate'),
(4010000,300619,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Wolfbound War Greaves'),
(4010000,300869,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Witchkeeper''s Wargrips'),
(4010000,300908,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Earthcaller''s Circle'),
(4010000,300923,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Lightcaller''s Eternal Armplates'),
(4010000,300983,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | The Mountainborn Greathelm'),
(4010000,320801,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Epaulets of First Flame'),
(4010000,320954,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | The Spiritforged Handguards'),
(4010000,340840,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Silent Queen''s Earthen-forged Tiara'),
(4010000,340967,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Locket, Hidden Hex'),
(4010000,360138,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Gilded Spirit Staff'),
(4010000,360791,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Shadowlord''s Frostbound Brooch'),
(4010000,380186,0,0,0,2,1,1,1,'Generated map_615_difficulty_1 boss_000742 | Warborn Armguards of Pale Moon');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31311 AND `Item` = 1 AND `Reference` = 4010000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31311,1,4010000,2,0,2,0,1,1,'Generated encounter attachment | map_615_difficulty_1 | boss_000742');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4030000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4030000,300385,0,0,0,2,1,1,1,'Generated map_619_difficulty_1 boss_000212 | War Leggings of Wyrm Watch'),
(4030000,300788,0,0,0,2,1,1,1,'Generated map_619_difficulty_1 boss_000212 | War Pauldrons of the Mana Wyrm'),
(4030000,380771,0,0,0,2,1,1,1,'Generated map_619_difficulty_1 boss_000212 | Brazen Wristguards of the Thunder Forge');

DELETE FROM `reference_loot_template` WHERE `Entry` = 4030004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4030004,380566,0,0,0,2,1,1,1,'Generated map_619_difficulty_1 boss_000215 | Hellforged Chestpiece of the Sky Forge');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31456 AND `Item` = 1 AND `Reference` = 4030000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31456,1,4030000,2,0,2,0,1,1,'Generated encounter attachment | map_619_difficulty_1 | boss_000212');

DELETE FROM `creature_loot_template` WHERE `Entry` = 31464 AND `Item` = 1 AND `Reference` = 4030004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(31464,1,4030004,2,0,2,0,1,1,'Generated encounter attachment | map_619_difficulty_1 | boss_000215');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4060000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4060000,220318,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Legplates of the Blackened Sky'),
(4060000,220880,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Mantle of the Broken Banner'),
(4060000,240307,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Blacksmith''s Greaves'),
(4060000,240623,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Legmail of the Pale Winter'),
(4060000,260317,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | The Heroic Strap'),
(4060000,260690,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Ruthless Gemmed Band of Earthen King'),
(4060000,280717,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Chestwrap, Plague Gaze'),
(4060000,280759,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Spiritforged Binding'),
(4060000,300152,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Wrap, Thorn Rebuke'),
(4060000,300441,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Silverguard''s Longcloak of the Frost Queen'),
(4060000,300594,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Gray Great Claymore'),
(4060000,300646,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Warborn Pauldrons of the Dragon Flame'),
(4060000,300795,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Ghostwarden''s Carapace'),
(4060000,300801,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Shoulderplates, Low Caller'),
(4060000,300863,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Winterforged Knightblade of Bronze Flight'),
(4060000,320284,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Sunforged Hauberk of Naxxramas'),
(4060000,340063,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Titan Horn Chestwrap'),
(4060000,340422,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Tombwarden''s Runic Rod of the Rimefang'),
(4060000,340988,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Heart of Midnight Watch'),
(4060000,360095,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Pathfinder''s Loop of the Frozen King'),
(4060000,360124,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Demon Bringerless Kilt'),
(4060000,360131,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Starlit Cuffs'),
(4060000,360455,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Leggings of the Western Plaguelands'),
(4060000,360500,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | The Royal Rune Band'),
(4060000,360523,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Cap, Steel Cleaver'),
(4060000,360735,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Bear Wake Flask'),
(4060000,380382,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Forgotten Will Spaulders'),
(4060000,380433,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Grips of the Plague Watch'),
(4060000,380881,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Titanforger''s Shadowforged Legwraps'),
(4060000,380946,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000845 | Frostforged Trousers of the Hodir Hall');

DELETE FROM `reference_loot_template` WHERE `Entry` = 4060007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4060007,200780,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Ghostwarden''s Greaves'),
(4060007,240729,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Girdle of the Silver Watch'),
(4060007,300215,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Shoulderplates of the Iron Banner'),
(4060007,300243,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Warmaster War Pauldrons of Arcane Moon'),
(4060007,320440,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Wyrm Light Wristguards'),
(4060007,340778,0,0,0,1,1,1,1,'Generated map_631_difficulty_0 boss_000856 | Cord of Silver Watch');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36612 AND `Item` = 1 AND `Reference` = 4060000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36612,1,4060000,2,0,1,0,1,1,'Generated encounter attachment | map_631_difficulty_0 | boss_000845');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36597 AND `Item` = 1 AND `Reference` = 4060007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36597,1,4060007,2,0,1,0,1,1,'Generated encounter attachment | map_631_difficulty_0 | boss_000856');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4070005;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4070005,220030,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Ominous Clasp of Titan Archive'),
(4070005,220269,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Plaguetouched Totem'),
(4070005,240626,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Gemmed Band of Far North'),
(4070005,240771,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Jeweled Shroud of Crusader Watch'),
(4070005,260421,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Armguards of the Death Rise'),
(4070005,360399,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Wintercaller''s Saronite Shoulderpads'),
(4070005,380277,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000851 | Armored Seal Ring of Altar of Sseratus');

DELETE FROM `reference_loot_template` WHERE `Entry` = 4070008;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4070008,380214,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000856 | Chillborn Bracers of Iron Banner'),
(4070008,380285,0,0,0,2,1,1,1,'Generated map_631_difficulty_1 boss_000856 | Deep Cleaver Scarab');

DELETE FROM `creature_loot_template` WHERE `Entry` = 38431 AND `Item` = 1 AND `Reference` = 4070005;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(38431,1,4070005,2,0,2,0,1,1,'Generated encounter attachment | map_631_difficulty_1 | boss_000851');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39166 AND `Item` = 1 AND `Reference` = 4070008;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39166,1,4070008,2,0,2,0,1,1,'Generated encounter attachment | map_631_difficulty_1 | boss_000856');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4080000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4080000,240115,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | The Steelbound Figurine'),
(4080000,260236,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Crystal, Abyss Shine'),
(4080000,260620,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Charmstone of the Wyrm Watch'),
(4080000,260827,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Pants, White Rime'),
(4080000,300315,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Shieldmaster''s Skullcrusher'),
(4080000,300327,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Crusader Shroud, Darkcaller''s Oath'),
(4080000,300360,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Frost Queen''s Warmaster Helm'),
(4080000,300509,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Talisman, Death Shade'),
(4080000,300893,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Icewarden''s Mountainborn Wristplates'),
(4080000,320470,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Gray Flare Battleaxe'),
(4080000,320530,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Wyrmcaller''s Iceforged Loop'),
(4080000,320732,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Shadowmarked Battlecloak'),
(4080000,340053,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Dragonkeeper''s Whispering Graspers'),
(4080000,340090,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Shoulderwraps, Earth Watch'),
(4080000,340246,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000845 | Voidsteel Hourglass of the Dead Watch');

DELETE FROM `reference_loot_template` WHERE `Entry` = 4080007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4080007,200718,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000856 | Plagueborn Wristplates of the Iron Banner'),
(4080007,200813,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000856 | Siegebound Signet'),
(4080007,300529,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000856 | The Frozen Headplate'),
(4080007,360353,0,0,0,4,1,1,1,'Generated map_631_difficulty_2 boss_000856 | Ominous Walkers of Drake Rider');

DELETE FROM `creature_loot_template` WHERE `Entry` = 37958 AND `Item` = 1 AND `Reference` = 4080000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(37958,1,4080000,2,0,4,0,1,1,'Generated encounter attachment | map_631_difficulty_2 | boss_000845');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39167 AND `Item` = 1 AND `Reference` = 4080007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39167,1,4080007,2,0,4,0,1,1,'Generated encounter attachment | map_631_difficulty_2 | boss_000856');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4090004;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4090004,200604,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Northkeeper''s Lightforged Sabatons'),
(4090004,200662,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Armguards of Searing Gorge'),
(4090004,220297,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Briarbound Great Pauldrons of Wyrmskull'),
(4090004,260539,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Warrior-forged Bracers of Shadow Vault'),
(4090004,300168,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Silverwarden''s Wild Sabatons'),
(4090004,300446,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Battleplate, Sacred Doom'),
(4090004,300677,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Ashen Lord''s Gray Legplates'),
(4090004,300847,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Frostguard''s Greaves'),
(4090004,320764,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Tombbound Ring of Golden Dawn'),
(4090004,340824,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Moonsteel Mitts of Soul Crown'),
(4090004,340842,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000851 | Argent Champion''s Medallion');

DELETE FROM `reference_loot_template` WHERE `Entry` = 4090007;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4090007,280789,0,0,0,8,1,1,1,'Generated map_631_difficulty_3 boss_000856 | Wayfarer''s Heavenforged Mark');

DELETE FROM `creature_loot_template` WHERE `Entry` = 38586 AND `Item` = 1 AND `Reference` = 4090004;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(38586,1,4090004,2,0,8,0,1,1,'Generated encounter attachment | map_631_difficulty_3 | boss_000851');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39168 AND `Item` = 1 AND `Reference` = 4090007;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39168,1,4090007,2,0,8,0,1,1,'Generated encounter attachment | map_631_difficulty_3 | boss_000856');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4100000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4100000,220191,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Mystic Runestone of Storm King'),
(4100000,240322,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Grimdark Shroud of Ashen March'),
(4100000,240518,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Footguards, Coldfire Mail'),
(4100000,280425,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Titan Keeper''s Robe of the Broken Banner'),
(4100000,300052,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Dragon Judgment Bone'),
(4100000,300475,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Fernwoven Pauldrons of the Hodir Hall'),
(4100000,300586,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | The Relicbound Headsman Axe'),
(4100000,300865,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | War Greaves, Dragon Bite'),
(4100000,300966,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Silverguard''s Great Pauldrons'),
(4100000,340585,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | The Lightforged Handwraps'),
(4100000,360133,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Neckguard, Hidden Creed'),
(4100000,380991,0,0,0,1,1,1,1,'Generated map_632_difficulty_0 boss_000829 | Frostmage''s Leggings of the Black Anvil');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36497 AND `Item` = 1 AND `Reference` = 4100000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36497,1,4100000,2,0,1,0,1,1,'Generated encounter attachment | map_632_difficulty_0 | boss_000829');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4110000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4110000,200131,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | The Cabalistic Great Gauntlets'),
(4110000,260407,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Helm, Dream Shield'),
(4110000,300122,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Broken War Pauldrons of the Wyrm Queen'),
(4110000,300209,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Sollerets, Scourge Ripper'),
(4110000,300295,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Argent Knight''s Battle Girdle'),
(4110000,300498,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Legplates of Plague Watch'),
(4110000,300580,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Warmarked Bracers of the Scarlet Dawn'),
(4110000,300675,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Dragonlord''s Stormwrought Runering'),
(4110000,300743,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | The Thorned Great Maul'),
(4110000,340244,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Warped Shoulderwraps'),
(4110000,340670,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Spider Voice Chestwrap'),
(4110000,360475,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Ancient Warden''s Wintertouched Regalia'),
(4110000,360885,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Titan Queen''s Wristwraps'),
(4110000,360983,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Valiant Shoulderwraps of the Gilded Crown'),
(4110000,380002,0,0,0,2,1,1,1,'Generated map_632_difficulty_1 boss_000829 | Devout Cloak');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36498 AND `Item` = 1 AND `Reference` = 4110000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36498,1,4110000,2,0,2,0,1,1,'Generated encounter attachment | map_632_difficulty_1 | boss_000829');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4120000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4120000,280182,0,0,0,1,1,1,1,'Generated map_650_difficulty_0 script_SetData | Charm, Moon Pledge'),
(4120000,280410,0,0,0,1,1,1,1,'Generated map_650_difficulty_0 script_SetData | Leggings of the Sindragosa Fall'),
(4120000,300704,0,0,0,1,1,1,1,'Generated map_650_difficulty_0 script_SetData | Soulshard Night Warbelt'),
(4120000,300804,0,0,0,1,1,1,1,'Generated map_650_difficulty_0 script_SetData | Great Pauldrons of the Raven Queen'),
(4120000,320734,0,0,0,1,1,1,1,'Generated map_650_difficulty_0 script_SetData | Bleak Cape');

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27321 AND `Item` = 1 AND `Reference` = 4120000;

INSERT INTO `gameobject_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(27321,1,4120000,2,0,1,0,1,1,'Generated encounter attachment | map_650_difficulty_0 | script_SetData');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4130000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4130000,220111,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Wyrmbound War Leggings of the Broken Gate'),
(4130000,240573,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Chain of Ancient Spirit'),
(4130000,240718,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Steel Gaze Boots'),
(4130000,260704,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Silent King''s Dreambound Shoulderwraps'),
(4130000,260871,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Ghost Dancer Chestguard'),
(4130000,300055,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Torc of the Deep Anvil'),
(4130000,300206,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | The Whispering Legplates'),
(4130000,300432,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Grim Spell Inscription'),
(4130000,300479,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Waistguard of the Iron Crown'),
(4130000,300737,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | The Broken Breastplate'),
(4130000,300985,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | War Axe, Lost Void'),
(4130000,320546,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Frozen Keeper''s Sunsteel Rune Band'),
(4130000,320592,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Adamant Shoulder Guards of Rime Watch'),
(4130000,360191,0,0,0,2,1,1,1,'Generated map_650_difficulty_1 script_SetData | Token, Hammer Spark');

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 27414 AND `Item` = 1 AND `Reference` = 4130000;

INSERT INTO `gameobject_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(27414,1,4130000,2,0,2,0,1,1,'Generated encounter attachment | map_650_difficulty_1 | script_SetData');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4140000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4140000,200729,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Ironthane Figurine of the Thunder Forge'),
(4140000,220600,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Breastplate of the Makers Overlook'),
(4140000,220612,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Neckchain of the Ancient Watcher'),
(4140000,220628,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Terrible Girdle'),
(4140000,240251,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Epaulets, Death Judgment'),
(4140000,260060,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Highguard''s Ringlet of the Dead King'),
(4140000,300599,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Visor of the Fallen Watch'),
(4140000,300848,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Firewarden''s Northborn Gauntlets'),
(4140000,300886,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Whispering Token'),
(4140000,320134,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Armored Torc of the Runed Path'),
(4140000,320390,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Traveling Cloak of the Arcane Star'),
(4140000,340331,0,0,0,1,1,1,1,'Generated map_658_difficulty_0 boss_000833 | Ashen Mitts, Dawnkeeper''s Oath');

DELETE FROM `creature_loot_template` WHERE `Entry` = 36494 AND `Item` = 1 AND `Reference` = 4140000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(36494,1,4140000,2,0,1,0,1,1,'Generated encounter attachment | map_658_difficulty_0 | boss_000833');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4150000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4150000,200320,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Windlord''s Coin of the Cold Flame'),
(4150000,200361,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Worldforged Necklace of Dragon Forge'),
(4150000,260903,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Skullforged Claws of the Ashen March'),
(4150000,300101,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Greaves, Frozen Grip'),
(4150000,300140,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Greaves of Stone Giant'),
(4150000,300323,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Bear Scream Legguards'),
(4150000,300887,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Breastplate of Wild Watch'),
(4150000,300993,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Warhelm of the Cold Moon'),
(4150000,360690,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Weathered Shoes of the Great Wolf'),
(4150000,380302,0,0,0,2,1,1,1,'Generated map_658_difficulty_1 boss_000833 | Twilight Rider Handguards');

DELETE FROM `creature_loot_template` WHERE `Entry` = 37613 AND `Item` = 1 AND `Reference` = 4150000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(37613,1,4150000,2,0,2,0,1,1,'Generated encounter attachment | map_658_difficulty_1 | boss_000833');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4160000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4160000,200969,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Gravekeeper''s Gauntlets of the Nexus'),
(4160000,220273,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Savage Root War Greaves'),
(4160000,220463,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Nightcloak of the Ice Crown'),
(4160000,240290,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Deep Fate Shoulderguards'),
(4160000,280234,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Morningstar of the Frozen Sea'),
(4160000,300132,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Great Chopper of Wind Watch'),
(4160000,320497,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Sunforged Chausses'),
(4160000,340946,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Gloves of Endless Vigil'),
(4160000,380964,0,0,0,1,1,1,1,'Generated map_668_difficulty_0 boss_000839 | Warpriest''s Stormwrought Pendant');

DELETE FROM `creature_loot_template` WHERE `Entry` = 38113 AND `Item` = 1 AND `Reference` = 4160000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(38113,1,4160000,2,0,1,0,1,1,'Generated encounter attachment | map_668_difficulty_0 | boss_000839');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4170000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4170000,200265,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Frozen Whisper Sabatons'),
(4170000,220348,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Dawn Shadow Mantle'),
(4170000,220615,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Armplates of Holy Guard'),
(4170000,220684,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Warsage''s Warband of the Ancient Grove'),
(4170000,240808,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | First Keeper''s Ringlet'),
(4170000,240901,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Harness of the Mimiron Forge'),
(4170000,260755,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Shadow Thirst Bracers'),
(4170000,300009,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Twilight Warbracers of Scale Queen'),
(4170000,300308,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Mantle, Drake Hail'),
(4170000,300424,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Battleplate Legguards of the Last Dawn'),
(4170000,300502,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Highkeeper''s Legplates'),
(4170000,300600,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | The Sable Neckchain'),
(4170000,300914,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | The Windbound Waistguard'),
(4170000,320356,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Armguards, Emerald Pledge'),
(4170000,320895,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | Shieldguard''s Defiant Horn'),
(4170000,340467,0,0,0,2,1,1,1,'Generated map_668_difficulty_1 boss_000839 | The Spellforged Skullcap');

DELETE FROM `creature_loot_template` WHERE `Entry` = 38603 AND `Item` = 1 AND `Reference` = 4170000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(38603,1,4170000,2,0,2,0,1,1,'Generated encounter attachment | map_668_difficulty_1 | boss_000839');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4180000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4180000,200581,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | The Runewoven Pendant'),
(4180000,220454,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Legguards, Savage Feather'),
(4180000,220601,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Brightsteel Stone Relic of First Flame'),
(4180000,260211,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Silverblessed Signet'),
(4180000,300172,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Charm of the Light Eternal'),
(4180000,300399,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Bearded Axe of the Silent Crypt'),
(4180000,300493,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Hammerlord''s Battleplate of the Avalanche'),
(4180000,300742,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Ancient Sorrow Chestplate'),
(4180000,300744,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Armplates, Unbroken Horn'),
(4180000,300775,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Hoarfrost Rune Band of the Shadow Ritual'),
(4180000,320100,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Chainmail, Ghost Shade'),
(4180000,340054,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Spell Flare Vest'),
(4180000,340198,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Steadfast Eye of the Great Wolf'),
(4180000,340871,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Lightcaller''s Cowl'),
(4180000,360456,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Grim Ringlet'),
(4180000,380594,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Charred Nightcloak of Green Flame'),
(4180000,380864,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Kingsguard''s Jerkin of the Long Night'),
(4180000,380943,0,0,0,1,1,1,1,'Generated map_724_difficulty_0 boss_000887 | Legwraps of Dread Crown');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39863 AND `Item` = 1 AND `Reference` = 4180000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39863,1,4180000,2,0,1,0,1,1,'Generated encounter attachment | map_724_difficulty_0 | boss_000887');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4190000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4190000,220376,0,0,0,2,1,1,1,'Generated map_724_difficulty_1 boss_000887 | Wrap, Hollow Wyrm'),
(4190000,240692,0,0,0,2,1,1,1,'Generated map_724_difficulty_1 boss_000887 | The Skyforged Chestguard'),
(4190000,340506,0,0,0,2,1,1,1,'Generated map_724_difficulty_1 boss_000887 | Shadowbound Mantle of Silver Banner');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39864 AND `Item` = 1 AND `Reference` = 4190000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39864,1,4190000,2,0,2,0,1,1,'Generated encounter attachment | map_724_difficulty_1 | boss_000887');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4200000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4200000,220091,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | Wyrmcaller''s Cloak of the Frost Giant'),
(4200000,280268,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | Dreamcaller''s Chestwrap'),
(4200000,300328,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | Flameforged Cuirass of the Wild Path'),
(4200000,300382,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | The Pale-blue Mallet'),
(4200000,300672,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | Plague Wolf Warhelm'),
(4200000,360126,0,0,0,4,1,1,1,'Generated map_724_difficulty_2 boss_000887 | Diadem of the Dread March');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39944 AND `Item` = 1 AND `Reference` = 4200000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39944,1,4200000,2,0,4,0,1,1,'Generated encounter attachment | map_724_difficulty_2 | boss_000887');

COMMIT;

-- Generated encounter loot; existing loot rows remain independent.

START TRANSACTION;

DELETE FROM `reference_loot_template` WHERE `Entry` = 4210000;

INSERT INTO `reference_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(4210000,340281,0,0,0,8,1,1,1,'Generated map_724_difficulty_3 boss_000887 | Drape, Deep Hail');

DELETE FROM `creature_loot_template` WHERE `Entry` = 39945 AND `Item` = 1 AND `Reference` = 4210000;

INSERT INTO `creature_loot_template`
(
    `Entry`,
    `Item`,
    `Reference`,
    `Chance`,
    `QuestRequired`,
    `LootMode`,
    `GroupId`,
    `MinCount`,
    `MaxCount`,
    `Comment`
)
VALUES
(39945,1,4210000,2,0,8,0,1,1,'Generated encounter attachment | map_724_difficulty_3 | boss_000887');

COMMIT;
