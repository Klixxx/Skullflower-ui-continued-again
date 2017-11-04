local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
--
local _G = _G
--
local function SetFrameStrataForCastBar(unit)
    local frame = _G["ElvUF_"..unit]
    if frame and frame.CastBar then
        frame.CastBar:SetFrameStrata("HIGH")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    self:UnregisterEvent(event)

    SetFrameStrataForCastBar("Player")
    SetFrameStrataForCastBar("Target")
    SetFrameStrataForCastBar("Focus")
    SetFrameStrataForCastBar("Pet")

    for i = 1,5 do
        SetFrameStrataForCastBar("Arena"..i)
        SetFrameStrataForCastBar("Boss"..i)
    end
end)