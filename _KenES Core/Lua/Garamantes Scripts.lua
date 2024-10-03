print ("Garamantes Scripts")

--------------------------
--Trade Route Movement
--------------------------

--------------------------
--Check later: Carvan Unit Tiles and Enemy ZoC
--------------------------

local pNoTerrainCost = GameInfoTypes.PROMOTION_IGNORE_TERRAIN_COST;
local pChariotRoute	= GameInfoTypes.PROMOTION_LIBYAN_CHARIOT_ROUTE;
local pNoMovement = GameInfoTypes.PROMOTION_ROUGH_TERRAIN_ENDS_TURN;
local pWood = GameInfoTypes.PROMOTION_WOODSMAN;

local fForest = GameInfoTypes.FEATURE_FOREST;
local fJungle = GameInfoTypes.FEATURE_JUNGLE;
local fOasis = GameInfoTypes.FEATURE_OASIS;

local tDesert = GameInfoTypes.TERRAIN_DESERT;
local tPlains = GameInfoTypes.TERRAIN_PLAINS;

local iFoggora = GameInfoTypes.IMPROVEMENT_GARAMANTES_MOD_FOGGORA;
local iFoggoraDummy = GameInfoTypes.IMPROVEMENT_GARAMANTES_MOD_FOGGORA_DUMMY;

local uCargo = GameInfoTypes.UNIT_CARGO_SHIP;
local uCaravan = GameInfoTypes.UNIT_CARAVAN;
local uChariot = GameInfoTypes.UNIT_CHARIOT_ARCHER;
local uWarChariot = GameInfoTypes.UNIT_EGYPTIAN_WARCHARIOT;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

function GetTradeRouteString(pPlot, pPlayer, pUnit)
	local strTradeRouteStr = "";
	local astrTradeRouteStrings = pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot);			
	for i,v in ipairs(astrTradeRouteStrings) do	
		if (strTradeRouteStr == "") then
			strTradeRouteStr = strTradeRouteStr .. Locale.ConvertTextKey("TXT_KEY_TRADE_ROUTE_TT_PLOT_HEADING");
		else
			strTradeRouteStr = strTradeRouteStr .. "[NEWLINE]";
		end
		strTradeRouteStr = strTradeRouteStr .. v.String;
	end	
	return strTradeRouteStr;
end

