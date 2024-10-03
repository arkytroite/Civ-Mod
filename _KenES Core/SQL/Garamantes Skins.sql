INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 1, 'Scout');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 'ART_DEF_UNIT_MEMBER_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 6);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 0.140000000596046, 'Garamante.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 0, 0, 'BLUNT', 'SPEAR');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_ANCIENT_LIBYAN_MOD_SCOUT_ALT', 'Unit', 'sv_Ancient_Libya.dds');

INSERT INTO ArtDefine_LandmarkTypes(Type, 			LandmarkType, 	FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 	'Improvement', 	'TOMATEKH_FOGGARAS';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 	ResourceType, 			Model, 							TerrainContour)
VALUES 	('Any', 'UnderConstruction', 	1.3,  	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_HB.fxsxml', 	1),
		('Any', 'Constructed',		 	1.3, 	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_B.fxsxml', 	1),
		('Any', 'Pillaged',				1.3,  	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_PL.fxsxml', 	1);

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'Improvement', 'sv_Fogaaras.dds');

