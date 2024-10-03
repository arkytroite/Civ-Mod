print ("Garamantes Check")

local GaramantesID = GameInfoTypes.CIVILIZATION_ARABIA;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == GaramantesID then
			include("Garamantes Scripts")
			break;
		end
	end
end

--Base Yield Fix
local pGaramaBaseUI = GameInfoTypes.POLICY_GARAMA_FIX_UI_BASE_YIELD;
local tFertilizer = GameInfoTypes.TECH_FERTILIZER;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		local pTeam = pPlayer:GetTeam();
		if Teams[pTeam]:IsHasTech(tFertilizer) then
			if not pPlayer:HasPolicy(pGaramaBaseUI) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(pGaramaBaseUI, true);
			end
		end
	end
end)