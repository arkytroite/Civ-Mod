-- Insert SQL Rules Here 

-- ===============================================================================================================================================
--
--								Major, Playable Civilization Overrides
--
-- This follow controls which units are available to which civilizations 
-- To remove a unit from major player civs, simply insert two dashes ("--") in front of the "UPDATE" statement. 
-- Commenting out the UPDATE statement will not allow the unit to appear for major, playable civs
--
-- It should be safe to remove any unit from the game
--
-- ===============================================================================================================================================


UPDATE Units SET Cost = Cost/5 WHERE IsMercUnit=1;		-- temp measure to lower procurement costs for human player to get merc units 

INSERT INTO Unit_FreePromotions(UnitType, PromotionType) VALUES ('UNIT_GT_TOKHAROI', 'PROMOTION_HUN_INVADER');

-- Camel Class Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_CAMEL_BOWMAN' WHERE Type = 'UNITCLASS_SMAN_EU_CAMEL_BOWMAN';									-- Camel Bowman Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_CAMEL_RAIDING_PARTY' WHERE Type = 'UNITCLASS_SMAN_EU_CAMEL_RAIDING_PARTY';					-- Camel Raiding Party Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_CAMEL_RIFLEMAN' WHERE Type = 'UNITCLASS_SMAN_EU_CAMEL_RIFLEMAN';								-- Camel Rifelman Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_CAMEL_WAR_PARTY' WHERE Type = 'UNITCLASS_SMAN_EU_CAMEL_WAR_PARTY';							-- Camel War Party Unit

-- Elephant/Pachyderm Class Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_TAMED_MAMMOTH' WHERE Type = 'UNITCLASS_SMAN_EU_TAMED_MAMMOTH';								-- Tamed Mammoth Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_BATTLE_ELEPHANT' WHERE Type = 'UNITCLASS_SMAN_EU_BATTLE_ELEPHANT';							-- Battle Elephant Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_SIEGE_ELEPHANT' WHERE Type = 'UNITCLASS_SMAN_EU_SIEGE_ELEPHANT';								-- Siege Elephant Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_EU_TURRETED_ELEPHANT' WHERE Type = 'UNITCLASS_SMAN_EU_TURRETED_ELEPHANT';						-- Turreted Elephant/Howdah Unit

-- Equites Sagittarii (Mounted, Ranged) Class Units - use care when disabling a unit here. If you disable a unit that an earlier unit can upgrade into, it will crash the game...
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_AKKADIAN_HORSE_ARCHER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_AKKADIAN_HORSE_ARCHER';		-- Horse Sagittari Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SCYTHIAN_HORSE_ARCHER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SCYTHIAN_HORSE_ARCHER';		-- Horse Bowman Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_FRANKISH_CROSSBOWMAN' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_FRANKISH_CROSSBOWMAN';			-- Horse Crossbowman Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_CORAZZIERI' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_CORAZZIERI';								-- Corazzieri Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_IROQUIOS_MUSKET_RIDER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_IROQUIOS_MUSKET_RIDER';		-- Musket Rider Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_CHEYENNE_DOG_SOLDIER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_CHEYENNE_DOG_SOLDIER';			-- Dog Soldier Unit


