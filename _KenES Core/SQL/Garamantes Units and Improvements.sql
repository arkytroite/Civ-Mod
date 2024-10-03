---------------------------
--Improvements
---------------------------

INSERT INTO Improvements 
		(Type,														          Description,                                    Civilopedia,									             Help,			                       ArtDefineTag,		SpecificCivRequired,			          CivilizationType,		HillsMakesValid,		PillageGold,	PortraitIndex,			    IconAtlas,		DestroyedWhenPillaged)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',   'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA',	'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_TEXT',		'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_HELP',		'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS',                          1,      'CIVILIZATION_ARABIA',			          0,	             18,	            3,	'ANCIENT_LIBYA_ATLAS',                          1);

INSERT INTO Improvement_Flavors 
		(ImprovementType,							      FlavorType,				 Flavor)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',       'FLAVOR_GROWTH',                    10);

INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,							    TerrainType)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',     'TERRAIN_DESERT');

INSERT INTO Improvement_Yields 
		(ImprovementType,							       YieldType,		      Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',          'YIELD_FOOD',                 3);

INSERT INTO Improvement_TechYieldChanges 
		(ImprovementType,							        TechType,          YieldType,		 Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA',     'TECH_FERTILIZER',       'YIELD_GOLD',            1);

INSERT INTO Builds 
		(Type,                              PrereqTech,        Time,                             ImprovementType,                          Description,                                        Help,                            Recommendation,                     EntityEvent,	OrderPriority,		CtrlDown,	IconIndex,             IconAtlas)
VALUES	('BUILD_GARAMA_FOGGORA',	'TECH_ENGINEERING',			700,		'IMPROVEMENT_GARAMANTES_MOD_FOGGORA',		'TXT_KEY_BUILD_GARAMA_FOGGORA',			'TXT_KEY_BUILD_GARAMA_FOGGORA_HELP',		'TXT_KEY_BUILD_GARAMA_FOGGORA_REC',			'ENTITY_EVENT_IRRIGATE',		        1,             1,           0,	'GARAMA_BUILD_ATLAS');

INSERT INTO BuildFeatures 
		(BuildType,                      FeatureType,              PrereqTech,  Time,	Production,    Remove)
VALUES	('BUILD_GARAMA_FOGGORA',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	 700,	         0,         1),
		('BUILD_GARAMA_FOGGORA',	'FEATURE_FOREST',	        'TECH_MINING',	 400,	        20,         1),
		('BUILD_GARAMA_FOGGORA',	 'FEATURE_MARSH',	       'TECH_MASONRY',	 600,	         0,         1);

--INSERT INTO Unit_Builds 
--			(UnitType,			                 BuildType)
--VALUES	('UNIT_WORKER',			'BUILD_GARAMA_FOGGORA');

--Dummy
---------------------------

INSERT INTO Improvements 
		(Type,														                Description,                                      Civilopedia,									             Help,			                       ArtDefineTag,		PillageGold,	PortraitIndex,			    IconAtlas,	GraphicalOnly,	DestroyedWhenPillaged)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',   'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA',	'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_TEXT',		'TXT_KEY_IMPROVEMENT_GARAMANTES_FOGGORA_HELP',		'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS',                 18,	            3,	'ANCIENT_LIBYA_ATLAS',              1,                      1);

INSERT INTO Improvement_Flavors 
		(ImprovementType,							            FlavorType,			     Flavor)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',       'FLAVOR_GROWTH',                  10);

INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,							          TerrainType)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',     'TERRAIN_DESERT');

INSERT INTO Improvement_Yields 
		(ImprovementType,							             YieldType,		        Yield)
VALUES	('IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',          'YIELD_FOOD',                 3);

INSERT INTO Builds 
		(Type,                                  PrereqTech,        Time,                                   ImprovementType,                        Description,                                        Help,                            Recommendation,                     EntityEvent,	OrderPriority,		CtrlDown,	IconIndex,             IconAtlas,	ShowInPedia,		ShowInTechTree)
VALUES	('BUILD_GARAMA_FOGGORA_DUMMY',	'TECH_ENGINEERING',			700,		'IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',		'TXT_KEY_BUILD_GARAMA_FOGGORA',			'TXT_KEY_BUILD_GARAMA_FOGGORA_HELP',		'TXT_KEY_BUILD_GARAMA_FOGGORA_REC',			'ENTITY_EVENT_IRRIGATE',		        1,             1,           0,	'GARAMA_BUILD_ATLAS',             0,                     0);

INSERT INTO BuildFeatures 
		(BuildType,                          FeatureType,              PrereqTech,  Time,	Production,    Remove)
VALUES	('BUILD_GARAMA_FOGGORA_DUMMY',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	 700,	         0,         1),
		('BUILD_GARAMA_FOGGORA_DUMMY',	'FEATURE_FOREST',	        'TECH_MINING',	 400,	        20,         1),
		('BUILD_GARAMA_FOGGORA_DUMMY',	 'FEATURE_MARSH',	       'TECH_MASONRY',	 600,	         0,         1);

INSERT INTO Unit_Builds 
	    (UnitType,			                              BuildType)
VALUES	('UNIT_GARAMA_DUMMY',		   'BUILD_GARAMA_FOGGORA_DUMMY'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_ROAD'),
		('UNIT_GARAMA_DUMMY',                      'BUILD_RAILROAD'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_FARM'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_MINE'),
		('UNIT_GARAMA_DUMMY',                  'BUILD_TRADING_POST'),
		('UNIT_GARAMA_DUMMY',                    'BUILD_LUMBERMILL'),
		('UNIT_GARAMA_DUMMY',                       'BUILD_PASTURE'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_CAMP'),
		('UNIT_GARAMA_DUMMY',                    'BUILD_PLANTATION'),
		('UNIT_GARAMA_DUMMY',                        'BUILD_QUARRY'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_WELL'),
		('UNIT_GARAMA_DUMMY',                          'BUILD_FORT'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_REMOVE_JUNGLE'),
		('UNIT_GARAMA_DUMMY',                  'BUILD_REMOVE_MARSH'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_REMOVE_FOREST'),
		('UNIT_GARAMA_DUMMY',                 'BUILD_SCRUB_FALLOUT'),
		('UNIT_GARAMA_DUMMY',                        'BUILD_REPAIR'),
		('UNIT_GARAMA_DUMMY',				   'BUILD_REMOVE_ROUTE');

--Misc.
INSERT INTO Policies 
		(Type,														                          Description,								                      Civilopedia,                                                   Help,	    GridX,	GridY,	PortraitIndex,			 IconAtlas,		   IconAtlasAchieved)
VALUES	('POLICY_GARAMA_FIX_UI_BASE_YIELD',			               'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD',			          'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD_TEXT',		      'TXT_KEY_POLICY_GARAMANTES_UI_FIX_MOD_HELP',	     1000,	 1000,		       47,		'POLICY_ATLAS',			'POLICY_A_ATLAS');

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,														                             ImprovementType,		                          YieldType,                       Yield)
Values	('POLICY_GARAMA_FIX_UI_BASE_YIELD',                                   'IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY',                              'YIELD_GOLD',                           1);