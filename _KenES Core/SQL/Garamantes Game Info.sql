---------------------------
--Audio
---------------------------

INSERT INTO Audio_Sounds 
			(SoundID, 															    Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_ANCIENT_LIBYA_MOD_PEACE',				       'DjallaPeace', 			   'DynamicResident'),
			('SND_LEADER_MUSIC_ANCIENT_LIBYA_MOD_WAR', 				             'DjallaWar', 			   'DynamicResident'),
			('SND_DOM_SPEECH_ANCIENT_LIBYA_MOD', 								 'DjallaDoM', 			   'DynamicResident');

INSERT INTO Audio_2DSounds 
			(ScriptID, 																									SoundID, 				SoundType, 			MinVolume, 			MaxVolume,			IsMusic)
VALUES		('AS2D_LEADER_MUSIC_ANCIENT_LIBYA_MOD_PEACE', 				             'SND_LEADER_MUSIC_ANCIENT_LIBYA_MOD_PEACE', 	         'GAME_MUSIC', 	               63, 		           63, 		          1),
			('AS2D_LEADER_MUSIC_ANCIENT_LIBYA_MOD_WAR', 	                           'SND_LEADER_MUSIC_ANCIENT_LIBYA_MOD_WAR', 		     'GAME_MUSIC', 	               48, 		           48, 		          1);

INSERT INTO Audio_2DSounds 
			(ScriptID, 																									SoundID, 				SoundType, 			 Looping,		MinVolume, 			MaxVolume)
VALUES		('AS2D_AMBIENCE_LEADER_ANCIENT_LIBYA_MOD_AMBIENCE', 		                      'SND_AMBIENCE_DESERT_DESERT_SAND', 		       'GAME_SFX', 	               1,	           50, 		           50),
			('AS2D_DOM_SPEECH_ANCIENT_LIBYA_MOD', 		                                     'SND_DOM_SPEECH_ANCIENT_LIBYA_MOD', 		    'GAME_SPEECH',           	   0,	           90, 		           90);

---------------------------
--Atlas
---------------------------

INSERT INTO IconTextureAtlases 
		(Atlas, 						      IconSize, 	                       Filename, 	    IconsPerRow, 	IconsPerColumn)
VALUES	('ANCIENT_LIBYA_ATLAS', 				   256, 		 'AncientLibyaAtlas256.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 				   214, 		 'AncientLibyaAtlas214.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 				   128, 		 'AncientLibyaAtlas128.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 					80, 		  'AncientLibyaAtlas80.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 					64, 		  'AncientLibyaAtlas64.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 					45, 		  'AncientLibyaAtlas45.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ATLAS', 					32, 		  'AncientLibyaAtlas32.dds',				  8, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 		       128, 	'AncientLibyaAlphaAtlas128.dds',				  1, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 			    64, 	 'AncientLibyaAlphaAtlas64.dds',				  1, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 			    48, 	 'AncientLibyaAlphaAtlas48.dds',				  1, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 			    32, 	 'AncientLibyaAlphaAtlas32.dds',				  1, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 			    24, 	 'AncientLibyaAlphaAtlas24.dds',				  1, 				 1),
		('ANCIENT_LIBYA_ALPHA_ATLAS', 			    16, 	 'AncientLibyaAlphaAtlas16.dds',				  1, 				 1),
		('ANCIENT_LIBYA_UNIT_ALPHA_ATLAS', 			32,    'AncientLibyaUnitAlphaAtlas.dds',				  1, 				 1),
		('GARAMA_BUILD_ATLAS', 				        64, 	          'Garama_Build_64.dds',				  1, 				 1),
		('GARAMA_BUILD_ATLAS', 				        45, 	          'Garama_Build_45.dds',				  1, 				 1),
		('GARAMA_BUILD_GOLD_ATLAS', 			    64,          'Garama_Gold_Build_64.dds',				  1, 				 1),
		('GARAMA_BUILD_GOLD_ATLAS',			        45,          'Garama_Gold_Build_45.dds',				  1, 				 1);

