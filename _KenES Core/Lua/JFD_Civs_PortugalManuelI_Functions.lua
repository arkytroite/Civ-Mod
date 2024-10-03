-- JFD_Civs_PortugalManuelI_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingRoyalTradingHouseID = GameInfoTypes["BUILDING_JFD_ROYAL_TRADING_HOUSE"]

local traitPortugalManuelIID = GameInfoTypes["TRAIT_JFD_PORTUGAL_MANUEL_I"]

local unitCosmographerID = GameInfoTypes["UNIT_JFD_COSMOGRAPHER"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--g_Religions_Table
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end

--g_Specialists_Table
local g_Specialists_Table = {}
local g_Specialists_Count = 1
for row in DB.Query("SELECT ID, GreatPeopleRateChange FROM Specialists WHERE ID > 0;") do 	
	g_Specialists_Table[g_Specialists_Count] = row
	g_Specialists_Count = g_Specialists_Count + 1
end

--JFD_PortugalManuelI_CityConstructed
local function JFD_PortugalManuelI_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--UNIQUE TRAIT
	if isGold then 
		if (not HasTrait(player, traitPortugalManuelIID)) then return end
		
		local city = player:GetCityByID(cityID)
		local numGPRMod = player:GetGreatPeopleRateModifier() + city:GetGreatPeopleRateModifier()
		-- local numPopPercent = 0
		local numPopSpecialists = 0
		
		--g_Specialists_Table
		local specialistsTable = g_Specialists_Table
		local numSpecialists = #specialistsTable
		for index = 1, numSpecialists do
			local row = g_Specialists_Table[index]
			local specialistID = row.ID
			local numSpecialists = city:GetSpecialistCount(specialistID)
			if numSpecialists > 0 then
				local numSpecialistGPP = row.GreatPeopleRateChange
				numSpecialistGPP = numSpecialistGPP + ((numSpecialistGPP*numGPRMod)/100)
				local numGPP = (numSpecialists*numSpecialistGPP)
				if city:IsCapital() then
					numGPP = (numGPP*2)
				end
				city:ChangeSpecialistGreatPersonProgressTimes100(specialistID, (numGPP*100))
				numPopSpecialists = numPopSpecialists + 1
			end
		end
		-- numPopPercent = ((numPopSpecialists/city:GetPopulation())*100)
		
		-- local mainReligionID = player:GetReligionCreatedByPlayer()
		-- if Player.HasStateReligion then
			-- mainReligionID = player:GetStateReligion()
		-- end
		-- if mainReligionID == -1 then
			-- mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
		-- end
		-- if mainReligionID == -1 then return end
		
		--g_Religions_Table
		-- local religionsTable = g_Religions_Table
		-- local numReligions = #religionsTable
		-- for index = 1, numReligions do
			-- local row = religionsTable[index]
			-- local religionID = row.ID
			-- city:ConvertPercentFollowers(mainReligionID, religionID, numPopPercent) 
		-- end
	end
	
	--UNIQUE BUILDING
	if buildingID == buildingRoyalTradingHouseID then
		local numGold = player:CalculateGoldRate()
				
		local city = player:GetCityByID(cityID)
		local plot = g_MapGetPlot(city:GetX(), city:GetY())
		for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:GetOwner() ~= playerID then
				local plotX = loopPlot:GetX()
				local plotY = loopPlot:GetY()
				local plotResourceID = loopPlot:GetResourceType()
				if plotResourceID > -1 and GameInfo.Resources[plotResourceID].ResourceClassType == "RESOURCECLASS_LUXURY" then
					loopPlot:SetOwner(playerID, cityID, true, true)
					loopPlot:SetRevealed(playerTeamID, true)		
					
					player:ChangeGold(numGold)
					if (player:IsHuman() and player:IsTurnActive()) then
						local hex = ToHexFromGrid(Vector2(plotX, plotY))
						Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR] [ICON_GOLD]", numGold), true)
					end
				end
			end
		end
	end
end
GameEvents.CityConstructed.Add(JFD_PortugalManuelI_CityConstructed)
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalManuelI_CityBoughtPlot
local function JFD_PortugalManuelI_CityBoughtPlot(playerID, cityID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE BUILDING
	local numGold = player:CalculateGoldRate()
				
	local city = player:GetCityByID(cityID)
	if city:IsHasBuilding(buildingRoyalTradingHouseID) then
		local plot = g_MapGetPlot(plotX, plotY)
		local plotResourceID = plot:GetResourceType()
		if plotResourceID > -1 and GameInfo.Resources[plotResourceID].ResourceClassType == "RESOURCECLASS_LUXURY" then
			player:ChangeGold(numGold)
			if (player:IsHuman() and player:IsTurnActive()) then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR] [ICON_GOLD]", numGold), true)
			end
		end
	end
