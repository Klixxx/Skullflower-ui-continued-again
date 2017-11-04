local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
--
local _G = _G
--
local function SetFrameStrataForPowerBar(unit)
    local frame = _G["ElvUF_"..unit]
    if frame and frame.power then
        frame.power:SetFrameStrata("LOW")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    self:UnregisterEvent(event)

    SetFrameStrataForPowerBar("Player")
    SetFrameStrataForPowerBar("Target")
    SetFrameStrataForPowerBar("Focus")
    SetFrameStrataForPowerBar("Pet")
	
end)