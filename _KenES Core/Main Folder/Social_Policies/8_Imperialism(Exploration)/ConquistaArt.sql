
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation) VALUES ('ART_DEF_UNIT_ARDL_CONQUISTA', 1, "HonorableGunpowder");


INSERT INTO ArtDefine_UnitInfoMemberInfos  (UnitInfoType,UnitMemberInfoType,NumMembers) VALUES    ('ART_DEF_UNIT_ARDL_CONQUISTA', 'ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA2', 7);
INSERT INTO ArtDefine_UnitInfoMemberInfos  (UnitInfoType,UnitMemberInfoType,NumMembers)	VALUES    ('ART_DEF_UNIT_ARDL_CONQUISTA', 'ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA3', 7);
INSERT INTO ArtDefine_UnitInfoMemberInfos  (UnitInfoType,UnitMemberInfoType,NumMembers)	VALUES    ('ART_DEF_UNIT_ARDL_CONQUISTA', 'ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA', 4);
INSERT INTO ArtDefine_UnitInfoMemberInfos  (UnitInfoType,UnitMemberInfoType,NumMembers)	VALUES    ('ART_DEF_UNIT_ARDL_CONQUISTA', 'ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA4', 1);

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA', 0.14, 0, 'U_Spanish_Conquistador.fxsxml', "CLOTH", "FLESH");
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA2', 0.14, 0, 'U_Spanish_Terico_Arcabucero.fxsxml', "ARMOR", "ARMOR");
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA3', 0.14, 0, 'U_Spanish_Terico_Piquero.fxsxml', "ARMOR", "ARMOR");
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA4', 0.14, 0, 'GreatGeneral_Early.fxsxml', "ARMOR", "ARMOR");
	

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk", 24.0, 0.35, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, "DefaultCavalry");
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA2', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk", 24.0, 0.35, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, "DefaultCavalry");
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA3', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk", 24.0, 0.35, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, "DefaultCavalry");
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA4', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk", 24.0, 0.35, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, "DefaultCavalry");
		

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA', 0, 0, "BULLET", "BULLET");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA2', 0, 0, "BULLET", "BULLET");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA2', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA3', 0, 0, "EXPLOSIVE", "EXPLOSION6POUND");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA3', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA4', 0, 0, "BULLET", "BULLET");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_CONQUISTA4', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);


	
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)

	VALUES	('ART_DEF_UNIT_ARDL_CONQUISTA', 'Unit', 'SV_Scout.dds');
