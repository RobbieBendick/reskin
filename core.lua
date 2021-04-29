
local frame = CreateFrame("FRAME", "Anon")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")

local function eventHandler(self, event, ...)

	-- EDIT THIS LINE BELOW TO CHANGE YOUR NAME
	NewName = "Rob"
	PlayerName = GetUnitName("player")


	-- Change Target's Target UnitFrame Name
	TFTNC = CreateFrame("Frame", "TargetFrameTargetNameChange")
	local function ChangeTargetofTargetName(self)
		local TTN = GetUnitName("targettarget")
		if PlayerName == TTN then
			TargetFrameToT.name:SetText(NewName)
		else TargetFrameToT.name:SetText(UnitClass("targettarget"))
		end
	end
	TFTNC:SetScript("OnUpdate", ChangeTargetofTargetName)

	-- Change Focus UnitFrame Name
	FFNC = CreateFrame("Frame", "FocusFrameNameChange")
	local function ChangeFocusName(self)
		local focusClassName, focusClassFileName, focusClassId = UnitClass("focus")
		local FN = GetUnitName("focus")
		local player = UnitIsPlayer("focus")

		--Class Colored Focus Frames
		-- Warrior
		if focusClassId == 1 and player then 
			FocusFrameNameBackground:SetVertexColor(0.78,0.61,0.43) --brown
		end
		-- Paladin
		if focusClassId == 2 and player then 
			FocusFrameNameBackground:SetVertexColor(0.96, 0.55, 0.73) --Pink
		end

		-- Hunter
		if focusClassId == 3 and player then 
			FocusFrameNameBackground:SetVertexColor(0.67, 0.83, 0.45) --Green
		end

		-- Rogue
		if focusClassId == 4 and player then 
			FocusFrameNameBackground:SetVertexColor(1, 0.96, 0.41) -- Yellow
		end

		-- Priest
		if focusClassId == 5 and player then 
			FocusFrameNameBackground:SetVertexColor(1, 1, 1) --White
		end

		-- Shaman
		if focusClassId == 7 and player then 
			FocusFrameNameBackground:SetVertexColor(0, 0.44, 0.87) --Dark Blue
		end

		-- Mage
		if focusClassId == 8 and player then 
			FocusFrameNameBackground:SetVertexColor(0.41, 0.80, 0.94) --Light Blue
		end

		-- Warlock
		if focusClassId == 9 and player then 
			FocusFrameNameBackground:SetVertexColor(0.58, 0.51,0.79) --Purple
		end

		-- Druid
		if focusClassId == 11 and player then 
			FocusFrameNameBackground:SetVertexColor(1 , 0.49, 0.04) --Orange
		end

		if PlayerName == FN then
			FocusFrame.name:SetText(NewName)
		end
		if UnitCreatureType("focus") == "Beast" and UnitPlayerControlled() then
			FocusFrame.name:SetText("Hunter Pet")
		end
		if UnitCreatureType("focus") == "Totem" then
			FocusFrame.name:SetText(GetUnitName("focus"))
		end
		if player then	
			FocusFrame.name:SetText(UnitClass("focus"))
		end
		--show arena numbers on focus
		for i=1,5 do
			if UnitIsUnit("focus","arena"..i) then
				FocusFrame.name:SetText(UnitClass("arena"..i) .. " " .. i)
			end
		end
	end
	FFNC:SetScript("OnUpdate", ChangeFocusName)

	-- Change Focus' Target UnitFrame Name
	FFTNC = CreateFrame("Frame", "FocusFrameTargetNameChange")
	local function ChangeFocusTargetName(self)
		local FTN = GetUnitName("focustarget")
		if PlayerName == FTN then
			FocusFrameToT.name:SetText(NewName)
		else FocusFrameToT.name:SetText(UnitClass("focustarget"))
		end
	end
	FFTNC:SetScript("OnUpdate", ChangeFocusTargetName)
end

	-- Change Player UnitFrame Name
	PFNC = CreateFrame("Frame", "PlayerFrameNameChange")
	local function ChangePlayerName(self)
		PlayerFrame.name:SetText(NewName)
	end
	PFNC:SetScript("OnUpdate", ChangePlayerName)

	-- Change Target UnitFrame Name
	TFNC = CreateFrame("Frame", "TargetFrameNameChange")
	local function ChangeTargetName(self)
		local TN, _ = GetUnitName("target")
		local targetClassName, targetClassFileName, targetClassId = UnitClass("target")
		local player = UnitIsPlayer("target")

			-- Change TargetFrame Name
			if TN == PlayerName then
				TargetFrame.name:SetText(NewName)
			elseif UnitPlayerControlled("target") and UnitCreatureType("target") == "Beast" and not player then
				TargetFrame.name:SetText("Hunter Pet")
			else
				if player then
					TargetFrame.name:SetText(UnitClass("target"))	
				end
			end	

		-- places arena numbers on targets
		for i=1,5 do
			if UnitIsUnit("target","arena"..i) then
				TargetFrame.name:SetText(UnitClass("arena"..i) .. " " .. i)
			end
		end

		--Class Colored Target Frames
		-- Warrior
		if targetClassId == 1 and player then 
			TargetFrameNameBackground:SetVertexColor(0.78,0.61,0.43) --brown
		end
		-- Paladin
		if targetClassId == 2 and player then 
			TargetFrameNameBackground:SetVertexColor(0.96, 0.55, 0.73) --Pink
		end

		-- Hunter
		if targetClassId == 3 and player then 
			TargetFrameNameBackground:SetVertexColor(0.67, 0.83, 0.45) --Green
		end

		-- Rogue
		if targetClassId == 4 and player then 
			TargetFrameNameBackground:SetVertexColor(1, 0.96, 0.41) -- Yellow
		end

		-- Priest
		if targetClassId == 5 and player then 
			TargetFrameNameBackground:SetVertexColor(1, 1, 1) --White
		end

		-- Shaman
		if targetClassId == 7 and player then 
			TargetFrameNameBackground:SetVertexColor(0, 0.44, 0.87) --Dark Blue
		end

		-- Mage
		if targetClassId == 8 and player then 
			TargetFrameNameBackground:SetVertexColor(0.41, 0.80, 0.94) --Light Blue
		end

		-- Warlock
		if targetClassId == 9 and player then 
			TargetFrameNameBackground:SetVertexColor(0.58, 0.51,0.79) --Purple
		end

		-- Druid
		if targetClassId == 11 and player then 
			TargetFrameNameBackground:SetVertexColor(1 , 0.49, 0.04) --Orange
		end
	end
	TFNC:SetScript("OnUpdate", ChangeTargetName)