end
GameEvents.CityBoughtPlot.Add(JFD_PortugalManuelI_CityBoughtPlot)
-------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalManuelI_CityInvestedBuilding
local function JFD_PortugalManuelI_CityInvestedBuilding(playerID, cityID, buildingID, value)
	local player = Players[playerID]
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitPortugalManuelIID)) then return end
	
	local city = player:GetCityByID(cityID)
	local numGPRMod = player:GetGreatPeopleRateModifier() + city:GetGreatPeopleRateModifier()
	-- local numPopPercent = 0
	local numPopSpecialists = 0
	
	--g_Specialists_Table
	local specialistsTable = g_Specialists_Table
	local numSpecialists = #specialistsTable
	for index = 1, numSpecialists do
		local row = g_Specialists_Table[index]
		local specialistID = row.ID
		local numSpecialists = city:GetSpecialistCount(specialistID)
		if numSpecialists > 0 then
			local numSpecialistGPP = row.GreatPeopleRateChange
			numSpecialistGPP = numSpecialistGPP + ((numSpecialistGPP*numGPRMod)/100)
			local numGPP = (numSpecialists*numSpecialistGPP)
			if city:IsCapital() then
				numGPP = (numGPP*2)
			end
			city:ChangeSpecialistGreatPersonProgressTimes100(specialistID, (numGPP*100))
			numPopSpecialists = numPopSpecialists + 1
		end
	end
	-- numPopPercent = ((numPopSpecialists/city:GetPopulation())*100)
	
	-- local mainReligionID = player:GetReligionCreatedByPlayer()
	-- if Player.HasStateReligion then
		-- mainReligionID = player:GetStateReligion()
	-- end
	-- if mainReligionID == -1 then
		-- mainReligionID = player:GetCapitalCity():GetReligiousMajority() 
	-- end
	-- if mainReligionID == -1 then return end
	
	--g_Religions_Table
	-- local religionsTable = g_Religions_Table
	-- local numReligions = #religionsTable
	-- for index = 1, numReligions do
		-- local row = religionsTable[index]
		-- local religionID = row.ID
		-- city:ConvertPercentFollowers(mainReligionID, religionID, numPopPercent) 
	-- end
end
if g_IsCPActive then
	GameEvents.CityInvestedBuilding.Add(JFD_PortugalManuelI_CityInvestedBuilding)
end
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalManuelI_UnitPrekill
local function JFD_PortugalManuelI_UnitPrekill(unitOwnerID, unitID, unitTypeID, plotX, plotY, isDelay, playerID)
	local player = Players[unitOwnerID]
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not player:IsAlive()) then return end
	if isDelay then return end
	if playerID ~= -1 then return end
	
	--UNIQUE UNIT
	if unitTypeID ~= unitCosmographerID then return end
	if g_MapGetPlot(plotX, plotY):GetImprovementType() ~= -1 then return end
	
	local playerCapital = player:GetCapitalCity()
	
	local currentTechID = player:GetCurrentResearch()
	if currentTechID == -1 then return end
	local numDistance = Map.PlotDistance(plotX, plotY, playerCapital:GetX(), playerCapital:GetY())
	local numScience = player:GetScience() + (numDistance*(GameInfo.Eras[player:GetCurrentEra()].StartingUnitMultiplier))
	teamTechs:ChangeResearchProgress(currentTechID, numScience, unitOwnerID)
	if (player:IsHuman() and player:IsTurnActive()) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", numScience), true)
	end
end
if (not g_IsVMCActive) then
	GameEvents.UnitPrekill.Add(JFD_PortugalManuelI_UnitPrekill)
end
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalManuelI_UnitCityFounded
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local function JFD_PortugalManuelI_UnitCityFounded(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not player:IsAlive()) then return end
	
	--UNIQUE UNIT
	if unitTypeID ~= unitCosmographerID then return end
	
	local playerCapital = player:GetCapitalCity()
	local currentTechID = player:GetCurrentResearch()
	if currentTechID == -1 then return end
	local numDistance = Map.PlotDistance(plotX, plotY, playerCapital:GetX(), playerCapital:GetY())
	local numScience = player:GetScience() + (numDistance*(GameInfo.Eras[player:GetCurrentEra()].StartingUnitMultiplier))
	teamTechs:ChangeResearchProgress(currentTechID, numScience, playerID)
	if (player:IsHuman() and player:IsTurnActive()) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_RESEARCH_RATE]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", numScience), true)
	end
end
if g_IsVMCActive then
	GameEvents.UnitCityFounded.Add(JFD_PortugalManuelI_UnitCityFounded)
end
--=======================================================================================================================
--=======================================================================================================================