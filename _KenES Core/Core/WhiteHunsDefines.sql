--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_GT_ASBAROBIDO', 	'Unit', 	'sv_asbarobido.dds'),
			('ART_DEF_UNIT_GT_TOKHAROI', 	'Unit', 	'sv_Xingar_Yir.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GT_TOKHAROI'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GT_TOKHAROI'), 	('ART_DEF_UNIT_MEMBER_GT_TOKHAROI'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOKHAROI'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOKHAROI'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOKHAROI'),	Scale,	ZOffset, Domain, ('Swordsman_India_v2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
--==========================================================================================================================
-- Icon Atlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_WHITE_HUNS_ATLAS', 						256, 		'White_Huns_Atlas256.dds',			2, 				2),
		('GT_WHITE_HUNS_ATLAS', 						128, 		'White_Huns_Atlas128.dds',			2, 				2),
		('GT_WHITE_HUNS_ATLAS', 						80, 		'White_Huns_Atlas80.dds',				2, 				2),
		('GT_WHITE_HUNS_ATLAS', 						64, 		'White_Huns_Atlas64.dds',				2, 				2),
		('GT_WHITE_HUNS_ATLAS', 						45, 		'White_Huns_Atlas45.dds',				2, 				2),
		('GT_WHITE_HUNS_ATLAS', 						32, 		'White_Huns_Atlas32.dds',				2, 				2),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				128, 		'White_Huns_Alpha128.dds',		1,				1),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				80, 		'White_Huns_Alpha80.dds',			1, 				1),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				64, 		'White_Huns_Alpha64.dds',			1, 				1),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				48, 		'White_Huns_Alpha48.dds',			1, 				1),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				32, 		'White_Huns_Alpha32.dds',			1, 				1),
		('GT_WHITE_HUNS_ALPHA_ATLAS', 				24, 		'White_Huns_Alpha24.dds',			1, 				1),
		('GT_ASBAROBIDO_FLAG_ATLAS',				32,			'uu_asbarobido_flag.dds',			1,				1),
		('GT_TOKHAROI_UNIT_FLAG_ATLAS',				32,			'uu_xingar_yir_flag.dds',			1,				1),
		('GT_TORAMANA_ATLAS',				80,			'Toramana_Atlas_80.dds',			1,				1),
		('GT_TORAMANA_ATLAS',				64,			'Toramana_Atlas_64.dds',			1,				1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_GT_WHITE_HUNS', 	'UNITCLASS_GREAT_GENERAL',		'UNIT_GT_ASBAROBIDO'),
		('CIVILIZATION_HUNS', 	'UNITCLASS_SWORDSMAN',		'UNIT_GT_TOKHAROI');
--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
		(Type, 							Class, Cost,   Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,	  RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Description, 							Help, 										Strategy,										Civilopedia, 								Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,							XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,							MoveRate, PortraitIndex,	IconAtlas)
SELECT	'UNIT_GT_TOKHAROI',	Class, Cost,   Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,   RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	'TXT_KEY_UNIT_GT_TOKHAROI',	'TXT_KEY_UNIT_GT_TOKHAROI_HELP',	'TXT_KEY_UNIT_GT_TOKHAROI_STRATEGY',	'TXT_KEY_GT_TOKHAROI_TEXT',	Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, 'ART_DEF_UNIT_GT_TOKHAROI',	XPValueAttack, XPValueDefense, 0,					'GT_TOKHAROI_UNIT_FLAG_ATLAS',	MoveRate, 3, 				'GT_WHITE_HUNS_ATLAS'
FROM Units WHERE Type = 'UNIT_SWORDSMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_GT_TOKHAROI',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------
-- Unit_Flavors
--------------------------------

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_GT_TOKHAROI',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
SELECT	'UNIT_GT_TOKHAROI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';
--==========================================================================================================================
--==========================================================================================================================