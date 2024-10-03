--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,								Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 								Civilopedia, 									Help, 											Strategy,											AdvancedStartCost,	UnitArtInfo, 							  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_INCAN_CHASKA_CHUQUI'),	Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_INCAN_CHASKA_CHUQUI'),	('TXT_KEY_UNIT_MC_INCAN_CHASKA_CHUQUI_PEDIA'), 	('TXT_KEY_UNIT_MC_INCAN_CHASKA_CHUQUI_HELP'), 	('TXT_KEY_UNIT_MC_INCAN_CHASKA_CHUQUI_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_INCAN_CHASKA_CHUQUI'),  0,					('MC_INCAN_CHASKA_CHUQUI_FLAG'),	2, 				('MC_INCA_ATLAS')
FROM Units WHERE (Type = 'UNIT_LONGSWORDSMAN');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 							UnitAIType)
SELECT		('UNIT_MC_INCAN_CHASKA_CHUQUI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LONGSWORDSMAN');


--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 							UnitClassType)
SELECT		('UNIT_MC_INCAN_CHASKA_CHUQUI'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LONGSWORDSMAN');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,							FlavorType, Flavor)
SELECT		('UNIT_MC_INCAN_CHASKA_CHUQUI'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LONGSWORDSMAN');

INSERT INTO Unit_Flavors
			(UnitType,							FlavorType, Flavor)
SELECT		('UNIT_MC_INCAN_YAMPU_RUNANCHA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_MC_INCAN_CHASKA_CHUQUI',	'PROMOTION_EXTRA_MOVES_I');

INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
SELECT		('UNIT_MC_INCAN_YAMPU_RUNANCHA'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 										SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_INCAN_CHASKA_CHUQUI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LONGSWORDSMAN');

INSERT INTO UnitGameplay2DScripts
(UnitType, 										SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_INCAN_YAMPU_RUNANCHA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');
--==========================================================================================================================
--==========================================================================================================================
