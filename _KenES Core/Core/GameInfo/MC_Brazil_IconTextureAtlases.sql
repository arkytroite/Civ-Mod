--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('MC_BRAZIL_ATLAS',					256, 		'MC_BRAZIL_256.dds',				2,				2),
		('MC_BRAZIL_ATLAS',					128, 		'MC_BRAZIL_128.dds',				2,				2),
		('MC_BRAZIL_ATLAS',					80, 		'MC_BRAZIL_80.dds',					2,				2),
		('MC_BRAZIL_ATLAS',					64, 		'MC_BRAZIL_64.dds',					2,				2),
		('MC_BRAZIL_ATLAS',					48, 		'MC_BRAZIL_48.dds',					2,				2),
		('MC_BRAZIL_ATLAS',					45, 		'MC_BRAZIL_45.dds',					2,				2),
		('MC_BRAZIL_ATLAS',					32, 		'MC_BRAZIL_32.dds',					2,				2),
		('MC_BRAZIL_ATLAS',					24, 		'MC_BRAZIL_24.dds',					2,				2),
		('MC_BRAZIL_ALPHA_ATLAS',			128, 		'MC_BRAZIL_ALPHA_128.dds',			1,				1),
		('MC_BRAZIL_ALPHA_ATLAS',			64, 		'MC_BRAZIL_ALPHA_64.dds',			1,				1),
		('MC_BRAZIL_ALPHA_ATLAS',			48, 		'MC_BRAZIL_ALPHA_48.dds',			1,				1),
		('MC_BRAZIL_ALPHA_ATLAS',			32, 		'MC_BRAZIL_ALPHA_32.dds',			1,				1),
		('MC_BRAZIL_ALPHA_ATLAS',			24, 		'MC_BRAZIL_ALPHA_24.dds',			1,				1),
		('MC_BRAZIL_ALPHA_ATLAS',			16, 		'MC_BRAZIL_ALPHA_16.dds',			1,				1),
		('MC_FATHERLAND_VOLUNTEER_FLAG',	32, 		'VolunteerAlphaAtlas32.dds',		1,				1);
--==========================================================================================================================	
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType,				UnitType)
VALUES		('CIVILIZATION_INCA', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_MC_INCAN_CHASKA_CHUQUI');