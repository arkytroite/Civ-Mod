--print("SLAVERY MOD ENABLED");

local RebelTypes = {
	GameInfoTypes.UNIT_WARRIOR, GameInfoTypes.UNIT_WARRIOR, GameInfoTypes.UNIT_SPEARMAN, GameInfoTypes.UNIT_BARBARIAN_SWORDSMAN, 
	GameInfoTypes.UNIT_MUSKETMAN, GameInfoTypes.UNIT_GREAT_WAR_INFANTRY, GameInfoTypes.UNIT_INFANTRY, GameInfoTypes.UNIT_INFANTRY, 
	GameInfoTypes.UNIT_INFANTRY, GameInfoTypes.UNIT_INFANTRY, GameInfoTypes.UNIT_INFANTRY };
local gameSpeed = GameInfo.GameSpeeds[PreGame.GetGameSpeed()];
local dice = gameSpeed.BarbPercent * 2;
local iSlaveHurry = GameInfo.Units["UNIT_SLAVE"].BaseHurry * gameSpeed.ConstructPercent / 100;
local noHurry = false;
--print("slave hurry = " .. iSlaveHurry);
-----------------------------------------------------------------------------------------------------------
function ReplaceWithRebel(unit)
	if unit:GetPlot():GetPlotCity() ~= nil then
		unit:JumpToNearestValidPlot();	-- should go out of city, otherwise it will capture it
	end
	local x = unit:GetX();
	local y = unit:GetY();
	unit:Kill();
	local barbs = Players[GameDefines.MAX_PLAYERS-1];
	-- lua arrays start from index 1, eras start from 0
	--print("current era: " .. Game.GetCurrentEra());
	local newUnit = barbs:InitUnit(RebelTypes[Game.GetCurrentEra() + 1], x, y);
	return x, y;
end
-----------------------------------------------------------------------------------------------------------
function CheckForSlaveRevolution(player)
	if player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY) 
	or player:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) then
		return;
	end
	local barbs = Players[GameDefines.MAX_PLAYERS-1];
	local d = dice;
	if Game.GetCurrentEra() >= GameInfoTypes.ERA_INDUSTRIAL then
		d = d / 2;	-- uprisings 2x more likely
	end
	for unit in player:Units() do
		if unit ~= nil and unit:GetUnitType() == GameInfoTypes.UNIT_SLAVE then
			if player:IsBarbarian() then
				ReplaceWithRebel(unit);
			elseif Map.Rand(d, "Slavery") == 0 then
				local x, y = ReplaceWithRebel(unit);	-- get revolt coords from this function
				-- notify the player:
				if player:GetID() == Game.GetActivePlayer() then
					player:AddNotification(NotificationTypes.NOTIFICATION_REBELS, "Slave revolt!", "Slave revolt!", x, y, GameInfoTypes.UNIT_SLAVE);
				end
				-- spread uprising:
				for slave in player:Units() do
					if slave ~= nil and slave:GetUnitType() == GameInfoTypes.UNIT_SLAVE then
						local dist = Map.PlotDistance(x, y, slave:GetX(), slave:GetY());
						if dist <= 10 then
							slave:FinishMoves();	-- so that they can't be disbanded this turn
						end
						if dist <= 5 and Map.Rand(dist + 2, "Slavery") < 2 then
							ReplaceWithRebel(slave);
						end
					end
				end
				return;	-- no more than 1 revolt per player per turn
			end	-- type of slave
		end	-- it is a slave
	end	-- loop units
