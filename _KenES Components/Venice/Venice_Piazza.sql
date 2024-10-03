--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,	BuildingClass,					PrereqTech,			ConquestProb,	Cost,	NukeImmune,	NumCityCostMod,	FreeBuildingThisCity,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,					Help,								Strategy,								Civilopedia,								ArtDefineTag,						MinAreaSize) 
SELECT 'BUILDING_FA_PIAZZA',	'BUILDINGCLASS_CIRCUS_MAXIMUS',	'TECH_THEOLOGY',	100,			125,	1,			30,				'BUILDINGCLASS_HARBOR',	-1,					'FA_UB_ATLAS',		20,				'TXT_KEY_BUILDING_FA_PIAZZA',	'TXT_KEY_BUILDING_FA_PIAZZA_HELP',	'TXT_KEY_BUILDING_FA_PIAZZA_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_FA_PIAZZA_TEXT',	'ART_DEF_BUILDING_CIRCUS_MAXIMUS',	-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_PIAZZA',								'BUILDINGCLASS_PALACE' UNION ALL
SELECT 'BUILDING_FA_PIAZZA',								'BUILDINGCLASS_LIGHTHOUSE';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_PIAZZA',						'YIELD_CULTURE',		1;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_PIAZZA',					'FLAVOR_CULTURE',			5 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',					'FLAVOR_WATER_CONNECTION',	40 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',					'FLAVOR_PRODUCTION',		10 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',					'FLAVOR_GOLD',				80 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',					'FLAVOR_HAPPINESS',			80;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,					BuildingType)
SELECT 'CIVILIZATION_VENICE',											'BUILDINGCLASS_CIRCUS_MAXIMUS',		'BUILDING_FA_PIAZZA';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
--DELETE FROM Units WHERE Type = 'UNIT_VENETIAN_GALLEASS';

--------------------------------------------------------------------------------------------------
--NON-BNW Updates
--------------------------------------------------------------------------------------------------
--DELETE FROM Buildings
--	WHERE NOT EXISTS ( SELECT * FROM Civilizations WHERE Type = 'CIVILIZATION_VENICE')
--	AND Type = 'BUILDING_FA_PIAZZA';

--------------------------------------------------------------------------------------------------
--Building Resource Production
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity (BuildingType,	ResourceType,				Quantity)
SELECT 'BUILDING_FA_PIAZZA',							'RESOURCE_SUGAR',			1 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',							'RESOURCE_SPICES',			1 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',							'RESOURCE_SILK',			1 UNION ALL
SELECT 'BUILDING_FA_PIAZZA',							'RESOURCE_SALT',			1;