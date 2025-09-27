--------------------------------------------------------------------------------------------
-- Update scale of some improvements/features
--------------------------------------------------------------------------------------------

UPDATE ArtDefine_Landmarks
SET Scale = Scale * CASE
	----
    WHEN ResourceType = 'ART_DEF_FEATURE_ATOLL'
      OR ImprovementType IN ('ART_DEF_IMPROVEMENT_BRAZILWOOD_CAMP', 'ART_DEF_IMPROVEMENT_FEITORIA')
    THEN 1.05

	----
    WHEN ImprovementType IN ('ART_DEF_IMPROVEMENT_PLANTATION', 'ART_DEF_IMPROVEMENT_FORT')
    OR ResourceType IN (
        SELECT 'ART_DEF_' || ResourceType
        FROM Improvement_ResourceTypes
		WHERE ImprovementType = 'IMPROVEMENT_PLANTATION'
    )
	OR ResourceType = 'ART_DEF_RESOURCE_SPICE'
    THEN 0.85

	----
    WHEN ResourceType = 'ART_DEF_RESOURCE_WHEAT'
      AND ImprovementType = 'ART_DEF_IMPROVEMENT_NONE'
    THEN 0.85

	----
    WHEN ImprovementType IN (
        'ART_DEF_IMPROVEMENT_MINE',
        'ART_DEF_IMPROVEMENT_MANUFACTORY',
        'ART_DEF_IMPROVEMENT_CUSTOMS_HOUSE',
        'ART_DEF_IMPROVEMENT_CITADEL',
        'ART_DEF_IMPROVEMENT_ACADEMY',
        'ART_DEF_IMPROVEMENT_TERRACE_FARM'
    )
	OR (
		ResourceType IN (
			SELECT 'ART_DEF_' || ResourceType
			FROM Improvement_ResourceTypes
			WHERE ImprovementType IN ('IMPROVEMENT_MINE', 'IMPROVEMENT_QUARRY')
		)
		AND ImprovementType <> 'ART_DEF_IMPROVEMENT_QUARRY'
	)
    THEN 0.80

	----
    WHEN ImprovementType IN (
        'ART_DEF_IMPROVEMENT_MONOLITH_AFRI',
        'ART_DEF_IMPROVEMENT_MONOLITH_AMER',
        'ART_DEF_IMPROVEMENT_MONOLITH_ASIA',
        'ART_DEF_IMPROVEMENT_MONOLITH_EURO',
        'ART_DEF_IMPROVEMENT_TRADING_POST',
        'ART_DEF_IMPROVEMENT_TRADING_POST1',
        'ART_DEF_IMPROVEMENT_TRADING_POST2',
        'ART_DEF_IMPROVEMENT_TRADING_POST3',
        'ART_DEF_IMPROVEMENT_TRADING_POST4',
        'ART_DEF_IMPROVEMENT_POLDER'
    )
    THEN 0.95

    ELSE 1.0 -- leave others unchanged
END;

--------------------------------------------------------------------------------------------
-- Double aircraft animation speed
--------------------------------------------------------------------------------------------

UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 2*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 2*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 2*TurnRateMax WHERE MoveRate > 0;

--------------------------------------------------------------------------------------------
-- Allow all GPTIs to improve every resource
--------------------------------------------------------------------------------------------

DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType IN (
    SELECT Type FROM Improvements WHERE CreatedByGreatPerson = 1
);

INSERT INTO Improvement_ResourceTypes (ImprovementType, ResourceType)
SELECT i.Type, r.Type
FROM Improvements i
CROSS JOIN Resources r
WHERE i.CreatedByGreatPerson = 1
  AND r.Type NOT IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS')
  AND r.OnlyMinorCivs = 0
  AND r.CivilizationType IS NULL;