-- Nuclear Program
-- Author: Machiavelli
-- DateCreated: 9/28/2013 12:05:36 PM
--------------------------------------------------------------
-- Gives exp to certain units classes
function GiveExperienceForSpaceshipFactory(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local policyID = GameInfoTypes["POLICY_SPACEFLIGHT_PIONEERS"];

	if(player:HasPolicy(policyID) and not player:IsPolicyBlocked(policyID) and unit:GetPlot():IsCity()) then
		-- Give promotion to missles
		if(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_ATOMIC_BOMB"] or unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_NUCLEAR_MISSILE"] or unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_GUIDED_MISSILE"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_NUCLEAR_PROGRAM"], true);
		end
		
		-- Give exp to GDR
		local city = unit:GetPlot():GetPlotCity();
		local buildingType = GetBuildingTypeFromClass("BUILDINGCLASS_SPACESHIP_FACTORY", player:GetCivilizationType());
		
		if(buildingType ~= nil and city:IsHasBuilding(GameInfoTypes[buildingType]) and unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_MECH"]) then
			unit:ChangeExperience(15);
		end
	end
end
LuaEvents.SerialEventUnitCreatedGood.Add(GiveExperienceForSpaceshipFactory);

--------------------
-- Private helper functions
--------------------
function GetBuildingTypeFromClass(buildingClass, civilizationTypeID)
	-- Assume it is the default building
	local buildingType = GameInfo.BuildingClasses[buildingClass].DefaultBuilding;

	-- See if this civilization has a unique building for this building class
	local condition = "CivilizationType = '" .. GameInfo.Civilizations[civilizationTypeID].Type .. "' AND BuildingClassType = '" .. buildingClass .. "'";
	for row in GameInfo.Civilization_BuildingClassOverrides(condition) do
		buildingType = row.BuildingType;
		return buildingType;
	end

	return buildingType;
end