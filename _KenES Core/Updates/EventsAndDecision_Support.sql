-- ѕозвол€ет двум новым типам дворца так же получать магистратов в начале игры
INSERT INTO Building_ResourcePerEra 	
			(BuildingType, 									ResourceType,			Quantity, 	InitialQuantity)
VALUES		('BUILDING_3DOGEPALACE',						'RESOURCE_MAGISTRATES',	0, 			2),
			('BUILDING_3_GRANDPALACE',						'RESOURCE_MAGISTRATES',	0, 			2);

