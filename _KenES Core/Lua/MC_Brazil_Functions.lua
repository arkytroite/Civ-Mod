
include("C15_IteratorPack_v4.lua")


local sTrait = "TRAIT_MC_ESTADO_NOVO"

local tValidLeaders = {}
for row in DB.Query("SELECT ID FROM Leaders WHERE Type IN (SELECT LeaderType FROM Leader_Traits WHERE TraitType = '" .. sTrait .. "')") do
	tValidLeaders[row.ID] = true
end

local iUU = GameInfoTypes["UNIT_BRAZILIAN_PRACINHA"]
local tUB = GameInfo.Buildings["BUILDING_MC_BRAZILIAN_SIDERURGICA"]
local iUB = tUB.ID

local tPolicyFactoryProductionModifiers = {}
for row in DB.Query("SELECT a.ID iPolicy, b.YieldMod Modifier FROM Policies a, Policy_BuildingClassYieldModifiers b, Buildings c WHERE a.Type = b.PolicyType AND b.BuildingClassType = c.BuildingClass AND b.YieldType = 'YIELD_PRODUCTION' AND c.Type = '" .. tUB.Type .. "'") do
	tPolicyFactoryProductionModifiers[row.iPolicy] = row.Modifier
end

local iUBProdModifier = 0
for row in DB.Query("SELECT Yield FROM Building_YieldModifiers WHERE BuildingType = '" .. tUB.Type .. "' AND YieldType = 'YIELD_PRODUCTION'") do
	iUBProdModifier = iUBProdModifier + row.Yield
end

local tPolicyBranchPolicies = {}
for row in DB.Query("SELECT a.ID iBranch, b.ID iPolicy FROM PolicyBranchTypes a, Policies b WHERE a.FreePolicy = b.Type") do
	tPolicyBranchPolicies[row.iBranch] = row.iPolicy
end

local tWonders = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxGlobalInstances = 1 OR MaxTeamInstances = 1 OR MaxPlayerInstances = 1)") do
	tWonders[row.ID] = true
end

local tStratResources = {}
for row in DB.Query("SELECT ID FROM Resources WHERE ResourceUsage = 1") do -- I hate that I've made this my standard but aiyah
	tStratResources[row.ID] = true
end

local iDoFDummy = GameInfoTypes["BUILDING_"] -- +5% Culture and Production
local iUUProductionDummy = GameInfoTypes["BUILDING_"] -- Uses the table Unit_ProductionModifierBuildings
local iUBCultureModifierDummy = GameInfoTypes["BUILDING_"] -- +1% Culture
local iUBHappinessDummy = GameInfoTypes["BUILDING_"] -- +1 Happiness

local iDoFLimit = 10 -- The number of dummies
local iUULimit = 10 -- 4 doesn't go into 30, btw

function C15_Pooky_Vargas_HandleUBDummies(pPlayer, pCity)
	if pCity:IsHasBuilding(iUB) then
		local iModifier = iUBProdModifier
		for k, v in pairs(tPolicyFactoryProductionModifiers) do
			if pPlayer:HasPolicy(k) then
				iModifier = iModifier + v
			end
		end
		
		pCity:SetNumRealBuilding(iUBCultureModifierDummy, iModifier)
	else
		pCity:SetNumRealBuilding(iUBCultureModifierDummy, 0)
	end
end

function C15_Pooky_Vargas_UpdateHappinessDummies(pCity)
	local iCount = 0
	local tStrats = {}
	for i = 0, pCity:GetNumCityPlots() - 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot and pPlot:GetWorkingCity() == pCity and pPlot:IsBeingWorked() then
			local iResource = pPlot:GetResourceType(teamID)
			if tStratResources[iResource] and not tStrats[iResource] then
				local iImprovement = pPlot:GetImprovementType()
				if pPlot:IsResourceConnectedByImprovement(iImprovement) then -- God I swear I found something funny about this function but I don't remember whattt
					iCount = iCount + 1
					tStrats[iResource] = true
				end
			end
		end
	end
	
	pCity:SetNumRealBuilding(iUBHappinessDummy, iCount)
end

