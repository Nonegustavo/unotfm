onEvent("TextAreaCallback", function(id, p, callback, ever)
	-- controle de cliques em menus e janelas do jogo
	if not PLAYER[p] or p:sub(1,1) == "*" then
		return true
	end
	PLAYER[p].antiDoubleClick2 = PLAYER[p].antiDoubleClick2 or (os.time() - 5)
	if PLAYER[p].antiDoubleClick2 < os.time() or ever then
		PLAYER[p].antiDoubleClick2 = os.time() + 200
	else
		return false
	end
	local arg = split(callback, " ")
	if arg[1] == "menu" then
		if window.isOpened(p, "MENU") then
			window.close(p, "MENU")
		else
			closeAll(p, "MENU")
			window.open(p, "MENU")
		end
		window.close(p, "TROPHY")
	elseif arg[1] == "openinventory" then
		if window.isOpened(p, "INVENTORY") then
			window.close(p, "INVENTORY")
			window.close(p, "INFO_INVENTORY")
		else
			closeAll(p, "INVENTORY")
			window.open(p, "INVENTORY")
		end
	elseif arg[1] == "inventory" then
		if window.isOpened(p, "INVENTORY") then
			window.update(p, "INVENTORY", arg[2], arg[3] and tonumber(arg[3]))
		else
			closeAll(p, "INVENTORY")
			window.open(p, "INVENTORY", arg[2], arg[3] and tonumber(arg[3]))
		end
	elseif arg[1] == "rules" then
		closeAll(p, "RULES")
		if window.isOpened(p, "RULES") then
			window.update(p, "RULES", tonumber(arg[2]))
		else
			window.open(p, "RULES", 1)
		end
	elseif arg[1] == "settings2" then
		closeAll(p, "SETTINGS2")
		if window.isOpened(p, "SETTINGS2") then
			window.update(p, "SETTINGS2", tonumber(arg[2]))
		else
			window.open(p, "SETTINGS2", 1)
		end
	elseif arg[1] == "credits" then
		closeAll(p, "CREDITS")
		if window.isOpened(p, "CREDITS") then
			window.update(p, "CREDITS")
		else
			window.open(p, "CREDITS")
		end
	elseif arg[1] == "trophy" then
		if window.isOpened(p, "TROPHY") then
			window.update(p, "TROPHY", tonumber(arg[2]))
		else
			window.open(p, "TROPHY", 1)
		end
	elseif arg[1] == "roomoptions" then
		closeAll(p, "SETTINGS3")
		if window.isOpened(p, "SETTINGS3") then
			window.update(p, "SETTINGS3", tonumber(arg[2]))
		else
			window.open(p, "SETTINGS3", 1)
		end
	elseif arg[1] == "profile" then
		closeAll(p, "PROFILE")
		eventChatCommand(p, callback)
	elseif arg[1] == "close" then
		if arg[2] == "rules" then
			window.close(p, "RULES")
		elseif arg[2] == "chairs" then
			window.close(p, "CHAIRS")
			window.close(p, "INFOCHAIR")
		elseif arg[2] == "infochair" then
			window.close(p, "INFOCHAIR")
			window.open(p, "CHAIRS", tonumber(arg[3]))
		elseif arg[2] == "chess" then
			window.close(p, "CHESS")
		elseif arg[2] == "tip" then
			window.close(p, "TIP")
		elseif arg[2] == "house" then
			window.close(p, "HOUSE")
		elseif arg[2] == "settings" then
			window.close(p, "SETTINGS")
		elseif arg[2] == "profile" then
			window.close(p, "PROFILE")
			window.close(p, "TROPHY")
		elseif arg[2] == "leaderboard" then
			window.close(p, "LEADERBOARD")
		elseif arg[2] == "options" then
			window.close(p, "OPTIONS")
		elseif arg[2] == "custom" then
			window.close(p, "CUSTOM")
		elseif arg[2] == "settings2" then
			window.close(p, "SETTINGS2")
		elseif arg[2] == "chairs2" then
			window.close(p, "CHAIRS2")
		elseif arg[2] == "card" then
			window.close(p, "CARD")
			PLAYER[p].ctrl = false
		elseif arg[2] == "command" then
			window.close(p, "COMMAND")
		elseif arg[2] == "credits" then
			window.close(p, "CREDITS")
		elseif arg[2] == "challenge" then
			window.close(p, "CHALLENGE")
		elseif arg[2] == "inventory" then
			window.close(p, "INVENTORY")
			window.close(p, "INFO_INVENTORY")
		end
	elseif arg[1] == "tab" and arg[2] then
		local vars = window.getVars(p, "INVENTORY")
		if vars then
			vars.tab = arg[2]
			window.update(p, "INVENTORY")
		end
	elseif arg[1] == "favorites" then
		local vars = window.getVars(p, "INVENTORY")
		if vars then
			vars.fav = not vars.fav
			window.update(p, "INVENTORY")
		end
	elseif arg[1] == "equip" and arg[2] and arg[3] then
		if arg[2] == "chairs" and PLAYER[p].skin[arg[3]] then
			PLAYER[p].skinEquiped = arg[3]
			window.update(p, "INVENTORY")
			eventTextAreaCallback(id, p, "info".." "..arg[2].." "..arg[3], true)
			saveData(p)
		elseif arg[2] == "panels" and PLAYER[p].flags[arg[3]] then
			PLAYER[p].flagEquipped = arg[3]
			window.update(p, "INVENTORY")
			eventTextAreaCallback(id, p, "info".." "..arg[2].." "..arg[3], true)
			saveData(p)
		end
	elseif arg[1] == "info" and arg[2] and arg[3] then
		if window.isOpened(p, "INFO_INVENTORY") then
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
		else
			window.open(p, "INFO_INVENTORY", arg[2], arg[3])
		end
	elseif arg[1] == "addfavorite" and arg[2] and arg[3] then
		if arg[2] == "chairs" and PLAYER[p].skin[arg[3]] then
			PLAYER[p].skin[arg[3]] = PLAYER[p].skin[arg[3]] == 2 and 1 or 2
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
			window.update(p, "INVENTORY")
			saveData(p)
		elseif arg[2] == "panels" and PLAYER[p].flags[arg[3]] then
			PLAYER[p].flags[arg[3]] = PLAYER[p].flags[arg[3]] == 2 and 1 or 2
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
			window.update(p, "INVENTORY")
			saveData(p)
		end
	elseif arg[1] == "rule" then
		if window.isOpened(p, "TIP") then
			window.update(p, "TIP", arg[2])
		else
			window.open(p, "TIP", arg[2])
		end
	elseif arg[1] == "chess" then
		closeAll(p, "CHESS")
		window.open(p, "CHESS")
	elseif arg[1] == "house" then
		closeAll(p, "HOUSE")
		window.open(p, "HOUSE")
	elseif arg[1] == "settings" then
		closeAll(p, "SETTINGS2")
		window.open(p, "SETTINGS2")
	elseif arg[1] == "profile" then
		closeAll(p, "PROFILE")
		window.open(p, "PROFILE")
	elseif arg[1] == "options" then
		closeAll(p, "OPTIONS")
		window.open(p, "OPTIONS")
	elseif arg[1] == "equipt" then
		PLAYER[p].trophyEquiped = arg[2]
		saveData(p)
		window.close(p, "TROPHY")
		window.update(p, "PROFILE", p)
	elseif arg[1] == "setrule" then
		eventChatCommand(p, "rule "..arg[2].." "..arg[3])
	elseif arg[1] == "clearrules" then
		eventChatCommand(p, "clearrules")
	elseif arg[1] == "fixedrules" then
		eventChatCommand(p, "random")
	elseif arg[1] == "fixedchair" then
		eventChatCommand(p, "fixedchair")
	elseif arg[1] == "newplayers" then
		eventChatCommand(p, "newplayers")
	elseif arg[1] == "scoreby" then
		eventChatCommand(p, "scoreby")
	elseif arg[1] == "resetscore" then
		eventChatCommand(p, "resetscore")
	elseif arg[1] == "autostart" then
		eventChatCommand(p, "autostart")
	elseif arg[1] == "commands" then
		eventChatCommand(p, "commands")
	elseif arg[1] == "colorblind" then
		eventChatCommand(p, "color")
		window.update(p, "OPTIONS")
	elseif arg[1] == "bell" then
		eventChatCommand(p, "bell")
		window.update(p, "OPTIONS")
	elseif arg[1] == "shadow" then
		eventChatCommand(p, "shadow")
		window.update(p, "OPTIONS")
	elseif arg[1] == "challengepopup" then
		eventChatCommand(p, "challengepopup")
		window.update(p, "OPTIONS")
	elseif arg[1] == "community" then
		eventChatCommand(p, "community")
		window.update(p, "OPTIONS")
	elseif arg[1] == "party" then
		tfm.exec.chatMessage(string.format("<vp>/room #unotfm0<b>%s</b>", p), p)
		tfm.exec.chatMessage(string.format("<vp>/room #unotfm0<b>%s</b>#music", p), p)
	elseif arg[1] == "copy" then
		customEditCopies(arg[2])
		window.update(p, "CUSTOM")
	elseif arg[1] == "desc" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		ui.addPopup(10, 2, translate(p, "CUSTOM_DESC_INFO"), p, 200, 200, 400, true)
	elseif arg[1] == "remove" then
		customRemoveAction(p, tonumber(arg[2]))
		window.update(p, "CUSTOM")
	elseif arg[1] == "edit" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		if arg[3] == "amount" then
			local txt = "2 => "..string.format(translate(p, "AMOUNT_X"), 2)
			txt = txt .. "\n1-5 => "..string.format(translate(p, "AMOUNT_RANGE"), 1, 5)
			txt = txt .. "\n#3 => "..string.format(translate(p, "AMOUNT_UNTIL"), 3)
			txt = txt .. "\n&1 => "..string.format(translate(p, "AMOUNT_RETURN"), 1)
			ui.addPopup(tonumber(arg[2]), 2, txt, p, 300, 180, 200, true)
		else
			local txt = printOptions(p, tonumber(arg[2]), arg[3])
			ui.addTextArea(99998, txt, p, 300, 140, 200, nil, 0x324650, 0x090D0F, 1, true)
		end
	elseif arg[1] == "addrule" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		local txt = printAdd(p)
		ui.addTextArea(99998, txt, p, 300, 140, 200, nil, 0x324650, 0x090D0F, 1, true)
	elseif arg[1] == "exit" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
	elseif arg[1] == "add" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
		customAddAction(p, arg[2])
		window.update(p, "CUSTOM")
	elseif arg[1] == "edit2" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
		customEditAction(p, tonumber(arg[2]), arg[3], arg[4])
		window.update(p, "CUSTOM")
	elseif arg[1] == "custom" then
		closeAll(p, "CUSTOM")
		window.open(p, "CUSTOM")
	elseif arg[1] == "play" then
		addEntry(p)
	elseif arg[1] == "curse" then
		showCurse(p)
	elseif arg[1] == "tip" then
		if PLAYER[p].chair and ROUND.state == "PLAY" then
			ui.removeTextArea(33, p)
			ui.removeTextArea(32, p)
		else
			giveTip(p)
		end
	elseif arg[1] == "challenge" then
		window.close(p, "CHALLENGE")
		local chair = PLAYER[p].chair
		if chair and ROUND.turn == chair and ROUND.accumulated and ROUND.topCard.card[2] == "draw4" then
			challengeDrawFour(chair)
		end
	elseif arg[1] == "support" then
		tfm.exec.chatMessage("<vp>https://a801-luadev.github.io/?redirect=unotfm", p)
	end
end)