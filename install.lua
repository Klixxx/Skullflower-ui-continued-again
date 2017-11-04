local E, L, V, P, G = unpack(ElvUI);

local CURRENT_PAGE = 0
local MAX_PAGE = 2

SFUI_Version = GetAddOnMetadata("ElvUI_Skullflower", "Version");

L['LOGIN_MSG'] = "|cfffb4f4fSkullflower's UI Cont. Again |cffffffffversion |r|cfffb4f4f"..SFUI_Version.."|cffffffff. Type |cfffb4f4f/sf |cffffffffto access the SF installation menu or |cfffb4f4f/ec |cffffffffto access ElvUI options. For any issues or suggestions, please visit https://discord.gg/CRxVT77"

SLASH_SKULL1, SLASH_SKULL2, SLASH_SKULL3, SLASH_SKULL4 = '/sf', '/sfui', '/skull', '/skullflower';
function SlashCmdList.SKULL(msg, editbox)
	CURRENT_PAGE = 0
	E:Install()
end

function E:GetColor(r, b, g, a)	
	return { r = r, b = b, g = g, a = a }
end

function E:SetupTheme(theme, noDisplayMsg)
	local classColor = RAID_CLASS_COLORS[E.myclass]
	InstallStepComplete.message = L["Interface Installed"]
	InstallStepComplete:Show()		
	E.private.theme = theme
	if not E.db.movers then E.db.movers = {}; end
		if theme == "SkullflowerUI" then
		----------[Frame Placement]----------
		--Bars
		E.db.movers["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,34"
		E.db.movers["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,67"
		E.db.movers["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,100"
		E.db.movers["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,-248,1"
		E.db.movers["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,247,1"
		E.db.movers["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,1"
		E.db.movers["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-240,236"
		E.db.movers["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,959,172"
		E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
		E.db.movers["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-30"
		E.db.movers["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,100"
		E.db.movers["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-33"
		E.db.movers["HonorBarMover"] = "TOP,ElvUIParent,TOP,0,-66"
		if E.myclass == "MAGE" or E.myclass == "PRIEST" or E.myclass == "WARRIOR" or E.myclass == "HUNTER" or  E.myclass == "DEMONHUNTER" then
		E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
		elseif E.myclass == "DEATHKNIGHT" and IsAddOnLoaded("CompactRunes") or IsAddOnLoaded("mRunes") then
		E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
		else
		E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,358"
		end
		--General
		E.db.movers["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-30"
		E.db.movers["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,30"
		E.db.movers["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,30"
		E.db.movers["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,207"
		E.db.movers["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-30"
		E.db.movers["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,185"
		E.db.movers["LootFrameMover"] = "TOP,ElvUIParent,TOP,0,-275"
		E.db.movers["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,0,-155"
		E.db.movers["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-490"
		E.db.movers["CM_MOVER"] = "BOTTOM,ElvUIParent,BOTTOM,0,150"
		E.db.movers["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-81,-280"
		E.db.movers["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,30"
		E.db.movers["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,30"
		--Player
		E.db.movers["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
		E.db.movers["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
		E.db.movers["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
		E.db.movers["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
		E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,263"
		--Pet
		E.db.movers["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,200"
		E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,184"
		--Target/ToT
		E.db.movers["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
		E.db.movers["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
		E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,263"
		E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,280,200"
		--Focus/FT
		E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,311"
		E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,295"
		E.db.movers["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,342"
		--Group
		E.db.movers["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,660"
		E.db.movers["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,905"
		E.db.movers["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,910"
		E.db.movers["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-340,-285"
		E.db.movers["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,30,-340"
		E.db.movers["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-100"
		E.db.movers["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-390,-285"
		E.db.movers["WatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-300"
		E.db.movers["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-250"
		--Minimap/Auras
		E.db.movers["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-30"
		E.db.movers["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-184,-30"
		E.db.movers["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-184,-148"
		--TotemBar
		if E.myclass == "SHAMAN" then
		E.db.movers["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,432,30"
		else
		E.db.movers["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,432,30"
		end

		----------[General]----------
		E.db.gridsize = 128
		E.global.general.commandBarSetting = "DISABLED"
		E.db.general.taintLog = false
		E.db.general.stickyFrames = true
		E.db.general.loginmessage = true
		E.db.general.interruptAnnounce = "SAY"
		E.db.general.autoRepair = "GUILD"
		E.db.general.autoRoll = false
		E.db.general.vendorGrays = true
		E.db.general.autoAcceptInvite = false
		E.db.general.bottomPanel = false
		E.db.general.hideErrorFrame = true
		E.db.general.enhancedPvpMessages = true
		E.db.general.objectiveFrameHeight = 500
		E.db.general.bonusObjectivePosition = "LEFT"
		E.db.general.talkingHeadFrameScale = 0.75
		E.db.general.afk = true
		E.db.general.fontSize = 11
		E.db.general.font = "Expressway"
		E.private.general.chatBubbleFont = "Expressway"
		E.private.general.namefont = "Expressway"
		E.private.general.dmgfont = "Expressway"
		E.db.general.bordercolor = {r = 0/255, g = 0/255, b = 0/255}
		E.db.general.backdropcolor = {r = 18/255, g = 18/255, b = 18/255}
		E.db.general.backdropfadecolor = {r = 18/255, g = 18/255, b = 18/255, a = 0.9}
		E.db.general.valuecolor = E:GetColor(classColor.r, classColor.b, classColor.g)
		E.db.general.minimap.size = 150
		E.db.general.minimap.locationText = "MOUSEOVER"
		E.db.general.minimap.icons.mail.scale = 1
		E.db.general.minimap.icons.mail.position = "TOPRIGHT"
		E.db.general.minimap.icons.mail.xOffset = -2
		E.db.general.minimap.icons.mail.yOffset = 0
		E.db.general.minimap.icons.classHall.scale = 0.60
		E.db.general.minimap.icons.classHall.position = "BOTTOMRIGHT"
		E.db.general.minimap.icons.classHall.hide = false
		E.db.general.minimap.icons.calendar.hide = true
		E.db.general.minimap.icons.lfgEye.scale = 0.75
		E.db.general.minimap.icons.lfgEye.position = "BOTTOMLEFT"
		E.db.general.minimap.icons.lfgEye.xOffset = 4
		E.db.general.minimap.icons.lfgEye.yOffset = 4
		E.db.general.minimap.icons.vehicleLeave.size = 40
		E.db.general.minimap.icons.vehicleLeave.xOffset = 2
		E.db.general.minimap.icons.vehicleLeave.yOffset = 2
		E.db.general.threat.enable = false
		if E.myclass == "SHAMAN" then
			E.db.general.totems.enable = true
		else
			E.db.general.totems.enable = false
		end
		E.db.general.totems.growthDirection = "VERTICAL"
		E.db.general.totems.size = 40
		E.db.general.totems.spacing = 3
		-- General textures
		E.private.general.normTex = "Skullflower"
		E.private.general.glossTex = "Skullflower"
	
		----------[Actionbars]----------
		E.db.actionbar.font = "Expressway"
		E.db.actionbar.fontSize = 12
		E.db.actionbar.fontOutline = "OUTLINE"
		E.db.actionbar.macrotext = false
		E.db.actionbar.hotkeytext = false
		E.db.actionbar.microbar.enabled = true
		E.db.actionbar.microbar.mouseover = true
		E.db.actionbar.microbar.buttonsPerRow = 12
		E.db.actionbar.microbar.alpha = 1
		E.db.actionbar.globalFadeAlpha = 0
		E.db.actionbar.lockActionBars = true
		--Bar 1
		E.db.actionbar.bar1.enabled = true
		E.db.actionbar.bar1.mouseover = false
		E.db.actionbar.bar1.buttons = 12
		E.db.actionbar.bar1.buttonsPerRow = 12
		E.db.actionbar.bar1.point = "BOTTOMLEFT"
		E.db.actionbar.bar1.backdrop = false
		E.db.actionbar.bar1.heightMult = 1
		E.db.actionbar.bar1.widthMult = 1
		E.db.actionbar.bar1.buttonsize = 32
		E.db.actionbar.bar1.buttonspacing = 1
		E.db.actionbar.bar1.backdropSpacing = 0
		E.db.actionbar.bar1.alpha = 1
		E.db.actionbar.bar1.inheritGlobalFade = false
		E.db.actionbar.bar1.showGrid = true
		--Bar 2
		E.db.actionbar.bar2.enabled = true
		E.db.actionbar.bar2.mouseover = false
		E.db.actionbar.bar2.buttons = 12
		E.db.actionbar.bar2.buttonsPerRow = 12
		E.db.actionbar.bar2.point = "BOTTOMLEFT"
		E.db.actionbar.bar2.backdrop = false
		E.db.actionbar.bar2.heightMult = 1
		E.db.actionbar.bar2.widthMult = 1
		E.db.actionbar.bar2.buttonsize = 32
		E.db.actionbar.bar2.buttonspacing = 1
		E.db.actionbar.bar2.backdropSpacing = 0
		E.db.actionbar.bar2.alpha = 1
		E.db.actionbar.bar2.inheritGlobalFade = false
		E.db.actionbar.bar2.showGrid = true
		--Bar 3
		E.db.actionbar.bar3.enabled = false
		E.db.actionbar.bar3.mouseover = false
		E.db.actionbar.bar3.buttons = 12
		E.db.actionbar.bar3.buttonsPerRow = 12
		E.db.actionbar.bar3.point = "BOTTOMLEFT"
		E.db.actionbar.bar3.backdrop = false
		E.db.actionbar.bar3.heightMult = 1
		E.db.actionbar.bar3.widthMult = 1
		E.db.actionbar.bar3.buttonsize = 32
		E.db.actionbar.bar3.buttonspacing = 1
		E.db.actionbar.bar3.backdropSpacing = 0
		E.db.actionbar.bar3.alpha = 1
		E.db.actionbar.bar3.inheritGlobalFade = false
		E.db.actionbar.bar3.showGrid = true
		--Bar 4
		E.db.actionbar.bar4.enabled = false
		E.db.actionbar.bar4.mouseover = true
		E.db.actionbar.bar4.buttons = 12
		E.db.actionbar.bar4.buttonsPerRow = 3
		E.db.actionbar.bar4.point = "BOTTOMLEFT"
		E.db.actionbar.bar4.backdrop = false
		E.db.actionbar.bar4.heightMult = 1
		E.db.actionbar.bar4.widthMult = 1
		E.db.actionbar.bar4.buttonsize = 32
		E.db.actionbar.bar4.buttonspacing = 1
		E.db.actionbar.bar4.backdropSpacing = 0
		E.db.actionbar.bar4.alpha = 1
		E.db.actionbar.bar4.inheritGlobalFade = false
		E.db.actionbar.bar4.showGrid = true
		--Bar 5
		E.db.actionbar.bar5.enabled = false
		E.db.actionbar.bar5.mouseover = true
		E.db.actionbar.bar5.buttons = 12
		E.db.actionbar.bar5.buttonsPerRow = 3
		E.db.actionbar.bar5.point = "BOTTOMLEFT"
		E.db.actionbar.bar5.backdrop = false
		E.db.actionbar.bar5.heightMult = 1
		E.db.actionbar.bar5.widthMult = 1
		E.db.actionbar.bar5.buttonsize = 32
		E.db.actionbar.bar5.buttonspacing = 1
		E.db.actionbar.bar5.backdropSpacing = 0
		E.db.actionbar.bar5.alpha = 1
		E.db.actionbar.bar5.inheritGlobalFade = false
		E.db.actionbar.bar5.showGrid = true
		--Bar 6
		E.db.actionbar.bar6.enabled = true
		E.db.actionbar.bar6.mouseover = true
		E.db.actionbar.bar6.buttons = 12
		E.db.actionbar.bar6.buttonsPerRow = 12
		E.db.actionbar.bar6.point = "BOTTOMLEFT"
		E.db.actionbar.bar6.backdrop = false
		E.db.actionbar.bar6.heightMult = 1
		E.db.actionbar.bar6.widthMult = 1
		E.db.actionbar.bar6.buttonsize = 32
		E.db.actionbar.bar6.buttonspacing = 1
		E.db.actionbar.bar6.backdropSpacing = 0
		E.db.actionbar.bar6.alpha = 1
		E.db.actionbar.bar6.inheritGlobalFade = false
		E.db.actionbar.bar6.showGrid = true
			
		--Pet Bar
		E.db.actionbar.barPet.enabled = true
		E.db.actionbar.barPet.mouseover = true
		E.db.actionbar.barPet.style = "darkenInactive"
		E.db.actionbar.barPet.buttons = NUM_STANCE_SLOTS
		E.db.actionbar.barPet.buttonsPerRow = NUM_STANCE_SLOTS
		E.db.actionbar.barPet.point = "BOTTOMLEFT"
		E.db.actionbar.barPet.backdrop = false
		E.db.actionbar.barPet.heightMult = 1
		E.db.actionbar.barPet.widthMult = 1
		E.db.actionbar.barPet.buttonsize = 17
		E.db.actionbar.barPet.buttonspacing = 1
		E.db.actionbar.barPet.backdropSpacing = 0
		E.db.actionbar.barPet.alpha = 1
		E.db.actionbar.barPet.inheritGlobalFade = false
		E.db.actionbar.barPet.showGrid = true
		--Stance Bar
		E.db.actionbar.stanceBar.enabled = false
		E.db.actionbar.stanceBar.mouseover = true
		E.db.actionbar.stanceBar.style = "darkenInactive"
		E.db.actionbar.stanceBar.buttons = NUM_STANCE_SLOTS
		E.db.actionbar.stanceBar.buttonsPerRow = NUM_STANCE_SLOTS
		E.db.actionbar.stanceBar.point = "BOTTOMLEFT"
		E.db.actionbar.stanceBar.backdrop = false
		E.db.actionbar.stanceBar.heightMult = 1
		E.db.actionbar.stanceBar.widthMult = 1
		E.db.actionbar.stanceBar.buttonsize = 32
		E.db.actionbar.stanceBar.buttonspacing = 1
		E.db.actionbar.stanceBar.backdropSpacing = 0
		E.db.actionbar.stanceBar.alpha = 1
		E.db.actionbar.stanceBar.inheritGlobalFade = false
		E.db.actionbar.stanceBar.showGrid = true
		--extraActionButton
		E.db.actionbar.extraActionButton.alpha = 1
		E.db.actionbar.extraActionButton.scale = 0.80
		E.db.actionbar.extraActionButton.inheritGlobalFade = false

		----------[Bags]----------
		E.db.bags.bagSize = 30
		E.db.bags.bagWidth = 400
		E.db.bags.bankSize = 30
		E.db.bags.bankWidth = 400
		E.db.bags.alignToChat = false
		E.db.bags.moneyCoins = false
		E.db.bags.junkIcon = true
		E.db.bags.sortInverted = true
		E.db.bags.itemLevelFont = "Expressway"
		E.db.bags.itemLevelFontSize = 12
		E.db.bags.itemLevelFontOutline = "OUTLINE"
		E.db.bags.countFont = "Expressway"
		E.db.bags.countFontSize = 12
		E.db.bags.countFontOutline = "OUTLINE"
		E.db.bags.bagBar.enable = false

		----------[Auras]----------
		E.db.auras.font = "Expressway"
		E.db.auras.fontSize = 12
		E.db.auras.timeXOffset = 0
		E.db.auras.fontOutline = "OUTLINE"
		E.db.auras.buffs.wrapAfter = 12
		E.db.auras.buffs.maxWraps = 2
		E.db.auras.buffs.horizontalSpacing = 2
		E.db.auras.buffs.size = 34
		E.db.auras.debuffs.wrapAfter = 12
		E.db.auras.debuffs.maxWraps = 2
		E.db.auras.debuffs.horizontalSpacing = 2
		E.db.auras.debuffs.size = 34
		if IsAddOnLoaded('ElvUI_VisualAuraTimers') then
		E.db.auras.timeYOffset = -8
		E.db.auras.buffs.verticalSpacing = 24
		else
		E.db.auras.timeYOffset = -1
		E.db.auras.buffs.verticalSpacing = 16
		end

		----------[Chat]----------
		E.db.chat.font = "Expressway"
		E.db.chat.fontOutline = "OUTLINE"
		E.db.chat.editBoxPosition = 'BELOW_CHAT'
		E.db.chat.emotionIcons = false
		E.db.chat.lfgIcons = false
		E.db.chat.panelWidth = 400
		E.db.chat.panelHeight = 175
		E.db.chat.panelWidthRight = 400
		E.db.chat.panelHeightRight = 175
		E.db.chat.panelBackdrop = "HIDEBOTH"
		E.db.chat.panelTabBackdrop = false
		E.db.chat.panelTabTransparency = false
		E.db.chat.fadeUndockedTabs = true
		E.db.chat.fadeTabsNoBackdrop = true
		E.db.chat.tabFont = "Expressway"
		E.db.chat.tabFontSize = 12
		E.db.chat.tabFontOutline = "OUTLINE"
		E.db.chat.chatHistory = true
		E.db.chat.timeStampFormat = "%H:%M"
		E.db.chat.keywords = "%MYNAME%, ElvUI"
		E.db.chat.keywordSound = "None"

		----------[DataBars]----------
		--XP
		E.db.databars.experience.enable = true
		E.db.databars.experience.width = 220
		E.db.databars.experience.height = 20
		E.db.databars.experience.font = "Expressway"
		E.db.databars.experience.fontOutline = "OUTLINE"
		E.db.databars.experience.textFormat = "PERCENT"
		E.db.databars.experience.textSize = 10
		E.db.databars.experience.mouseover = false
		E.db.databars.experience.orientation = "HORIZONTAL"
		E.db.databars.experience.reverseFill = false
		E.db.databars.experience.hideAtMaxLevel = true
		E.db.databars.experience.hideInVehicle = false
		--Rep
		E.db.databars.reputation.enable = true
		E.db.databars.reputation.width = 395
		E.db.databars.reputation.height = 32
		E.db.databars.reputation.font = "Expressway"
		E.db.databars.reputation.fontOutline = "OUTLINE"
		E.db.databars.reputation.textFormat = "PERCENT"
		E.db.databars.reputation.textSize = 12
		E.db.databars.reputation.mouseover = true
		E.db.databars.reputation.orientation = "HORIZONTAL"
		E.db.databars.reputation.reverseFill = false
		E.db.databars.reputation.hideInVehicle = false
		--Art
		E.db.databars.artifact.enable = true
		E.db.databars.artifact.width = 395
		E.db.databars.artifact.height = 32
		E.db.databars.artifact.font = "Expressway"
		E.db.databars.artifact.fontOutline = "OUTLINE"
		E.db.databars.artifact.textFormat = "PERCENT"
		E.db.databars.artifact.textSize = 12
		E.db.databars.artifact.mouseover = true
		E.db.databars.artifact.orientation = "HORIZONTAL"
		E.db.databars.artifact.reverseFill = false
		E.db.databars.artifact.hideInVehicle = false
		--Honor
		E.db.databars.honor.enable = true
		E.db.databars.honor.width = 395
		E.db.databars.honor.height = 32
		E.db.databars.honor.font = "Expressway"
		E.db.databars.honor.fontOutline = "OUTLINE"
		E.db.databars.honor.textFormat = "PERCENT"
		E.db.databars.honor.textSize = 12
		E.db.databars.honor.mouseover = true
		E.db.databars.honor.orientation = "HORIZONTAL"
		E.db.databars.honor.reverseFill = false
		E.db.databars.honor.hideInVehicle = false

		----------[DataTexts]----------
		E.db.datatexts.font = "Expressway"
		E.db.datatexts.fontSize = 12
		E.db.datatexts.fontOutline = "OUTLINE"
		E.db.datatexts.battleground = false
		E.db.datatexts.panels.LeftChatDataPanel.left = ""
		E.db.datatexts.panels.LeftChatDataPanel.middle = ""
		E.db.datatexts.panels.LeftChatDataPanel.right = ""
		E.db.datatexts.panels.RightChatDataPanel.left = ""
		E.db.datatexts.panels.RightChatDataPanel.middle = ""
		E.db.datatexts.panels.RightChatDataPanel.right = ""
		E.db.datatexts.panels.LeftMiniPanel = ""
		E.db.datatexts.panels.RightMiniPanel = ""
		E.db.datatexts.panels.BottomMiniPanel = "Time (SFUI)"
		E.db.datatexts.panels.TopMiniPanel = ""
		E.db.datatexts.panels.BottomLeftMiniPanel = ""
		E.db.datatexts.panels.BottomRightMiniPanel = ""
		E.db.datatexts.panels.TopRightMiniPanel = ""
		E.db.datatexts.panels.TopLeftMiniPanel = ""
		E.db.datatexts.minimapPanels = false
		E.db.datatexts.leftChatPanel = false
		E.db.datatexts.rightChatPanel = false
		E.db.datatexts.minimapTop = false
		E.db.datatexts.minimapTopLeft = false
		E.db.datatexts.minimapTopRight = false
		E.db.datatexts.minimapBottom = true
		E.db.datatexts.minimapBottomLeft = false
		E.db.datatexts.minimapBottomRight = false

		----------[Nameplates]----------
		E.db.nameplates.statusbar = "Skullflower"
		E.db.nameplates.font = "Expressway"
		E.db.nameplates.stackFont = "Expressway"
		E.db.nameplates.durationFont = "Expressway"
		E.db.nameplates.fontSize = 12
		E.db.nameplates.fontOutline = "OUTLINE"
		E.db.nameplates.stackFontOutline = "OUTLINE"
		E.db.nameplates.durationFontOutline = "OUTLINE"
		E.db.nameplates.nonTargetTransparency = 0.65
		E.db.nameplates.classbar.enable = false
		E.db.nameplates.units.PLAYER.enable = false
		E.db.nameplates.units.PLAYER.healthbar.height = 14
		E.db.nameplates.units.PLAYER.healthbar.width = 175
		E.db.nameplates.units.PLAYER.healthbar.text.enable = true
		E.db.nameplates.units.PLAYER.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.PLAYER.buffs.baseHeight = 30
		E.db.nameplates.units.PLAYER.debuffs.baseHeight = 30
		E.db.nameplates.units.HEALER.healthbar.height = 14
		E.db.nameplates.units.HEALER.healthbar.width = 175
		E.db.nameplates.units.HEALER.healthbar.text.enable = true
		E.db.nameplates.units.HEALER.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.HEALER.buffs.baseHeight = 30
		E.db.nameplates.units.HEALER.debuffs.baseHeight = 30
		E.db.nameplates.units.FRIENDLY_PLAYER.healthbar.height = 14
		E.db.nameplates.units.FRIENDLY_PLAYER.healthbar.width = 175
		E.db.nameplates.units.FRIENDLY_PLAYER.healthbar.text.enable = true
		E.db.nameplates.units.FRIENDLY_PLAYER.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.FRIENDLY_PLAYER.buffs.baseHeight = 30
		E.db.nameplates.units.FRIENDLY_PLAYER.debuffs.baseHeight = 30
		E.db.nameplates.units.ENEMY_PLAYER.healthbar.height = 14
		E.db.nameplates.units.ENEMY_PLAYER.healthbar.width = 174
		E.db.nameplates.units.ENEMY_PLAYER.healthbar.text.enable = true
		E.db.nameplates.units.ENEMY_PLAYER.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.ENEMY_PLAYER.buffs.baseHeight = 30
		E.db.nameplates.units.ENEMY_PLAYER.debuffs.baseHeight = 30
		E.db.nameplates.units.FRIENDLY_NPC.healthbar.height = 14
		E.db.nameplates.units.FRIENDLY_NPC.healthbar.width = 175
		E.db.nameplates.units.FRIENDLY_NPC.healthbar.text.enable = true
		E.db.nameplates.units.FRIENDLY_NPC.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.FRIENDLY_NPC.buffs.baseHeight = 30
		E.db.nameplates.units.FRIENDLY_NPC.debuffs.baseHeight = 30
		E.db.nameplates.units.ENEMY_NPC.healthbar.height = 14
		E.db.nameplates.units.ENEMY_NPC.healthbar.width = 175
		E.db.nameplates.units.ENEMY_NPC.healthbar.text.enable = true
		E.db.nameplates.units.ENEMY_NPC.healthbar.text.format = "CURRENT_PERCENT"
		E.db.nameplates.units.ENEMY_NPC.buffs.baseHeight = 30
		E.db.nameplates.units.ENEMY_NPC.debuffs.baseHeight = 30

		---------[Tooltip]----------
		E.db.tooltip.targetInfo = true
		E.db.tooltip.playerTitles = true
		E.db.tooltip.guildRanks = true
		E.db.tooltip.inspectInfo = true
		E.db.tooltip.spellID = false
		E.db.tooltip.font = "Expressway"
		E.db.tooltip.fontOutline = "OUTLINE"
		E.db.tooltip.itemCount = "NONE"
		E.db.tooltip.headerFontSize = 11
		E.db.tooltip.textFontSize = 11
		E.db.tooltip.smallTextFontSize = 11
		E.db.tooltip.healthBar.text = false
		E.db.tooltip.healthBar.height = 0
		E.db.tooltip.healthBar.font = "Expressway"
		E.db.tooltip.healthBar.fontSIze = 11
		E.db.tooltip.visibility.combat = true

		---------[UnitFrames]----------
		E.db.unitframe.smoothbars = true
		E.db.unitframe.statusbar = "Skullflower"
		E.db.unitframe.font = "Expressway"
		E.db.unitframe.fontSize = 11
		E.db.unitframe.fontOutline = "OUTLINE"
		E.db.unitframe.smartRaidFilter = false
		
		--Colors
		E.db.unitframe.colors.healthclass = true
		E.db.unitframe.colors.forcehealthreaction = false
		E.db.unitframe.colors.colorhealthbyvalue = false
		E.db.unitframe.colors.customhealthbackdrop = true
		E.db.unitframe.colors.useDeadBackdrop = false
		E.db.unitframe.colors.castClassColor = false
		E.db.unitframe.colors.classbackdrop = false
		E.db.unitframe.colors.castColor = E:GetColor(17/255, 17/255, 17/255)
		E.db.unitframe.colors.health = { r = 107/255, g = 255/255, b = 103/255 }
		E.db.unitframe.colors.health_backdrop = { r = 18/255, g = 18/255, b = 18/255 }
		E.db.unitframe.colors.tapped = { r = 195/255, g = 202/255, b = 217/255 }
		E.db.unitframe.colors.disconnected = { r = 195/255, g = 202/255, b = 217/255 }
		E.db.unitframe.colors.power.MANA = { r = 79/255, g = 115/255, b = 161/255 }
		E.db.unitframe.colors.power.RAGE = { r = 199/255, g = 64/255, b = 64/255 }
		E.db.unitframe.colors.power.FOCUS = { r = 181/255, g = 110/255, b = 69/255 }
		E.db.unitframe.colors.power.ENERGY = { r = 166/255, g = 161/255, b = 89/255 }
		E.db.unitframe.colors.power.RUNIC_POWER = { r = 0/255, g = 209/255, b = 255/255 }
		E.db.unitframe.colors.power.FURY = { r = 227/255, g = 126/255, b = 39/255 }
		E.db.unitframe.colors.power.PAIN = { r = 225/255, g = 225/255, b = 225/255 }
		E.db.unitframe.colors.reaction.BAD = { r = 239/225, g = 31/225, b = 44/225 }
		E.db.unitframe.colors.reaction.NEUTRAL = { r = 255/255, g = 249/255, b = 94/255 }
		E.db.unitframe.colors.reaction.GOOD = { r = 107/255, g = 255/255, b = 103/255 }
		E.db.unitframe.colors.castColor = { r = 204/255, g = 204/255, b = 204/255 }
		E.db.unitframe.colors.castNoInterrupt = { r = 239/225, g = 31/225, b = 44/225 }
		E.db.unitframe.colors.classResources.bgColor = { r = 18/255, g = 18/255, b = 18/255}
		--Resource Colors
		E.db.unitframe.colors.classResources.MONK[1] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[2] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[3] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[4] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[5] = { r = 0/255, g = 255/255, b = 150/255 }
		E.db.unitframe.colors.classResources.MONK[6] = { r = 0/255, g = 255/255, b = 150/255 }
		
		--Player
		E.db.unitframe.units.player.customTexts = {}
		E.db.unitframe.units.player.customTexts.HealthText = {}
		E.db.unitframe.units.player.combatIcon = false
		E.db.unitframe.units.player.restIcon = false
		E.db.unitframe.units.player.width = 220
		E.db.unitframe.units.player.height = 60
		E.db.unitframe.units.player.healPrediction = true
		E.db.unitframe.units.player.threatStyle = "NONE"
		E.db.unitframe.units.player.health.text_format = ""
		E.db.unitframe.units.player.power.text_format = ""
		E.db.unitframe.units.player.power.position = "RIGHT"
		E.db.unitframe.units.player.power.attachTextTo = "Power"
		E.db.unitframe.units.player.power.height = 15
		E.db.unitframe.units.player.power.xOffset = 0
		E.db.unitframe.units.player.power.yOffset = 0
		E.db.unitframe.units.player.power.detachFromFrame = true
		E.db.unitframe.units.player.power.detachedWidth = 220
		E.db.unitframe.units.player.power.druidMana = false
		E.db.unitframe.units.player.power.strataAndLevel.useCustomStrata = true
		E.db.unitframe.units.player.pvp.text_format = ""
		E.db.unitframe.units.player.buffs.enable = false
		E.db.unitframe.units.player.buffs.yOffset = 4
		E.db.unitframe.units.player.buffs.attachTo = "Frame"
		E.db.unitframe.units.player.buffs.anchorPoint = "CENTER"
		E.db.unitframe.units.player.debuffs.enable = false
		E.db.unitframe.units.player.debuffs.sizeOverride = 46
		E.db.unitframe.units.player.debuffs.xOffset = -1
		E.db.unitframe.units.player.debuffs.yOffset = -8
		E.db.unitframe.units.player.debuffs.fontSize = 16
		E.db.unitframe.units.player.debuffs.attachTo = "Frame"
		E.db.unitframe.units.player.debuffs.anchorPoint = "LEFT"
		E.db.unitframe.units.player.castbar.enable = true
		E.db.unitframe.units.player.castbar.width = 220
		E.db.unitframe.units.player.castbar.height = 17
		E.db.unitframe.units.player.castbar.icon = false
		E.db.unitframe.units.player.castbar.latency = false
		E.db.unitframe.units.player.castbar.format = "Remaining"
		E.db.unitframe.units.player.castbar.ticks = true
		E.db.unitframe.units.player.castbar.spark = false
		E.db.unitframe.units.player.stagger.enable = false
		E.db.unitframe.units.player.customTexts.HealthText.text_format = ""
		E.db.unitframe.units.player.customTexts.HealthText.justifyH = "Left"
		E.db.unitframe.units.player.customTexts.HealthText.xOffset = 6
		E.db.unitframe.units.player.customTexts.HealthText.yOffset = 5
		E.db.unitframe.units.player.customTexts.HealthText.size = 32
		E.db.unitframe.units.player.aurabar.enable = false
		E.db.unitframe.units.player.aurabar.attachTo = "FRAME"
		E.db.unitframe.units.player.aurabar.anchorPoint = "ABOVE"
		E.db.unitframe.units.player.aurabar.height = 18
		E.db.unitframe.units.player.classbar.detachFromFrame = true
		if E.myclass == "DEATHKNIGHT" and IsAddOnLoaded("CompactRunes") or IsAddOnLoaded("mRunes") then
			E.db.unitframe.units.player.classbar.enable = false
			E.db.unitframe.units.player.classbar.height = 0
			E.db.unitframe.units.player.classbar.detachedWidth = 0
		else
			E.db.unitframe.units.player.classbar.enable = true
			E.db.unitframe.units.player.classbar.detachedWidth = 220
			E.db.unitframe.units.player.classbar.height = 15
		end
		
		--Target
		E.db.unitframe.units.target.customTexts = {}
		E.db.unitframe.units.target.customTexts.HealthText = {}
		E.db.unitframe.units.target.customTexts.NameText = {}
		E.db.unitframe.units.target.rangeCheck = false
		E.db.unitframe.units.target.width = 220
		E.db.unitframe.units.target.height = 60
		E.db.unitframe.units.target.healPrediction = false
		E.db.unitframe.units.target.threatStyle = "NONE"
		E.db.unitframe.units.target.health.text_format = ""
		E.db.unitframe.units.target.power.text_format = ""
		E.db.unitframe.units.target.power.attachTextTo = "Health"
		E.db.unitframe.units.target.power.position = "LEFT"
		E.db.unitframe.units.target.power.height = 15
		E.db.unitframe.units.target.power.xOffset = 2
		E.db.unitframe.units.target.power.yOffset = -22
		E.db.unitframe.units.target.power.detachFromFrame = true
		E.db.unitframe.units.target.power.detachedWidth = 220
		E.db.unitframe.units.target.power.hideonnpc = false
		E.db.unitframe.units.target.power.strataAndLevel.useCustomStrata = true
		E.db.unitframe.units.target.name.position = "LEFT"
		E.db.unitframe.units.target.name.text_format = ""
		E.db.unitframe.units.target.name.xOffset = 0
		E.db.unitframe.units.target.name.yOffset = 0
		E.db.unitframe.units.target.buffs.enable = true
		E.db.unitframe.units.target.buffs.anchorPoint = "TOPLEFT"
		E.db.unitframe.units.target.buffs.attachTo = "FRAME"
		E.db.unitframe.units.target.buffs.sizeOverride = 26
		E.db.unitframe.units.target.buffs.perrow = 8
		E.db.unitframe.units.target.buffs.fontSize = 11
		E.db.unitframe.units.target.buffs.xOffset = 0
		E.db.unitframe.units.target.buffs.yOffset = 1
		E.db.unitframe.units.target.debuffs.enable = true
		E.db.unitframe.units.target.debuffs.attachTo = "FRAME"
		E.db.unitframe.units.target.debuffs.anchorPoint = "TOPLEFT"
		E.db.unitframe.units.target.debuffs.sizeOverride = 26
		E.db.unitframe.units.target.debuffs.perrow = 8
		E.db.unitframe.units.target.debuffs.fontSize = 11
		E.db.unitframe.units.target.debuffs.xOffset = 0
		E.db.unitframe.units.target.debuffs.yOffset = 28
		E.db.unitframe.units.target.castbar.enable = true
		E.db.unitframe.units.target.castbar.width = 220
		E.db.unitframe.units.target.castbar.height = 17
		E.db.unitframe.units.target.castbar.icon = false
		E.db.unitframe.units.target.castbar.format = "Remaining"
		E.db.unitframe.units.target.castbar.spark = false
		E.db.unitframe.units.target.aurabar.enable = false
		E.db.unitframe.units.target.aurabar.attachTo = "FRAME"
		E.db.unitframe.units.target.aurabar.anchorPoint = "ABOVE"
		E.db.unitframe.units.target.aurabar.height = 18
		E.db.unitframe.units.target.customTexts.HealthText.text_format = ""
		E.db.unitframe.units.target.customTexts.HealthText.justifyH = "Right"
		E.db.unitframe.units.target.customTexts.HealthText.xOffset = -6
		E.db.unitframe.units.target.customTexts.HealthText.yOffset = 5
		E.db.unitframe.units.target.customTexts.HealthText.size = 32
		E.db.unitframe.units.target.customTexts.NameText.text_format = ""
		E.db.unitframe.units.target.customTexts.NameText.justifyH = "Left"
		E.db.unitframe.units.target.customTexts.NameText.xOffset = 4
		E.db.unitframe.units.target.customTexts.NameText.yOffset = 4
		E.db.unitframe.units.target.customTexts.NameText.size = 14
		
		--Target of Target
		E.db.unitframe.units.targettarget.enable = true
		E.db.unitframe.units.targettarget.rangeCheck = false
		E.db.unitframe.units.targettarget.debuffs.enable = false
		E.db.unitframe.units.targettarget.width = 100
		E.db.unitframe.units.targettarget.height = 35
		E.db.unitframe.units.targettarget.power.enable = false
		E.db.unitframe.units.targettarget.name.position = "CENTER"
		E.db.unitframe.units.targettarget.name.text_format = ""
		
		--Focus
		E.db.unitframe.units.focus.rangeCheck = false
		E.db.unitframe.units.focus.width= 120
		E.db.unitframe.units.focus.height = 30
		E.db.unitframe.units.focus.power.enable = false
		E.db.unitframe.units.focus.power.height = 3
		E.db.unitframe.units.focus.threatStyle = "NONE"
		E.db.unitframe.units.focus.name.position = "CENTER"
		E.db.unitframe.units.focus.name.text_format = ""
		E.db.unitframe.units.focus.debuffs.enable = false
		E.db.unitframe.units.focus.castbar.width = 120
		E.db.unitframe.units.focus.castbar.height = 15
		E.db.unitframe.units.focus.castbar.icon = false
		E.db.unitframe.units.focus.castbar.format = "Remaining"
		E.db.unitframe.units.focus.castbar.spark = false
		
		--Focus Target
		E.db.unitframe.units.focustarget.enable = true
		E.db.unitframe.units.focustarget.rangeCheck = false
		E.db.unitframe.units.focustarget.debuffs.enable = false
		E.db.unitframe.units.focustarget.width = 120
		E.db.unitframe.units.focustarget.height = 16
		E.db.unitframe.units.focustarget.power.enable = false
		E.db.unitframe.units.focustarget.name.position = "CENTER"
		E.db.unitframe.units.focustarget.name.text_format = ""
		
		--Pet
		E.db.unitframe.units.pet.rangeCheck = false
		E.db.unitframe.units.pet.width = 100
		E.db.unitframe.units.pet.height = 35
		E.db.unitframe.units.pet.threatStyle = "NONE"
		E.db.unitframe.units.pet.healPrediction = false
		E.db.unitframe.units.pet.power.enable = false
		E.db.unitframe.units.pet.name.text_format = ""
		E.db.unitframe.units.pet.name.position = "CENTER"
		E.db.unitframe.units.pet.buffIndicator.enable = false
		E.db.unitframe.units.pet.castbar.width = 100
		E.db.unitframe.units.pet.castbar.height = 15
		E.db.unitframe.units.pet.castbar.spark = false
		E.db.unitframe.units.pet.castbar.icon = false
		E.db.unitframe.units.pet.castbar.iconAttached = false
		E.db.unitframe.units.pet.insideInfoPanel = false

		--Boss 
		E.db.unitframe.units.boss.enable = false
		E.db.unitframe.units.boss.width = 175
		E.db.unitframe.units.boss.height = 35
		E.db.unitframe.units.boss.spacing = 20
		E.db.unitframe.units.boss.health.text_format = "[health:percent]"
		E.db.unitframe.units.boss.health.position = "RIGHT"
		E.db.unitframe.units.boss.health.xOffset = -4
		E.db.unitframe.units.boss.health.yOffset = 0
		E.db.unitframe.units.boss.power.enable = true
		E.db.unitframe.units.boss.power.height = 5
		E.db.unitframe.units.boss.power.text_format = ""
		E.db.unitframe.units.boss.name.text_format = "[name:medium]"
		E.db.unitframe.units.boss.name.position = "LEFT"
		E.db.unitframe.units.boss.name.xOffset = 4
		E.db.unitframe.units.boss.name.yOffset = 0
		E.db.unitframe.units.boss.castbar.enable = true
		E.db.unitframe.units.boss.castbar.width = 175
		E.db.unitframe.units.boss.castbar.height = 10
		E.db.unitframe.units.boss.castbar.icon = false
		E.db.unitframe.units.boss.castbar.format = ""
		E.db.unitframe.units.boss.buffs.enable = false
		E.db.unitframe.units.boss.buffs.perrow = 3
		E.db.unitframe.units.boss.buffs.numrows = 1
		E.db.unitframe.units.boss.buffs.anchorPoint = "LEFT"
		E.db.unitframe.units.boss.buffs.fontSize = 22
		E.db.unitframe.units.boss.buffs.xOffset = -3
		E.db.unitframe.units.boss.buffs.yOffset = 0
		E.db.unitframe.units.boss.buffs.sizeOverride = 35
		E.db.unitframe.units.boss.debuffs.enable = true
		E.db.unitframe.units.boss.debuffs.perrow = 3
		E.db.unitframe.units.boss.debuffs.numrows = 1
		E.db.unitframe.units.boss.debuffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.boss.debuffs.fontSize = 22
		E.db.unitframe.units.boss.debuffs.xOffset = 1
		E.db.unitframe.units.boss.debuffs.yOffset = 0
		E.db.unitframe.units.boss.debuffs.sizeOverride = 35
		
		--Arena
		E.db.unitframe.units.arena.width = 225
		E.db.unitframe.units.arena.height = 40
		E.db.unitframe.units.arena.spacing = 20
		E.db.unitframe.units.arena.health.text_format = "[health:current] | [health:percent]"
		E.db.unitframe.units.arena.health.position = "RIGHT"
		E.db.unitframe.units.arena.health.xOffset = -4
		E.db.unitframe.units.arena.health.yOffset = 0
		E.db.unitframe.units.arena.power.text_format = ""
		E.db.unitframe.units.arena.name.text_format = "[name:medium]"
		E.db.unitframe.units.arena.name.position = "LEFT"
		E.db.unitframe.units.arena.name.xOffset = 4
		E.db.unitframe.units.arena.name.yOffset = 0
		E.db.unitframe.units.arena.buffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.arena.buffs.fontSize = 11
		E.db.unitframe.units.arena.buffs.sizeOverride = 19
		E.db.unitframe.units.arena.buffs.xOffset = 1
		E.db.unitframe.units.arena.buffs.yOffset = 10
		E.db.unitframe.units.arena.debuffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.arena.debuffs.fontSize = 11
		E.db.unitframe.units.arena.debuffs.sizeOverride = 19
		E.db.unitframe.units.arena.debuffs.xOffset = 1
		E.db.unitframe.units.arena.debuffs.yOffset = -11
		E.db.unitframe.units.arena.castbar.width = 225
		E.db.unitframe.units.arena.castbar.height = 10
		E.db.unitframe.units.arena.castbar.icon = false
		E.db.unitframe.units.arena.castbar.format = ""
		E.db.unitframe.units.arena.castbar.spark = false
		
		--Party
		E.db.unitframe.units.party.width = 200
		E.db.unitframe.units.party.height = 25
		E.db.unitframe.units.party.threatStyle = "GLOW"
		E.db.unitframe.units.party.growthDirection = "DOWN_RIGHT"
		E.db.unitframe.units.party.horizontalSpacing = 0
		E.db.unitframe.units.party.verticalSpacing = 1
		E.db.unitframe.units.party.health.attachTextTo = "Health"
		E.db.unitframe.units.party.health.position = "CENTER"
		E.db.unitframe.units.party.health.text_format = "[health:deficit]"
		E.db.unitframe.units.party.health.xOffset = 0
		E.db.unitframe.units.party.health.yOffset = 0
		E.db.unitframe.units.party.power.enable = true
		E.db.unitframe.units.party.power.height = 5
		E.db.unitframe.units.party.power.text_format = "[powercolor][power:current]"
		E.db.unitframe.units.party.power.position = "RIGHT"
		E.db.unitframe.units.party.power.attachTo = "HEALTH"
		E.db.unitframe.units.party.power.xOffset = -2
		E.db.unitframe.units.party.power.yOffset = 0
		E.db.unitframe.units.party.name.position = "LEFT"
		E.db.unitframe.units.party.name.attachTextTo = "Frame"
		E.db.unitframe.units.party.name.text_format = "[name:long]"
		E.db.unitframe.units.party.name.xOffset = 205
		E.db.unitframe.units.party.name.yOffset = 0
		E.db.unitframe.units.party.buffs.enable = false
		E.db.unitframe.units.party.buffs.perrow = 2
		E.db.unitframe.units.party.buffs.numrows = 1
		E.db.unitframe.units.party.buffs.sizeOverride = 20
		E.db.unitframe.units.party.buffs.xOffset = -47
		E.db.unitframe.units.party.buffs.yOffset = 0
		E.db.unitframe.units.party.buffs.anchorPoint = "RIGHT"
		E.db.unitframe.units.party.debuffs.enable = false
		E.db.unitframe.units.party.debuffs.perrow = 1
		E.db.unitframe.units.party.debuffs.numrows = 3
		E.db.unitframe.units.party.debuffs.sizeOverride = 30
		E.db.unitframe.units.party.debuffs.yOffset = -1
		E.db.unitframe.units.party.debuffs.anchorPoint = "BOTTOM"
		E.db.unitframe.units.party.debuffs.onlyDispellable = true
		E.db.unitframe.units.party.buffIndicator.enable = true
		E.db.unitframe.units.party.buffIndicator.size = 8
		E.db.unitframe.units.party.roleIcon.enable = true
		E.db.unitframe.units.party.roleIcon.damager = false
		E.db.unitframe.units.party.roleIcon.position = "LEFT"
		E.db.unitframe.units.party.roleIcon.xOffset = 0
		E.db.unitframe.units.party.roleIcon.yOffset = 0
		E.db.unitframe.units.party.visibility = "[@raid6,exists][nogroup] hide;show"
		
		--Raid
		E.db.unitframe.units.raid.width = 170
		E.db.unitframe.units.raid.height = 20
		E.db.unitframe.units.raid.threatStyle = "GLOW"
		E.db.unitframe.units.raid.growthDirection = "DOWN_RIGHT"
		E.db.unitframe.units.raid.visibility = "[@raid6,noexists][@raid31,exists] hide;show"
		E.db.unitframe.units.raid.horizontalSpacing = 0
		E.db.unitframe.units.raid.verticalSpacing = 1
		E.db.unitframe.units.raid.health.text_format = "[health:deficit]"
		E.db.unitframe.units.raid.power.enable = false
		E.db.unitframe.units.raid.name.position = "LEFT"
		E.db.unitframe.units.raid.name.attachTextTo = "Frame"
		E.db.unitframe.units.raid.name.text_format = "[name:long]"
		E.db.unitframe.units.raid.name.xOffset = 175
		E.db.unitframe.units.raid.name.yOffset = 0
		E.db.unitframe.units.raid.buffs.enable = false
		E.db.unitframe.units.raid.debuffs.enable = true
		E.db.unitframe.units.raid.debuffs.perrow = 1
		E.db.unitframe.units.raid.debuffs.numrows = 1
		E.db.unitframe.units.raid.debuffs.sizeOverride = 18
		E.db.unitframe.units.raid.debuffs.xOffset = 0
		E.db.unitframe.units.raid.debuffs.yOffset = 0
		E.db.unitframe.units.raid.debuffs.attachTo = "FRAME"
		E.db.unitframe.units.raid.debuffs.anchorPoint = "CENTER"
		E.db.unitframe.units.raid.debuffs.onlyDispellable = true
		E.db.unitframe.units.party.buffIndicator.enable = true
		E.db.unitframe.units.party.buffIndicator.size = 8
		E.db.unitframe.units.raid.rdebuffs.enable = false
		E.db.unitframe.units.raid.rdebuffs.size = 20
		E.db.unitframe.units.raid.rdebuffs.font = "Expressway"
		E.db.unitframe.units.raid.rdebuffs.fontOutline = "OUTLINE"
		E.db.unitframe.units.raid.roleIcon.enable = true
		E.db.unitframe.units.raid.roleIcon.damager = false
		E.db.unitframe.units.raid.roleIcon.position = "LEFT"
		E.db.unitframe.units.raid.roleIcon.xOffset = 0
		E.db.unitframe.units.raid.roleIcon.yOffset = 0
		E.db.unitframe.units.raid.numGroups = 6
		E.db.unitframe.units.raid.groupsPerRowCol = 6
		E.db.unitframe.units.raid40.enable = true
		E.db.unitframe.units.raid40.width = 170
		E.db.unitframe.units.raid40.height = 15
		E.db.unitframe.units.raid40.threatStyle = "GLOW"
		E.db.unitframe.units.raid40.growthDirection = "DOWN_RIGHT"
		E.db.unitframe.units.raid40.visibility = "[@raid31,noexists] hide;show"
		E.db.unitframe.units.raid40.horizontalSpacing = 0
		E.db.unitframe.units.raid40.verticalSpacing = 1
		E.db.unitframe.units.raid40.health.text_format = "[health:deficit]"
		E.db.unitframe.units.raid40.power.enable = false
		E.db.unitframe.units.raid40.name.position = "LEFT"
		E.db.unitframe.units.raid40.name.attachTextTo = "Frame"
		E.db.unitframe.units.raid40.name.text_format = "[name:long]"
		E.db.unitframe.units.raid40.name.xOffset = 175
		E.db.unitframe.units.raid40.name.yOffset = 0
		E.db.unitframe.units.raid40.buffs.enable = false
		E.db.unitframe.units.raid40.debuffs.enable = false
		E.db.unitframe.units.raid40.buffIndicator.enable = true
		E.db.unitframe.units.raid40.buffIndicator.size = 8
		E.db.unitframe.units.raid40.rdebuffs.enable = false
		E.db.unitframe.units.raid40.roleIcon.enable = false
		E.db.unitframe.units.raid40.numGroups = 8
		E.db.unitframe.units.raid40.groupsPerRowCol = 8
		E.db.unitframe.units.tank.enable = false
		E.db.unitframe.units.assist.enable = false

		
		
		---------[Optional Settings]----------
		--Set Textures to SkullflowerLight
		elseif theme == "LightTexture" then
			E.db.unitframe.statusbar = "SkullflowerLight"
			E.db.nameplates.statusbar = "SkullflowerLight"
			E.private.general.normTex = "SkullflowerLight"
			E.private.general.glossTex = "SkullflowerLight"
			
		
		--Set Old UI Style
		elseif theme == "OldUIStyle" then
			E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
			E.db.movers["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,99"
			E.db.movers["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,207"
			if E.myclass == "MAGE" or E.myclass == "PRIEST" or E.myclass == "WARRIOR" or E.myclass == "HUNTER" or E.myclass == "DEMONHUNTER" then
			E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,337"
			elseif E.myclass == "DEATHKNIGHT" and IsAddOnLoaded("CompactRunes") or IsAddOnLoaded("mRunes") then
			E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,337"
			else
			E.db.movers["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,353"
			end
		--Player movers
			E.db.movers["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,337"
			E.db.movers["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,337"
			E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,263"
		--Pet movers
			E.db.movers["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,200"
			E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,184"
			E.db.movers["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-240,236"
		--Target/ToT movers
			E.db.movers["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,263"
			E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,280,200"
		--Focus/FT movers
			E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,306"
			E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,290"
			E.db.movers["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,337"
		
		--Colors
			E.db.unitframe.colors.power.MANA = { r = 0/255, g = 190/255, b = 230/255 }
			E.db.unitframe.colors.power.RAGE = { r = 70/255, g = 70/255, b = 70/255 }
			E.db.unitframe.colors.power.FOCUS = { r = 230/255, g = 140/255, b = 60/255 }
			E.db.unitframe.colors.power.ENERGY = { r = 70/255, g = 70/255, b = 70/255 }
			E.db.unitframe.colors.power.RUNIC_POWER = { r = 70/255, g = 70/255, b = 70/255 }
			E.db.unitframe.colors.power.FURY = { r = 70/255, g = 70/255, b = 70/255 }
			E.db.unitframe.colors.power.PAIN = { r = 70/255, g = 70/255, b = 70/255 }
		--Player
			E.db.unitframe.units.player.height = 55
			E.db.unitframe.units.player.power.height = 20
			E.db.unitframe.units.player.customTexts.HealthText.xOffset = 11
			E.db.unitframe.units.player.customTexts.HealthText.yOffset = -4
			E.db.unitframe.units.player.customTexts.HealthText.size = 34
		--Target
			E.db.unitframe.units.target.height = 55
			E.db.unitframe.units.target.power.height = 20
			E.db.unitframe.units.target.power.yOffset = -18
			E.db.unitframe.units.target.customTexts.HealthText.xOffset = -11
			E.db.unitframe.units.target.customTexts.HealthText.yOffset = -4
			E.db.unitframe.units.target.customTexts.HealthText.size = 34
			E.db.unitframe.units.target.customTexts.NameText.xOffset = 4
			E.db.unitframe.units.target.customTexts.NameText.yOffset = 8
			E.db.unitframe.units.target.customTexts.NameText.size = 12

		
		--Set Healer Layout
		elseif theme == "HealerLayout" then
			E.db.movers["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-555,33"
			E.db.movers["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-99"
		--Player movers
			E.db.movers["ElvUF_PlayerMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,281"
			E.db.movers["PlayerPowerBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,281"
			E.db.movers["ComboBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,342"
			E.db.movers["ClassBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,342"
			E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,263"
		--Pet movers
			E.db.movers["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,200"
			E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,184"
			E.db.movers["PetAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,520,236"
		--Target/ToT movers
			E.db.movers["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-520,281"
			E.db.movers["TargetPowerBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-520,281"
			E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-520,263"
			E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-520,200"
		--Focus/FT movers
			E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-350,311"
			E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-350,295"
			E.db.movers["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-350,342"
		--Group movers
			E.db.movers["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,708,71"
			E.db.movers["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,755,-259"
			E.db.movers["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,755,-265"
			
		--Party
			E.db.unitframe.units.party.width = 100
			E.db.unitframe.units.party.height = 50
			E.db.unitframe.units.party.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.party.threatStyle = "GLOW"
			E.db.unitframe.units.party.horizontalSpacing = 1
			E.db.unitframe.units.party.verticalSpacing = 1
			E.db.unitframe.units.party.health.text_format = ""
			E.db.unitframe.units.party.health.position = "CENTER"
			E.db.unitframe.units.party.health.attachTextTo = "Frame"
			E.db.unitframe.units.party.power.enable = true
			E.db.unitframe.units.party.power.height = 5
			E.db.unitframe.units.party.power.text_format = ""
			E.db.unitframe.units.party.power.position = "RIGHT"
			E.db.unitframe.units.party.power.attachTo = "HEALTH"
			E.db.unitframe.units.party.power.xOffset = -2
			E.db.unitframe.units.party.power.yOffset = 0
			E.db.unitframe.units.party.name.position = "CENTER"
			E.db.unitframe.units.party.name.attachTextTo = "Frame"
			E.db.unitframe.units.party.name.text_format = "[name:medium]"
			E.db.unitframe.units.party.name.xOffset = 0
			E.db.unitframe.units.party.name.yOffset = 0
			E.db.unitframe.units.party.buffIndicator.enable = true
			E.db.unitframe.units.party.roleIcon.enable = false
			E.db.unitframe.units.party.debuffs.enable = true
			E.db.unitframe.units.party.debuffs.perrow = 1
			E.db.unitframe.units.party.debuffs.numrows = 1
			E.db.unitframe.units.party.debuffs.sizeOverride = 20
			E.db.unitframe.units.party.debuffs.xOffset = 0
			E.db.unitframe.units.party.debuffs.yOffset = -20
			E.db.unitframe.units.party.debuffs.anchorPoint = "TOPRIGHT"
			E.db.unitframe.units.party.debuffs.onlyDispellable = true
			E.db.unitframe.units.party.buffs.enable = false
			E.db.unitframe.units.party.buffs.perrow = 2
			E.db.unitframe.units.party.buffs.numrows = 1
			E.db.unitframe.units.party.buffs.sizeOverride = 20
			E.db.unitframe.units.party.buffs.xOffset = -47
			E.db.unitframe.units.party.buffs.yOffset = 0
			E.db.unitframe.units.party.buffs.anchorPoint = "RIGHT"
			E.db.unitframe.units.party.visibility = "[@raid6,exists][nogroup] hide;show"
		--Raid
			E.db.unitframe.units.raid.width = 80
			E.db.unitframe.units.raid.height = 40
			E.db.unitframe.units.raid.threatStyle = "GLOW"
			E.db.unitframe.units.raid.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.raid.visibility = "[@raid6,noexists][@raid31,exists] hide;show"
			E.db.unitframe.units.raid.horizontalSpacing = 2
			E.db.unitframe.units.raid.verticalSpacing = 2
			E.db.unitframe.units.raid.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid.health.position = "BOTTOM"
			E.db.unitframe.units.raid.power.enable = false
			E.db.unitframe.units.raid.name.position = "CENTER"
			E.db.unitframe.units.raid.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid.name.text_format = "[name:medium]"
			E.db.unitframe.units.raid.name.xOffset = 0
			E.db.unitframe.units.raid.name.yOffset = 0
			E.db.unitframe.units.raid.roleIcon.enable = true
			E.db.unitframe.units.raid.roleIcon.size = 15
			E.db.unitframe.units.raid.roleIcon.position = "TOPLEFT"
			E.db.unitframe.units.raid.roleIcon.xOffset = 0
			E.db.unitframe.units.raid.roleIcon.yOffset = 0
			E.db.unitframe.units.raid.numGroups = 6
			E.db.unitframe.units.raid.groupsPerRowCol = 1
			E.db.unitframe.units.raid.buffs.enable = false
			E.db.unitframe.units.raid.debuffs.enable = true
			E.db.unitframe.units.raid.debuffs.perrow = 1
			E.db.unitframe.units.raid.debuffs.numrows = 1
			E.db.unitframe.units.raid.debuffs.sizeOverride = 20
			E.db.unitframe.units.raid.debuffs.xOffset = 0
			E.db.unitframe.units.raid.debuffs.yOffset = -20
			E.db.unitframe.units.raid.debuffs.anchorPoint = "TOPRIGHT"
			E.db.unitframe.units.raid.debuffs.onlyDispellable = true
			E.db.unitframe.units.raid40.enable = true
			E.db.unitframe.units.raid40.width = 80
			E.db.unitframe.units.raid40.height = 30
			E.db.unitframe.units.raid40.threatStyle = "GLOW"
			E.db.unitframe.units.raid40.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.raid40.visibility = "[@raid31,noexists] hide;show"
			E.db.unitframe.units.raid40.horizontalSpacing = 2
			E.db.unitframe.units.raid40.verticalSpacing = 2
			E.db.unitframe.units.raid40.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid40.health.position = "BOTTOM"
			E.db.unitframe.units.raid40.power.enable = false
			E.db.unitframe.units.raid40.name.position = "CENTER"
			E.db.unitframe.units.raid40.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid40.name.text_format = "[name:medium]"
			E.db.unitframe.units.raid40.name.xOffset = 0
			E.db.unitframe.units.raid40.name.yOffset = 0
			E.db.unitframe.units.raid40.roleIcon.enable = true
			E.db.unitframe.units.raid40.roleIcon.size = 15
			E.db.unitframe.units.raid40.roleIcon.position = "BOTTOMLEFT"
			E.db.unitframe.units.raid40.roleIcon.xOffset = 0
			E.db.unitframe.units.raid40.roleIcon.yOffset = 0
			E.db.unitframe.units.raid40.numGroups = 8
			E.db.unitframe.units.raid40.groupsPerRowCol = 1
			E.db.unitframe.units.tank.enable = false
			E.db.unitframe.units.assist.enable = false

			
		--Set Boxed Party/Raid Frames
		elseif theme == "BoxedFrames" then
			E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
			E.db.movers["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,99"
			E.db.movers["BNETMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,207"
		--Player movers
			E.db.movers["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
			E.db.movers["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
			E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,263"
		--Pet movers
			E.db.movers["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,200"
			E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,184"
			E.db.movers["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-240,236"
		--Target/ToT movers
			E.db.movers["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,263"
			E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,280,200"
		--Focus/FT movers
			E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,311"
			E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,295"
			E.db.movers["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,342"
		--Group movers
			E.db.movers["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,247"
			E.db.movers["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,452"
			E.db.movers["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,454"
			
		--Party
			E.db.unitframe.units.party.width = 80
			E.db.unitframe.units.party.height = 40
			E.db.unitframe.units.party.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.party.threatStyle = "GLOW"
			E.db.unitframe.units.party.horizontalSpacing = 1
			E.db.unitframe.units.party.verticalSpacing = 1
			E.db.unitframe.units.party.health.text_format = ""
			E.db.unitframe.units.party.health.position = "CENTER"
			E.db.unitframe.units.party.health.attachTextTo = "Frame"
			E.db.unitframe.units.party.power.enable = true
			E.db.unitframe.units.party.power.height = 5
			E.db.unitframe.units.party.power.text_format = ""
			E.db.unitframe.units.party.power.position = "RIGHT"
			E.db.unitframe.units.party.power.attachTo = "HEALTH"
			E.db.unitframe.units.party.power.xOffset = -2
			E.db.unitframe.units.party.power.yOffset = 0
			E.db.unitframe.units.party.name.position = "CENTER"
			E.db.unitframe.units.party.name.attachTextTo = "Frame"
			E.db.unitframe.units.party.name.text_format = "[name:medium]"
			E.db.unitframe.units.party.name.xOffset = 0
			E.db.unitframe.units.party.name.yOffset = 0
			E.db.unitframe.units.party.buffIndicator.enable = true
			E.db.unitframe.units.party.buffIndicator.size = 8
			E.db.unitframe.units.party.roleIcon.enable = true
			E.db.unitframe.units.party.roleIcon.damager = false
			E.db.unitframe.units.party.roleIcon.position = "TOPLEFT"
			E.db.unitframe.units.party.roleIcon.xOffset = 0
			E.db.unitframe.units.party.roleIcon.yOffset = 0
			E.db.unitframe.units.party.debuffs.enable = false
			E.db.unitframe.units.party.debuffs.perrow = 1
			E.db.unitframe.units.party.debuffs.numrows = 1
			E.db.unitframe.units.party.debuffs.sizeOverride = 20
			E.db.unitframe.units.party.debuffs.xOffset = 0
			E.db.unitframe.units.party.debuffs.yOffset = -20
			E.db.unitframe.units.party.debuffs.anchorPoint = "TOPRIGHT"
			E.db.unitframe.units.party.debuffs.onlyDispellable = true
			E.db.unitframe.units.party.buffs.enable = false
			E.db.unitframe.units.party.buffs.perrow = 2
			E.db.unitframe.units.party.buffs.numrows = 1
			E.db.unitframe.units.party.buffs.sizeOverride = 20
			E.db.unitframe.units.party.buffs.xOffset = -47
			E.db.unitframe.units.party.buffs.yOffset = 0
			E.db.unitframe.units.party.buffs.anchorPoint = "RIGHT"
			E.db.unitframe.units.party.visibility = "[@raid6,exists][nogroup] hide;show"
		--Raid
			E.db.unitframe.units.raid.width = 80
			E.db.unitframe.units.raid.height = 40
			E.db.unitframe.units.raid.threatStyle = "GLOW"
			E.db.unitframe.units.raid.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.raid.visibility = "[@raid6,noexists][@raid31,exists] hide;show"
			E.db.unitframe.units.raid.horizontalSpacing = 1
			E.db.unitframe.units.raid.verticalSpacing = 1
			E.db.unitframe.units.raid.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid.health.position = "BOTTOM"
			E.db.unitframe.units.raid.power.enable = false
			E.db.unitframe.units.raid.name.position = "CENTER"
			E.db.unitframe.units.raid.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid.name.text_format = "[name:medium]"
			E.db.unitframe.units.raid.name.xOffset = 0
			E.db.unitframe.units.raid.name.yOffset = 0
			E.db.unitframe.units.raid.roleIcon.enable = true
			E.db.unitframe.units.raid.roleIcon.damager = false
			E.db.unitframe.units.raid.roleIcon.size = 15
			E.db.unitframe.units.raid.roleIcon.position = "TOPLEFT"
			E.db.unitframe.units.raid.roleIcon.xOffset = 0
			E.db.unitframe.units.raid.roleIcon.yOffset = 0
			E.db.unitframe.units.raid.numGroups = 6
			E.db.unitframe.units.raid.groupsPerRowCol = 1
			E.db.unitframe.units.raid.buffs.enable = false
			E.db.unitframe.units.raid.debuffs.enable = false
			E.db.unitframe.units.raid.buffIndicator.enable = true
			E.db.unitframe.units.raid.buffIndicator.size = 8
			E.db.unitframe.units.raid.rdebuffs.enable = true
			E.db.unitframe.units.raid.rdebuffs.size = 20
			E.db.unitframe.units.raid.rdebuffs.font = "Expressway"
			E.db.unitframe.units.raid.rdebuffs.fontOutline = "OUTLINE"
			E.db.unitframe.units.raid.rdebuffs.xOffset = 30
			E.db.unitframe.units.raid.rdebuffs.yOffset = 20
			E.db.unitframe.units.raid40.enable = true
			E.db.unitframe.units.raid40.width = 80
			E.db.unitframe.units.raid40.height = 30
			E.db.unitframe.units.raid40.threatStyle = "GLOW"
			E.db.unitframe.units.raid40.growthDirection = "RIGHT_DOWN"
			E.db.unitframe.units.raid40.visibility = "[@raid31,noexists] hide;show"
			E.db.unitframe.units.raid40.horizontalSpacing = 1
			E.db.unitframe.units.raid40.verticalSpacing = 1
			E.db.unitframe.units.raid40.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid40.health.position = "BOTTOM"
			E.db.unitframe.units.raid40.power.enable = false
			E.db.unitframe.units.raid40.name.position = "CENTER"
			E.db.unitframe.units.raid40.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid40.name.text_format = "[name:medium]"
			E.db.unitframe.units.raid40.name.xOffset = 0
			E.db.unitframe.units.raid40.name.yOffset = 0
			E.db.unitframe.units.raid40.roleIcon.enable = true
			E.db.unitframe.units.raid40.roleIcon.damager = false
			E.db.unitframe.units.raid40.roleIcon.size = 15
			E.db.unitframe.units.raid40.roleIcon.position = "TOPLEFT"
			E.db.unitframe.units.raid40.roleIcon.xOffset = 0
			E.db.unitframe.units.raid40.roleIcon.yOffset = 0
			E.db.unitframe.units.raid40.numGroups = 8
			E.db.unitframe.units.raid40.groupsPerRowCol = 1
			E.db.unitframe.units.raid40.buffs.enable = false
			E.db.unitframe.units.raid40.debuffs.enable = false
			E.db.unitframe.units.raid40.buffIndicator.enable = true
			E.db.unitframe.units.raid40.buffIndicator.size = 8
			E.db.unitframe.units.raid40.rdebuffs.enable = true
			E.db.unitframe.units.raid40.rdebuffs.size = 20
			E.db.unitframe.units.raid40.rdebuffs.font = "Expressway"
			E.db.unitframe.units.raid40.rdebuffs.fontOutline = "OUTLINE"
			E.db.unitframe.units.raid40.rdebuffs.xOffset = 30
			E.db.unitframe.units.raid40.rdebuffs.yOffset = 10
			E.db.unitframe.units.tank.enable = false
			E.db.unitframe.units.assist.enable = false
		--Chat
			E.db.chat.panelWidth = 404
			
			
		--Set Vertical Party/Raid Frames
		elseif theme == "VerticalFrames" then
			E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,140"
			E.db.movers["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,99"
			E.db.movers["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,207"
		--Player movers
			E.db.movers["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,281"
			E.db.movers["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
			E.db.movers["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,342"
			E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-220,263"
		--Pet movers
			E.db.movers["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,200"
			E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-280,184"
			E.db.movers["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-240,236"
		--Target/ToT movers
			E.db.movers["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,281"
			E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,220,263"
			E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,280,200"
		--Focus/FT movers
			E.db.movers["ElvUF_FocusMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,311"
			E.db.movers["ElvUF_FocusCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,295"
			E.db.movers["ElvUF_FocusTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-460,342"
		--Group movers
			E.db.movers["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,660"
			E.db.movers["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,905"
			E.db.movers["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,30,910"
			
		--Party
			E.db.unitframe.units.party.width = 200
			E.db.unitframe.units.party.height = 25
			E.db.unitframe.units.party.threatStyle = "GLOW"
			E.db.unitframe.units.party.growthDirection = "DOWN_RIGHT"
			E.db.unitframe.units.party.horizontalSpacing = 0
			E.db.unitframe.units.party.verticalSpacing = 1
			E.db.unitframe.units.party.health.text_format = "[health:deficit]"
			E.db.unitframe.units.party.power.enable = true
			E.db.unitframe.units.party.power.height = 5
			E.db.unitframe.units.party.power.text_format = "[powercolor][power:current]"
			E.db.unitframe.units.party.power.position = "RIGHT"
			E.db.unitframe.units.party.power.attachTo = "HEALTH"
			E.db.unitframe.units.party.power.xOffset = -2
			E.db.unitframe.units.party.power.yOffset = 0
			E.db.unitframe.units.party.name.position = "LEFT"
			E.db.unitframe.units.party.name.attachTextTo = "Frame"
			E.db.unitframe.units.party.name.text_format = "[name:long]"
			E.db.unitframe.units.party.name.xOffset = 205
			E.db.unitframe.units.party.name.yOffset = 0
			E.db.unitframe.units.party.buffs.enable = false
			E.db.unitframe.units.party.buffs.perrow = 2
			E.db.unitframe.units.party.buffs.numrows = 1
			E.db.unitframe.units.party.buffs.sizeOverride = 20
			E.db.unitframe.units.party.buffs.xOffset = -47
			E.db.unitframe.units.party.buffs.yOffset = 0
			E.db.unitframe.units.party.buffs.anchorPoint = "RIGHT"
			E.db.unitframe.units.party.debuffs.enable = false
			E.db.unitframe.units.party.debuffs.perrow = 1
			E.db.unitframe.units.party.debuffs.numrows = 3
			E.db.unitframe.units.party.debuffs.sizeOverride = 30
			E.db.unitframe.units.party.debuffs.yOffset = -1
			E.db.unitframe.units.party.debuffs.anchorPoint = "BOTTOM"
			E.db.unitframe.units.party.debuffs.onlyDispellable = true
			E.db.unitframe.units.party.buffIndicator.enable = true
			E.db.unitframe.units.party.buffIndicator.size = 8
			E.db.unitframe.units.party.roleIcon.enable = true
			E.db.unitframe.units.party.roleIcon.damager = false
			E.db.unitframe.units.party.roleIcon.position = "LEFT"
			E.db.unitframe.units.party.roleIcon.xOffset = 0
			E.db.unitframe.units.party.roleIcon.yOffset = 0
			E.db.unitframe.units.party.visibility = "[@raid6,exists][nogroup] hide;show"
			--Raid
			E.db.unitframe.units.raid.width = 170
			E.db.unitframe.units.raid.height = 20
			E.db.unitframe.units.raid.threatStyle = "GLOW"
			E.db.unitframe.units.raid.growthDirection = "DOWN_RIGHT"
			E.db.unitframe.units.raid.visibility = "[@raid6,noexists][@raid31,exists] hide;show"
			E.db.unitframe.units.raid.horizontalSpacing = 0
			E.db.unitframe.units.raid.verticalSpacing = 1
			E.db.unitframe.units.raid.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid.power.enable = false
			E.db.unitframe.units.raid.name.position = "LEFT"
			E.db.unitframe.units.raid.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid.name.text_format = "[name:long]"
			E.db.unitframe.units.raid.name.xOffset = 175
			E.db.unitframe.units.raid.name.yOffset = 0
			E.db.unitframe.units.raid.buffs.enable = false
			E.db.unitframe.units.raid.debuffs.enable = true
			E.db.unitframe.units.raid.debuffs.perrow = 1
			E.db.unitframe.units.raid.debuffs.numrows = 1
			E.db.unitframe.units.raid.debuffs.sizeOverride = 18
			E.db.unitframe.units.raid.debuffs.xOffset = 0
			E.db.unitframe.units.raid.debuffs.yOffset = 0
			E.db.unitframe.units.party.buffIndicator.enable = true
			E.db.unitframe.units.party.buffIndicator.size = 8
			E.db.unitframe.units.raid.rdebuffs.enable = false
			E.db.unitframe.units.raid.rdebuffs.size = 20
			E.db.unitframe.units.raid.rdebuffs.font = "Expressway"
			E.db.unitframe.units.raid.rdebuffs.fontOutline = "OUTLINE"
			E.db.unitframe.units.raid.rdebuffs.xOffset = 0
			E.db.unitframe.units.raid.rdebuffs.yOffset = 0
			E.db.unitframe.units.raid.roleIcon.enable = true
			E.db.unitframe.units.raid.roleIcon.damager = false
			E.db.unitframe.units.raid.roleIcon.position = "LEFT"
			E.db.unitframe.units.raid.roleIcon.xOffset = 0
			E.db.unitframe.units.raid.roleIcon.yOffset = 0
			E.db.unitframe.units.raid.numGroups = 6
			E.db.unitframe.units.raid.groupsPerRowCol = 6
			E.db.unitframe.units.raid40.enable = true
			E.db.unitframe.units.raid40.width = 170
			E.db.unitframe.units.raid40.height = 15
			E.db.unitframe.units.raid40.threatStyle = "GLOW"
			E.db.unitframe.units.raid40.growthDirection = "DOWN_RIGHT"
			E.db.unitframe.units.raid40.visibility = "[@raid31,noexists] hide;show"
			E.db.unitframe.units.raid40.horizontalSpacing = 0
			E.db.unitframe.units.raid40.verticalSpacing = 1
			E.db.unitframe.units.raid40.health.text_format = "[health:deficit]"
			E.db.unitframe.units.raid40.power.enable = false
			E.db.unitframe.units.raid40.name.position = "LEFT"
			E.db.unitframe.units.raid40.name.attachTextTo = "Frame"
			E.db.unitframe.units.raid40.name.text_format = "[name:long]"
			E.db.unitframe.units.raid40.name.xOffset = 175
			E.db.unitframe.units.raid40.name.yOffset = 0
			E.db.unitframe.units.raid40.buffs.enable = false
			E.db.unitframe.units.raid40.debuffs.enable = false
			E.db.unitframe.units.raid40.buffIndicator.enable = true
			E.db.unitframe.units.raid40.buffIndicator.size = 8
			E.db.unitframe.units.raid40.rdebuffs.enable = false
			E.db.unitframe.units.raid40.roleIcon.enable = true
			E.db.unitframe.units.raid40.roleIcon.damager = false
			E.db.unitframe.units.raid40.roleIcon.position = "LEFT"
			E.db.unitframe.units.raid40.roleIcon.xOffset = 0
			E.db.unitframe.units.raid40.roleIcon.yOffset = 0
			E.db.unitframe.units.raid40.numGroups = 8
			E.db.unitframe.units.raid40.groupsPerRowCol = 8
			E.db.unitframe.units.tank.enable = false
			E.db.unitframe.units.assist.enable = false
		
		
		--Extra Actionbars
		elseif theme == "extraActionBars" then
			E.db.movers["ArtifactBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133"
			E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,170"
			E.db.actionbar.bar3.enabled = true
			E.db.actionbar.bar4.enabled = true
			E.db.actionbar.bar5.enabled = true
			E.db.actionbar.bar3.mouseover = false

			
		--Square Actionbars
		elseif theme == "squareBars" then
			E.db.movers["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,30"
			E.db.movers["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,88"
			E.db.movers["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-116,30"
			E.db.movers["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,116,30"
			E.db.movers["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,146"
			E.db.movers["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,1"
			E.db.movers["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-99"
			E.db.movers["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,180"
			E.db.actionbar.bar1.buttons = 12
			E.db.actionbar.bar1.buttonsPerRow = 6
			E.db.actionbar.bar2.buttons = 12
			E.db.actionbar.bar2.buttonsPerRow = 6
			E.db.actionbar.bar3.mouseover = true
			E.db.actionbar.bar3.buttons = 8
			E.db.actionbar.bar3.buttonsPerRow = 2
			E.db.actionbar.bar4.buttons = 8
			E.db.actionbar.bar4.buttonsPerRow = 2
			E.db.actionbar.bar4.mouseover = true
			E.db.actionbar.bar5.buttons = 10
			E.db.actionbar.bar5.buttonsPerRow = 12
			E.db.actionbar.bar6.buttons = 10
			E.db.actionbar.bar1.buttonsize = 28
			E.db.actionbar.bar2.buttonsize = 28
			E.db.actionbar.bar3.buttonsize = 28
			E.db.actionbar.bar4.buttonsize = 28
			E.db.actionbar.bar5.buttonsize = 28
			E.db.actionbar.bar6.buttonsize = 28

			
		--Databars
		elseif theme == "Databars" then
			E.db.movers["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-216"
			E.db.movers["SquareMinimapBar"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-216"
			E.db.movers["ArtifactBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-205"
			E.db.movers["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-183"
			E.db.movers["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-194"
			
			--Reputation
			E.db.databars.reputation.enable = true
			E.db.databars.reputation.width = 152
			E.db.databars.reputation.height = 10
			E.db.databars.reputation.textFormat = "NONE"
			E.db.databars.reputation.textSize = 12
			E.db.databars.reputation.mouseover = false
			E.db.databars.reputation.orientation = "HORIZONTAL"
			E.db.databars.reputation.reverseFill = false
			E.db.databars.reputation.hideInVehicle = false
			--Artifact
			E.db.databars.artifact.enable = true
			E.db.databars.artifact.width = 152
			E.db.databars.artifact.height = 10
			E.db.databars.artifact.textFormat = "NONE"
			E.db.databars.artifact.textSize = 12
			E.db.databars.artifact.mouseover = false
			E.db.databars.artifact.orientation = "HORIZONTAL"
			E.db.databars.artifact.reverseFill = false
			E.db.databars.artifact.hideInVehicle = false
			--Honor
			E.db.databars.honor.enable = true
			E.db.databars.honor.width = 152
			E.db.databars.honor.height = 10
			E.db.databars.honor.textFormat = "NONE"
			E.db.databars.honor.textSize = 12
			E.db.databars.honor.mouseover = false
			E.db.databars.honor.orientation = "HORIZONTAL"
			E.db.databars.honor.reverseFill = false
			E.db.databars.honor.hideInVehicle = false
		
		
		-- Datatexts
		elseif theme == "Datatexts" then
			E.db.movers["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,56"
			E.db.movers["ElvUIBankMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,56"
			--Minimap
			E.db.general.minimap.icons.mail.hide = false
			--Chat options
			E.db.chat.panelBackdrop = "SHOWBOTH"
			--Datatext options
			E.db.datatexts.font = "Expressway"
			E.db.datatexts.fontSize = 12
			E.db.datatexts.fontOutline = "OUTLINE"
			E.db.datatexts.battleground = false
			E.db.datatexts.panelTransparency = true
			E.db.datatexts.panels.LeftChatDataPanel.left = "Spec Switch (SFUI)"
			E.db.datatexts.panels.LeftChatDataPanel.middle = "Item Level (SFUI)"
			E.db.datatexts.panels.LeftChatDataPanel.right = "Classhall (SFUI)"
			E.db.datatexts.panels.RightChatDataPanel.left = "System"
			E.db.datatexts.panels.RightChatDataPanel.middle = "Bags"
			E.db.datatexts.panels.RightChatDataPanel.right = "Gold"
			E.db.datatexts.panels.LeftMiniPanel = ""
			E.db.datatexts.panels.RightMiniPanel = ""
			E.db.datatexts.panels.BottomMiniPanel = "Time (SFUI)"
			E.db.datatexts.panels.TopMiniPanel = ""
			E.db.datatexts.panels.BottomLeftMiniPanel = ""
			E.db.datatexts.panels.BottomRightMiniPanel = ""
			E.db.datatexts.panels.TopRightMiniPanel = ""
			E.db.datatexts.panels.TopLeftMiniPanel = ""
			E.db.datatexts.minimapPanels = false
			E.db.datatexts.leftChatPanel = true
			E.db.datatexts.rightChatPanel = true
			E.db.datatexts.minimapTop = false
			E.db.datatexts.minimapTopLeft = false
			E.db.datatexts.minimapTopRight = false
			E.db.datatexts.minimapBottom = true
			E.db.datatexts.minimapBottomLeft = false
			E.db.datatexts.minimapBottomRight = false
		
		
		--Enable AuraBars
		elseif theme == "enableAuraBars" then
			E.db.unitframe.units.player.aurabar.enable = true
			E.db.unitframe.units.target.aurabar.enable = true
			E.db.unitframe.units.player.aurabar.attachTo = "FRAME"
			E.db.unitframe.units.player.aurabar.anchorPoint = "ABOVE"
			E.db.unitframe.units.player.aurabar.yOffset = 2
			E.db.unitframe.units.target.aurabar.attachTo = "FRAME"
			E.db.unitframe.units.target.aurabar.anchorPoint = "ABOVE"
			E.db.unitframe.units.target.aurabar.yOffset = 2
			E.db.unitframe.units.target.debuffs.enable = false
			E.db.unitframe.units.target.debuffs.yOffset = 31
			E.db.unitframe.units.target.buffs.attachTo = "POWER"
			E.db.unitframe.units.target.buffs.anchorPoint = "BOTTOMLEFT"
			E.db.unitframe.units.target.buffs.yOffset = -1
			
			
		--UF Text
		elseif theme == "unitframeTexts" then
			E.db.unitframe.units.player.customTexts.HealthText.text_format = "[health:current]"
			E.db.unitframe.units.player.power.text_format = "[power:current]"
			E.db.unitframe.units.target.customTexts.HealthText.text_format = "[health:current]"
			E.db.unitframe.units.target.customTexts.NameText.text_format = "[name:long]"
			E.db.unitframe.units.target.power.text_format = "[health:percent]"
			E.db.unitframe.units.targettarget.name.text_format = "[name:medium]"
			E.db.unitframe.units.focus.name.text_format = "[name:medium]"
			E.db.unitframe.units.focustarget.name.text_format = "[name:medium]"
			E.db.unitframe.units.pet.name.text_format = "[name:medium]"

		
		--Alt. UF Text
		elseif theme == "UFTexts" then
			E.db.unitframe.units.player.customTexts.HealthText.text_format = "[health:current-sfui]"
			E.db.unitframe.units.player.power.text_format = "[power:current-sfui]"
			E.db.unitframe.units.target.customTexts.HealthText.text_format = "[health:current-sfui]"
			E.db.unitframe.units.target.customTexts.NameText.text_format = "[name:long]"
			E.db.unitframe.units.target.power.text_format = "[health:percent]"
			E.db.unitframe.units.targettarget.name.text_format = "[name:medium]"
			E.db.unitframe.units.focus.name.text_format = "[name:medium]"
			E.db.unitframe.units.focustarget.name.text_format = "[name:medium]"
			E.db.unitframe.units.pet.name.text_format = "[name:medium]"

		
		--Boss frames
		elseif theme == "bossFrame" then
			E.db.unitframe.units.boss.enable = true
		end
		
		if not noDisplayMsg then
			E:UpdateAll(true)
		end
end

function E:SetupAddon(addon)
	if addon == 'Skada' then
		if IsAddOnLoaded('Skada') then
			E:Print(L["A profile for Skada has been created."])
			InstallStepComplete.message = L["AddOn Profiles installed"]
			InstallStepComplete:Show()
			SkadaDB['profiles']['Skullflower'] = {
			["windows"] = {
				{
					["barheight"] = 20,
					["classicons"] = false,
					["barslocked"] = true,
					["y"] = 30,
					["x"] = -30,
					["title"] = {
						["color"] = {
							["a"] = 1,
							["b"] = 0.0784313725490196,
							["g"] = 0.0784313725490196,
							["r"] = 0.0784313725490196,
						},
						["bordertexture"] = "Pixel",
						["font"] = "Expressway",
						["borderthickness"] = 0,
						["fontflags"] = "OUTLINE",
						["height"] = 20,
						["texture"] = "Skullflower",
					},
					["barfontflags"] = "OUTLINE",
					["point"] = "BOTTOMRIGHT",
					["mode"] = "Damage",
					["buttons"] = {
						["menu"] = false,
						["mode"] = false,
					},
					["barwidth"] = 280,
					["barbgcolor"] = {
						["a"] = 1,
						["r"] = 0.301960784313726,
						["g"] = 0.301960784313726,
						["b"] = 0.301960784313726,
					},
					["barcolor"] = {
						["b"] = 1,
						["g"] = 0.349019607843137,
						["r"] = 0.227450980392157,
					},
					["barfontsize"] = 10,
					["background"] = {
						["borderthickness"] = 0,
						["color"] = {
							["a"] = 1,
							["b"] = 0.0784313725490196,
							["g"] = 0.0784313725490196,
							["r"] = 0.0784313725490196,
						},
						["bordertexture"] = "Pixel",
						["texture"] = "ElvUI Blank",
					},
					["bartexture"] = "Skullflower",
					["barfont"] = "Expressway",
				}, -- [1]
			},
			["icon"] = {
				["hide"] = true,
			},
			["columns"] = {
				["Threat_TPS"] = true,
			},
			["tooltiprows"] = 5,
			["hidesolo"] = true,
			["showranks"] = false,
			["hidedisables"] = false,
			["tooltippos"] = "topleft",
			["reset"] = {
				["join"] = 1,
			},
		}
	end

	if IsAddOnLoaded('Details') then
		E:Print(L["A profile for Details! has been created."])
		InstallStepComplete.message = L["AddOn Profiles installed"]
		InstallStepComplete:Show()
			_detalhes_global["__profiles"]['Skullflower'] = {
			["capture_real"] = {
			["heal"] = true,
			["spellcast"] = true,
			["miscdata"] = true,
			["aura"] = true,
			["energy"] = true,
			["damage"] = true,
		},
		["row_fade_in"] = {
			"in", -- [1]
			0.2, -- [2]
		},
		["player_details_window"] = {
			["scale"] = 1,
			["bar_texture"] = "Skullflower",
			["skin"] = "ElvUI",
		},
		["numerical_system"] = 1,
		["use_row_animations"] = false,
		["report_heal_links"] = false,
		["remove_realm_from_name"] = true,
		["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
		["report_to_who"] = "",
		["overall_flag"] = 13,
		["profile_save_pos"] = true,
		["tooltip"] = {
			["header_statusbar"] = {
				0.3, -- [1]
				0.3, -- [2]
				0.3, -- [3]
				0.8, -- [4]
				false, -- [5]
				false, -- [6]
				"WorldState Score", -- [7]
			},
			["fontcolor_right"] = {
				1, -- [1]
				0.7, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["tooltip_max_targets"] = 2,
			["icon_size"] = {
				["W"] = 13,
				["H"] = 13,
			},
			["tooltip_max_pets"] = 2,
			["anchor_relative"] = "top",
			["abbreviation"] = 2,
			["anchored_to"] = 1,
			["show_amount"] = false,
			["header_text_color"] = {
				1, -- [1]
				0.9176, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fontsize"] = 12,
			["background"] = {
				0.196, -- [1]
				0.196, -- [2]
				0.196, -- [3]
				0.8697, -- [4]
			},
			["submenu_wallpaper"] = true,
			["fontsize_title"] = 12,
			["icon_border_texcoord"] = {
				["B"] = 0.921875,
				["L"] = 0.078125,
				["T"] = 0.078125,
				["R"] = 0.921875,
			},
			["commands"] = {
			},
			["tooltip_max_abilities"] = 5,
			["fontface"] = "Expressway",
			["border_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["border_texture"] = "Blizzard Tooltip",
			["anchor_offset"] = {
				0, -- [1]
				0, -- [2]
			},
			["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
			["maximize_method"] = 1,
			["border_size"] = 14,
			["fontshadow"] = true,
			["anchor_screen_pos"] = {
				507.7, -- [1]
				-350.5, -- [2]
			},
			["anchor_point"] = "bottom",
			["menus_bg_coords"] = {
				0.309777336120606, -- [1]
				0.924000015258789, -- [2]
				0.213000011444092, -- [3]
				0.279000015258789, -- [4]
			},
			["fontcolor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["menus_bg_color"] = {
				0.8, -- [1]
				0.8, -- [2]
				0.8, -- [3]
				0.2, -- [4]
			},
		},
		["ps_abbreviation"] = 3,
		["world_combat_is_trash"] = false,
		["update_speed"] = 0.0500000011920929,
		["track_item_level"] = true,
		["windows_fade_in"] = {
			"in", -- [1]
			0.2, -- [2]
		},
		["instances_menu_click_to_open"] = false,
		["overall_clear_newchallenge"] = true,
		["time_type"] = 2,
		["instances_disable_bar_highlight"] = false,
		["trash_concatenate"] = false,
		["disable_stretch_from_toolbar"] = false,
		["disable_lock_ungroup_buttons"] = false,
		["memory_ram"] = 64,
		["disable_window_groups"] = false,
		["instances_suppress_trash"] = 0,
		["font_faces"] = {
			["menus"] = "Expressway",
		},
		["segments_amount"] = 12,
		["report_lines"] = 5,
		["skin"] = "ElvUI Frame Style",
		["override_spellids"] = true,
		["use_battleground_server_parser"] = true,
		["default_bg_alpha"] = 0.5,
		["clear_ungrouped"] = true,
		["chat_tab_embed"] = {
			["enabled"] = false,
			["tab_name"] = "",
			["single_window"] = false,
		},
		["minimum_combat_time"] = 5,
		["animate_scroll"] = false,
		["cloud_capture"] = true,
		["damage_taken_everything"] = false,
		["scroll_speed"] = 2,
		["new_window_size"] = {
			["height"] = 155,
			["width"] = 320,
		},
		["memory_threshold"] = 3,
		["deadlog_events"] = 32,
		["class_specs_coords"] = {
			[62] = {
				0.251953125, -- [1]
				0.375, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[63] = {
				0.375, -- [1]
				0.5, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[250] = {
				0, -- [1]
				0.125, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[251] = {
				0.125, -- [1]
				0.25, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[252] = {
				0.25, -- [1]
				0.375, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[253] = {
				0.875, -- [1]
				1, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[254] = {
				0, -- [1]
				0.125, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[255] = {
				0.125, -- [1]
				0.25, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[66] = {
				0.125, -- [1]
				0.25, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[257] = {
				0.5, -- [1]
				0.625, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[258] = {
				0.6328125, -- [1]
				0.75, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[259] = {
				0.75, -- [1]
				0.875, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[260] = {
				0.875, -- [1]
				1, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[577] = {
				0.25, -- [1]
				0.375, -- [2]
				0.5, -- [3]
				0.625, -- [4]
			},
			[262] = {
				0.125, -- [1]
				0.25, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[581] = {
				0.375, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.625, -- [4]
			},
			[264] = {
				0.375, -- [1]
				0.5, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[265] = {
				0.5, -- [1]
				0.625, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[266] = {
				0.625, -- [1]
				0.75, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[267] = {
				0.75, -- [1]
				0.875, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[268] = {
				0.625, -- [1]
				0.75, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[269] = {
				0.875, -- [1]
				1, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[270] = {
				0.75, -- [1]
				0.875, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[70] = {
				0.251953125, -- [1]
				0.375, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[102] = {
				0.375, -- [1]
				0.5, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[71] = {
				0.875, -- [1]
				1, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[103] = {
				0.5, -- [1]
				0.625, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[72] = {
				0, -- [1]
				0.125, -- [2]
				0.5, -- [3]
				0.625, -- [4]
			},
			[104] = {
				0.625, -- [1]
				0.75, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[73] = {
				0.125, -- [1]
				0.25, -- [2]
				0.5, -- [3]
				0.625, -- [4]
			},
			[64] = {
				0.5, -- [1]
				0.625, -- [2]
				0.125, -- [3]
				0.25, -- [4]
			},
			[105] = {
				0.75, -- [1]
				0.875, -- [2]
				0, -- [3]
				0.125, -- [4]
			},
			[65] = {
				0, -- [1]
				0.125, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[256] = {
				0.375, -- [1]
				0.5, -- [2]
				0.25, -- [3]
				0.375, -- [4]
			},
			[261] = {
				0, -- [1]
				0.125, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
			[263] = {
				0.25, -- [1]
				0.375, -- [2]
				0.375, -- [3]
				0.5, -- [4]
			},
		},
		["close_shields"] = false,
		["class_coords"] = {
			["HUNTER"] = {
				0, -- [1]
				0.25, -- [2]
				0.25, -- [3]
				0.5, -- [4]
			},
			["WARRIOR"] = {
				0, -- [1]
				0.25, -- [2]
				0, -- [3]
				0.25, -- [4]
			},
			["ROGUE"] = {
				0.49609375, -- [1]
				0.7421875, -- [2]
				0, -- [3]
				0.25, -- [4]
			},
			["MAGE"] = {
				0.25, -- [1]
				0.49609375, -- [2]
				0, -- [3]
				0.25, -- [4]
			},
			["PET"] = {
				0.25, -- [1]
				0.49609375, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["DRUID"] = {
				0.7421875, -- [1]
				0.98828125, -- [2]
				0, -- [3]
				0.25, -- [4]
			},
			["MONK"] = {
				0.5, -- [1]
				0.73828125, -- [2]
				0.5, -- [3]
				0.75, -- [4]
			},
			["DEATHKNIGHT"] = {
				0.25, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.75, -- [4]
			},
			["MONSTER"] = {
				0, -- [1]
				0.25, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["UNKNOW"] = {
				0.5, -- [1]
				0.75, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["PRIEST"] = {
				0.49609375, -- [1]
				0.7421875, -- [2]
				0.25, -- [3]
				0.5, -- [4]
			},
			["SHAMAN"] = {
				0.25, -- [1]
				0.49609375, -- [2]
				0.25, -- [3]
				0.5, -- [4]
			},
			["Alliance"] = {
				0.49609375, -- [1]
				0.7421875, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["ENEMY"] = {
				0, -- [1]
				0.25, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["DEMONHUNTER"] = {
				0.73828126, -- [1]
				1, -- [2]
				0.5, -- [3]
				0.75, -- [4]
			},
			["Horde"] = {
				0.7421875, -- [1]
				0.98828125, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["PALADIN"] = {
				0, -- [1]
				0.25, -- [2]
				0.5, -- [3]
				0.75, -- [4]
			},
			["UNGROUPPLAYER"] = {
				0.5, -- [1]
				0.75, -- [2]
				0.75, -- [3]
				1, -- [4]
			},
			["WARLOCK"] = {
				0.7421875, -- [1]
				0.98828125, -- [2]
				0.25, -- [3]
				0.5, -- [4]
			},
		},
		["overall_clear_logout"] = false,
		["disable_alldisplays_window"] = false,
		["pvp_as_group"] = true,
		["force_activity_time_pvp"] = true,
		["windows_fade_out"] = {
			"out", -- [1]
			0.2, -- [2]
		},
		["death_tooltip_width"] = 300,
		["clear_graphic"] = true,
		["hotcorner_topleft"] = {
			["hide"] = false,
		},
		["segments_auto_erase"] = 1,
		["options_group_edit"] = true,
		["segments_amount_to_save"] = 5,
		["minimap"] = {
			["onclick_what_todo"] = 1,
			["radius"] = 160,
			["text_type"] = 1,
			["minimapPos"] = 220,
			["text_format"] = 3,
			["hide"] = false,
		},
		["instances_amount"] = 5,
		["max_window_size"] = {
			["height"] = 450,
			["width"] = 480,
		},
		["trash_auto_remove"] = true,
		["only_pvp_frags"] = false,
		["disable_stretch_button"] = false,
		["time_type_original"] = 2,
		["default_bg_color"] = 0.0941,
		["numerical_system_symbols"] = "auto",
		["segments_panic_mode"] = false,
		["window_clamp"] = {
			-8, -- [1]
			0, -- [2]
			21, -- [3]
			-14, -- [4]
		},
		["standard_skin"] = {
			["show_statusbar"] = false,
			["backdrop_texture"] = "Skullflower",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["menu_anchor"] = {
				16, -- [1]
				2, -- [2]
				["side"] = 2,
			},
			["bg_r"] = 0.3294,
			["skin"] = "ElvUI Frame Style",
			["following"] = {
				["bar_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["enabled"] = false,
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["color_buttons"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["switch_healer"] = false,
			["micro_displays_locked"] = true,
			["bg_b"] = 0.3294,
			["tooltip"] = {
				["n_abilities"] = 3,
				["n_enemies"] = 3,
			},
			["desaturated_menu"] = false,
			["switch_tank_in_combat"] = false,
			["switch_all_roles_in_combat"] = false,
			["instance_button_anchor"] = {
				-27, -- [1]
				1, -- [2]
			},
			["bg_alpha"] = 0.51,
			["attribute_text"] = {
				["enabled"] = true,
				["shadow"] = true,
				["side"] = 1,
				["text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.7, -- [4]
				},
				["custom_text"] = "{name}",
				["text_face"] = "Expressway",
				["anchor"] = {
					-19, -- [1]
					5, -- [2]
				},
				["show_timer"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
				["enable_custom_text"] = false,
				["text_size"] = 12,
			},
			["libwindow"] = {
			},
			["menu_alpha"] = {
				["enabled"] = false,
				["onleave"] = 1,
				["ignorebars"] = false,
				["iconstoo"] = true,
				["onenter"] = 1,
			},
			["stretch_button_side"] = 1,
			["micro_displays_side"] = 2,
			["switch_healer_in_combat"] = false,
			["strata"] = "LOW",
			["hide_in_combat_type"] = 1,
			["statusbar_info"] = {
				["alpha"] = 1,
				["overlay"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["switch_tank"] = false,
			["hide_in_combat_alpha"] = 0,
			["switch_all_roles_after_wipe"] = false,
			["menu_icons"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
				true, -- [4]
				true, -- [5]
				false, -- [6]
				["space"] = -2,
				["shadow"] = false,
			},
			["switch_damager"] = false,
			["show_sidebars"] = true,
			["window_scale"] = 1,
			["bars_grow_direction"] = 1,
			["row_info"] = {
				["textR_outline"] = false,
				["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
				["textL_outline"] = false,
				["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
				["textL_outline_small"] = true,
				["textL_enable_custom_text"] = false,
				["fixed_text_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
				["space"] = {
					["right"] = -2,
					["left"] = 1,
					["between"] = 1,
				},
				["texture_background_class_color"] = false,
				["textL_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Expressway.ttf",
				["textL_custom_text"] = "{data1}. {data3}{data2}",
				["font_size"] = 12,
				["height"] = 16,
				["texture_file"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\Skullflower",
				["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small_alpha",
				["texture_custom_file"] = "Interface\\",
				["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar_background",
				["use_spec_icons"] = true,
				["textR_enable_custom_text"] = false,
				["models"] = {
					["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
					["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
					["upper_alpha"] = 0.5,
					["lower_enabled"] = false,
					["lower_alpha"] = 0.1,
					["upper_enabled"] = false,
				},
				["fixed_texture_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
				},
				["textL_show_number"] = true,
				["fixed_texture_background_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.339636147022247, -- [4]
				},
				["backdrop"] = {
					["enabled"] = false,
					["texture"] = "Details BarBorder 2",
					["color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["size"] = 4,
				},
				["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
				["texture"] = "Skullflower",
				["textR_outline_small"] = true,
				["percent_type"] = 1,
				["textR_show_data"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
				},
				["texture_background"] = "Skullflower",
				["alpha"] = 0.8,
				["textR_class_colors"] = false,
				["textR_outline_small_color"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["no_icon"] = false,
				["textL_class_colors"] = false,
				["texture_custom"] = "Skullflower",
				["font_face"] = "Expressway",
				["texture_class_colors"] = true,
				["start_after_icon"] = false,
				["fast_ps_update"] = false,
				["textR_separator"] = ",",
				["textR_bracket"] = "(",
			},
			["grab_on_top"] = false,
			["hide_icon"] = true,
			["switch_damager_in_combat"] = false,
			["row_show_animation"] = {
				["anim"] = "Fade",
				["options"] = {
				},
			},
			["bars_sort_direction"] = 1,
			["auto_current"] = true,
			["toolbar_side"] = 1,
			["bg_g"] = 0.3294,
			["menu_anchor_down"] = {
				16, -- [1]
				-2, -- [2]
			},
			["hide_in_combat"] = false,
			["auto_hide_menu"] = {
				["left"] = false,
				["right"] = false,
			},
			["menu_icons_size"] = 0.899999976158142,
			["plugins_grow_direction"] = 1,
			["wallpaper"] = {
				["overlay"] = {
					0.999997794628143, -- [1]
					0.999997794628143, -- [2]
					0.999997794628143, -- [3]
					0.799998223781586, -- [4]
				},
				["width"] = 266.000061035156,
				["texcoord"] = {
					0.0480000019073486, -- [1]
					0.298000011444092, -- [2]
					0.630999984741211, -- [3]
					0.755999984741211, -- [4]
				},
				["enabled"] = true,
				["anchor"] = "all",
				["height"] = 225.999984741211,
				["alpha"] = 0.800000071525574,
				["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
			},
			["total_bar"] = {
				["enabled"] = false,
				["only_in_group"] = true,
				["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
				},
			},
			["hide_out_of_combat"] = false,
			["skin_custom"] = "",
			["ignore_mass_showhide"] = false,
			["bars_inverted"] = false,
		},
		["row_fade_out"] = {
			"out", -- [1]
			0.2, -- [2]
		},
		["use_scroll"] = false,
		["class_colors"] = {
			["HUNTER"] = {
				0.67, -- [1]
				0.83, -- [2]
				0.45, -- [3]
			},
			["WARRIOR"] = {
				0.78, -- [1]
				0.61, -- [2]
				0.43, -- [3]
			},
			["PALADIN"] = {
				0.96, -- [1]
				0.55, -- [2]
				0.73, -- [3]
			},
			["MAGE"] = {
				0.41, -- [1]
				0.8, -- [2]
				0.94, -- [3]
			},
			["ARENA_YELLOW"] = {
				0.9, -- [1]
				0.9, -- [2]
				0, -- [3]
			},
			["UNGROUPPLAYER"] = {
				0.4, -- [1]
				0.4, -- [2]
				0.4, -- [3]
			},
			["DRUID"] = {
				1, -- [1]
				0.49, -- [2]
				0.04, -- [3]
			},
			["MONK"] = {
				0, -- [1]
				1, -- [2]
				0.59, -- [3]
			},
			["DEATHKNIGHT"] = {
				0.77, -- [1]
				0.12, -- [2]
				0.23, -- [3]
			},
			["ENEMY"] = {
				0.94117, -- [1]
				0, -- [2]
				0.0196, -- [3]
				1, -- [4]
			},
			["UNKNOW"] = {
				0.2, -- [1]
				0.2, -- [2]
				0.2, -- [3]
			},
			["PRIEST"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["SHAMAN"] = {
				0, -- [1]
				0.44, -- [2]
				0.87, -- [3]
			},
			["ARENA_GREEN"] = {
				0.1, -- [1]
				0.85, -- [2]
				0.1, -- [3]
			},
			["WARLOCK"] = {
				0.58, -- [1]
				0.51, -- [2]
				0.79, -- [3]
			},
			["DEMONHUNTER"] = {
				0.64, -- [1]
				0.19, -- [2]
				0.79, -- [3]
			},
			["version"] = 1,
			["NEUTRAL"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
			},
			["ROGUE"] = {
				1, -- [1]
				0.96, -- [2]
				0.41, -- [3]
			},
			["PET"] = {
				0.3, -- [1]
				0.4, -- [2]
				0.5, -- [3]
			},
		},
		["total_abbreviation"] = 2,
		["report_schema"] = 1,
		["overall_clear_newboss"] = true,
		["font_sizes"] = {
			["menus"] = 12,
		},
		["disable_reset_button"] = false,
		["data_broker_text"] = "",
		["instances_no_libwindow"] = false,
		["instances_segments_locked"] = false,
		["deadlog_limit"] = 16,
		["instances"] = {
			{
				["__pos"] = {
					["normal"] = {
						["y"] = -452.999885559082,
						["x"] = 650.000244140625,
						["w"] = 200.000061035156,
						["h"] = 155.999969482422,
					},
					["solo"] = {
						["y"] = 2,
						["x"] = 1,
						["w"] = 300,
						["h"] = 200,
					},
				},
				["hide_in_combat_type"] = 1,
				["backdrop_texture"] = "Details Ground",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["menu_anchor"] = {
					16, -- [1]
					2, -- [2]
					["side"] = 2,
				},
				["__snapV"] = false,
				["__snapH"] = false,
				["bg_r"] = 0.3294,
				["row_show_animation"] = {
					["anim"] = "Fade",
					["options"] = {
					},
				},
				["plugins_grow_direction"] = 1,
				["hide_out_of_combat"] = false,
				["__was_opened"] = true,
				["following"] = {
					["enabled"] = false,
					["bar_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["color_buttons"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["switch_healer"] = false,
				["skin_custom"] = "",
				["bars_sort_direction"] = 1,
				["show_statusbar"] = false,
				["bars_grow_direction"] = 1,
				["menu_anchor_down"] = {
					16, -- [1]
					-2, -- [2]
				},
				["tooltip"] = {
					["n_abilities"] = 3,
					["n_enemies"] = 3,
				},
				["StatusBarSaved"] = {
					["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
					["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
					["options"] = {
						["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["textXMod"] = 0,
							["textFace"] = "Expressway",
							["textStyle"] = 2,
							["textAlign"] = 0,
							["textSize"] = 10,
							["textYMod"] = 1,
						},
						["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["segmentType"] = 2,
							["textXMod"] = 0,
							["textFace"] = "Expressway",
							["textAlign"] = 0,
							["textStyle"] = 2,
							["textSize"] = 12,
							["textYMod"] = 1,
						},
						["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["textStyle"] = 2,
							["textFace"] = "Expressway",
							["textAlign"] = 0,
							["textXMod"] = 6,
							["timeType"] = 1,
							["textSize"] = 10,
							["textYMod"] = 1,
						},
					},
					["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
				},
				["total_bar"] = {
					["enabled"] = false,
					["only_in_group"] = true,
					["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["switch_all_roles_in_combat"] = false,
				["instance_button_anchor"] = {
					-27, -- [1]
					1, -- [2]
				},
				["version"] = 3,
				["attribute_text"] = {
					["show_timer"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
					},
					["shadow"] = true,
					["side"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.7, -- [4]
					},
					["custom_text"] = "{name}",
					["text_face"] = "Expressway",
					["anchor"] = {
						-2, -- [1]
						3, -- [2]
					},
					["text_size"] = 12,
					["enable_custom_text"] = false,
					["enabled"] = true,
				},
				["__locked"] = true,
				["menu_alpha"] = {
					["enabled"] = false,
					["onenter"] = 1,
					["iconstoo"] = true,
					["ignorebars"] = false,
					["onleave"] = 1,
				},
				["switch_damager_in_combat"] = false,
				["micro_displays_locked"] = true,
				["switch_tank_in_combat"] = false,
				["strata"] = "LOW",
				["grab_on_top"] = false,
				["__snap"] = {
					[3] = 2,
				},
				["switch_tank"] = false,
				["hide_in_combat_alpha"] = 0,
				["switch_all_roles_after_wipe"] = false,
				["menu_icons"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
					true, -- [4]
					true, -- [5]
					false, -- [6]
					["space"] = -2,
					["shadow"] = true,
				},
				["switch_damager"] = false,
				["micro_displays_side"] = 2,
				["statusbar_info"] = {
					["alpha"] = 1,
					["overlay"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["window_scale"] = 1,
				["libwindow"] = {
					["y"] = 30.0000705718994,
					["x"] = -230.999877929687,
					["point"] = "BOTTOMRIGHT",
				},
				["desaturated_menu"] = true,
				["bars_inverted"] = false,
				["hide_icon"] = false,
				["switch_healer_in_combat"] = false,
				["bg_alpha"] = 0.55,
				["auto_current"] = true,
				["toolbar_side"] = 1,
				["bg_g"] = 0.3294,
				["skin"] = "ElvUI Frame Style",
				["hide_in_combat"] = false,
				["posicao"] = {
					["normal"] = {
						["y"] = -452.999885559082,
						["x"] = 650.000244140625,
						["w"] = 200.000061035156,
						["h"] = 155.999969482422,
					},
					["solo"] = {
						["y"] = 2,
						["x"] = 1,
						["w"] = 300,
						["h"] = 200,
					},
				},
				["menu_icons_size"] = 0.899999976158142,
				["ignore_mass_showhide"] = false,
				["wallpaper"] = {
					["enabled"] = false,
					["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
					["texcoord"] = {
						0.0480000019073486, -- [1]
						0.298000011444092, -- [2]
						0.630999984741211, -- [3]
						0.755999984741211, -- [4]
					},
					["overlay"] = {
						0.999997794628143, -- [1]
						0.999997794628143, -- [2]
						0.999997794628143, -- [3]
						0.799998223781586, -- [4]
					},
					["anchor"] = "all",
					["height"] = 225.999984741211,
					["alpha"] = 0.800000071525574,
					["width"] = 266.000061035156,
				},
				["stretch_button_side"] = 1,
				["auto_hide_menu"] = {
					["left"] = true,
					["right"] = false,
				},
				["show_sidebars"] = false,
				["row_info"] = {
					["textR_outline"] = false,
					["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
					["textL_outline"] = false,
					["textR_outline_small"] = true,
					["textL_outline_small"] = true,
					["percent_type"] = 1,
					["fixed_text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["space"] = {
						["right"] = 0,
						["left"] = 0,
						["between"] = 2,
					},
					["texture_background_class_color"] = false,
					["start_after_icon"] = false,
					["font_face_file"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\fonts\\Expressway.ttf",
					["textL_custom_text"] = "{data1}. {data3}{data2}",
					["font_size"] = 12,
					["texture_custom_file"] = "Interface\\",
					["texture_file"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\Skullflower.tga",
					["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small_alpha",
					["use_spec_icons"] = true,
					["models"] = {
						["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
						["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
						["upper_alpha"] = 0.5,
						["lower_enabled"] = false,
						["lower_alpha"] = 0.1,
						["upper_enabled"] = false,
					},
					["textR_bracket"] = "(",
					["textR_enable_custom_text"] = false,
					["backdrop"] = {
						["enabled"] = false,
						["size"] = 4,
						["color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["texture"] = "Details BarBorder 2",
					},
					["fixed_texture_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
					},
					["textL_show_number"] = true,
					["fixed_texture_background_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.339636147022247, -- [4]
					},
					["texture_custom"] = "",
					["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
					["texture"] = "Skullflower",
					["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
					["textL_enable_custom_text"] = false,
					["textR_class_colors"] = false,
					["textL_class_colors"] = false,
					["textR_outline_small_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["texture_background"] = "None",
					["alpha"] = 0.8,
					["no_icon"] = false,
					["textR_show_data"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
					},
					["textL_outline_small_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["font_face"] = "Expressway",
					["texture_class_colors"] = true,
					["texture_background_file"] = "Interface\\Addons\\ElvUI_Skullflower\\media\\textures\\Skullflower.tga",
					["fast_ps_update"] = false,
					["textR_separator"] = ",",
					["height"] = 16,
				},
				["bg_b"] = 0.3294,
			}, -- [1]
			{
				["__pos"] = {
					["normal"] = {
						["y"] = -452.999885559082,
						["x"] = 852.000122070313,
						["w"] = 204.000091552734,
						["h"] = 155.999969482422,
					},
					["solo"] = {
						["y"] = 2,
						["x"] = 1,
						["w"] = 300,
						["h"] = 200,
					},
				},
				["hide_in_combat_type"] = 1,
				["backdrop_texture"] = "Details Ground",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["menu_anchor"] = {
					16, -- [1]
					2, -- [2]
					["side"] = 2,
				},
				["__snapV"] = false,
				["__snapH"] = false,
				["bg_r"] = 0.3294,
				["row_show_animation"] = {
					["anim"] = "Fade",
					["options"] = {
					},
				},
				["plugins_grow_direction"] = 1,
				["hide_out_of_combat"] = false,
				["__was_opened"] = true,
				["following"] = {
					["enabled"] = false,
					["bar_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["color_buttons"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["switch_healer"] = false,
				["skin_custom"] = "",
				["bars_sort_direction"] = 1,
				["show_statusbar"] = false,
				["bars_grow_direction"] = 1,
				["menu_anchor_down"] = {
					16, -- [1]
					-2, -- [2]
				},
				["tooltip"] = {
					["n_abilities"] = 3,
					["n_enemies"] = 3,
				},
				["StatusBarSaved"] = {
					["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
					["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
					["options"] = {
						["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
							["textYMod"] = 1,
							["textXMod"] = 0,
							["textFace"] = "Expressway",
							["textAlign"] = 0,
							["textStyle"] = 2,
							["textSize"] = 12,
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.7, -- [4]
							},
						},
						["DETAILS_STATUSBAR_PLUGIN_THREAT"] = {
							["isHidden"] = false,
							["textStyle"] = 2,
							["textYMod"] = 1,
							["segmentType"] = 2,
							["textXMod"] = 0,
							["textFace"] = "Expressway",
							["textAlign"] = 0,
							["textSize"] = 10,
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.7, -- [4]
							},
						},
						["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
							["textColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.7, -- [4]
							},
							["textXMod"] = 6,
							["textFace"] = "Expressway",
							["textAlign"] = 0,
							["textStyle"] = 2,
							["timeType"] = 1,
							["textSize"] = 12,
							["textYMod"] = 1,
						},
					},
					["left"] = "DETAILS_STATUSBAR_PLUGIN_THREAT",
				},
				["total_bar"] = {
					["enabled"] = false,
					["only_in_group"] = true,
					["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["switch_all_roles_in_combat"] = false,
				["instance_button_anchor"] = {
					-27, -- [1]
					1, -- [2]
				},
				["version"] = 3,
				["attribute_text"] = {
					["show_timer"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
					},
					["shadow"] = true,
					["side"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.7, -- [4]
					},
					["custom_text"] = "{name}",
					["text_face"] = "Expressway",
					["anchor"] = {
						-2, -- [1]
						3, -- [2]
					},
					["text_size"] = 12,
					["enable_custom_text"] = false,
					["enabled"] = true,
				},
				["__locked"] = true,
				["menu_alpha"] = {
					["enabled"] = false,
					["onenter"] = 1,
					["iconstoo"] = true,
					["ignorebars"] = false,
					["onleave"] = 1,
				},
				["switch_damager_in_combat"] = false,
				["micro_displays_locked"] = true,
				["switch_tank_in_combat"] = false,
				["strata"] = "LOW",
				["grab_on_top"] = false,
				["__snap"] = {
					1, -- [1]
				},
				["switch_tank"] = false,
				["hide_in_combat_alpha"] = 0,
				["switch_all_roles_after_wipe"] = false,
				["menu_icons"] = {
					true, -- [1]
					true, -- [2]
					true, -- [3]
					true, -- [4]
					true, -- [5]
					false, -- [6]
					["space"] = -2,
					["shadow"] = false,
				},
				["switch_damager"] = false,
				["micro_displays_side"] = 2,
				["statusbar_info"] = {
					["alpha"] = 1,
					["overlay"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
				},
				["window_scale"] = 1,
				["libwindow"] = {
					["y"] = 30.0000705718994,
					["x"] = -26.9998779296875,
					["point"] = "BOTTOMRIGHT",
				},
				["desaturated_menu"] = true,
				["bars_inverted"] = false,
				["hide_icon"] = false,
				["switch_healer_in_combat"] = false,
				["bg_alpha"] = 0.55,
				["auto_current"] = true,
				["toolbar_side"] = 1,
				["bg_g"] = 0.3294,
				["skin"] = "ElvUI Frame Style",
				["hide_in_combat"] = false,
				["posicao"] = {
					["normal"] = {
						["y"] = -452.999885559082,
						["x"] = 852.000122070313,
						["w"] = 204.000091552734,
						["h"] = 155.999969482422,
					},
					["solo"] = {
						["y"] = 2,
						["x"] = 1,
						["w"] = 300,
						["h"] = 200,
					},
				},
				["menu_icons_size"] = 0.899999976158142,
				["ignore_mass_showhide"] = false,
				["wallpaper"] = {
					["enabled"] = false,
					["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
					["texcoord"] = {
						0.0480000019073486, -- [1]
						0.298000011444092, -- [2]
						0.630999984741211, -- [3]
						0.755999984741211, -- [4]
					},
					["overlay"] = {
						0.999997794628143, -- [1]
						0.999997794628143, -- [2]
						0.999997794628143, -- [3]
						0.799998223781586, -- [4]
					},
					["anchor"] = "all",
					["height"] = 225.999984741211,
					["alpha"] = 0.800000071525574,
					["width"] = 266.000061035156,
				},
				["stretch_button_side"] = 1,
				["auto_hide_menu"] = {
					["left"] = true,
					["right"] = false,
				},
				["show_sidebars"] = false,
				["row_info"] = {
					["textR_outline"] = false,
					["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
					["textL_outline"] = false,
					["textR_outline_small"] = true,
					["textL_outline_small"] = true,
					["percent_type"] = 1,
					["fixed_text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["space"] = {
						["right"] = 0,
						["left"] = 0,
						["between"] = 2,
					},
					["texture_background_class_color"] = false,
					["start_after_icon"] = false,
					["font_face_file"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\fonts\\Expressway.ttf",
					["textL_custom_text"] = "{data1}. {data3}{data2}",
					["font_size"] = 12,
					["texture_custom_file"] = "Interface\\",
					["texture_file"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\Skullflower.tga",
					["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small_alpha",
					["use_spec_icons"] = true,
					["models"] = {
						["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
						["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
						["upper_alpha"] = 0.5,
						["lower_enabled"] = false,
						["lower_alpha"] = 0.1,
						["upper_enabled"] = false,
					},
					["textR_bracket"] = "(",
					["textR_enable_custom_text"] = false,
					["backdrop"] = {
						["enabled"] = false,
						["size"] = 4,
						["color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["texture"] = "Details BarBorder 2",
					},
					["fixed_texture_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
					},
					["textL_show_number"] = true,
					["fixed_texture_background_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.339636147022247, -- [4]
					},
					["texture_custom"] = "",
					["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
					["texture"] = "Skullflower",
					["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
					["textL_enable_custom_text"] = false,
					["textR_class_colors"] = false,
					["textL_class_colors"] = false,
					["textR_outline_small_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["texture_background"] = "None",
					["alpha"] = 0.8,
					["no_icon"] = false,
					["textR_show_data"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
					},
					["textL_outline_small_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["font_face"] = "Expressway",
					["texture_class_colors"] = true,
					["texture_background_file"] = "Interface\\Addons\\ElvUI_Skullflower\\media\\textures\\Skullflower.tga",
					["fast_ps_update"] = false,
					["textR_separator"] = ",",
					["height"] = 16,
				},
				["bg_b"] = 0.3294,
			}, -- [2]
		},
	}
	_detalhes:ApplyProfile('Skullflower')
end

	if IsAddOnLoaded('BigWigs') then
		E:Print(L["A profile for Big Wigs has been created. Type /bw, go to Profiles, and change your profile to Skullflower."])
		InstallStepComplete.message = L["AddOn Profiles installed"]
		InstallStepComplete:Show()
		BigWigs3DB = {
		["namespaces"] = {
		["BigWigs_Plugins_Victory"] = {
		},
		["BigWigs_Plugins_Colors"] = {
		},
		["BigWigs_Plugins_Alt Power"] = {
			["profiles"] = {
				["Default"] = {
					["font"] = "Friz Quadrata TT",
					["fontOutline"] = "",
					["fontSize"] = 11.0000009536743,
				},
				["Skullflower"] = {
					["posx"] = 165.688686737744,
					["fontSize"] = 11.0000009536743,
					["disabled"] = true,
					["posy"] = 239.64436344173,
					["fontOutline"] = "",
					["font"] = "Expressway",
				},
			},
		},
		["BigWigs_Plugins_BossBlock"] = {
		},
		["BigWigs_Plugins_Bars"] = {
			["profiles"] = {
				["Default"] = {
					["font"] = "Friz Quadrata TT",
					["BigWigsAnchor_width"] = 199.999908447266,
				},
				["Skullflower"] = {
					["BigWigsEmphasizeAnchor_y"] = 38.688656511566,
					["fontSize"] = 11,
					["BigWigsAnchor_y"] = 38.4000578959797,
					["emphasizeGrowup"] = true,
					["BigWigsAnchor_x"] = 398.222145059372,
					["texture"] = "SkullflowerLight",
					["barStyle"] = "ElvUI",
					["BigWigsAnchor_width"] = 199.999908447266,
					["BigWigsEmphasizeAnchor_width"] = 203.000076293945,
					["BigWigsEmphasizeAnchor_x"] = 839.111044624115,
					["font"] = "Expressway",
					["outline"] = "OUTLINE",
					["emphasizeScale"] = 1,
				},
			},
		},
		["BigWigs_Plugins_Super Emphasize"] = {
			["profiles"] = {
				["Default"] = {
					["font"] = "Friz Quadrata TT",
				},
				["Skullflower"] = {
					["font"] = "Expressway",
				},
			},
		},
		["BigWigs_Plugins_Sounds"] = {
		},
		["BigWigs_Plugins_Messages"] = {
			["profiles"] = {
				["Default"] = {
					["fontSize"] = 20,
					["font"] = "Friz Quadrata TT",
				},
				["Skullflower"] = {
					["outline"] = "OUTLINE",
					["fontSize"] = 20,
					["BWMessageAnchor_x"] = 608.711212656235,
					["growUpwards"] = false,
					["font"] = "Expressway",
					["BWMessageAnchor_y"] = 620.800015032291,
				},
			},
		},
		["BigWigs_Plugins_Statistics"] = {
		},
		["BigWigs_Plugins_Respawn"] = {
		},
		["BigWigs_Plugins_Proximity"] = {
			["profiles"] = {
				["Default"] = {
					["fontSize"] = 20,
					["font"] = "Friz Quadrata TT",
					["height"] = 120.000007629395,
				},
				["Skullflower"] = {
					["fontSize"] = 20,
					["font"] = "Friz Quadrata TT",
					["posx"] = 351.999834912349,
					["height"] = 120.000007629395,
					["posy"] = 260.977697291637,
				},
			},
		},
		["BigWigs_Plugins_Raid Icons"] = {
		},
		["LibDualSpec-1.0"] = {
		},
	},
		["profiles"] = {
			["Skullflower"] = {
			},
		},
	}
	end

	if IsAddOnLoaded('DBM-Core') then
		DBM:CreateProfile('Skullflower')
		E:Print(L["A profile for DBM has been created."])
		InstallStepComplete.message = L["AddOn Profiles installed"]
		InstallStepComplete:Show()

		DBM_AllSavedOptions["Skullflower"]["SpecialWarningFontShadow"] = true
		DBM_AllSavedOptions["Skullflower"]["SpecialWarningFontStyle"] = "OUTLINE"
		DBM_AllSavedOptions["Skullflower"]["SpecialWarningX"] = 0
		DBM_AllSavedOptions["Skullflower"]["SpecialWarningY"] = 350
		DBM_AllSavedOptions["Skullflower"]["SpecialWarningFont"] = "Expressway"
		DBM_AllSavedOptions["Skullflower"]["WarningFontShadow"] = true
		DBM_AllSavedOptions["Skullflower"]["WarningFont"] = "Expressway"
		DBM_AllSavedOptions["Skullflower"]["WarningFontStyle"] = "OUTLINE"
		DBM_AllSavedOptions["Skullflower"]["WarningX"] = 0
		DBM_AllSavedOptions["Skullflower"]["WarningY"] = 200
		DBM_AllSavedOptions["Skullflower"]["HPFrameY"] = -230.333389282227
		DBM_AllSavedOptions["Skullflower"]["HPFrameX"] = -285.500061035156
		DBM_AllSavedOptions["Skullflower"]["HPFramePoint"] = "RIGHT"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Texture"] = "Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\Skullflower.tga"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Scale"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["FontSize"] = 12
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeScale"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Font"] = "Expressway"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["FontStyle"] = "OUTLINE"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["EndColorG"] = 0
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeTimerY"] = 32
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeBarXOffset"] = 0
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Scale"] = 0.899999976158142
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["EnlargeBarsPercent"] = 0.125
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeBarYOffset"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeWidth"] = 200
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["BarYOffset"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["TimerY"] = 32
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["StartColorR"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["ExpandUpwards"] = true
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["ExpandUpwardsLarge"] = true
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["TimerPoint"] = "BOTTOM"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["StartColorG"] = 0.701960784313726
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["TimerX"] = -281.361145019531
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeTimerX"] = 324.277557373047
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["EndColorR"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Width"] = 183
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["HugeTimerPoint"] = "BOTTOM"
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["EnlargeBarsTime"] = 8
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["StartColorB"] = 0
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["Height"] = 23
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["BarXOffset"] = 0
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["EndColorB"] = 0
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["LastRevision"] = 11873
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["SettingsMessageShown"] = true
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["BugMessageShown"] = 1
		DBT_AllPersistentOptions["Skullflower"]["DBM"]["ForumsMessageShown"] = 11873

		DBM:ApplyProfile('Skullflower')
	end
	
	if (IsAddOnLoaded('ProjectAzilroka') and _G.ProjectAzilroka.db['SMB']) then
		E:Print(L["A profile for Square Minimap Buttons has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
		E.db["movers"]["SquareMinimapButtonBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-183"
		SquareMinimapButtonsDB["profiles"]["Skullflower"]['BarEnabled'] = true
		SquareMinimapButtonsDB["profiles"]["Skullflower"]['ButtonsPerRow'] = 6
		SquareMinimapButtonsDB["profiles"]["Skullflower"]['IconSize'] = 24
		SquareMinimapButtonsDB["profiles"]["Skullflower"]['ButtonSpacing'] = 1
	end
	
	if (IsAddOnLoaded('ProjectAzilroka') and _G.ProjectAzilroka.db['EFL']) then
		E:Print(L["A profile for Enhanced Friends Lists has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
		EnhancedFriendsListDB["profiles"]["Skullflower"]["NameFont"] = "Expressway"
		EnhancedFriendsListDB["profiles"]["Skullflower"]["NameFontSize"] = 12
		EnhancedFriendsListDB["profiles"]["Skullflower"]["InfoFont"] = "Expressway"
		EnhancedFriendsListDB["profiles"]["Skullflower"]["InfoFontSize"] = 10
		EnhancedFriendsListDB["profiles"]["Skullflower"]["GameIconPack"] = "Launcher"
		EnhancedFriendsListDB["profiles"]["Skullflower"]["StatusIconPack"] = "D3"
	end

	if IsAddOnLoaded('ElvUI_SLE') then
		E:Print(L["A profile for Shadow & Light has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
		E.db["movers"]["RaidMarkerBarAnchor"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-30,207"
		E.db["movers"]["SquareMinimapBar"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-30,-183"
		E.db["sle"]["raidmarkers"]["enable"] = false
		E.db["sle"]["raidmarkers"]["backdrop"] = true
		E.db["sle"]["media"]["fonts"]["gossip"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["zone"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["subzone"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["outline"] = "OUTLINE"
		E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["objectiveHeader"]["outline"] = "OUTLINE"
		E.db["sle"]["media"]["fonts"]["objectiveHeader"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["objectiveHeader"]["size"] = 16
		E.db["sle"]["media"]["fonts"]["mail"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["objective"]["outline"] = "OUTLINE"
		E.db["sle"]["media"]["fonts"]["objective"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["editbox"]["font"] = "Expressway"
		E.db["sle"]["media"]["fonts"]["pvp"]["font"] = "Expressway"
		E.db["sle"]["Armory"]["Character"]["Enchant"]["Font"] = "Expressway"
		E.db["sle"]["Armory"]["Character"]["Artifact"]["Font"] = "Expressway"
		E.db["sle"]["Armory"]["Character"]["Durability"]["Font"] = "Expressway"
		E.db["sle"]["Armory"]["Character"]["Level"]["Font"] = "Expressway"
		E.db["sle"]["Armory"]["Inspect"]["Enchant"]["Font"] = "Expressway"
		E.db["sle"]["Armory"]["Inspect"]["Level"]["Font"] = "Expressway"
		E.db["sle"]["bags"]["artifactPower"]["enable"] = true
		E.db["sle"]["bags"]["artifactPower"]["fonts"]["font"] = "Expressway"
		E.db["sle"]["bags"]["artifactPower"]["short"] = true
		E.db["sle"]["tooltip"]["RaidProg"]["enable"] = true
		E.db["sle"]["minimap"]["mapicons"]["iconsize"] = 22
		E.db["sle"]["minimap"]["mapicons"]["iconmouseover"] = true
		E.db["sle"]["minimap"]["mapicons"]["iconperrow"] = 6
		E.db["sle"]["datatexts"]["chathandle"] = false
	end

	if IsAddOnLoaded('XIV_Databar') then
		E:Print(L["A profile for XIV_Databar has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
	XIVBarDB = {
		["profiles"] = {
			["Skullflower"] = {
				["modules"] = {
					["tradeskill"] = {
						["barCC"] = true,
					},
					["talent"] = {
						["barCC"] = true,
					},
					["currency"] = {
						["xpBarCC"] = true,
						["currencyTwo"] = "1220",
						["currencyOne"] = "1273",
					},
					["clock"] = {
						["timeFormat"] = "twoFour",
					},
				},
				["text"] = {
					["flags"] = 2,
					["fontSize"] = 10,
					["font"] = "Expressway",
				},
				["general"] = {
					["moduleSpacing"] = 25,
				},
				["color"] = {
					["barColor"] = {
						["a"] = 0,
						["r"] = 0.952941176470588,
						["g"] = 0.968627450980392,
						["b"] = 1,
					},
				},
			},
		},
	}
end
	
	if IsAddOnLoaded('ElvUI_VisualAuraTimers') then
		E:Print(L["A profile for Visual Aura Timers has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
		E.db["VAT"]["noduration"] = false
		E.db["VAT"]["showText"] = true
		E.db["VAT"]["barHeight"] = 6
		E.db["VAT"]["statusbarTexture"] = "Skullflower"
		E.db["VAT"]["backdropTexture"] = "Skullflower"
		E.db["VAT"]["backdropColor"]["r"] = 0.070588235294118
		E.db["VAT"]["backdropColor"]["g"] = 0.070588235294118
		E.db["VAT"]["backdropColor"]["b"] = 0.070588235294118
		E.db["VAT"]["enableStaticColor"] = true
		E.db["VAT"]["staticColor"]["r"] = 0.96078431372549
		E.db["VAT"]["staticColor"]["g"] = 0.54901960784314
		E.db["VAT"]["staticColor"]["b"] = 0.72941176470588
		E.db["VAT"]["colors"]["minutesIndicator"]["r"] = 0.96078431372549
		E.db["VAT"]["colors"]["minutesIndicator"]["g"] = 0.54901960784314
		E.db["VAT"]["colors"]["minutesIndicator"]["b"] = 0.72941176470588
		E.db["VAT"]["colors"]["expireIndicator"]["r"] = 0.96078431372549
		E.db["VAT"]["colors"]["expireIndicator"]["g"] = 0.54901960784314
		E.db["VAT"]["colors"]["expireIndicator"]["b"] = 0.72941176470588
		E.db["VAT"]["colors"]["hoursIndicator"]["r"] = 0.96078431372549
		E.db["VAT"]["colors"]["hoursIndicator"]["g"] = 0.54901960784314
		E.db["VAT"]["colors"]["hoursIndicator"]["b"] = 0.72941176470588
		E.db["VAT"]["colors"]["daysIndicator"]["r"] = 0.96078431372549
		E.db["VAT"]["colors"]["daysIndicator"]["g"] = 0.54901960784314
		E.db["VAT"]["colors"]["daysIndicator"]["b"] = 0.72941176470588
		E.db["VAT"]["colors"]["secondsIndicator"]["r"] = 0.96078431372549
		E.db["VAT"]["colors"]["secondsIndicator"]["g"] = 0.54901960784314
		E.db["VAT"]["colors"]["secondsIndicator"]["b"] = 0.72941176470588
	end
	
	if IsAddOnLoaded('ElvUI_EverySecondCounts') then
		E:Print(L["A profile for Every Second Counts has been created."])
		InstallStepComplete.message = L["AddOn profiles installed"]
		InstallStepComplete:Show()
		E.db["ESC"]["font"] = "Expressway"
		E.db["ESC"]["fontSize"] = 20
	end
	
	if IsAddOnLoaded('CompactRunes') then
		E:Print(L["A profile for CompactRunes has been created."])
		InstallStepComplete.message = L["AddOn Profiles installed"]
		InstallStepComplete:Show()
		CompactRunesDB['profiles']['Skullflower'] = {
			["ooc_alpha"] = 0.5,
			["profileVersion"] = 2,
			["bars"] = {
				["BloodPlagueBar"] = {
				},
				["DarkTransformationBar"] = {
				},
				["EpidemicBar"] = {
					["enabled"] = false,
				},
				["RunicPowerBar"] = {
					["userPlaced"] = true,
					["overrideWidth"] = true,
					["x"] = 0,
					["width"] = 72,
					["y"] = -281,
				},
				["BloodBoilBar"] = {
				},
				["BoneShieldBar"] = {
					["enabled"] = true,
				},
			},
			["border"] = "Pixel",
			["texture"] = "SkullflowerLight",
			["procIcon"] = {
				["alphas"] = {
					["ooc"] = 0,
				},
			},
			["borderInd"] = "Pixel",
			["cdbars"] = {
				["Unholy"] = {
					["ordering"] = {
						"Summon Gargoyle", -- [1]
						"Dark Arbiter", -- [2]
						"Dark Transformation", -- [3]
						"Apocalypse", -- [4]
						"Anti-Magic Shell", -- [5]
						"Outbreak", -- [6]
						"Army of the Dead", -- [7]
						"Death and Decay", -- [8]
						"Defile", -- [9]
						"Mind Freeze", -- [10]
						"Asphyxiate", -- [11]
						"Corpse Shield", -- [12]
						"Blighted Rune Weapon", -- [13]
						"Soul Reaper", -- [14]
						"Icebound Fortitude", -- [15]
						"Thorasus, the Stone Heart of Draenor", -- [16]
						"Vial of Convulsive Shadows", -- [17]
						"Wraith Walk", -- [18]
					},
				},
				["Frost"] = {
					["ordering"] = {
						"Pillar of Frost", -- [1]
						"Glacial Advance", -- [2]
						"Obliteration", -- [3]
						"Horn of Winter", -- [4]
						"Anti-Magic Shell", -- [5]
						"Hungering Rune Weapon", -- [6]
						"Empower Rune Weapon", -- [7]
						"Remorseless Winter", -- [8]
						"Breath of Sindragosa", -- [9]
						"Mind Freeze", -- [10]
						"Icebound Fortitude", -- [11]
						"Thorasus, the Stone Heart of Draenor", -- [12]
						"Vial of Convulsive Shadows", -- [13]
						"Wraith Walk", -- [14]
						"Blinding Sleet", -- [15]
					},
				},
				["Blood"] = {
					["ordering"] = {
						"Rune Tap", -- [1]
						"Blood Tap", -- [2]
						"Vampiric Blood", -- [3]
						"Anti-Magic Shell", -- [4]
						"Dancing Rune Weapon", -- [5]
						"Death and Decay", -- [6]
						"Gorefiend's Grasp", -- [7]
						"Death's Caress", -- [8]
						"Consumption", -- [9]
						"Blood Mirror", -- [10]
						"Bonestorm", -- [11]
						"Mark of Blood", -- [12]
						"Anti-Magic Zone", -- [13]
						"Mind Freeze", -- [14]
						"Asphyxiate (Blood)", -- [15]
						"Sanctus, Sigil of the Unbroken", -- [16]
						"Vial of Convulsive Shadows", -- [17]
						"Wraith Walk", -- [18]
					},
				},
			},
			["enabled"] = {
				["enabled"] = {
					["Unholy"] = {
						["Festering Wound < 5"] = false,
					},
					["Frost"] = {
						["Empower Rune Weapon"] = false,
					},
					["Blood"] = {
						["Blood Tap"] = true,
						["Blood Boil"] = false,
					},
				},
				["borderInd"] = "Compact Runes",
				["border"] = "None",
				["profileVersion"] = 2,
				["Frost"] = {
					["Empower Rune Weapon"] = false,
					["Breath of Sindragosa"] = false,
				},
				["hideBlizzardFrames"] = true,
				["Unholy"] = {
					["Festering Wound < 5"] = false,
				},
				["priorityList"] = {
					["Unholy"] = {
						"Raise Dead", -- [1]
						"Summon Gargoyle", -- [2]
						"Apocalypse", -- [3]
						"Sudden Doom", -- [4]
						"Dark Transformation", -- [5]
						"Dark Succor", -- [6]
						"Necrosis Buff", -- [7]
						"Festering Wound < 5", -- [8]
						"Death and Decay", -- [9]
					},
				},
				["locked"] = true,
				["frame"] = {
					["y"] = -250,
					["x"] = 0,
				},
				["bars"] = {
					["BloodPlagueBar"] = {
					},
					["RunicPowerBar"] = {
					},
					["DarkTransformationBar"] = {
					},
					["EpidemicBar"] = {
					},
					["BloodBoilBar"] = {
					},
				},
				["cdbars"] = {
					["Unholy"] = {
						["ordering"] = {
							"Summon Gargoyle", -- [1]
							"Dark Arbiter", -- [2]
							"Dark Transformation", -- [3]
							"Apocalypse", -- [4]
							"Anti-Magic Shell", -- [5]
							"Outbreak", -- [6]
							"Army of the Dead", -- [7]
							"Death and Decay", -- [8]
							"Defile", -- [9]
							"Mind Freeze", -- [10]
							"Asphyxiate", -- [11]
							"Corpse Shield", -- [12]
							"Blighted Rune Weapon", -- [13]
							"Soul Reaper", -- [14]
							"Icebound Fortitude", -- [15]
							"Thorasus, the Stone Heart of Draenor", -- [16]
							"Vial of Convulsive Shadows", -- [17]
							"Wraith Walk", -- [18]
						},
					},
					["Frost"] = {
						["ordering"] = {
							"Pillar of Frost", -- [1]
							"Glacial Advance", -- [2]
							"Obliteration", -- [3]
							"Horn of Winter", -- [4]
							"Anti-Magic Shell", -- [5]
							"Hungering Rune Weapon", -- [6]
							"Empower Rune Weapon", -- [7]
							"Remorseless Winter", -- [8]
							"Breath of Sindragosa", -- [9]
							"Mind Freeze", -- [10]
							"Icebound Fortitude", -- [11]
							"Thorasus, the Stone Heart of Draenor", -- [12]
							"Vial of Convulsive Shadows", -- [13]
							"Wraith Walk", -- [14]
							"Blinding Sleet", -- [15]
						},
					},
					["Blood"] = {
						["ordering"] = {
							"Rune Tap", -- [1]
							"Blood Tap", -- [2]
							"Vampiric Blood", -- [3]
							"Anti-Magic Shell", -- [4]
							"Dancing Rune Weapon", -- [5]
							"Death and Decay", -- [6]
							"Gorefiend's Grasp", -- [7]
							"Death's Caress", -- [8]
							"Consumption", -- [9]
							"Blood Mirror", -- [10]
							"Bonestorm", -- [11]
							"Mark of Blood", -- [12]
							"Anti-Magic Zone", -- [13]
							"Mind Freeze", -- [14]
							"Asphyxiate (Blood)", -- [15]
							"Sanctus, Sigil of the Unbroken", -- [16]
							"Vial of Convulsive Shadows", -- [17]
							"Wraith Walk", -- [18]
						},
					},
				},
			},
			["frame"] = {
				["y"] = -250,
			},
		}
		end

		if IsAddOnLoaded('xCT+') then
			E:Print(L["A profile for xCT has been created."])
			InstallStepComplete.message = L["AddOn Profiles installed"]
			InstallStepComplete:Show()
			xCTSavedDB['profiles']['Skullflower'] = {
			["frames"] = {
				["general"] = {
					["enabledFrame"] = false,
					["font"] = "Expressway",
					["colors"] = {
						["auras"] = {
							["colors"] = {
								["debuffsGained"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
								["buffsGained"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["buffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["debuffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
						["killingBlow"] = {
							["color"] = {
								0.2, -- [1]
								1, -- [2]
								0.2, -- [3]
							},
						},
						["combat"] = {
							["colors"] = {
								["combatLeaving"] = {
									["color"] = {
										0.1, -- [1]
										1, -- [2]
										0.1, -- [3]
									},
								},
								["combatEntering"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["interrupts"] = {
							["color"] = {
								1, -- [1]
								0.5, -- [2]
								0, -- [3]
							},
						},
						["reputation"] = {
							["colors"] = {
								["reputationGain"] = {
									["color"] = {
										0.1, -- [1]
										0.1, -- [2]
										1, -- [3]
									},
								},
								["reputationLoss"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["lowResources"] = {
							["colors"] = {
								["lowResourcesMana"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
								["lowResourcesHealth"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["honorGains"] = {
							["color"] = {
								0.1, -- [1]
								0.1, -- [2]
								1, -- [3]
							},
						},
						["dispells"] = {
							["colors"] = {
								["dispellBuffs"] = {
									["color"] = {
										0, -- [1]
										1, -- [2]
										0.5, -- [3]
									},
								},
								["dispellStolen"] = {
									["color"] = {
										0.31, -- [1]
										0.71, -- [2]
										1, -- [3]
									},
								},
								["dispellDebuffs"] = {
									["color"] = {
										1, -- [1]
										0, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
					},
					["fontOutline"] = "2OUTLINE",
				},
				["power"] = {
					["fontOutline"] = "2OUTLINE",
					["enabledFrame"] = false,
					["font"] = "Expressway",
				},
				["healing"] = {
					["enableRealmNames"] = false,
					["fontSize"] = 12,
					["showFriendlyHealers"] = false,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 68,
					["Y"] = -18,
					["font"] = "Expressway",
					["colors"] = {
						["healingTakenCritical"] = {
							["color"] = {
								0.1, -- [1]
								1, -- [2]
								0.1, -- [3]
							},
						},
						["healingTaken"] = {
							["color"] = {
								0.1, -- [1]
								0.75, -- [2]
								0.1, -- [3]
							},
						},
						["healingTakenPeriodic"] = {
							["color"] = {
								0.1, -- [1]
								0.5, -- [2]
								0.1, -- [3]
							},
						},
						["shieldTaken"] = {
							["color"] = {
								0.6, -- [1]
								0.65, -- [2]
								1, -- [3]
							},
						},
						["healingTakenPeriodicCritical"] = {
							["color"] = {
								0.1, -- [1]
								0.5, -- [2]
								0.1, -- [3]
							},
						},
					},
					["Height"] = 218,
					["X"] = -109,
				},
				["outgoing"] = {
					["fontSize"] = 12,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 122,
					["Y"] = 29,
					["font"] = "Expressway",
					["colors"] = {
						["genericDamage"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOut"] = {
									["color"] = {
										0.1, -- [1]
										0.75, -- [2]
										0.1, -- [3]
									},
								},
								["shieldOut"] = {
									["color"] = {
										0.6, -- [1]
										0.65, -- [2]
										1, -- [3]
									},
								},
								["healingOutPeriodic"] = {
									["color"] = {
										0.1, -- [1]
										0.5, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
						["spellSchools"] = {
							["colors"] = {
								["SpellSchool_Nature"] = {
									["color"] = {
										0.3, -- [1]
										1, -- [2]
										0.3, -- [3]
									},
								},
								["SpellSchool_Arcane"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Frost"] = {
									["color"] = {
										0.5, -- [1]
										1, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Physical"] = {
									["color"] = {
										1, -- [1]
										1, -- [2]
										0, -- [3]
									},
								},
								["SpellSchool_Shadow"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										1, -- [3]
									},
								},
								["SpellSchool_Holy"] = {
									["color"] = {
										1, -- [1]
										0.9, -- [2]
										0.5, -- [3]
									},
								},
								["SpellSchool_Fire"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										0, -- [3]
									},
								},
							},
						},
						["misstypesOut"] = {
							["color"] = {
								0.5, -- [1]
								0.5, -- [2]
								0.5, -- [3]
							},
						},
					},
					["Height"] = 317,
					["X"] = 231,
				},
				["critical"] = {
					["fontSize"] = 12,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 96,
					["Y"] = 29,
					["font"] = "Expressway",
					["colors"] = {
						["genericDamageCritical"] = {
							["color"] = {
								1, -- [1]
								1, -- [2]
								0, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOutCritical"] = {
									["color"] = {
										0.1, -- [1]
										1, -- [2]
										0.1, -- [3]
									},
								},
							},
						},
					},
					["Height"] = 317,
					["X"] = 150,
				},
				["procs"] = {
					["fontOutline"] = "2OUTLINE",
					["font"] = "Expressway",
					["colors"] = {
						["spellReactive"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["spellProc"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
					},
					["enabledFrame"] = false,
				},
				["loot"] = {
					["enabledFrame"] = false,
					["fontOutline"] = "2OUTLINE",
					["font"] = "Expressway",
				},
				["class"] = {
					["font"] = "Expressway",
					["colors"] = {
						["comboPoints"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["comboPointsMax"] = {
							["color"] = {
								0, -- [1]
								0.82, -- [2]
								1, -- [3]
							},
						},
					},
					["enabledFrame"] = false,
					["fontOutline"] = "2OUTLINE",
				},
				["damage"] = {
					["fontSize"] = 12,
					["insertText"] = "bottom",
					["X"] = -210,
					["Width"] = 131,
					["Y"] = -18,
					["font"] = "Expressway",
					["colors"] = {
						["missTypesTaken"] = {
							["colors"] = {
								["missTypeBlock"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeMiss"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeImmune"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeDodge"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeParry"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeResist"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeEvade"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeAbsorb"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeDeflect"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeReflect"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
						["damageTakenCritical"] = {
							["color"] = {
								1, -- [1]
								0.1, -- [2]
								0.1, -- [3]
							},
						},
						["spellDamageTaken"] = {
							["color"] = {
								0.75, -- [1]
								0.3, -- [2]
								0.85, -- [3]
							},
						},
						["damageTaken"] = {
							["color"] = {
								0.75, -- [1]
								0.1, -- [2]
								0.1, -- [3]
							},
						},
						["spellDamageTakenCritical"] = {
							["color"] = {
								0.75, -- [1]
								0.3, -- [2]
								0.85, -- [3]
							},
						},
					},
					["Height"] = 218,
					["fontOutline"] = "2OUTLINE",
				},
			},
			
			}
		end
			
		if IsAddOnLoaded('MikScrollingBattleText') then
			E:Print(L["A profile for MSBT has been created. Type /mbst to change the profile."])
			InstallStepComplete.message = L["AddOn profiles installed"]
			InstallStepComplete:Show()
			MSBTProfiles_SavedVars['profiles']['Skullflower'] = {
			["animationSpeed"] = 105,
			["abbreviateAbilities"] = true,
			["events"] = {
				["NOTIFICATION_MONEY"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_ITEM_COOLDOWN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_LOOT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_PET_COOLDOWN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_COOLDOWN"] = {
					["disabled"] = true,
				},
			},
			["hideNames"] = true,
			["scrollAreas"] = {
				["Static"] = {
					["direction"] = "Up",
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["critOutlineIndex"] = 2,
					["stickyDirection"] = "Up",
					["disabled"] = true,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Incoming"] = {
					["direction"] = "Up",
					["normalOutlineIndex"] = 2,
					["stickyBehavior"] = "MSBT_NORMAL",
					["offsetX"] = -200,
					["textAlignIndex"] = 1,
					["critFontName"] = "Expressway",
					["critOutlineIndex"] = 2,
					["animationSpeed"] = 110,
					["behavior"] = "MSBT_NORMAL",
					["critFontSize"] = 14,
					["stickyDirection"] = "Up",
					["normalFontSize"] = 12,
					["offsetY"] = -175,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Outgoing"] = {
					["critOutlineIndex"] = 2,
					["direction"] = "Up",
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["stickyBehavior"] = "MSBT_NORMAL",
					["normalFontSize"] = 12,
					["behavior"] = "MSBT_NORMAL",
					["critFontSize"] = 14,
					["stickyDirection"] = "Up",
					["offsetX"] = 200,
					["offsetY"] = -175,
					["textAlignIndex"] = 3,
					["normalFontName"] = "Expressway",
					["animationStyle"] = "Straight",
					["stickyAnimationStyle"] = "Static",
				},
				["Notification"] = {
					["stickyDirection"] = "Up",
					["critOutlineIndex"] = 2,
					["critFontName"] = "Expressway",
					["normalOutlineIndex"] = 2,
					["disabled"] = true,
					["normalFontName"] = "Expressway",
					["stickyAnimationStyle"] = "Static",
				},
			},
			["hideMergeTrailer"] = true,
			["creationVersion"] = "5.7.138",
		}
		end
	end
end

function SetProfilesToSkullflower()
	local LibStub = _G["LibStub"]
	local AceLibrary = _G["AceLibrary"]
	local Rock = _G["Rock"]
	
	local ls_ace = false
	-- Ace DB 3 check
	if LibStub then
		local AceDB = LibStub:GetLibrary("AceDB-3.0",true)
		if AceDB and AceDB.db_registry then
			for db in pairs(AceDB.db_registry) do
				if not db.parent then --db.sv is a ref to the saved vairable name
						if addon then
							if addon and db.sv == addon then
								db:SetProfile("Skullflower")
							end
						else
							db:SetProfile("Skullflower")
						end
					end
				end
			end
		end

end

local function InstallComplete()
	E.private.install_complete = E.version
	ReloadUI()
end

local function ResetAll()
	InstallNextButton:Disable()
	InstallPrevButton:Disable()
	InstallOption1Button:Hide()
	InstallOption1Button:SetScript("OnClick", nil)
	InstallOption1Button:SetText("")
	InstallOption2Button:Hide()
	InstallOption2Button:SetScript('OnClick', nil)
	InstallOption2Button:SetText('')
	InstallOption3Button:Hide()
	InstallOption3Button:SetScript('OnClick', nil)
	InstallOption3Button:SetText('')	
	InstallOption4Button:Hide()
	InstallOption4Button:SetScript('OnClick', nil)
	InstallOption4Button:SetText('')
	InstallOption5Button:Hide()
	InstallOption5Button:SetScript('OnClick', nil)
	InstallOption5Button:SetText('')
	InstallOption6Button:Hide()
	InstallOption6Button:SetScript('OnClick', nil)
	InstallOption6Button:SetText('')
	InstallOption7Button:Hide()
	InstallOption7Button:SetScript('OnClick', nil)
	InstallOption7Button:SetText('')
	InstallOption8Button:Hide()
	InstallOption8Button:SetScript('OnClick', nil)
	InstallOption8Button:SetText('')
	InstallOption9Button:Hide()
	InstallOption9Button:SetScript('OnClick', nil)
	InstallOption9Button:SetText('')
	InstallOption10Button:Hide()
	InstallOption10Button:SetScript('OnClick', nil)
	InstallOption10Button:SetText('')
	InstallOption11Button:Hide()
	InstallOption11Button:SetScript('OnClick', nil)
	InstallOption11Button:SetText('')
	InstallOption12Button:Hide()
	InstallOption12Button:SetScript('OnClick', nil)
	InstallOption12Button:SetText('')
	InstallOption13Button:Hide()
	InstallOption13Button:SetScript('OnClick', nil)
	InstallOption13Button:SetText('')
	InstallOption14Button:Hide()
	InstallOption14Button:SetScript('OnClick', nil)
	InstallOption14Button:SetText('')
	
	InstallBtn:Hide()
	InstallBtn:SetScript('OnClick', nil)
	InstallBtn:SetText('')
	FinishBtn:Hide()
	FinishBtn:SetScript('OnClick', nil)
	FinishBtn:SetText('')
	MoveBtn:Hide()
	MoveBtn:SetScript('OnClick', nil)
	MoveBtn:SetText('')
	ElvUIInstallFrame:Size(320, 64)
end

local function SetPage(PageNum)
	CURRENT_PAGE = PageNum
	ResetAll()
	
	local f = ElvUIInstallFrame
	
	if PageNum == 1 then
		InstallPrevButton:Hide()
		InstallPrevButton:Disable()
		InstallNextButton:Enable()
		InstallNextButton:Show()
	elseif PageNum == 2 then
		InstallPrevButton:Show()
		InstallPrevButton:Enable()
		InstallNextButton:Disable()
		InstallNextButton:Hide()
	end

	if PageNum == 1 then
		InstallBtn:Show()
		InstallBtn:SetScript('OnClick', function() E:SetupAddon('Skada'); SetProfilesToSkullflower(); E:SetupTheme('SkullflowerUI'); end)
		InstallBtn:SetText(L[''])	
		
		MoveBtn:Show()
		MoveBtn:SetScript("OnClick", function() E:ToggleConfigMode() end)
		MoveBtn:SetText(L[''])
		
		FinishBtn:Show()
		FinishBtn:SetText(L[''])
		FinishBtn:SetScript("OnClick", InstallComplete)	
	elseif PageNum == 2 then
		InstallBtn:Show()
		InstallBtn:SetScript('OnClick', function() E:SetupAddon('Skada'); SetProfilesToSkullflower(); E:SetupTheme('SkullflowerUI'); end)
		InstallBtn:SetText(L[''])	
		
		MoveBtn:Show()
		MoveBtn:SetScript("OnClick", function() E:ToggleConfigMode() end)
		MoveBtn:SetText(L[''])
		
		FinishBtn:Show()
		FinishBtn:SetText(L[''])
		FinishBtn:SetScript("OnClick", InstallComplete)	
		
		InstallOption1Button:Show()
		InstallOption1Button:SetScript('OnClick', function() E:SetupTheme('SkullflowerUI') end)
		InstallOption1Button:SetText(L['|cffffffffReset Settings|r'])
		
		InstallOption2Button:Show()
		InstallOption2Button:SetScript('OnClick', function() E:SetupTheme('LightTexture') end)
		InstallOption2Button:SetText(L['|cffffffffLight Textures|r'])
		
		InstallOption3Button:Show()
		InstallOption3Button:SetScript('OnClick', function() E:SetupTheme('unitframeTexts') end)
		InstallOption3Button:SetText(L['|cffffffffEnable UFTexts|r'])
		
		InstallOption4Button:Show()
		InstallOption4Button:SetScript('OnClick', function() E:SetupTheme('UFTexts') end)
		InstallOption4Button:SetText(L['|cffffffffAlt. UFTexts|r'])
		
		InstallOption5Button:Show()
		InstallOption5Button:SetScript('OnClick', function() E:SetupTheme('OldUIStyle') end)
		InstallOption5Button:SetText(L['|cffffffffOld UI Style|r'])
		
		InstallOption6Button:Show()
		InstallOption6Button:SetScript('OnClick', function() E:SetupTheme('HealerLayout') end)
		InstallOption6Button:SetText(L['|cffffffffHealer Layout|r'])
		
		InstallOption7Button:Show()
		InstallOption7Button:SetScript('OnClick', function() E:SetupTheme('BoxedFrames') end)
		InstallOption7Button:SetText(L['|cffffffffBoxed Frames|r'])
		
		InstallOption8Button:Show()
		InstallOption8Button:SetScript('OnClick', function() E:SetupTheme('VerticalFrames') end)
		InstallOption8Button:SetText(L['|cffffffffVertical Frames|r'])
		
		InstallOption9Button:Show()
		InstallOption9Button:SetScript('OnClick', function() E:SetupTheme('bossFrame') end)
		InstallOption9Button:SetText(L['|cffffffffBoss Frames|r'])

		InstallOption10Button:Show()
		InstallOption10Button:SetScript('OnClick', function() E:SetupTheme('enableAuraBars') end)
		InstallOption10Button:SetText(L['|cffffffffAura Bars|r'])
		
		InstallOption11Button:Show()
		InstallOption11Button:SetScript('OnClick', function() E:SetupTheme('squareBars') end)
		InstallOption11Button:SetText(L['|cffffffffSquare ABars|r'])
		
		InstallOption12Button:Show()
		InstallOption12Button:SetScript('OnClick', function() E:SetupTheme('extraActionBars') end)
		InstallOption12Button:SetText(L['|cffffffffExtra ABars|r'])
		
		InstallOption13Button:Show()
		InstallOption13Button:SetScript('OnClick', function() E:SetupTheme('Databars') end)
		InstallOption13Button:SetText(L['|cffffffffAlt. Databars|r'])
		
		InstallOption14Button:Show()
		InstallOption14Button:SetScript('OnClick', function() E:SetupTheme('Datatexts') end)
		InstallOption14Button:SetText(L['|cffffffffExtra Datatexts|r'])
	end
end

local function NextPage()	
	if CURRENT_PAGE ~= MAX_PAGE then
		CURRENT_PAGE = CURRENT_PAGE + 1
		SetPage(CURRENT_PAGE)
	end
end

local function PreviousPage()
	if CURRENT_PAGE ~= 1 then
		CURRENT_PAGE = CURRENT_PAGE - 1
		SetPage(CURRENT_PAGE)
	end
end

--Install UI
function E:Install()	
	if not InstallStepComplete then
		local imsg = CreateFrame("Frame", "InstallStepComplete", E.UIParent)
		imsg:Size(142, 150)
		imsg:Point("TOP", 0, -190)
		imsg:Hide()
		imsg:SetScript('OnShow', function(self)
			if self.message then 
				self.text:SetText(self.message)
				UIFrameFadeOut(self, 3.5, 1, 0)
				E:Delay(4, function() self:Hide() end)	
				self.message = nil

				if imsg.firstShow == false then			
					imsg.firstShow = true
				end
			else
				self:Hide()
			end
		end)

		imsg.firstShow = false

		imsg.bg = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.bg:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.bg:SetPoint('BOTTOM')
		imsg.bg:Size(206, 150)
		imsg.bg:SetTexCoord(0.00195313, 0.63867188, 0.03710938, 0.23828125)
		imsg.bg:SetVertexColor(1, 1, 1, 0.6)

		imsg.lineBottom = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.lineBottom:SetDrawLayer('BACKGROUND', 2)
		imsg.lineBottom:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.lineBottom:SetPoint("BOTTOM")
		imsg.lineBottom:Size(206, 150)
		imsg.lineBottom:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

		imsg.text = imsg:CreateFontString(nil, 'ARTWORK', 'GameFont_Gigantic')
		imsg.text:Point("BOTTOM", 0, 12)
		imsg.text:SetTextColor(1, 0.82, 0)
		imsg.text:SetJustifyH("CENTER")
		
	end

	--Create Frame
	if not ElvUIInstallFrame then
		local f = CreateFrame("Button", "ElvUIInstallFrame", E.UIParent)
		f.SetPage = SetPage
		f:Size(78, 150)
		f:SetTemplate("Transparent")
		f:SetPoint("TOP")
		
		f.InstallBtn = CreateFrame("Button", "InstallBtn", f, "UIPanelButtonTemplate")
		f.InstallBtn:StripTextures()
		f.InstallBtn:SetFrameStrata('MEDIUM')
		f.InstallBtn:Size(64, 64)
		f.InstallBtn:Point("LEFT", 0, 0)
		f.InstallBtn:SetText("")
		f.InstallBtn:SetAlpha(0)
		E.Skins:HandleButton(f.InstallBtn, true)
		
		f.Next = CreateFrame("Button", "InstallNextButton", f, "UIPanelButtonTemplate")
		f.Next:StripTextures()
		f.Next:SetTemplate("Default", true)
		f.Next:SetAlpha(0)
		f.Next:Size(64, 64)
		f.Next:Point('RIGHT', f.InstallBtn, 64, 0)
		f.Next:Disable()
		f.Next:SetScript("OnClick", NextPage)
		E.Skins:HandleButton(f.Next, true)
		
		f.Prev = CreateFrame("Button", "InstallPrevButton", f, "UIPanelButtonTemplate")
		f.Prev:StripTextures()
		f.Prev:SetTemplate("Default", true)
		f.Prev:SetAlpha(0)
		f.Prev:Size(64, 64)
		f.Prev:Point('RIGHT', f.InstallBtn, 64, 0)
		f.Prev:Disable()
		f.Prev:SetScript("OnClick", PreviousPage)
		E.Skins:HandleButton(f.Prev, true)
		
		f.MoveBtn = CreateFrame("Button", "MoveBtn", f, "UIPanelButtonTemplate")
		f.MoveBtn:StripTextures()
		f.MoveBtn:SetFrameStrata('MEDIUM')
		f.MoveBtn:Size(64, 64)
		f.MoveBtn:Point('RIGHT', f.Next, 64, 0)
		f.MoveBtn:SetText("")
		f.MoveBtn:SetAlpha(0)
		E.Skins:HandleButton(f.MoveBtn, true)
						
		f.FinishBtn = CreateFrame("Button", "FinishBtn", f, "UIPanelButtonTemplate")
		f.FinishBtn:StripTextures()
		f.FinishBtn:SetFrameStrata('MEDIUM')
		f.FinishBtn:Size(64, 64)
		f.FinishBtn:Point('RIGHT', f.MoveBtn, 64, 0)
		f.FinishBtn:SetText("")
		f.FinishBtn:SetAlpha(0)
		E.Skins:HandleButton(f.FinishBtn, true)
		
		local close = CreateFrame("Button", "InstallCloseButton", f, "UIPanelButtonTemplate")
		close:StripTextures()
		close:Point('RIGHT', f.FinishBtn, 64, 0)
		close:Size(64, 64)
		close:SetAlpha(0)
		close:SetScript("OnClick", function()
			f:Hide()
		end)
		E.Skins:HandleButton(close)
		
		f.Option1 = CreateFrame("Button", "InstallOption1Button", f, "UIPanelButtonTemplate")
		f.Option1:StripTextures()
		f.Option1:Size(100, 22)
		f.Option1:SetAlpha(1)
		f.Option1:Point('TOP', f.Prev, 'BOTTOM', 0, -1)
		f.Option1:SetText("")
		f.Option1:Hide()
		E.Skins:HandleButton(f.Option1, true)
		
		f.Option2 = CreateFrame("Button", "InstallOption2Button", f, "UIPanelButtonTemplate")
		f.Option2:StripTextures()
		f.Option2:Size(100, 22)
		f.Option2:SetAlpha(1)
		f.Option2:Point('TOP', f.Option1, 'BOTTOM', 0, -1)
		f.Option2:SetText("")
		f.Option2:Hide()
		E.Skins:HandleButton(f.Option2, true)		
		
		f.Option3 = CreateFrame("Button", "InstallOption3Button", f, "UIPanelButtonTemplate")
		f.Option3:StripTextures()
		f.Option3:Size(100, 22)
		f.Option3:SetAlpha(1)
		f.Option3:Point('TOP', f.Option2, 'BOTTOM', 0, -1)
		f.Option3:SetText("")
		f.Option3:Hide()
		E.Skins:HandleButton(f.Option3, true)	
		
		f.Option4 = CreateFrame("Button", "InstallOption4Button", f, "UIPanelButtonTemplate")
		f.Option4:StripTextures()
		f.Option4:Size(100, 22)
		f.Option4:SetAlpha(1)
		f.Option4:Point('TOP', f.Option3, 'BOTTOM', 0, -1)
		f.Option4:SetText("")
		E.Skins:HandleButton(f.Option4, true)
		
		f.Option5 = CreateFrame("Button", "InstallOption5Button", f, "UIPanelButtonTemplate")
		f.Option5:StripTextures()
		f.Option5:Size(100, 22)
		f.Option5:SetAlpha(1)
		f.Option5:Point('TOP', f.Option4, 'BOTTOM', 0, -1)
		f.Option5:SetText("")
		E.Skins:HandleButton(f.Option5, true)
		
		f.Option6 = CreateFrame("Button", "InstallOption6Button", f, "UIPanelButtonTemplate")
		f.Option6:StripTextures()
		f.Option6:Size(100, 22)
		f.Option6:SetAlpha(1)
		f.Option6:Point('TOP', f.Option5, 'BOTTOM', 0, -1)
		f.Option6:SetText("")
		E.Skins:HandleButton(f.Option6, true)
		
		f.Option7 = CreateFrame("Button", "InstallOption7Button", f, "UIPanelButtonTemplate")
		f.Option7:StripTextures()
		f.Option7:Size(100, 22)
		f.Option7:SetAlpha(1)
		f.Option7:Point('TOP', f.Option6, 'BOTTOM', 0, -1)
		f.Option7:SetText("")
		E.Skins:HandleButton(f.Option7, true)
		
		f.Option8 = CreateFrame("Button", "InstallOption8Button", f, "UIPanelButtonTemplate")
		f.Option8:StripTextures()
		f.Option8:Size(100, 22)
		f.Option8:SetAlpha(1)
		f.Option8:Point('TOP', f.Option7, 'BOTTOM', 0, -1)
		f.Option8:SetText("")
		E.Skins:HandleButton(f.Option8, true)
		
		f.Option9 = CreateFrame("Button", "InstallOption9Button", f, "UIPanelButtonTemplate")
		f.Option9:StripTextures()
		f.Option9:Size(100, 22)
		f.Option9:SetAlpha(1)
		f.Option9:Point('TOP', f.Option8, 'BOTTOM', 0, -1)
		f.Option9:SetText("")
		E.Skins:HandleButton(f.Option9, true)
		
		f.Option10 = CreateFrame("Button", "InstallOption10Button", f, "UIPanelButtonTemplate")
		f.Option10:StripTextures()
		f.Option10:Size(100, 22)
		f.Option10:SetAlpha(1)
		f.Option10:Point('TOP', f.Option9, 'BOTTOM', 0, -1)
		f.Option10:SetText("")
		E.Skins:HandleButton(f.Option10, true)
		
		f.Option11 = CreateFrame("Button", "InstallOption11Button", f, "UIPanelButtonTemplate")
		f.Option11:StripTextures()
		f.Option11:Size(100, 22)
		f.Option11:SetAlpha(1)
		f.Option11:Point('TOP', f.Option10, 'BOTTOM', 0, -1)
		f.Option11:SetText("")
		E.Skins:HandleButton(f.Option11, true)
		
		f.Option12 = CreateFrame("Button", "InstallOption12Button", f, "UIPanelButtonTemplate")
		f.Option12:StripTextures()
		f.Option12:Size(100, 22)
		f.Option12:SetAlpha(1)
		f.Option12:Point('TOP', f.Option11, 'BOTTOM', 0, -1)
		f.Option12:SetText("")
		E.Skins:HandleButton(f.Option12, true)
		
		f.Option13 = CreateFrame("Button", "InstallOption13Button", f, "UIPanelButtonTemplate")
		f.Option13:StripTextures()
		f.Option13:Size(100, 22)
		f.Option13:SetAlpha(1)
		f.Option13:Point('TOP', f.Option12, 'BOTTOM', 0, -1)
		f.Option13:SetText("")
		E.Skins:HandleButton(f.Option13, true)
		
		f.Option14 = CreateFrame("Button", "InstallOption14Button", f, "UIPanelButtonTemplate")
		f.Option14:StripTextures()
		f.Option14:Size(100, 22)
		f.Option14:SetAlpha(1)
		f.Option14:Point('TOP', f.Option13, 'BOTTOM', 0, -1)
		f.Option14:SetText("")
		E.Skins:HandleButton(f.Option14, true)
		
		
		f.SUF = f:CreateTexture('SUF_LOGO')
		f.SUF:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\SkullflowerUI.tga')
		f.SUF:Point('LEFT', "ElvUIInstallFrame", 34, -75)
		
		f.InstallBtn = f:CreateTexture('InstallButton')
		f.InstallBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\install.tga')
		f.InstallBtn:Point('LEFT', "ElvUIInstallFrame", 0, 0)
		
		f.CustomBtn = f:CreateTexture('CustomButton')
		f.CustomBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\customize.tga')
		f.CustomBtn:Point('RIGHT', f.InstallBtn, 64, 0)
		
		f.MoveBtn = f:CreateTexture('MoveButton')
		f.MoveBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\move.tga')
		f.MoveBtn:Point('RIGHT', f.CustomBtn, 64, 0)
				
		f.FinishBtn = f:CreateTexture('FinishButton')
		f.FinishBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\finish.tga')
		f.FinishBtn:Point('RIGHT', f.MoveBtn, 64, 0)
		
		f.CloseBtn = f:CreateTexture('CloseButton')
		f.CloseBtn:SetTexture('Interface\\AddOns\\ElvUI_Skullflower\\media\\textures\\close.tga')
		f.CloseBtn:Point('RIGHT', f.FinishBtn, 64, 0)

	end
	
	ElvUIInstallFrame:Show()
	NextPage()
end