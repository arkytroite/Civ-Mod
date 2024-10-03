-- Insert SQL Rules Here    ART_DEF_UNIT_SMAN_BATTLE_ELEPHANT

INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
    SELECT	('ART_DEF_UNIT_SMAN_EU_TAMED_MAMMOTH'), DamageStates, Formation
    FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_SIAMESE_WARELEPHANT');


INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES    ('ART_DEF_UNIT_SMAN_EU_TAMED_MAMMOTH', 'ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH_MAHOUT', "1");
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_SMAN_EU_TAMED_MAMMOTH', 'ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH', "1");


INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH_MAHOUT', 0.14, 0, 'SMAN_EU_CRP_Mammoth_Guide.fxsxml', "CLOTH", "FLESH");

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    SELECT    ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH'), Scale, ('SMAN_EU_CRP_Mammoth.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
    FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT');


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, LastToDie)
	VALUES ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH_MAHOUT', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge", 12.0, 0.35, 8.0, 1, 0);

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation, LastToDie)
    SELECT    ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH'), EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation, 1
    FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT');


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH_MAHOUT', 0, 0, "BLUNT", "SPEAR");

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    SELECT ('ART_DEF_UNIT_MEMBER_SMAN_EU_TAMED_MAMMOTH'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
    FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT');



INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_UNIT_SMAN_EU_TAMED_MAMMOTH', "Unit", 'sv_sman_elephant.dds');