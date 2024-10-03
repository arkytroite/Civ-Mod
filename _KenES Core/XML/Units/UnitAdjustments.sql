-- Insert SQL Rules Here 

-- Add column to Units table to show which ones are mercs (true); default is false
ALTER TABLE Units ADD IsMercUnit integer DEFAULT 0;


--UPDATE Units SET Cost = Cost/5 WHERE IsMercUnit=1;





--Unit_FreePromotions	
-- Add these promotions as "compensation" to civs that have elephant-based UU's
INSERT INTO Unit_FreePromotions(UnitType, PromotionType) VALUES ('UNIT_INDIAN_WARELEPHANT', 'PROMOTION_WOODSMAN');
INSERT INTO Unit_FreePromotions(UnitType, PromotionType) VALUES ('UNIT_SIAMESE_WARELEPHANT', 'PROMOTION_WOODSMAN');
INSERT INTO Unit_FreePromotions(UnitType, PromotionType) VALUES ('UNIT_CARTHAGINIAN_FOREST_ELEPHANT', 'PROMOTION_WOODSMAN');






--UnitPromotions_UnitCombats
-- Fixes required to allow Zeppelins and Helicopters to hover over water.  It breaks normal Helicopter unit embarkation, but that's probably ok.

DELETE FROM UnitPromotions_UnitCombats WHERE UnitCombatType='UNITCOMBAT_HELICOPTER' AND PromotionType='PROMOTION_EMBARKATION';
DELETE FROM UnitPromotions_UnitCombats WHERE UnitCombatType='UNITCOMBAT_HELICOPTER' AND PromotionType='PROMOTION_DEFENSIVE_EMBARKATION';
DELETE FROM UnitPromotions_UnitCombats WHERE UnitCombatType='UNITCOMBAT_HELICOPTER' AND PromotionType='PROMOTION_ALLWATER_EMBARKATION';