GameEvents.UnitSetXY.Add( 
function(iPlayerID, iUnitID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[iPlayerID]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	if pPlot then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then
			if (pUnit:GetUnitType() ~= uCargo) and (pUnit:GetUnitType() ~= uCaravan) then
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and not pUnit:IsEmbarked() then 
					local strTradeRouteStr = GetTradeRouteString(pPlot, pPlayer, pUnit)
					if strTradeRouteStr ~= "" then		
						if (pPlayer:IsHuman()) then --Might confuse AI movement?
							if not pUnit:IsHasPromotion(pNoTerrainCost) then
								if not pUnit:IsHasPromotion(pChariotRoute) then
									pUnit:SetHasPromotion(pChariotRoute, true)
								end
							end	
							if (pUnit:GetUnitType() == uChariot) or (pUnit:GetUnitType() == uWarChariot) then
								if pUnit:IsHasPromotion(pNoMovement) then
									pUnit:SetHasPromotion(pNoMovement, false)
								end
							end						
						end
					elseif strTradeRouteStr == "" then
						if (pPlayer:IsHuman()) then
							if pUnit:IsHasPromotion(pChariotRoute) then
								pUnit:SetHasPromotion(pChariotRoute, false)
								if pPlot:IsRoughGround() and not pPlot:IsRoute() then
									if not pUnit:IsHasPromotion(pWood) then
										pUnit:ChangeMoves(-60)
									elseif pUnit:IsHasPromotion(pWood) then
										if (pPlot:GetFeatureType() ~= fForest) and (pPlot:GetFeatureType() ~= fJungle) then
											pUnit:ChangeMoves(-60)
										end
									end
								end
							end
							if (pUnit:GetUnitType() == uChariot) or (pUnit:GetUnitType() == uWarChariot) then
								if not pUnit:IsHasPromotion(pNoMovement) then
									pUnit:SetHasPromotion(pNoMovement, true)
									if pPlot:IsRoughGround() and not pPlot:IsRoute() then
										local MovesLeft = pUnit:GetMoves();
										pUnit:ChangeMoves(-MovesLeft)
									end
								end
							end		
						end
					end
				end
			end
		end
	end
end);

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local iCurrentTurn = Game.GetGameTurn()
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then
		for pUnit in pPlayer:Units() do		
			if (pUnit:GetUnitType() ~= uCargo) and (pUnit:GetUnitType() ~= uCaravan) then
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and not pUnit:IsEmbarked() then 
					local pPlot = pUnit:GetPlot()
					local strTradeRouteStr = GetTradeRouteString(pPlot, pPlayer, pUnit)				
					if strTradeRouteStr ~= "" then	
						if (pPlayer:IsHuman()) then		
							if not pUnit:IsHasPromotion(pNoTerrainCost) then
								if not pUnit:IsHasPromotion(pChariotRoute) then
									pUnit:SetHasPromotion(pChariotRoute, true)
								end
							end	
							if (pUnit:GetUnitType() == uChariot) or (pUnit:GetUnitType() == uWarChariot) then
								if pUnit:IsHasPromotion(pNoMovement) then
									pUnit:SetHasPromotion(pNoMovement, false)
								end
							end		
						end	
						if pUnit:GetMoves() ~= 0 then				
							local pMax = pUnit:MaxMoves();
							pUnit:SetMoves(pMax + 60);
							--AI Handicap
							if not (pPlayer:IsHuman()) then
								if (pUnit:GetGameTurnCreated() == iCurrentTurn) then
									if not pUnit:IsHasPromotion(pNoTerrainCost) then
										if not pUnit:IsHasPromotion(pChariotRoute) then
											pUnit:SetHasPromotion(pChariotRoute, true)
										end
									end	
								end
							end
							--
						end
					elseif strTradeRouteStr == "" then
						if (pPlayer:IsHuman()) then
							if pUnit:IsHasPromotion(pChariotRoute) then
								pUnit:SetHasPromotion(pChariotRoute, false)
							end
							if (pUnit:GetUnitType() == uChariot) or (pUnit:GetUnitType() == uWarChariot) then
								if not pUnit:IsHasPromotion(pNoMovement) then
									pUnit:SetHasPromotion(pNoMovement, true)
								end
							end
						end
					end
				end
			end
			--AI Handicap
			if not (pPlayer:IsHuman()) then
				if (pUnit:GetGameTurnCreated() ~= iCurrentTurn) then
					if pUnit:IsHasPromotion(pChariotRoute) then
						pUnit:SetHasPromotion(pChariotRoute, false)
					end
				end
			end
			--
		end
	end
end);

--------------------------
--City Fresh Water
--------------------------

local fFoggoras = GameInfoTypes.FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER
local tSnow = GameInfoTypes.TERRAIN_SNOW
local bGarden = GameInfoTypes.BUILDING_GARDEN;

local isHarappa = (GameInfoTypes.CIVILIZATION_HARAPPA_MOD ~= nil);

local cGarama = GameInfoTypes.CIVILIZATION_ARABIA;
local cHarappa = GameInfoTypes.CIVILIZATION_ARABIA;

if isHarappa then
	cHarappa = GameInfoTypes.CIVILIZATION_HARAPPA_MOD;
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			local cPlot = pCity:Plot();
			if (pPlayer:GetCivilizationType() ~= cGarama) and (pPlayer:GetCivilizationType() ~= cHarappa) then
				if cPlot:GetFeatureType() == fFoggoras then
					cPlot:SetFeatureType(-1);
				end
			end
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then
				local DesertCheck = 0;
				if (cPlot:GetImprovementType() == iFoggora) or (cPlot:GetImprovementType() == iFoggoraDummy) --[[or (cPlot:GetFeatureType() == fOasis) --]]then
					DesertCheck = 1;
				end
				for loop, direction in ipairs(directions) do
					local dPlot = Map.PlotDirection(cPlot:GetX(), cPlot:GetY(), direction);
					if (dPlot:GetImprovementType() == iFoggora) or (dPlot:GetImprovementType() == iFoggoraDummy) --[[or (dPlot:GetFeatureType() == fOasis) --]]then
						DesertCheck = 1;
						break
					end
				end
				if DesertCheck >= 1 then
					if cPlot:GetFeatureType() == fFoggoras then
						cPlot:SetFeatureType(-1);
					end
					if cPlot:IsFreshWater() then
						if cPlot:GetFeatureType() == -1 then
							cPlot:SetFeatureType(fFoggoras);
						end
					end
				end
			end
		end
	end
end);


GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	if (pPlayer:IsAlive()) then
		if pPlot:GetFeatureType() == fFoggoras then
			pPlot:SetFeatureType(-1);
		end
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then
			local DesertCheck = 0;
			if (pPlot:GetImprovementType() == iFoggora) or (pPlot:GetImprovementType() == iFoggoraDummy) --[[or (pPlot:GetFeatureType() == fOasis) --]]then
				DesertCheck = 1;
			end
			for loop, direction in ipairs(directions) do
				local dPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
				if (dPlot:GetImprovementType() == iFoggora) or (dPlot:GetImprovementType() == iFoggoraDummy) --[[or (dPlot:GetFeatureType() == fOasis) --]]then
					DesertCheck = 1;
					break
				end
			end
			if DesertCheck >= 1 then
				if pPlot:GetFeatureType() == fFoggoras then
					pPlot:SetFeatureType(-1);
				end
				if pPlot:IsFreshWater() then
					if pPlot:GetFeatureType() == -1 then
						pPlot:SetFeatureType(fFoggoras);
					end
				end
			end
		end
	end
end);

--------------------------
--UI Fresh Water
--------------------------

function DecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function CompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local FoggoraPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:GetImprovementType() == iFoggora) or (pPlot:GetImprovementType() == iFoggoraDummy) then
		local sKey = CompilePlotID(pPlot)
		FoggoraPlots[sKey] = -1
    end
end

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlot = Map.GetPlot(x, y);
	if (eImprovement == iFoggora) or (eImprovement == iFoggoraDummy) then
		local sKey = CompilePlotID(pPlot)						
		FoggoraPlots[sKey] = -1
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	for sKey, tTable in pairs(FoggoraPlots) do
		local pPlot = DecompilePlotID(sKey)
		if (pPlot:GetImprovementType() == iFoggora) or (pPlot:GetImprovementType() == iFoggoraDummy) then
			if pPlot:GetFeatureType() == -1 then
				pPlot:SetFeatureType(fFoggoras);
			end
		elseif (pPlot:GetImprovementType() ~= iFoggora) and (pPlot:GetImprovementType() ~= iFoggoraDummy) and not pPlot:IsCity() then
			if pPlot:GetFeatureType() == fFoggoras then
				pPlot:SetFeatureType(-1);
			end
		end
	end
end);

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlot = Map.GetPlot(x, y);
	if eImprovement == iFoggora then
		if pPlot:GetFeatureType() == -1 then
			pPlot:SetFeatureType(fFoggoras);
		end
	end
	if eImprovement == iFoggoraDummy then
		pPlot:SetImprovementType(-1)
		pPlot:SetImprovementType(iFoggora)
		if pPlot:GetFeatureType() == -1 then
			pPlot:SetFeatureType(fFoggoras);
		end
	end
	if (eImprovement ~= iFoggora) and (eImprovement ~= iFoggoraDummy) then
		if pPlot:GetFeatureType() == fFoggoras then
			pPlot:SetFeatureType(-1);
		end
	end
end);

--------------------------
--UI Desert Hills Worker Switch
--------------------------

local uWorker = GameInfoTypes.UNIT_WORKER;
local uWorkerGarama = GameInfoTypes.UNIT_GARAMA_DUMMY;

local isCiD = false
local CiDID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == CiDID) then
		isCiD = true
		break
	end
end

GameEvents.UnitSetXY.Add( 
function(iPlayerID, iUnitID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[iPlayerID]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	if pPlot then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) and (pPlayer:IsHuman()) then
			if (pUnit:GetUnitType() == uWorker) then
				if (pPlot:GetTerrainType() == tDesert) and (pPlot:IsHills()) and not pPlot:IsCity() and (pPlot:GetResourceType() == -1) then
					local UnitMoves = pUnit:GetMoves()
					pUnit:SetMoves(0);
					local newUnit = pPlayer:InitUnit(uWorkerGarama, pUnit:GetX(), pUnit:GetY())
					newUnit:Convert(pUnit);
					newUnit:SetMoves(0);
					newUnit:SetMoves(UnitMoves);
				end
			end
			if (pUnit:GetUnitType() == uWorkerGarama) then
				if (pPlot:GetTerrainType() ~= tDesert) or not (pPlot:IsHills()) then
					local UnitMoves = pUnit:GetMoves()
					pUnit:SetMoves(0);
					local newUnit = pPlayer:InitUnit(uWorker, pUnit:GetX(), pUnit:GetY())
					newUnit:Convert(pUnit);
					newUnit:SetMoves(0);
					newUnit:SetMoves(UnitMoves);
				end
			end
			if isCiD then
				local uWorker2 = GameInfoTypes.UNIT_JFD_WORKER;
				local uWorkerGarama2 = GameInfoTypes.UNIT_JFD_WORKER_GARAMA;
				if (pUnit:GetUnitType() == uWorker2) then
					if (pPlot:GetTerrainType() == tDesert) and (pPlot:IsHills()) and not pPlot:IsCity() and (pPlot:GetResourceType() == -1) then
						local UnitMoves = pUnit:GetMoves()
						pUnit:SetMoves(0);
						local newUnit = pPlayer:InitUnit(uWorkerGarama2, pUnit:GetX(), pUnit:GetY())
						newUnit:Convert(pUnit);
						newUnit:SetMoves(0);
						newUnit:SetMoves(UnitMoves);
					end
				end
				if (pUnit:GetUnitType() == uWorkerGarama2) then
					if (pPlot:GetTerrainType() ~= tDesert) or not (pPlot:IsHills()) then
						local UnitMoves = pUnit:GetMoves()
						pUnit:SetMoves(0);
						local newUnit = pPlayer:InitUnit(uWorker2, pUnit:GetX(), pUnit:GetY())
						newUnit:Convert(pUnit);
						newUnit:SetMoves(0);
						newUnit:SetMoves(UnitMoves);
					end
				end
			end
		end
	end
end);

