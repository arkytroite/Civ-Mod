--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,									Civilopedia,											Help,												Strategy,												FaithCost,	UnlockedByBelief,	XBuiltTriggersIdeologyChoice,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_BRAZILIAN_SIDERURGICA'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_BRAZILIAN_SIDERURGICA'),	('TXT_KEY_BUILDING_MC_BRAZILIAN_SIDERURGICA_PEDIA'),	('TXT_KEY_BUILDING_MC_BRAZILIAN_SIDERURGICA_HELP'),	('TXT_KEY_BUILDING_MC_BRAZILIAN_SIDERURGICA_STRATEGY'),	FaithCost,	UnlockedByBelief,	XBuiltTriggersIdeologyChoice,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	'MC_BRAZIL_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_FACTORY');

--Dummy Building
INSERT INTO Buildings
		(Type,								BuildingClass,							Description,								Cost,	PrereqTech,	GreatWorkCount,	UnmoddedHappiness,	FaithCost,	NeverCapture)
VALUES	('BUILDING_MC_BRAZIL_DOFS',			'BUILDINGCLASS_MC_BRAZIL_DOFS',			'TXT_KEY_BUILDING_MC_BRAZIL_DOFS',			-1,		null,		-1,				0,					-1,			1),
		('BUILDING_MC_BRAZIL_PRACINHA',		'BUILDINGCLASS_MC_BRAZIL_PRACINHA',		'TXT_KEY_BUILDING_MC_BRAZIL_PRACINHA',		-1,		null,		-1,				0,					-1,			1),
		('BUILDING_MC_BRAZIL_UB_CULTURE',	'BUILDINGCLASS_MC_BRAZIL_UB_CULTURE',	'TXT_KEY_BUILDING_MC_BRAZIL_UB_CULTURE',	-1,		null,		-1,				0,					-1,			1),
		('BUILDING_MC_BRAZIL_UB_HAPPY',		'BUILDINGCLASS_MC_BRAZIL_UB_HAPPY',		'TXT_KEY_BUILDING_MC_BRAZIL_UB_HAPPY',		-1,		null,		-1,				1,					-1,			1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_MC_BRAZIL_DOFS',			'BUILDING_MC_BRAZIL_DOFS',			'TXT_KEY_BUILDING_MC_BRAZIL_DOFS'),
		('BUILDINGCLASS_MC_BRAZIL_PRACINHA',		'BUILDING_MC_BRAZIL_PRACINHA',		'TXT_KEY_BUILDING_MC_BRAZIL_PRACINHA'),
		('BUILDINGCLASS_MC_BRAZIL_UB_CULTURE',		'BUILDING_MC_BRAZIL_UB_CULTURE',	'TXT_KEY_BUILDING_MC_BRAZIL_UB_CULTURE'),
		('BUILDINGCLASS_MC_BRAZIL_UB_HAPPY',		'BUILDING_MC_BRAZIL_UB_HAPPY',		'TXT_KEY_BUILDING_MC_BRAZIL_UB_HAPPY');

--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,							BuildingClassType)
SELECT	('BUILDING_MC_BRAZILIAN_SIDERURGICA'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_FACTORY');

--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType,							YieldType,		Yield)
SELECT	('BUILDING_MC_BRAZILIAN_SIDERURGICA'),	YieldType,		Yield
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_FACTORY');

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType,							YieldType,		Yield)
SELECT	('BUILDING_MC_BRAZILIAN_SIDERURGICA'),	YieldType,		Yield
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_FACTORY');

INSERT INTO Building_YieldModifiers
		(BuildingType,							YieldType,			Yield)
VALUES	('BUILDING_MC_BRAZIL_DOFS',				'YIELD_CULTURE',	5),
		('BUILDING_MC_BRAZIL_DOFS',				'YIELD_PRODUCTION',	5),
		('BUILDING_MC_BRAZIL_UB_CULTURE',		'YIELD_CULTURE',	1);

--==========================================================================================================================
-- Unit_ProductionModifierBuildings
--==========================================================================================================================
INSERT INTO Unit_ProductionModifierBuildings
		(UnitType,							BuildingType,					ProductionModifier)
VALUES	('UNIT_BRAZILIAN_PRACINHA',			'BUILDING_MC_BRAZIL_PRACINHA',	4);

--==========================================================================================================================
-- Building_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Building_ResourceQuantityRequirements 	
		(BuildingType,							ResourceType,		Cost)
SELECT	('BUILDING_MC_BRAZILIAN_SIDERURGICA'),	ResourceType,		Cost
FROM Building_ClassesNeededInCity WHERE (BuildingType ='BUILDING_FACTORY');

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,				Flavor)
VALUES	('BUILDING_MC_BRAZILIAN_SIDERURGICA',	'FLAVOR_GROWTH',		4),
		('BUILDING_MC_BRAZILIAN_SIDERURGICA',	'FLAVOR_PRODUCTION',	100),
		('BUILDING_MC_BRAZILIAN_SIDERURGICA',	'FLAVOR_GREAT_PEOPLE',	5),
		('BUILDING_MC_BRAZILIAN_SIDERURGICA',	'FLAVOR_HAPPINESS',		20),
		('BUILDING_MC_BRAZILIAN_SIDERURGICA',	'FLAVOR_CULTURE',		10);
		
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_BRAZIL', 	'BUILDINGCLASS_FACTORY',	'BUILDING_MC_BRAZILIAN_SIDERURGICA');
			
