--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,			BuildingClass,				PrereqTech,					ConquestProb,	Cost,	GoldMaintenance,	SpecialistType,			SpecialistCount,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,							Help,										Strategy,								Civilopedia,							ArtDefineTag,					MinAreaSize) 
SELECT 'BUILDING_FA_ASSEMBLYPLANT',		'BUILDINGCLASS_FACTORY',	'TECH_INDUSTRIALIZATION',	66,				340,	2,					'SPECIALIST_ENGINEER',	2,					0,					'FA_UB_ATLAS',		8,				'TXT_KEY_BUILDING_FA_ASSEMBLYPLANT',	'TXT_KEY_BUILDING_FA_ASSEMBLYPLANT_HELP',	'TXT_KEY_BUILDING_FACTORY_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_FACTORY_TEXT',	'ART_DEF_BUILDING_FACTORY',		-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_ASSEMBLYPLANT',							'BUILDINGCLASS_WORKSHOP';

--------------------------------------------------------------------------------------------------
--Building Strategic Resource Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantityRequirements (BuildingType,	ResourceType,		Cost) 
SELECT 'BUILDING_FA_ASSEMBLYPLANT',									'RESOURCE_COAL',	1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ASSEMBLYPLANT',					'YIELD_PRODUCTION',		4;

--------------------------------------------------------------------------------------------------
--Building, City Yield Modifiers
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_ASSEMBLYPLANT',					'YIELD_PRODUCTION',		10;

--------------------------------------------------------------------------------------------------
--Building Resource Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges (BuildingType,	ResourceType,			YieldType,			Yield)
SELECT 'BUILDING_FA_ASSEMBLYPLANT',							'RESOURCE_COAL',		'YIELD_PRODUCTION',	2 UNION ALL
SELECT 'BUILDING_FA_ASSEMBLYPLANT',							'RESOURCE_OIL',			'YIELD_PRODUCTION',	2 UNION ALL
SELECT 'BUILDING_FA_ASSEMBLYPLANT',							'RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	2;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_ASSEMBLYPLANT',				'FLAVOR_MILITARY_TRAINING',	8 UNION ALL
SELECT 'BUILDING_FA_ASSEMBLYPLANT',				'FLAVOR_GROWTH',			4 UNION ALL
SELECT 'BUILDING_FA_ASSEMBLYPLANT',				'FLAVOR_PRODUCTION',		100 UNION ALL
SELECT 'BUILDING_FA_ASSEMBLYPLANT',				'FLAVOR_GREAT_PEOPLE',		5;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_RUSSIA',											'BUILDINGCLASS_FACTORY',		'BUILDING_FA_ASSEMBLYPLANT';

--------------------------------------------------------------------------------------------------
--VANILLA Updates
--------------------------------------------------------------------------------------------------
UPDATE Buildings
	SET PrereqTech = 'TECH_STEAM_POWER'
	WHERE NOT EXISTS ( SELECT * FROM UnitCombatInfos WHERE Type = 'UNITCOMBAT_NAVALRANGED')
	AND Type = 'BUILDING_FA_ASSEMBLYPLANT';

--------------------------------------------------------------------------------------------------
--NON-BNW Updates
--------------------------------------------------------------------------------------------------
--DELETE FROM Units
--	WHERE NOT EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN' )
--	AND Type = 'UNIT_GERMAN_LANDSKNECHT';

--DELETE FROM Buildings WHERE Type = 'BUILDING_HANSE';

--------------------------------------------------------------------------------------------------
--BNW Updates
--------------------------------------------------------------------------------------------------
UPDATE Buildings
	SET	XBuiltTriggersIdeologyChoice = 3
	WHERE EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN')
	AND Type = 'BUILDING_FA_ASSEMBLYPLANT';




