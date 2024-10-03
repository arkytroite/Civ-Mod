--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_COSMOGRAPHER',	'Unit', 	'sv_Cosmographer.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_COSMOGRAPHER', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCIENTIST'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_COSMOGRAPHER', 	'ART_DEF_UNIT_MEMBER_JFD_COSMOGRAPHER', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SCIENTIST';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COSMOGRAPHER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COSMOGRAPHER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 							 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_COSMOGRAPHER',	Scale, ZOffset, Domain, 'conquistador_musket_3.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_PEACE', 	'JFD_PortugalManuelI_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_WAR', 		'JFD_PortugalManuelI_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_PEACE', 	'SND_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_PEACE',		'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_WAR', 	'SND_LEADER_MUSIC_JFD_PORTUGAL_MANUEL_I_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JFD_PORTUGAL_MANUEL_I_ICON', 		0.843,	0.588,	0.294,  1),
		('COLOR_PLAYER_JFD_PORTUGAL_MANUEL_I_BACKGROUND', 	0.176,	0.333,	0,		1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_PORTUGAL_MANUEL_I',	'COLOR_PLAYER_JFD_PORTUGAL_MANUEL_I_ICON',  'COLOR_PLAYER_JFD_PORTUGAL_MANUEL_I_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		128, 		'JFD_PortugalManuelI_AlphaAtlas_128.dds',		1,				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		80, 		'JFD_PortugalManuelI_AlphaAtlas_80.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		64, 		'JFD_PortugalManuelI_AlphaAtlas_64.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		48, 		'JFD_PortugalManuelI_AlphaAtlas_48.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		45, 		'JFD_PortugalManuelI_AlphaAtlas_45.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		32, 		'JFD_PortugalManuelI_AlphaAtlas_32.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		24, 		'JFD_PortugalManuelI_AlphaAtlas_24.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ALPHA_ATLAS',		16, 		'JFD_PortugalManuelI_AlphaAtlas_16.dds',		1, 				1),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		256, 		'JFD_PortugalManuelI_IconAtlas_256.dds',		2, 				2),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		128, 		'JFD_PortugalManuelI_IconAtlas_128.dds',		2, 				2),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		80, 		'JFD_PortugalManuelI_IconAtlas_80.dds',			2, 				2),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		64, 		'JFD_PortugalManuelI_IconAtlas_64.dds',			2, 				2),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		45, 		'JFD_PortugalManuelI_IconAtlas_45.dds',			2, 				2),
		('JFD_PORTUGAL_MANUEL_I_ICON_ATLAS', 		32, 		'JFD_PortugalManuelI_IconAtlas_32.dds',			2, 				2),
		('JFD_PORTUGAL_MANUEL_I_UNIT_FLAG_ATLAS', 	32, 		'JFD_PortugalManuelI_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
