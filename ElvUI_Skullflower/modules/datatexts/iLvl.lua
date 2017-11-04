local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

--All credits belongs to Benik for this Ilvl datatext mod
local getILVL = GetAverageItemLevel
local strform = string.format
local tonumber = tonumber
local tostring = tostring

local function OnEvent(self, event, ...)

	total, equipped, pvp = getILVL()
	
	self.text:SetText("iLvl: "..strform("%.1f",equipped))
	
end

local function OnEnter(self)
	DT:SetupTooltip(self)	
	local tip = DT.tooltip;	
	
	
	total, equipped, pvp = getILVL()

		
	
	
	tip:AddDoubleLine("Equipped:", strform("%.1f",equipped), 1, 1, 1, 1, 1, 1)
	tip:AddDoubleLine("Total:", strform("%.1f",total), 1, 1, 1, 1, 1, 1)
	tip:AddDoubleLine("PvP:", strform("%.1f",pvp), 1, 1, 1, 1, 1, 1)

	DT.tooltip:Show()
	
end

local function OnClick(self)

	OnEvent(self, nil, nil)

end

	
--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]


DT:RegisterDatatext('Item Level (SFUI)', {'PLAYER_ENTERING_WORLD', 'PLAYER_EQUIPMENT_CHANGED', 'PLAYER_LOOT_SPEC_UPDATED'}, OnEvent, nil, OnClick, OnEnter, nil)

