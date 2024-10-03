-- Store the original positions of units
local unitOriginalPositions = {}
-- Flag to disable the event handler temporarily
local disableOnUnitSetXY = false

-- Natural Wonder Features
local naturalWonderFeatures = {}
for row in DB.Query("SELECT ID FROM Features WHERE Impassable = 1") do
    naturalWonderFeatures[#naturalWonderFeatures + 1] = row.ID
end

-- Cache players with traits and unit promotions
local tTraitPlayers = {}
for row in DB.Query("SELECT a.ID LeaderID FROM Leaders a, Leader_Traits b, Traits c WHERE a.Type = b.LeaderType AND b.TraitType = c.Type AND c.CrossesMountainsAfterGreatGeneral = 1") do
    tTraitPlayers[row.LeaderID] = true
end

function HasTrait(player)
    return tTraitPlayers[player:GetLeaderType()] ~= nil
end

local hoveringPromotion = GameInfo.UnitPromotions["PROMOTION_HOVERING_UNIT"].ID
local tbmUnitID = GameInfo.Units["UNIT_TBM"].ID

function GiveTunnelPromotion(playerID, unitID)
    local player = Players[playerID]
    local unit = player:GetUnitByID(unitID)
    local plot = unit:GetPlot()
    local tunnelPromotion = GameInfo.UnitPromotions["PROMOTION_TUNNEL"].ID

    local unitType = unit:GetUnitType()
    local isExcludedUnit = unit:IsHasPromotion(hoveringPromotion) or unitType == tbmUnitID

    -- Skip excluded unit types
    if isExcludedUnit then
        return
    end

    local isAdjacentToMountainRailroad = false

    -- Check all adjacent plots
    for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
        local adjacentPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
        if adjacentPlot and adjacentPlot:IsMountain() and adjacentPlot:GetRouteType() == GameInfoTypes.ROUTE_RAILROAD then
            isAdjacentToMountainRailroad = true
            break
        end
    end

    -- Units with the trait receive the promotion if on or adjacent to a mountain railroad
    if HasTrait(player) then
        if plot:IsMountain() and plot:GetRouteType() == GameInfoTypes.ROUTE_RAILROAD then
            if not unit:IsHasPromotion(tunnelPromotion) then
                unit:SetHasPromotion(tunnelPromotion, true)
            end
        else
            if unit:IsHasPromotion(tunnelPromotion) then
                unit:SetHasPromotion(tunnelPromotion, false)
            end
        end
    else
        if isAdjacentToMountainRailroad or (plot:IsMountain() and plot:GetRouteType() == GameInfoTypes.ROUTE_RAILROAD) then
            if not unit:IsHasPromotion(tunnelPromotion) then
                unit:SetHasPromotion(tunnelPromotion, true)
            end
        else
            if unit:IsHasPromotion(tunnelPromotion) then
                unit:SetHasPromotion(tunnelPromotion, false)
            end
        end
    end
end

-- Cache improvements that allow walking on water
local allowsWalkWaterImprovements = {}
for row in DB.Query("SELECT ID FROM Improvements WHERE AllowsWalkWater = 1") do
    allowsWalkWaterImprovements[row.ID] = true
end

function OnUnitSetXY(playerID, unitID, plotX, plotY)
    if disableOnUnitSetXY then
        return
    end

    -- Validate the new plot coordinates
    if not IsValidPlot(plotX, plotY) then
        return
    end

    -- Save the original position of the unit
    local unit = Players[playerID]:GetUnitByID(unitID)
    if not unitOriginalPositions[playerID] then
        unitOriginalPositions[playerID] = {}
    end

    local originalPlot = unitOriginalPositions[playerID][unitID]
    if not originalPlot then
        originalPlot = {x = unit:GetX(), y = unit:GetY()}
        unitOriginalPositions[playerID][unitID] = originalPlot
    end

    local initialPlotX = originalPlot.x
    local initialPlotY = originalPlot.y

    local validMove = true

    if not CheckMovementRestrictions(playerID, unitID, initialPlotX, initialPlotY, plotX, plotY) then
        validMove = false
    end

    if not CheckTBMRestrictions(playerID, unitID, initialPlotX, initialPlotY, plotX, plotY) then
        validMove = false
    end

    if validMove then
        unitOriginalPositions[playerID][unitID] = {x = plotX, y = plotY}
    else
        disableOnUnitSetXY = true
        unit:SetXY(initialPlotX, initialPlotY)
        local initialPlot = Map.GetPlot(initialPlotX, initialPlotY)
        
        if initialPlot:IsWater() and not unit:IsEmbarked() and 
           not allowsWalkWaterImprovements[initialPlot:GetImprovementType()] then
            unit:Embark()
        end
        disableOnUnitSetXY = false
    end

    GiveTunnelPromotion(playerID, unitID)
end

function IsValidPlot(plotX, plotY)
    local pPlot = Map.GetPlot(plotX, plotY)
    return pPlot ~= nil
end

function CheckMovementRestrictions(playerID, unitID, originalPlotX, originalPlotY, newPlotX, newPlotY)
    local player = Players[playerID]
    local unit = player:GetUnitByID(unitID)
    local newPlot = Map.GetPlot(newPlotX, newPlotY)

    local unitType = unit:GetUnitType()
    local isCarthageWorker = unitType == GameInfo.Units["UNIT_WORKER"].ID and HasTrait(player)
    local isExcludedUnit = unit:IsHasPromotion(hoveringPromotion) or unitType == tbmUnitID
    local isCarthageUnit = HasTrait(player) and not isCarthageWorker

    -- Check if the unit is moving onto a mountain tile without a railroad
    if newPlot:IsMountain() and newPlot:GetRouteType() ~= GameInfoTypes.ROUTE_RAILROAD then
        if not isExcludedUnit and not isCarthageUnit then
            return false
        end
    end

    return true
end

function CheckTBMRestrictions(playerID, unitID, originalPlotX, originalPlotY, newPlotX, newPlotY)
    local player = Players[playerID]
    local unit = player:GetUnitByID(unitID)
    local newPlot = Map.GetPlot(newPlotX, newPlotY)

    local unitType = unit:GetUnitType()
    local isCarthageUnit = HasTrait(player) and unitType ~= GameInfo.Units["UNIT_WORKER"].ID and not unit:IsHasPromotion(hoveringPromotion)

    if unitType == tbmUnitID or isCarthageUnit then
        for _, featureType in ipairs(naturalWonderFeatures) do
            if newPlot:GetFeatureType() == featureType then
                return false
            end
        end
    end

    return true
end

function InitializeUnitPositions()
    for playerID, player in pairs(Players) do
        if player:IsAlive() then
            for unit in player:Units() do
                local unitID = unit:GetID()
                if not unitOriginalPositions[playerID] then
                    unitOriginalPositions[playerID] = {}
                end
                unitOriginalPositions[playerID][unitID] = {x = unit:GetX(), y = unit:GetY()}
            end
        end
    end
end

Events.SequenceGameInitComplete.Add(InitializeUnitPositions)
GameEvents.UnitSetXY.Add(OnUnitSetXY)