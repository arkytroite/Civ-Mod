-- Adds +2 Happiness for each National Wonder
INSERT INTO Policy_BuildingClassHappiness(PolicyType, BuildingClassType, Happiness)
	SELECT 'POLICY_UNIVERSAL_HEALTHCARE_O', Type, 2
	FROM BuildingClasses
	WHERE MaxPlayerInstances = 1 AND DefaultBuilding IN
		(SELECT BuildingType FROM Building_PrereqBuildingClasses WHERE NumBuildingNeeded = -1);

-- Adds +2 Culture for each National Wonder
INSERT INTO Policy_BuildingClassCultureChanges(PolicyType, BuildingClassType, CultureChange)
	SELECT 'POLICY_UNIVERSAL_HEALTHCARE_O', Type, 2
	FROM BuildingClasses
	WHERE MaxPlayerInstances = 1 AND DefaultBuilding IN
		(SELECT BuildingType FROM Building_PrereqBuildingClasses WHERE NumBuildingNeeded = -1);
-----------------------
-- DATABASE TRIGGERS --
-----------------------
-- Adds entries for a inserted national wonder
CREATE TRIGGER MonumentParty_BuildingClasses_NewNationalWonderInsert
AFTER INSERT ON BuildingClasses
WHEN ((NEW.MaxPlayerInstances = 1) AND (NEW.DefaultBuilding IN (SELECT BuildingType FROM Building_PrereqBuildingClasses WHERE NumBuildingNeeded = -1)))
BEGIN
	INSERT INTO Policy_BuildingClassHappiness(PolicyType, BuildingClassType, Happiness)
	VALUES('POLICY_UNIVERSAL_HEALTHCARE_O', NEW.Type, 2);

	INSERT INTO Policy_BuildingClassCultureChanges(PolicyType, BuildingClassType, CultureChange)
	VALUES('POLICY_UNIVERSAL_HEALTHCARE_O', NEW.Type, 2);
END;

--INSERT INTO Building_PrereqBuildingClasses(BuildingType, NumBuildingNeeded)
--VALUES('BUILDING_NATIONAL_WONDER_TEST', -1);
--INSERT INTO BuildingClasses(Type, DefaultBuilding, MaxPlayerInstances)
--VALUES('BUILDINGCLASS_NATIONAL_WONDER_TEST', 'BUILDING_NATIONAL_WONDER_TEST', 1);


CREATE TRIGGER MonumentParty_Building_PrereqBuildingClasses_NewNationalWonderInsert
AFTER INSERT ON Building_PrereqBuildingClasses
WHEN ((NEW.NumBuildingNeeded = -1) AND (NEW.BuildingType IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = 1)))
BEGIN
	INSERT INTO Policy_BuildingClassHappiness(PolicyType, BuildingClassType, Happiness)
		SELECT 'POLICY_UNIVERSAL_HEALTHCARE_O', Type, 2
		FROM BuildingClasses
		WHERE NEW.BuildingType = DefaultBuilding;

	INSERT INTO Policy_BuildingClassCultureChanges(PolicyType, BuildingClassType, CultureChange)
		SELECT 'POLICY_UNIVERSAL_HEALTHCARE_O', Type, 2
		FROM BuildingClasses
		WHERE NEW.BuildingType = DefaultBuilding;
END;

--INSERT INTO BuildingClasses(Type, DefaultBuilding, MaxPlayerInstances)
--VALUES('BUILDINGCLASS_NATIONAL_WONDER_TEST3', 'BUILDING_NATIONAL_WONDER_TEST3', 1);
--INSERT INTO Building_PrereqBuildingClasses(BuildingType, NumBuildingNeeded)
--VALUES('BUILDING_NATIONAL_WONDER_TEST3', -1);

--TODO: Add triggers for edits that turn National Wonders into something else.