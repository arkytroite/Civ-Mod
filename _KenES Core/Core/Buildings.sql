--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
-- Buildings
-----------------------------
UPDATE Buildings
SET Description = 'TXT_KEY_BUILDING_UC_CHINAMPA', Help = 'TXT_KEY_BUILDING_UC_CHINAMPA_HELP', Strategy = 'TXT_KEY_BUILDING_UC_CHINAMPA_STRATEGY'
WHERE Type = 'BUILDING_FLOATING_GARDENS';

INSERT INTO Buildings
			(Type, 							SpecialistType, SpecialistCount, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, UnlockedByBelief, HurryCostModifier, ConquestProb, GreatWorkSlotType, 				GreatWorkCount, Description,							Help,										Civilopedia,							Strategy,										ArtDefineTag, MinAreaSize, 	HurryCostModifier, IconAtlas,				PortraitIndex)
SELECT	'BUILDING_UC_CALMECAC',	SpecialistType, SpecialistCount, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, UnlockedByBelief, HurryCostModifier, ConquestProb, GreatWorkSlotType,	GreatWorkCount,					('TXT_KEY_BUILDING_UC_CALMECAC'),	('TXT_KEY_BUILDING_UC_CALMECAC_HELP'),	('TXT_KEY_CIV5_UC_CALMECAC_TEXT'),	('TXT_KEY_BUILDING_UC_CALMECAC_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, ('UC_ITZ_AZTECS_ATLAS'), 	3
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';
	
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_UC_CALMECAC', 	FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 					BuildingClassType)
VALUES		('BUILDING_UC_CALMECAC', 	'BUILDINGCLASS_LIBRARY');
			
INSERT INTO Building_YieldModifiers 
			(BuildingType, 					YieldType,		Yield)
VALUES		('BUILDING_UC_CALMECAC', 	'YIELD_SCIENCE', 33);

INSERT INTO Building_FeatureYieldChanges 
			(BuildingType, 					FeatureType,		YieldType,			Yield)
VALUES		('BUILDING_UC_CALMECAC', 	'FEATURE_JUNGLE', 	'YIELD_SCIENCE', 	2);

INSERT INTO Building_Flavors 
			(BuildingType, 					FlavorType,					Flavor)
VALUES		('BUILDING_UC_CALMECAC', 	'FLAVOR_GREAT_PEOPLE',		30),
			('BUILDING_UC_CALMECAC', 'FLAVOR_MILITARY_TRAINING', 30);

INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 					DomainType,					Experience)
VALUES		('BUILDING_UC_CALMECAC', 	'DOMAIN_LAND',		10);
--==========================================================================================================================
-- UC_Aztec_TourismCount
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS UC_Aztec_TourismCount(numTourism INTEGER DEFAULT 0);
INSERT INTO UC_Aztec_TourismCount(numTourism) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);	

INSERT OR REPLACE INTO BuildingClasses
		(Type,																DefaultBuilding,												Description)
SELECT	'BUILDINGCLASS_UC_ITZCOATL_TOURISM_'||numTourism,				'BUILDING_UC_ITZCOATL_TOURISM_'||numTourism,				null
FROM UC_Aztec_TourismCount;

INSERT INTO Buildings
		(Type,												BuildingClass,											Description,									GreatWorkCount,	Civilopedia,	NukeImmune, ConquestProb,	Cost,	FaithCost,	PrereqTech,	EnhancedYieldTech,		TechEnhancedTourism,	IconAtlas,	PortraitIndex)
SELECT	'BUILDING_UC_ITZCOATL_TOURISM_'||numTourism,	'BUILDINGCLASS_UC_ITZCOATL_TOURISM_'||numTourism,	'TXT_KEY_BUILDING_US_AUGUST_DESTINY_TOURISM',	-1,				null,			1,			100,			-1,		-1,			NULL,		'TECH_AGRICULTURE',		numTourism,				null,		0
FROM UC_Aztec_TourismCount;