frame:SetScript("OnEvent", eventHandler)


	-- Change Tooltip from names of players to classes and pets to pet
	GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	local targetClassName, targetClassFileName, targetClassId = UnitClass("mouseover")
	local player = UnitIsPlayer("mouseover")

	-- Hunter pet tooltip
	if UnitPlayerControlled("mouseover") and UnitCreatureType("mouseover") == "Beast" and not player then 
		GameTooltip:ClearLines()
		GameTooltip:AddLine("Hunter Pet", 1,1,1)
		GameTooltip:AddLine(GameTooltipStatusBar:Show())
	end

	-- Warlock Pet tooltips
	local pets = {
		"Succubus", "Imp", "Voidwalker", "Felhunter", "Shadowfiend",
	}
	for i=1,#pets do
		if UnitCreatureFamily("mouseover") == pets[i] then
			GameTooltip:ClearLines()
			GameTooltip:AddLine(pets[i], 1,1,1)
			GameTooltip:AddLine(GameTooltipStatusBar:Show())
		end
	end


	-- Shaman Totems
	if UnitCreatureType("mouseover") == "Totem" then
		GameTooltip:ClearLines()
		GameTooltip:AddLine(TN, 1,1,1)
		GameTooltip:AddLine(GameTooltipStatusBar:Show())
	end

	--Mage Pet tooltip
	if UnitPlayerControlled("mouseover") and targetClassName == "Water Elemental" then
		GameTooltip:ClearLines()
		GameTooltip:AddLine("Water Elemental", 1,1,1)
		GameTooltip:AddLine(GameTooltipStatusBar:Show())
	end

	-- Player tooltips
    if UnitIsPlayer("mouseover") and PlayerName ~= UnitName("mouseover") then 
        GameTooltip:ClearLines()
        GameTooltip:AddLine(UnitClass("mouseover"), 1,1,1)
        if UnitLevel("mouseover") == -1 then
            GameTooltip:AddLine("Level " .. (UnitLevel("player") + 10) .. "+ " .. UnitRace("mouseover") .. " " .. UnitClass("mouseover") .. " (Player)", 1,1,1)
        else
            GameTooltip:AddLine("Level " .. UnitLevel("mouseover") .. " " .. UnitRace("mouseover") .. " " .. UnitClass("mouseover") .. " (Player)", 1,1,1)
        end
        if UnitIsPlayer("mouseover") then
            GameTooltip:AddLine(GameTooltipStatusBar:Show())
        end
        if UnitIsPVP("mouseover") then 
            GameTooltip:AddLine("PvP", 1,1,1)
    	end
	end
end)

--clear tooltip healthbar 
GameTooltip:HookScript("OnTooltipCleared", function()GameTooltip:AddLine(GameTooltipStatusBar:Hide())end)

--Change nameplate name to classname and all pets to Pet
hooksecurefunc("CompactUnitFrame_UpdateName",function(f)
	if f.unit:find("nameplate") then -- pet nameplates
		if f.unit and not UnitIsPlayer(f.unit) and UnitPlayerControlled(f.unit) then
			f.name:SetText("Pet")
			f.name:SetTextColor(1,1,1)
		elseif f.unit:find("nameplate") then
			if f.unit and UnitIsPlayer(f.unit) then -- player nameplates
				f.name:SetText(UnitClass(f.unit))
				f.name:SetTextColor(1,1,1)
			end 
		end
	end
end)

local emotesToHide = {
	" spits on",
	" rude gesture",
	" slaps",
	" makes some strange gestures",
	" laughs",
	" rolls on the floor laughing",
	" checks your pulse",
	" ruffles your hair",
	" questions",
	" calm",
	" pats",
	" pets",
	" flex",
}
	-- ^^^^^^Removes emotes that contains a message in this list^^^^^
ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", function(frame, event, message, sender, ...)
	for i,v in ipairs(emotesToHide) do 
		if message:find(v) then
			return true
		end
	end
end)
