INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_UNIT_COLOSSAL_DRAGON', 'Unit', 'SV_Warrior.dds');

-- COLOSSAL_DRAGON
---------------

INSERT INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	("ART_DEF_UNIT_COLOSSAL_DRAGON"), "DamageStates",  ("Barbarian")
	FROM "ArtDefine_UnitInfos" WHERE (Type = "ART_DEF_UNIT_BARBARIAN_EURO");
INSERT INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	VALUES	("ART_DEF_UNIT_COLOSSAL_DRAGON", "ART_DEF_UNIT_MEMBER_COLOSSAL_DRAGON", "1");
INSERT INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_COLOSSAL_DRAGON"), "EnableActions", "DisableActions", "MoveRadius", "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", 
			"MoveRate", "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA");
INSERT INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_COLOSSAL_DRAGON"), "Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA");
INSERT INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_COLOSSAL_DRAGON"), ("96"), "ZOffset", "Domain", 
			("colossal_drake.fxsxml"), "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" WHERE (Type = "ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA");
-------------------------------------------------------------------------------------------------------------------------