function C15_Pooky_Vargas_UBDummiesUI()
	local pPlayer = Game.GetActivePlayer()
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iUB) or pCity:IsHasBuilding(iUBHappinessDummy) then
			C15_Pooky_Vargas_UpdateHappinessDummies(pCity)
		end
	end
end

-- These Events don't cover every way in which plot work-ship can be changed, so if you aren't happy with that then just delete them and declare the effect as being decided at turn start or w/e
Events.SerialEventExitCityScreen.Add(C15_Pooky_Vargas_UBDummiesUI)
Events.SerialEventCityScreenDirty.Add(C15_Pooky_Vargas_UBDummiesUI)

function C15_Pooky_Vargas_DoTurn(playerID)
	local pPlayer = Players[playerID]
	local iDoFCount = 0
	local teamID = pPlayer:GetTeam()
	if tValidLeaders[pPlayer:GetLeaderType()] then
		local pTeam = Teams[teamID]
		for pIterPlayer in C15_MajorIterator() do
			local iOtherTeam = pIterPlayer:GetTeam()
			if pTeam:IsHasMet(iOtherTeam) and pIterPlayer:IsDoF(playerID) then
				iDoFCount = iDoFCount + 1
			end
		end
	end
	
	if iDoFCount > 0 or pPlayer:CountNumBuildings(iDoFDummy) > 0 or pPlayer:CountNumBuildings(iUUDummyCount) > 0 or pPlayer:CountNumBuildings(iUB) > 0 or pPlayer:CountNumBuildings(iUBCultureModifierDummy) > 0 or pPlayer:CountNumBuildings(iUBHappinessDummy) > 0 then
		local iDoFDummyCount = math.min(iDoFLimit, iDoFCount)
		local iUUDummyCount = math.min(iUULimit, iDoFCount)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iDoFDummyCount, iDoFDummyCount)
			pCity:SetNumRealBuilding(iUUDummyCount, iUUDummyCount)
			C15_Pooky_Vargas_HandleUBDummies(pPlayer, pCity)
			if pCity:IsHasBuilding(iUB) then
				C15_Pooky_Vargas_UpdateHappinessDummies(pCity)
			elseif pCity:IsHasBuilding(iUBHappinessDummy) then -- Woo arbitrarity
				pCity:SetNumRealBuilding(iUBHappinessDummy, 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Pooky_Vargas_DoTurn)


function C15_Pooky_Vargas_Constructed(playerID, cityID, iBuilding)
	if iBuilding == iUB then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		C15_Pooky_Vargas_HandleUBDummies(pPlayer, pCity)
	end
end

GameEvents.CityConstructed.Add(C15_Pooky_Vargas_Constructed)

function C15_Pooky_Vargas_Policy(playerID, iPolicy)
	local pPlayer = Players[playerID]
	local bGACondition = pPlayer:IsGoldenAge() and tValidLeaders[pPlayer:GetLeaderType()]
	local bFactoryPolicy = tPolicyFactoryProductionModifiers[iPolicy]
	if bFactoryPolicy or bGACondition then
		for pCity in pPlayer:Cities() do
			if bGACondition then
				local iCurrentBuilding = pCity:GetProductionBuilding()
				if iCurrentBuilding > -1 and (not tWonders[iCurrentBuilding]) then
					local iProdDiff = pCity:GetProductionNeeded(-1, pCity:GetProductionBuilding()) - pCity:GetProduction()
					if iProdDiff > 0 then
						pCity:ChangeBuildingProduction(iCurrentBuilding, iProdDiff)
					end
				end
			end
			if bFactoryPolicy then
				C15_Pooky_Vargas_HandleUBDummies(pPlayer, pCity)
			end
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(C15_Pooky_Vargas_Policy)

function C15_Pooky_Vargas_Policy_Branch(playerID, iBranch)
	local iPolicy = tPolicyBranchPolicies[iBranch]
	if iPolicy then
		C15_Pooky_Vargas_Policy(playerID, iPolicy)
	end
end

GameEvents.PlayerAdoptPolicyBranch.Add(C15_Pooky_Vargas_Policy_Branch)