local uNomad = GameInfoTypes.UNIT_LIBYAN_NOMAD_MOD;
local pNomadUU = GameInfoTypes.PROMOTION_LIBYAN_NOMAD;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ARABIA) then		
		for pUnit in pPlayer:Units() do	
			if (pUnit:GetUnitType() == uWorkerGarama) then
				local pPlot = pUnit:GetPlot();
				pUnit:Kill();
				aUnit = pPlayer:InitUnit(uWorker, pPlot:GetX(), pPlot:GetY(), UNITAI_WORKER);
			end
			if pUnit:IsHasPromotion(pNomadUU) and not (pUnit:GetUnitType() == uNomad) then
				pUnit:SetHasPromotion(pNomadUU, false)
			end
			if isCiD then
				local uWorker2 = GameInfoTypes.UNIT_JFD_WORKER;
				local uWorkerGarama2 = GameInfoTypes.UNIT_JFD_WORKER_GARAMA;
				if (pUnit:GetUnitType() == uWorkerGarama2) then
					local pPlot = pUnit:GetPlot();
					pUnit:Kill();
					aUnit = pPlayer:InitUnit(uWorker2, pPlot:GetX(), pPlot:GetY(), UNITAI_WORKER);
				end
			end
		end
	elseif (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then	
		for pUnit in pPlayer:Units() do	
			if pUnit:IsHasPromotion(pNomadUU) and not (pUnit:GetUnitType() == uNomad) then
				pUnit:SetHasPromotion(pNomadUU, false)
			end
		end
	end
end);
--------------------------
--UU Limit
--------------------------

local ucScout = GameInfoTypes.UNITCLASS_SCOUT;

