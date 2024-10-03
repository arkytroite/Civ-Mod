-- Insert SQL Rules Here 
-- Insert SQL Rules Here 

INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation) VALUES ('ART_DEF_UNIT_ARDL_AUTHORITYADMIRAL', 1, "ChariotElephant");


--INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES    ('ART_DEF_UNIT_ARDL_AUTHORITYADMIRAL', 'ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL2', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers) VALUES	('ART_DEF_UNIT_ARDL_AUTHORITYADMIRAL', 'ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL', 2);


INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL', 0.09, 0, 'Battleship.fxsxml', "METAL", "METALLRG");
--INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
--    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL2', 0.12, 0, 'Great_Admiral_Late.fxsxml', "METAL", "METALLRG");


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
	VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir",1 ,1, 0, 1);
--INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
--VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL2', "Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir",1 ,1, 0, 1);


	

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL', 0, 0, "EXPLOSIVE", "EXPLOSION6POUND");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);


--INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
--    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL2', 0, 0, "BULLET", "BULLET");
--INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
--    VALUES ('ART_DEF_UNIT_MEMBER_ARDL_AUTHORITYADMIRAL2', 1, 0, 10.0, 20.0, "FLAMING_ARROW", 10.0);


	
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset)
	VALUES	('ART_DEF_UNIT_ARDL_AUTHORITYADMIRAL', 'Unit', 'SV_Scout.dds');