-- Mercenary Class Units
--		Ancient units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_BATTLE_GALLEY' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_BATTLE_GALLEY';						-- Battle Galley Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_BARQUE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_BARQUE';										-- Barque Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_RABBLE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_RABBLE';										-- Rabble (militia) Unit
--		Classical Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GHAZI' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GHAZI';										-- Ghazi Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GREEK_HIPPEIS' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GREEK_HIPPEIS';						-- Greek Hippeis Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_MADYAN_ARCHER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_MADYAN_ARCHER';						-- Madyan Archer Unit
--		Medieval Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_DHOW' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_DHOW';											-- Dhow Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_FIRE_SHIP' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_FIRE_SHIP';								-- Fire Ship Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GENOESE_CROSSBOWMAN' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GENOESE_CROSSBOWMAN';			-- Genoese Crossbowman Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_THALAI_THIRVAI' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_THALAI_THIRVAI';						-- Thalai Thirvai (Fighting Admiral) Unit
--		Renaissance Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_CAVALIER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_CAVALIER';									-- Cavalier Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_CONDOTTIERI' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_CONDOTTIERI';							-- Condottieri Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GREAT_BOMBARD' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GREAT_BOMBARD';						-- Great Bombard Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_LIL_BOMBARD' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_LIL_BOMBARD';							-- Lil' Bombard Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_WILD_GEESE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_WILD_GEESE';								-- Wild Geese Unit
--		Industrial Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_CORSAIR' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_CORSAIR';									-- Corsair Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_LAND_IRONCLAD' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_LAND_IRONCLAD';						-- Land Ironclad Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_WAR_JUNK' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_WAR_JUNK';									-- War Junk Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_ZEPPELIN' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_ZEPPELIN';									-- Zeppelin Unit
--		Modern Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SMAN_ARMORED_FRIGATE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SMAN_ARMORED_FRIGATE';			-- Armored Frigate Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SMAN_DREADNOUGHT' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SMAN_DREADNOUGHT';					-- Dreadnought Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_FLYING_CIRCUS' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_FLYING_CIRCUS';						-- Flying Circus Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GUERILLA' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GUERILLA';									-- Guerrilla Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_GURKHA' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_GURKHA';										-- Gurkha Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_RECON_PLANE' WHERE Type = 'UNITCLASS_SMAN_RECON_PLANE';											-- Recon Plane Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SOF' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SOF';											-- Soldiers of Fortune Unit
--		Atomic Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SMAN_PATROL_BOAT' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SMAN_PATROL_BOAT';					-- Patrol Boat Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_SMAN_SUB_HUNTER' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_SMAN_SUB_HUNTER';					-- Sub Hunter Unit
--		Information Units
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_PREDATOR_DRONE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_PREDATOR_DRONE';						-- Predator Drone Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_PMC' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_PMC';											-- Private Military Contractors Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_EXOTIC_UNIT_REAPER_DRONE' WHERE Type = 'UNITCLASS_EXOTIC_UNIT_REAPER_DRONE';							-- Reaper Drone Unit
UPDATE UnitClasses SET DefaultUnit = 'UNIT_SMAN_RECON_JET' WHERE Type = 'UNITCLASS_SMAN_RECON_JET';												-- Recon Jet Unit


-- ===============================================================================================================================================
--                              Major Civ unit adjustments
--
--	This area is where we adjust certain civs with similar UU's to units this mod adds - prevents duplication
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_INDIA', 'UNITCLASS_SMAN_EU_SIEGE_ELEPHANT', null);			-- India already has ranged War Elephant
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_SIAM', 'UNITCLASS_SMAN_EU_BATTLE_ELEPHANT', null);			-- Siam already has ranged Naresuans Elephant

-- Not sure if this override is needed - the two units use similar artwork/attacks, but Carthage unit shows up early (obsolete at Chivalry, while the Turreted unit shows up at Physics, same time frame for both techs.
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_CARTHAGE', 'UNITCLASS_SMAN_EU_TURRETED_ELEPHANT', null);		-- Carthage already has African Forest Elephant

-- ===============================================================================================================================================
--
--								BARBARIAN OVERRIDES 
--
-- These units are usually not available to Barbarians by default. 
-- To make a unit available, simply remove the two dashes ("--") in front of the "INSERT" statement. 
-- Commenting out the INSERT statement will prevent the unit from appearing in the game for the Barbarians
-- As intentionally designed, some of the earlier class units are available to the Barbarians
--
-- ===============================================================================================================================================

-- Camel Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_CAMEL_BOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_CAMEL_RAIDING_PARTY', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_CAMEL_RIFLEMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_CAMEL_WAR_PARTY', null);

-- Elephant/Pachyderm Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_TAMED_MAMMOTH', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_BATTLE_ELEPHANT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_SIEGE_ELEPHANT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_TURRETED_ELEPHANT', null);

