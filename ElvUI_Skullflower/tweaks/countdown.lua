--Bigwigs Countdown Sounds
--Unreal Tournament '99
if not IsAddOnLoaded("BigWigs") then return end
local heroes = {
	"UT99",
}
local key = "Skullflower - Unreal Tournament '99"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Unreal_Tournament\\Classic99\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end


--Unreal Tournament 2003
local heroes = {
	"UT2003",
}
local key = "Skullflower - Unreal Tournament 2003"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Unreal_Tournament\\Classic2003\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end


--Unreal Tournament 2004
local heroes = {
	"UT2004",
}
local key = "Skullflower - Unreal Tournament 2004"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Unreal_Tournament\\Classic2004\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end


--Unreal Tournament Female
local heroes = {
	"UTF",
}
local key = "Skullflower - Unreal Tournament Female"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Unreal_Tournament\\Female\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end


--Unreal Tournament Evil
local heroes = {
	"UTE",
}
local key = "Skullflower - Unreal Tournament Evil"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Unreal_Tournament\\Evil\\%s_%d.ogg"

for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end


--Arnold Swarznegger
local heroes = {
	"AS",
}
local key = "Skullflower - Arnold Swarznegger"
local path = "Interface\\AddOns\\ElvUI_Skullflower\\media\\sounds\\Arnold_Swarznegger\\%s_%d.ogg"


for i = 1, #heroes do
	local hero = heroes[i]
	BigWigsAPI:RegisterCountdown(key:format(hero), {
		path:format(hero, 1), 
		path:format(hero, 2),
		path:format(hero, 3),
		path:format(hero, 4),
		path:format(hero, 5),
		path:format(hero, 6),
		path:format(hero, 7),
		path:format(hero, 8),
		path:format(hero, 9),
		path:format(hero, 10),
	})
end