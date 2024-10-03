-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                           IconSize,    Filename,                      IconsPerRow,       IconsPerColumn)
VALUES    ('ZRQ_POLAND_JADWIGA_ATLAS',     256,        'JadwigaAtlas_256.dds',        2,                 2),
('ZRQ_POLAND_JADWIGA_ATLAS',               128,        'JadwigaAtlas_128.dds',        2,                 2),
('ZRQ_POLAND_JADWIGA_ATLAS',               80,         'JadwigaAtlas_80.dds',         2,                 2),
('ZRQ_POLAND_JADWIGA_ATLAS',               64,         'JadwigaAtlas_64.dds',         2,                 2),
('ZRQ_POLAND_JADWIGA_ATLAS',               45,         'JadwigaAtlas_45.dds',         2,                 2),
('ZRQ_POLAND_JADWIGA_ATLAS',               32,         'JadwigaAtlas_32.dds',         2,                 2),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         256,        'JadwigaAlpha_256.dds',        1,                 1),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         128,        'JadwigaAlpha_128.dds',        1,                 1),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         64,         'JadwigaAlpha_64.dds',         1,                 1),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         48,         'JadwigaAlpha_48.dds',         1,                 1),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         32,         'JadwigaAlpha_32.dds',         1,                 1),
('ZRQ_POLAND_JADWIGA_ALPHA_ATLAS',         24,         'JadwigaAlpha_24.dds',         1,                 1);


-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
          (Type,                              Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_ZRQ_POLAND_JADWIGA_ICON',   0.835,   0.725,    0.678,    1),
('COLOR_PLAYER_ZRQ_POLAND_JADWIGA_BACKGROUND',       0.490,   0.075,    0.137,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_ZRQ_POLAND_JADWIGA',        'COLOR_PLAYER_ZRQ_POLAND_JADWIGA_ICON',     'COLOR_PLAYER_ZRQ_POLAND_JADWIGA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');



-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES 	('ZRQ_RACOWIE_FLAG',		  32,	'Flag32.dds',	1,				1);

--==========================================================================================================================	
-- Unit Defines
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_ZRQ_RACOWIE'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PIKEMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_ZRQ_RACOWIE',	'ART_DEF_UNIT_MEMBER_ZRQ_RACOWIE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');

------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_RACOWIE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_RACOWIE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 										--this is where you add fxsml
		(Type, 									Scale,  ZOffset, Domain, Model,						 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_RACOWIE'),	Scale,	ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_ZRQ_RACOWIE',	'Unit', 	'FlagSV.dds');



-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 							             Filename, 		  LoadType)
VALUES	('SND_LEADER_MUSIC_ZRQ_JADWIGA_PEACE', 		'Jadwiga_Peace', 'DynamicResident'),
		('SND_LEADER_MUSIC_ZRQ_JADWIGA_WAR', 		'Jadwiga_War',   'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ZRQ_JADWIGA_PEACE', 		'SND_LEADER_MUSIC_ZRQ_JADWIGA_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ZRQ_JADWIGA_WAR', 			'SND_LEADER_MUSIC_ZRQ_JADWIGA_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================