-- Equites Sagittarii (Mounted, Ranged) Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_AKKADIAN_HORSE_ARCHER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SCYTHIAN_HORSE_ARCHER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_FRANKISH_CROSSBOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_CORAZZIERI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_IROQUIOS_MUSKET_RIDER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_CHEYENNE_DOG_SOLDIER', null);


-- Mercenary Class Units
--		Ancient units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_BATTLE_GALLEY', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_BARQUE', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_RABBLE', null);
--		Classical Units
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GHAZI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GREEK_HIPPEIS', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_MADYAN_ARCHER', null);
--		Medieval Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_DHOW', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_FIRE_SHIP', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GENOESE_CROSSBOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_THALAI_THIRVAI', null);
--		Renaissance Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_CAVALIER', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_CONDOTTIERI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GREAT_BOMBARD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_LIL_BOMBARD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_WILD_GEESE', null);
--		Industrial Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_CORSAIR', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_LAND_IRONCLAD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_WAR_JUNK', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_ZEPPELIN', null);
--		Modern Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SMAN_ARMORED_FRIGATE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SMAN_DREADNOUGHT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_FLYING_CIRCUS', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GUERILLA', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_GURKHA', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_RECON_PLANE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SOF', null);
--		Atomic Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SMAN_PATROL_BOAT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_SMAN_SUB_HUNTER', null);
--		Information Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_PREDATOR_DRONE', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_PMC', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXOTIC_UNIT_REAPER_DRONE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_BARBARIAN', 'UNITCLASS_SMAN_EU_RECON_JET', null);

-- ===============================================================================================================================================
--
--								CITY STATE OVERRIDES 
--
-- These units are usually not available to City States by default. 
-- To make a unit available, simply remove two dashes ("--") in front of the "INSERT" statement. 
-- Commenting out the INSERT statement will prevent the unit from appearing in the game for City States
-- As intentionally designed, some of the earlier class units are available to City States
--
-- ===============================================================================================================================================

-- Camel Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_CAMEL_BOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_CAMEL_RAIDING_PARTY', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_CAMEL_RIFLEMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_CAMEL_WAR_PARTY', null);

-- Elephant/Pachyderm Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_TAMED_MAMMOTH', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_BATTLE_ELEPHANT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_SIEGE_ELEPHANT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_TURRETED_ELEPHANT', null);

-- Equites Sagittarii (Mounted, Ranged) Class Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_AKKADIAN_HORSE_ARCHER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SCYTHIAN_HORSE_ARCHER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_FRANKISH_CROSSBOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_CORAZZIERI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_IROQUIOS_MUSKET_RIDER', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_CHEYENNE_DOG_SOLDIER', null);


-- Mercenary Class Units
--		Ancient units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_BATTLE_GALLEY', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_BARQUE', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_RABBLE', null);
--		Classical Units
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GHAZI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GREEK_HIPPEIS', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_MADYAN_ARCHER', null);
--		Medieval Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_DHOW', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_FIRE_SHIP', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GENOESE_CROSSBOWMAN', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_THALAI_THIRVAI', null);
--		Renaissance Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_CAVALIER', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_CONDOTTIERI', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GREAT_BOMBARD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_LIL_BOMBARD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_WILD_GEESE', null);
--		Industrial Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_CORSAIR', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_LAND_IRONCLAD', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_WAR_JUNK', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_ZEPPELIN', null);
--		Modern Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SMAN_ARMORED_FRIGATE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SMAN_DREADNOUGHT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_FLYING_CIRCUS', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GUERILLA', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_GURKHA', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_RECON_PLANE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SOF', null);
--		Atomic Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SMAN_PATROL_BOAT', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_SMAN_SUB_HUNTER', null);
--		Information Units
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_PREDATOR_DRONE', null);
--INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_PMC', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_EXOTIC_UNIT_REAPER_DRONE', null);
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType) VALUES ('CIVILIZATION_MINOR', 'UNITCLASS_SMAN_EU_RECON_JET', null);