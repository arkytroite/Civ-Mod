--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('OW_IRAN_ATLAS', 						256, 		'IranAtlas256.dds',				2, 				2),
		('OW_IRAN_ATLAS', 						128, 		'IranAtlas128.dds',				2, 				2),
		('OW_IRAN_ATLAS', 						80, 		'IranAtlas80.dds',				 2, 				2),
		('OW_IRAN_ATLAS', 						64, 		'IranAtlas64.dds',				2, 				2),
		('OW_IRAN_ATLAS', 						45, 		'IranAtlas45.dds',					2, 				2),
		('OW_IRAN_ATLAS', 						32, 		'IranAtlas32.dds',					2, 				2),
		('OW_IRAN_ALPHA_ATLAS', 				128, 		'IranAlpha128.dds',			1,				1),
		('OW_IRAN_ALPHA_ATLAS', 				80, 		'IranAlpha80.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				64, 		'IranAlpha64.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				48, 		'IranAlpha48.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				45, 		'IranAlpha45.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				32, 		'IranAlpha32.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				24, 		'IranAlpha24.dds',			1, 				1),
		('OW_IRAN_ALPHA_ATLAS', 				16, 		'IranAlpha16.dds',			1, 				1),
		('OW_IRAN_FLAG_REVGUARD_ATLAS',	32, 		'Rev32.dds',			1, 				1);
--==========================================================================================================================	
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_OW_REVGUARD', 		'Unit', 	'RevSV.dds');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
	(SoundID, 								Filename, 							LoadType)
VALUES		('SND_LEADER_MUSIC_OW_IRAN_PEACE', 	'KhomeiniPeace', 						'DynamicResident'),
		('SND_LEADER_MUSIC_OW_IRAN_WAR', 		'KhomeiniWar', 						'DynamicResident');			