GameEvents.CityCanTrain.Add(
function(player, city, unitType) 
	local pPlayer = Players[player];
	local pCity = pPlayer:GetCityByID(city);
	local cPlot = pCity:Plot()
	local ScoutCount = pPlayer:GetUnitClassCount(ucScout);
	local NomadLimit = 0;
	local mSize = Map.GetWorldSize();
	if (mSize == GameInfo.Worlds['WORLDSIZE_DUEL'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_TINY'].ID) then
		NomadLimit = 4;
	elseif (mSize == GameInfo.Worlds['WORLDSIZE_SMALL'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_STANDARD'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_LARGE'].ID) then
		NomadLimit = 6;
	elseif (mSize == GameInfo.Worlds['WORLDSIZE_HUGE'].ID) then
		NomadLimit = 8;
	else
		NomadLimit = 8;
	end
  	if (unitType == uNomad) then
		if ScoutCount >= NomadLimit then
			return false
		end
	end
	return true
end);

for pPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
	local pPlayer = Players[pPlayer];
	if pPlayer:IsEverAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) then
			local NomadLimit = 0;
			local mSize = Map.GetWorldSize();
			if (mSize == GameInfo.Worlds['WORLDSIZE_DUEL'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_TINY'].ID) then
				NomadLimit = 4;
			elseif (mSize == GameInfo.Worlds['WORLDSIZE_SMALL'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_STANDARD'].ID) or (mSize == GameInfo.Worlds['WORLDSIZE_LARGE'].ID) then
				NomadLimit = 6;
			elseif (mSize == GameInfo.Worlds['WORLDSIZE_HUGE'].ID) then
				NomadLimit = 8;
			else
				NomadLimit = 8;
			end
			local Lang = Locale.GetCurrentLanguage().Type;
			if Lang == "en_US" then
				local tquery = {"UPDATE Language_en_US SET Text = 'Unrivalled Recon Unit that excels at moving over Desert Tiles and scouting Rival Territory.[NEWLINE][NEWLINE]Maximum of ".. NomadLimit .." of these Units in your empire.' WHERE Tag = 'TXT_KEY_UNIT_LIBYAN_NOMAD_MOD_HELP'"}
				for i,iQuery in pairs(tquery) do
					for result in DB.Query(iQuery) do
					end
				end
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			end
		end
	end
end

--------------------------
--AI Handle
--------------------------

local tEngineering = GameInfo.Technologies["TECH_ENGINEERING"].ID
local bGaraDummy = GameInfoTypes.BUILDING_GARAMA_DUMMY;

local AIGaramaPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:GetTerrainType() == tDesert) and (pPlot:IsHills()) then
		local sKey = CompilePlotID(pPlot)
		AIGaramaPlots[sKey] = -1
    end
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) and not (pPlayer:IsHuman()) then
		if (Teams[pTeam]:IsHasTech(tEngineering)) then
			if Teams[pTeam]:GetAtWarCount(true) == 0 then
				local AIFoggarasCheck = 1;
				for sKey, tTable in pairs(AIGaramaPlots) do
					local pPlot = DecompilePlotID(sKey)
					if pPlot:GetOwner() ~= -1 then
						if pPlot:GetOwner() == iPlayer then
							if pPlot:GetFeatureType() == -1 and pPlot:GetImprovementType() == -1 and pPlot:GetResourceType() == -1 and not pPlot:IsUnit() and not pPlot:IsCity() and not pPlot:IsMountain() and not pPlot:IsImpassable() then
								if AIFoggarasCheck > 0 then
									AIFoggarasCheck = AIFoggarasCheck - 1;							
									pPlot:SetImprovementType(iFoggora)
									pPlot:SetFeatureType(fFoggoras);
									local sKey = CompilePlotID(pPlot)
									FoggoraPlots[sKey] = -1
								end
							end
						end
					end
				end
			end
		end
	end
end);

local iFarm = GameInfoTypes.IMPROVEMENT_FARM
local iMine = GameInfoTypes.IMPROVEMENT_MINE

function GaramaGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == tEngineering) then
		local gPlayer = 0;
		local pTeam = 999;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) and not (pPlayer:IsHuman()) then
					gPlayer = pPlayer;
					pTeam = pPlayer:GetTeam();
				end
			end
		end
		if gPlayer ~= 0 then
			if pTeam == iTeam then
				for sKey, tTable in pairs(AIGaramaPlots) do
					local pPlot = DecompilePlotID(sKey)
					if pPlot:GetOwner() ~= -1 then
						local gID = gPlayer:GetID()			
						if pPlot:GetOwner() == gID then
							if pPlot:GetFeatureType() == -1 and pPlot:GetResourceType() == -1 and not pPlot:IsUnit() and not pPlot:IsCity() and not pPlot:IsMountain() and not pPlot:IsImpassable() then
								if (pPlot:GetImprovementType() == iFarm) then
									pPlot:SetImprovementType(-1)
									pPlot:SetImprovementType(iFoggora)
									pPlot:SetFeatureType(fFoggoras);
									local sKey = CompilePlotID(pPlot)
									FoggoraPlots[sKey] = -1
								elseif (pPlot:GetImprovementType() == iMine) then
									local gRandom = GaramaGetRandom(1, 2)
									if gRandom == 1 then
										pPlot:SetImprovementType(-1)
										pPlot:SetImprovementType(iFoggora)
										pPlot:SetFeatureType(fFoggoras);
										local sKey = CompilePlotID(pPlot)
										FoggoraPlots[sKey] = -1
									end
								end
							end
						end
					end
				end
			end
		end
	end
end);

--[[
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ARABIA) and not (pPlayer:IsHuman()) then		
		local pTeam = pPlayer:GetTeam();
		if Teams[pTeam]:GetAtWarCount(true) == 0 then
			for pUnit in pPlayer:Units() do	
				if (pUnit:GetUnitType() == uWorker) then	
					local pPlot = pUnit:GetPlot();
					if (pPlot:GetTerrainType() == tDesert) then
						local Moves = pUnit:GetMoves();
						if (Moves <= 120) and (Moves > 0) then				
							local pMax = pUnit:MaxMoves();
							pUnit:SetMoves(pMax + 60);
						end
					end
				end
			end
		end
	end
end);
--]]