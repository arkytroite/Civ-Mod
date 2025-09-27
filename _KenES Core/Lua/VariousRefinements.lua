--------------------------------------------------------------------------------------------
-- Various Refinements lua script written by zai4z

-- Do NOT copy this code without permission and credits
--------------------------------------------------------------------------------------------

local Kremlin = GameInfoTypes.BUILDING_KREMLIN
local KremlinCityPlot
local KremlinOwner

local MinorCivArtStyles = {}

local Archaeologists = {}
local Landmark = GameInfoTypes.IMPROVEMENT_LANDMARK
local ArtToLandmark = {
    [GameInfoTypes.ARTSTYLE_SOUTH_AMERICA] = GameInfoTypes.IMPROVEMENT_LANDMARK_AMER,
    [GameInfoTypes.ARTSTYLE_ASIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_ASIA,
    [GameInfoTypes.ARTSTYLE_MIDDLE_EAST] = GameInfoTypes.IMPROVEMENT_LANDMARK_AFRI,
    [GameInfoTypes.ARTSTYLE_EUROPEAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO,
    [GameInfoTypes.ARTSTYLE_GRECO_ROMAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO,
    [GameInfoTypes.ARTSTYLE_POLYNESIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_AMER,
    [GameInfoTypes.ARTSTYLE_BARBARIAN] = GameInfoTypes.IMPROVEMENT_LANDMARK_EURO
}

local Blitz = GameInfoTypes.PROMOTION_BLITZ
local ExtraAttackParadrop = GameInfoTypes.PROMOTION_EXTENDED_PARADROP
local NormalParadrop = GameInfoTypes.PROMOTION_EXTENDED_PARADROP_2

local RecordedCities = {}
local SatelliteTeams = {}
local Satellites = GameInfoTypes.TECH_SATELLITES

local ImprovementPlotsToRestore = {}
local BuildableOnResourceImprovements = {
    [GameInfoTypes.IMPROVEMENT_FORT] = true,
    [GameInfoTypes.IMPROVEMENT_ACADEMY] = true,
    [GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE] = true,
    [GameInfoTypes.IMPROVEMENT_MANUFACTORY] = true,
    [GameInfoTypes.IMPROVEMENT_CITADEL] = true,
    [GameInfoTypes.IMPROVEMENT_HOLY_SITE] = true
}

--------------------------------------------------------------------------------------------
-- Find techs dependent the tech given by the ruin, to carry over science
--------------------------------------------------------------------------------------------

function GetRandomDependantTech(eTech)
    local dependantTechs = {}
    for row in GameInfo.Technology_PrereqTechs("PrereqTech='" .. GameInfo.Technologies[eTech].Type .. "'") do
        table.insert(dependantTechs, row.TechType)
    end

    if #dependantTechs > 0 then
        return GameInfoTypes[dependantTechs[Game.Rand(#dependantTechs, "Tech Refund") + 1]]
    end
    return nil
end

--------------------------------------------------------------------------------------------
-- If the current tech has had research put into it, refund into a following tech
--------------------------------------------------------------------------------------------

function OnGoodyHutTechResearched(ePlayer, eTech)
    local pTeamTechs = Teams[Players[ePlayer]:GetTeam()]:GetTeamTechs()
    local iProgress = pTeamTechs:GetResearchProgress(eTech)
    
    if iProgress > 0 then
        local eRefundTech = GetRandomDependantTech(eTech)
        if eRefundTech then
            pTeamTechs:ChangeResearchProgress(eRefundTech, iProgress, ePlayer)
        end
    end
end
GameEvents.GoodyHutTechResearched.Add(OnGoodyHutTechResearched)

--------------------------------------------------------------------------------------------
-- Allow human players to raze any city apart from their own
--------------------------------------------------------------------------------------------

function RazeRegardless(cityOwner)
	if Players[cityOwner]:IsHuman() then
	    return true
    end
    return false
end
GameEvents.CanRazeOverride.Add(RazeRegardless)

--------------------------------------------------------------------------------------------
-- Store minor civilization city art styles
--------------------------------------------------------------------------------------------

for row in DB.Query("SELECT ID, ArtStyleType FROM MinorCivilizations") do
    MinorCivArtStyles[row.ID] = GameInfoTypes[row.ArtStyleType]
end

--------------------------------------------------------------------------------------------
-- Keep city architecture the same upon capture
--------------------------------------------------------------------------------------------

function CityCaptureCreated(vHexPos, playerID, cityID, artStyleID, eraType, continent, population, size, fogState) 
	local pPlot = Map.GetPlot(ToGridFromHex(vHexPos.x, vHexPos.y))
	local cityOriginalOwnerID = pPlot:GetPlotCity():GetOriginalOwner()

	if playerID == cityOriginalOwnerID then
        return 
    end

	local cityOriginalOwner = Players[cityOriginalOwnerID]

    local oldCityArtID
    if cityOriginalOwner:IsMinorCiv() then
        oldCityArtID = MinorCivArtStyles[cityOriginalOwner:GetMinorCivType()]
	else 
        oldCityArtID = cityOriginalOwner:GetArtStyleType()
    end

    if oldCityArtID and oldCityArtID ~= artStyleID then
        Events.SerialEventCityCreated(vHexPos, playerID, cityID, oldCityArtID, eraType, continent, population, size, fogState)
    end
end
Events.SerialEventCityCreated.Add(CityCaptureCreated)

--------------------------------------------------------------------------------------------
-- Change landmark to variant
--------------------------------------------------------------------------------------------

for row in DB.Query("SELECT UnitType FROM Unit_Builds WHERE BuildType = 'BUILD_LANDMARK'") do
    Archaeologists[GameInfoTypes[row.UnitType]] = true
end

function LandmarkCreated(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
    if not Archaeologists[unitType] then
        return
    end

    local pPlot = Map.GetPlot(unitX, unitY)

    if pPlot and (pPlot:GetImprovementType() == Landmark) then
        pPlot:SetImprovementType(ArtToLandmark[Players[unitOwnerId]:GetArtStyleType()])
    end
end
GameEvents.UnitPrekill.Add(LandmarkCreated)

--------------------------------------------------------------------------------------------
-- Replace modified skyranger with normal skyranger after gaining blitz
--------------------------------------------------------------------------------------------

function RemoveExtraAttack(ownerId, unitId, ePromotion)
    if ePromotion ~= Blitz then
        return 
    end

    local pUnit = Players[ownerId]:GetUnitByID(unitId)

    if pUnit:IsHasPromotion(ExtraAttackParadrop) then
        pUnit:SetHasPromotion(ExtraAttackParadrop, false)
        pUnit:SetHasPromotion(NormalParadrop, true)
	end
end
GameEvents.UnitPromoted.Add(RemoveExtraAttack)

--------------------------------------------------------------------------------------------
-- Record city locations and teams with satellites
--------------------------------------------------------------------------------------------

function RecordCities(iPlayer, iPlotX, iPlotY)
    local pPlot = Map.GetPlot(iPlotX, iPlotY)
    if pPlot:IsCity() then
        RecordedCities[pPlot] = true
    end
end
GameEvents.PlayerCityFounded.Add(RecordCities)

function SatellitesResearched(TeamID, TechType)
    if TechType == Satellites then
        SatelliteTeams[TeamID] = true
        RevealCities()
    end
end
GameEvents.TeamTechResearched.Add(SatellitesResearched)

--------------------------------------------------------------------------------------------
-- Highlight cities to all players with satellites
--------------------------------------------------------------------------------------------

function RevealCities()
    local RemovePlots = {}
    for teamID in pairs(SatelliteTeams) do 
        for pPlot in pairs(RecordedCities) do
            if pPlot:IsCity() then
                if pPlot:GetVisibilityCount(teamID) > 0 then
                    pPlot:ChangeVisibilityCount(teamID, -1, -1, true)
                end
                pPlot:ChangeVisibilityCount(teamID, 1, -1, true)
            else
                RemovePlots[pPlot] = true
                -- Only works with Howard's DLL
                if pPlot:GetVisibilityCount(teamID) > 0 then
                    pPlot:ChangeVisibilityCount(teamID, -1, -1, true)
                end
            end
        end
    end

    for pPlot in pairs(RemovePlots) do 
        RecordedCities[pPlot] = nil
    end
end
Events.ActivePlayerTurnStart.Add(RevealCities)

--------------------------------------------------------------------------------------------
-- Startup logic
--------------------------------------------------------------------------------------------

function InitializeResources()
    for iPlot = 0, Map.GetNumPlots() - 1 do
        local pPlot = Map.GetPlotByIndex(iPlot)
        local ImprovementType = pPlot:GetImprovementType()

        if pPlot:IsCity() then
            RecordedCities[pPlot] = true
        elseif BuildableOnResourceImprovements[ImprovementType] and (pPlot:GetResourceType() ~= -1) then
            ImprovementPlotsToRestore[pPlot] = ImprovementType
        end
    end

    -- Record who has Satellites
    for iTeam = 0, GameDefines.MAX_CIV_TEAMS - 1 do
        local pTeam = Teams[iTeam]
        if pTeam and pTeam:IsHasTech(Satellites) then
            SatelliteTeams[iTeam] = true
        end
    end
end
Events.SequenceGameInitComplete.Add(InitializeResources)


--------------------------------------------------------------------------------------------
-- Remove graphical bug from resource
--------------------------------------------------------------------------------------------

function RestoreImprovementPlots(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:IsBarbarian() then
        --Remove
        for pPlot in pairs(ImprovementPlotsToRestore) do
            pPlot:SetImprovementType(-1)
        end
    elseif pPlayer:IsHuman() then
        -- Restore
        for pPlot, ImprovementType in pairs(ImprovementPlotsToRestore) do
            pPlot:SetImprovementType(ImprovementType)
        end

        ImprovementPlotsToRestore = nil
        GameEvents.PlayerDoTurn.Remove(RestoreImprovementPlots)
    end
end
GameEvents.PlayerDoTurn.Add(RestoreImprovementPlots)