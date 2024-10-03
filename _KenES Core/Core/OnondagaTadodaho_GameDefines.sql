
--==========================================================================================================================
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 							TradeMissionGoldModifier,	TradeMissionInfluenceModifier,	LostWithUpgrade,	Description, 						Help, 										Sound, 				CannotBeChosen,  PortraitIndex, 	IconAtlas, 			PediaType, 				PediaEntry)
VALUES	('PROMOTION_LEU_FIREKEEPER', 	-100,						100,								1, 					'TXT_KEY_PROMOTION_LEU_FIREKEEPER',	'TXT_KEY_PROMOTION_LEU_FIREKEEPER_HELP',	'AS2D_IF_LEVELUP', 	1, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_FIREKEEPER');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					BaseGold, NumGoldPerEra,	ShowInPedia, Class, Cost, Moves, FaithCost,	Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 						Help, 									Strategy,									Civilopedia, 							AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 					 UnitFlagIconOffset,	UnitFlagAtlas,								MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_LEU_FIREKEEPER',	300,	  100,				ShowInPedia, Class, Cost, Moves, FaithCost, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_LEU_FIREKEEPER',		'TXT_KEY_UNIT_LEU_FIREKEEPER_HELP', 	'TXT_KEY_UNIT_LEU_FIREKEEPER_STRATEGY',		'TXT_KEY_UNIT_LEU_FIREKEEPER_TEXT', 	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_LEU_FIREKEEPER',   0,						'LEU_ONONDAGA_TADODAHO_UNIT_FLAG_ATLAS',	MoveRate, 2, 				'LEU_ONONDAGA_TADODAHO_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_LEU_FIREKEEPER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_LEU_FIREKEEPER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_GENERAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_LEU_FIREKEEPER',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_LEU_FIREKEEPER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_LEU_FIREKEEPER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_LEU_FIREKEEPER', 'PROMOTION_LEU_FIREKEEPER');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_LEU_FIREKEEPER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									ExperiencePercent,	LostWithUpgrade,	Description, 									Help, 													Sound, 				CannotBeChosen,  PortraitIndex, 	IconAtlas, 			PediaType, 				PediaEntry)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO', 	10,					0, 					'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_HELP',			'AS2D_IF_LEVELUP', 	1, 				 0, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO'),
		('PROMOTION_LEU_ONONDAGA_TADODAHO_A', 	25,					0, 					'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_A',	'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_A_HELP',		'AS2D_IF_LEVELUP', 	1, 				 0, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------	
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_IROQUOIS',	'BUILDINGCLASS_MINT',			'BUILDING_LEU_WAMPUM_HOUSE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_IROQUOIS',	'UNITCLASS_GREAT_GENERAL',		'UNIT_LEU_FIREKEEPER');