end
-----------------------------------------------------------------------------------------------------------
local camps = nil;
function CheckBarbCamp(iPlayer, iUnitID, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	local player = Players[iPlayer];
	local idx = iX * 1000 + iY;
	if plot == nil then
		return;
	elseif player:IsBarbarian() and plot:HasBarbarianCamp() then
		camps[idx] = true;
		print("a barb camp was placed");
		return;
	end
	--local unit = player:GetUnitByID(iUnitID);
	if camps[idx] and player:HasPolicy(GameInfoTypes.POLICY_MILITARY_CASTE) then
		camps[idx] = false;
		local slave = player:InitUnit(GameInfoTypes.UNIT_SLAVE, iX, iY, GameInfoTypes.UNITAI_WORKER);
	end
end
-----------------------------------------------------------------------------------------------------------
function SlavesFromConquest(iOldOwner, bIsCapital, x, y, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner];
	if not bConquest or not CanTakeSlavesFromCities(player) then
		--return;	DEBUG
	end
	local city = Map.GetPlot(x, y):GetPlotCity();
	if city:GetOriginalOwner() == iNewOwner then
		return;	-- dont get slaves from own people!
	end
	--print("pop = " .. iPop);
	local n = log2(iPop);	-- iPop is pre-conquest population
	if n == 0 then
		n = 1;
	end
	--print("log2 pop = " .. n);
	for i = 1, n do
		AddSlave(player, city, GameInfoTypes.UNITAI_TREASURE);
	end
end
-----------------------------------------------------------------------------------------------------------
function CanTakeSlavesFromCities(player)
	return 
	player:HasPolicy(GameInfoTypes.POLICY_HONOR) and 
	player:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE	-- with Honor, take slaves till Ren 
	or player:HasPolicy(GameInfoTypes.POLICY_MASTER_RACE);	-- with Master Race, take slaves till the end
end
-----------------------------------------------------------------------------------------------------------
--[[
function HurryForAI(player)
	if player:IsHuman() then
		return;
	end
	print("");
	print("processing " .. player:GetName());
	local cap = player:GetCapitalCity();
	if cap == nil then
		return;
	end
	EmptyCity(cap);	-- otherwise "treasure" slaves would stuck
	local plot = cap:Plot();
	for i = 0, plot:GetNumUnits() do
		local unit = plot:GetUnit(i);
		if unit ~= nil and unit:GetUnitType() == GameInfoTypes.UNIT_SLAVE then
			print("turn created = " .. unit:GetGameTurnCreated());
			print("game turn = " .. Game.GetGameTurn());
			if (unit:GetGameTurnCreated() < Game.GetGameTurn() - 1) then	-- so AIs could buy slaves for work
				print("expending a slave");
				unit:Kill();
				cap:SetOverflowProduction(cap:GetOverflowProduction() + iSlaveHurry);
				--print("production hurried in " .. cap:GetName());
				return;
			end
		end	--unit not nil
	end
end
]]
-----------------------------------------------------------------------------------------------------------
function EmptyCity(city)
	local plot = city:Plot();
	--print("inspecting the capital..");
	for i = 0, plot:GetNumUnits() do
		local unit = plot:GetUnit(i);
		if unit == nil then
			--print("unit is nil");
			return;
		end
		--print("=== found " .. unit:GetName());
		if unit:IsCombatUnit() then
			--print("he is a combat unit");
		end
		if unit:IsBusy() then
			--print("he is busy");
		end
		local immobile = GameInfo.Units[unit:GetUnitType()].Immobile;	-- e.g. caravan
		if immobile then
			--print("he is immobile");
		end
		local player = Players[city:GetOwner()];
		--local danger = player:GetPlotDanger(plot);
		--print("danger = " .. danger);
		local x = plot:GetX();
		local y = plot:GetY();
		if unit ~= nil and not unit:IsCombatUnit() and not unit:IsBusy() and
		unit:GetUnitType() ~= GameInfoTypes.UNIT_SLAVE and not immobile then
			--print("has idle non slave civilian - send him out");
			-- check nearby plots to send the unit there
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local dest = Map.PlotDirection(x, y, direction);
				--print("direction = " .. direction);
				local canmove = CanMoveOnto(unit, dest);
				if not canmove then 
					--print("can't move there");
				end
				local danger = player:GetPlotDanger(dest);
				--print("danger = " .. danger);
				if canmove and danger < 200 then
					--print("moving out");
					unit:PopMission();
					unit:PushMission(MissionTypes.MISSION_MOVE_TO, dest:GetX(), dest:GetY(), 0, 0, 1, MissionTypes.MISSION_MOVE_TO, plot, unit);
					return;
				end
			end
			--old way: just jump to a random nearby plot
			--unit:JumpToNearestValidPlot();
			--unit:FinishMoves();
		end
	end
end
-----------------------------------------------------------------------------------------------------------
function CanMoveOnto(unit, plot)
	if plot:IsWater() then
		return unit:CanEmbarkOnto(unit:GetPlot(), plot);
	end
	if plot:IsImpassable() then
		return false;
	end
	for i = 0, plot:GetNumUnits() do
		local other = plot:GetUnit(i);
		if other ~= nil and not GameInfo.Units[other:GetUnitType()].Immobile -- caravan or plane
		and (other:IsCombatUnit() == unit:IsCombatUnit() or other:GetOwner() ~= unit:GetOwner()) then
			return false;
		end
	end
	return true;
end
-----------------------------------------------------------------------------------------------------------
function SlavesFromRazing(player)
	if player == nil or not CanTakeSlavesFromCities(player) then
		return;
	end
	for city in player:Cities() do
		--print("razing " .. city:GetName());
		if city:IsRazing() and (player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HUNS or 
		city:GetPopulation() % 2 == 1) then
			AddSlave(player, city, GameInfoTypes.UNITAI_TREASURE);
		end
	end
end
-----------------------------------------------------------------------------------------------------------
function UpdateSlaves(iPlayer)
	if camps == nil then
		print("update camps");
		camps = {};
		for i = 0, Map.GetNumPlots()-1, 1 do
			local plot = Map.GetPlotByIndex(i);
			if plot:HasBarbarianCamp() then
				local id = plot:GetX() * 1000 + plot:GetY();
				camps[id] = true;
			end
		end
	end
	local player = Players[iPlayer];
	if player == nil or not player:IsAlive() then
		return;
	end
	CheckForSlaveRevolution(player);
	--HurryForAI(player);	-- done on UnitSetXY
	if not player:IsHuman() and player:GetNumCities() > 0 then
		EmptyCity(player:GetCapitalCity());	--so "treasure" slaves could enter
	end
	SlavesFromRazing(player);
end
-----------------------------------------------------------------------------------------------------------
function CheckSlaveHurry(iPlayer, iUnitID, iX, iY)
	if noHurry then
		return;
	end
	local plot = Map.GetPlot(iX, iY);
	if plot == nil then
		return;
	end
	local city = plot:GetPlotCity();
	if city == nil or city:GetOwner() ~= iPlayer or city:IsRazing() or city:IsResistance() then
		return;
	end
	local player = Players[iPlayer];
	if player:IsHuman() then
		return;
	end
	local unit = player:GetUnitByID(iUnitID);
	--print(unit:GetName() .. ", created at " .. unit:GetGameTurnCreated());
	--print("current turn = " .. Game.GetGameTurn());
	if unit:GetUnitType() == GameInfoTypes.UNIT_SLAVE and 
	(unit:GetGameTurnCreated() < Game.GetGameTurn() - 1) then	-- so slaves bought for work could go out
		city:SetOverflowProduction(city:GetOverflowProduction() + iSlaveHurry);
		unit:Kill(true, -1);
		--print("production hurried in " .. plot:GetPlotCity():GetName());
	end
end
-----------------------------------------------------------------------------------------------------------
function CheckSlaveLiberation(iPlayer, iUnitID, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	if plot == nil then
		return;
	end
	local player = Players[iPlayer];
	if not player:HasPolicy(GameInfoTypes.POLICY_EMANCIPATION) then
		return;
	end
	local unit = player:GetUnitByID(iUnitID);
	if not unit:IsCombatUnit() then
		return;
	end
	for i = 0, plot:GetNumUnits() do
		local captured = plot:GetUnit(i);
		if captured ~= nil and captured:GetUnitType() == GameInfoTypes.UNIT_SLAVE then
			--print("a slave was freed by " .. unit:GetName());
			captured:Kill(true, -1);	-- free slave
			unit:SetDamage(0);	-- heal liberator
		end
	end
end
-----------------------------------------------------------------------------------------------------------
function PolicyAdopted(iPlayer, iPolicy)
	local player = Players[iPlayer];
	if iPolicy == GameInfoTypes.POLICY_EMANCIPATION then
		--print("abolitionism adopted");
		--print("setting our slaves free");
		for unit in player:Units() do	-- emancipation
			if unit ~= nil and unit:GetUnitType() == GameInfoTypes.UNIT_SLAVE then
				unit:Kill();
			end
		end
		local iTurns = player:GetGoldenAgeLength();
		for city in player:Cities() do	-- WLTKD
			if city ~= null then
				--print("starting WLTKD in " .. city:GetName());
				if city:GetWeLoveTheKingDayCounter() == 0 then
					city:SetResourceDemanded(GameInfoTypes.RESOURCE_MARBLE);
					city:SetWeLoveTheKingDayCounter(iTurns);	--same length as GA
				else
					city:ChangeWeLoveTheKingDayCounter(iTurns);	--same length as GA
				end
			end
		end
	elseif iPolicy == GameInfoTypes.POLICY_MASTER_RACE then
		--print("master race adopted");
		KillPopulation(player, true);
	--elseif iPolicy == GameInfoTypes.POLICY_THE_GREAT_PURGE then
	--	print("performing the great purge");
	--	KillPopulation(player, true);
	end
end
-----------------------------------------------------------------------------------------------------------
function KillPopulation(player, getSlaves)
	for city in player:Cities() do
		if city ~= null and city:GetPopulation() > 1 then
			local iPop = city:GetPopulation();
			if Map.Rand(50, "Slavery") < iPop then
				city:SetPopulation(iPop - 1, true);	-- kill a citizen
				if player:GetID() == Game.GetActivePlayer() then
					player:AddNotification(NotificationTypes.NOTIFICATION_STARVING, "A citizen was imprisoned.", "A citizen was imprisoned.", city:GetX(), city:GetY());
				end
				if getSlaves then
					--print("add slaves for " .. city:GetName());
					AddSlave(player, city, GameInfoTypes.UNITAI_WORKER);
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------
function AddSlave(player, city, AI)
	noHurry = true;	--otherwise are instantly expended as UnitSetXY is fired before the unit's GameTurnCreated is set
	local slave = player:InitUnit(GameInfoTypes.UNIT_SLAVE, city:GetX(), city:GetY(), AI);
	slave:JumpToNearestValidPlot();
	slave:FinishMoves();
	--print("slave added");
	noHurry = false;
end
-----------------------------------------------------------------------------------------------------------
function CanBuySlave(player, city, unitType)
	if unitType == GameInfoTypes.UNIT_SLAVE then
		return Game.GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL;
	end
	return true;
end
-----------------------------------------------------------------------------------------------------------
function Resettlement(iPlayer, iX, iY)
	local player = Players[iPlayer];
	if not player:HasPolicy(GameInfoTypes.POLICY_RESETTLEMENT) then
		return;
	end
	local plot = Map.GetPlot(iX, iY);
	if plot == nil then
		return;
	end
	local city = plot:GetPlotCity();
	if city == nil then 
		return;
	end
	AddSlave(player, city, GameInfoTypes.UNITAI_WORKER);
	AddSlave(player, city, GameInfoTypes.UNITAI_WORKER);
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
GameEvents.UnitSetXY.Add( CheckSlaveHurry );
GameEvents.UnitSetXY.Add( CheckSlaveLiberation );
GameEvents.UnitSetXY.Add( CheckBarbCamp );
GameEvents.CityCaptureComplete.Add( SlavesFromConquest );
GameEvents.PlayerDoTurn.Add( UpdateSlaves );
GameEvents.PlayerAdoptPolicy.Add( PolicyAdopted );
GameEvents.CityCanTrain.Add( CanBuySlave );
GameEvents.PlayerCityFounded.Add( Resettlement );
-----------------------------------------------------------------------------------------------------------
function log2(n)
	local _n = 2
	local x = 1
    if (_n < n) then
        repeat
            x = x + 1
            _n = _n + _n
        until (_n >= n)
    elseif (_n > n) then
        if (n == 1) then
            return 0
        else
            return nil
        end
    end 
    if (_n > n) then
        return x-1
    else
        return x
    end 
end