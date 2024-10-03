UPDATE Improvements
	SET ArtDefineTag = 'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS'
	WHERE Type = 'IMPROVEMENT_KASBAH';

INSERT INTO ArtDefine_LandmarkTypes(Type, 			LandmarkType, 	FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 	'Improvement', 	'TOMATEKH_FOGGARAS';
	
INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType, 						LayoutHandler, 	ResourceType, 			Model, 							TerrainContour)
VALUES 	('Any', 'UnderConstruction', 	1.3,  	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_HB.fxsxml', 	1),
		('Any', 'Constructed',		 	1.3, 	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_B.fxsxml', 	1),
		('Any', 'Pillaged',				1.3,  	'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', 'RANDOM', 		'ART_DEF_RESOURCE_ALL', 'Tomatekh_Foggaras_PL.fxsxml', 	1);

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_TOMATEKH_FOGGARAS', TileType, Asset
FROM ArtDefine_StrategicView WHERE (StrategicViewType = 'ART_DEF_IMPROVEMENT_KASBAH');


