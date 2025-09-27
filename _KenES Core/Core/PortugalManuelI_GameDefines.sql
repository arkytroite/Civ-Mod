--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_FOUNDED', 1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade, Description, 							 Help, 										 Sound, 			 CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_COSMOGRAPHER', 	0,				 'TXT_KEY_PROMOTION_JFD_COSMOGRAPHER',	 'TXT_KEY_PROMOTION_JFD_COSMOGRAPHER_HELP',  'AS2D_IF_LEVELUP',  1, 			 20, 			'VALERY_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COSMOGRAPHER');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, RangedCombat, Cost, Moves, HurryCostModifier, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									 Strategy, 									Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,							  UnitFlagIconOffset,	IconAtlas,							PortraitIndex, WorkRate)
SELECT	'UNIT_JFD_COSMOGRAPHER',	Class, PrereqTech, Combat, RangedCombat, Cost, 4, HurryCostModifier, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_UNIT_JFD_COSMOGRAPHER_HELP', 	 'TXT_KEY_UNIT_JFD_COSMOGRAPHER_STRATEGY',  'TXT_KEY_UNIT_JFD_COSMOGRAPHER_TEXT',	'ART_DEF_UNIT_JFD_COSMOGRAPHER',	'JFD_PORTUGAL_MANUEL_I_UNIT_FLAG_ATLAS',  0,					'JFD_PORTUGAL_MANUEL_I_ICON_ATLAS',	2, 800
FROM Units WHERE Type = 'UNIT_SCIENTIST';	

UPDATE Units
SET Found = 1
WHERE Type = 'UNIT_JFD_COSMOGRAPHER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCIENTIST';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SETTLER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCIENTIST';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SETTLER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCIENTIST';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_COSMOGRAPHER',	'PROMOTION_JFD_COSMOGRAPHER');
------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName)
VALUES	('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_01'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_02'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_03'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_04'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_05'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_06'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_07'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_08'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_09'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_10'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_11'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_12'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_13'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_14'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_15'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_16'),
		('UNIT_JFD_COSMOGRAPHER',	'TXT_KEY_GREAT_PERSON_JFD_COSMOGRAPHER_17');	
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_COSMOGRAPHER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCIENTIST';			
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_PORTUGAL',	'UNITCLASS_SCIENTIST',		'UNIT_JFD_COSMOGRAPHER');
--==========================================================================================================================
--==========================================================================================================================