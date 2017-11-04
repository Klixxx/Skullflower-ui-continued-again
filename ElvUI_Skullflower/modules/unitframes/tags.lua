local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local ElvUF = ElvUI.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")


--All credits belongs to Merathilis and Blazeflack for this mod

-- Cache global variables
local abs = math.abs
local format, match, sub, gsub, len = string.format, string.match, string.sub, string.gsub, string.len
local assert, tonumber, type = assert, tonumber, type
-- WoW API / Variables
local UnitIsDead = UnitIsDead
local UnitClass = UnitClass
local UnitIsGhost = UnitIsGhost
local UnitIsConnected = UnitIsConnected
local UnitHealth, UnitHealthMax = UnitHealth, UnitHealthMax
local UnitName = UnitName
local UnitFactionGroup = UnitFactionGroup
local UnitPower = UnitPower
local IsResting = IsResting

-- GLOBALS: Hex, _COLORS

local textFormatStyles = {
	["CURRENT"] = "%.1f",
	["CURRENT_MAX"] = "%.1f - %.1f",
	["CURRENT_PERCENT"] =  "%.1f - %.1f%%",
	["CURRENT_MAX_PERCENT"] = "%.1f - %.1f | %.1f%%",
	["PERCENT"] = "%.1f%%",
	["DEFICIT"] = "-%.1f"
}

local textFormatStylesNoDecimal = {
	["CURRENT"] = "%s",
	["CURRENT_MAX"] = "%s - %s",
	["CURRENT_PERCENT"] =  "%s - %.0f%%",
	["CURRENT_MAX_PERCENT"] = "%s - %s | %.0f%%",
	["PERCENT"] = "%.0f%%",
	["DEFICIT"] = "-%s"
}

local function shortenNumber(number)
	if type(number) ~= "number" then
		number = tonumber(number)
	end
	if not number then
		return
	end

	local affixes = {
		"",
		"k",
		"m",
		"B",
	}

	local affix = 1
	local dec = 0
	local num1 = abs(number)
	while num1 >= 1000 and affix < #affixes do
		num1 = num1 / 1000
		affix = affix + 1
	end
	if affix > 1 then
		dec = 2
		local num2 = num1
		while num2 >= 10 do
			num2 = num2 / 10
			dec = dec - 1
		end
	end
	if number < 0 then
		num1 = -num1
	end

	return format("%."..dec.."f"..affixes[affix], num1)
end


-- Displays current HP --(2.04B, 2.04M, 204k, 204)--
_G["ElvUF"].Tags.Events["health:current-sfui"] = "UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED"
_G["ElvUF"].Tags.Methods["health:current-sfui"] = function(unit)
	local status = UnitIsDead(unit) and L["Dead"] or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]
		if (status) then
			return status
		else
	local currentHealth = UnitHealth(unit)
		return shortenNumber(currentHealth)
	end
end

-- Displays current power and 0 when no power instead of hiding when at 0, Also formats it like HP tag
_G["ElvUF"].Tags.Events["power:current-sfui"] = "UNIT_DISPLAYPOWER UNIT_POWER UNIT_POWER_FREQUENT"
_G["ElvUF"].Tags.Methods["power:current-sfui"] = function(unit)
	local CurrentPower = UnitPower(unit)
	return shortenNumber(CurrentPower)
end

_G["ElvUF"].Tags.Events["sfui-resting"] = "PLAYER_UPDATE_RESTING"
_G["ElvUF"].Tags.Methods["sfui-resting"] = function(unit)
	if(unit == "player" and IsResting()) then
		return "zZz"
	else
		return ""
	end
end