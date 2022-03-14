onEvent("ChatCommand", function(p, cmd)
	if not PLAYER[p] then
		return false
	end
	local arg = split(cmd, " ")
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	end
	if p == "Ninguem#0095" then
		if arg[1] == "givechair" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if SKIN[arg[2]] and PLAYER[name] then
				unlockChair(name, arg[2], true)
			end
		elseif arg[1] == "givebadge" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if TROPHY[arg[2]] and PLAYER[name] then
				unlockTrophy(name, arg[2])
			end
		elseif arg[1] == "giverule" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if RULE[arg[2]] and PLAYER[name] then
				unlockRule(name, arg[2])
			end
		elseif arg[1] == "givescore" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if tonumber(arg[2]) and PLAYER[name] then
				tfm.exec.setPlayerScore(name, tonumber(arg[2]))
			end
		elseif arg[1] == "givetitle" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if PLAYER[name] then
				system.giveEventGift(name, arg[2])
			end
		elseif arg[1] == "boss" and ROUND.state == "PLAY" and PLAYER[p].chair then
			ROUND.chair[PLAYER[p].chair].boss = true
		elseif arg[1] == "fake" and arg[2] and arg[3] then
			quoteFake(arg[2], table.concat(arg, " ", 3))
		elseif arg[1] == "test" and arg[2] then
			SKIN.test.img = arg[2]
			PLAYER[p].skinEquiped = "test"
		elseif arg[1] == "custom" then
			window.open(p, "CUSTOM")
		elseif arg[1] == "power" and ROUND.state == "PLAY" and PLAYER[p].chair and ROUND.turn == PLAYER[p].chair then
			power(ROUND.turn)
		elseif arg[1] == "rulenow" and arg[2] and RULE[arg[2]] then
			addRule(arg[2])
		elseif arg[1] == "flag" and arg[2] and FLAG[arg[2]] then
			PLAYER[p].flagEquipped = arg[2]
		elseif arg[1] == "panels" then
			window.open(p, "PANELS")
		elseif arg[1] == "light" and arg[2] and LIGHT[arg[2]] then
			PLAYER[p].lightEquiped = arg[2]
		end
	end
	if p == OWNER and not CONFIG.tribeHouse then
		if arg[1] == "adm" and arg[2] then
			local name = whichNick(arg[2]) or arg[2]
			if name == OWNER then
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_OWNER"), name), p)
			elseif isAdm(name) then
				ADM[name] = nil
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM_REMOVE"), name), p)
				colorNick(name)
			elseif tfm.get.room.playerList[name] then
				ADM[name] = true
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM"), name), p)
				if BANNED[name] then
					BANNED[name] = false
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_UNBANED"), name), p)
				end
				colorNick(name)
			end
		elseif arg[1] == "limit" and arg[2] and tonumber(arg[2]) then
			tfm.exec.setRoomMaxPlayers(tonumber(arg[2]))
			tfm.exec.chatMessage("<bv>Limit: "..arg[2], p)
		elseif arg[1] == "spectator" and ROUND and not ROUND.spectator and not PLAYER[p].chair then
			ROUND.spectator = true
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			for i, v in pairs(ROUND.imgRule or {}) do
				tfm.exec.removeImage(v)
			end
			for i, v in pairs(tfm.get.room.playerList) do
				showRules(i)
			end
		end
	end
	if p == OWNER or isAdm(p) or CONFIG.tribeHouse then
		if not CONFIG.tribeHouse then
			if arg[1] == "kick" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if tfm.get.room.playerList[name] and PLAYER[name].chair then
					kickPlayer(name)
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_KICK"), name), p)
				end
			elseif arg[1] == "ban" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if name == OWNER then
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_OWNER"), name), p)
				elseif tfm.get.room.playerList[name] and not BANNED[name] then
					BANNED[name] = true
					kickPlayer(name)
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_BAN"), name), p)
					if isAdm(name) then
						ADM[name] = nil
						tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM_REMOVE"), name), p)
					end
					colorNick(name)
				end
			elseif arg[1] == "unban" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if BANNED[name] then
					BANNED[name] = nil
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_UNBANED"), name), p)
					colorNick(name)
				end
			elseif arg[1] == "pw" then
				if arg[2] then
					tfm.exec.setRoomPassword(table.concat(arg, " ", 2))
					tfm.exec.chatMessage(translate(p, "PASSWORD").." : "..table.concat(arg, " ", 2), p)
				else
					tfm.exec.setRoomPassword("")
					tfm.exec.chatMessage(translate(p, "PASSWORD_REMOVED"), p)
				end
			elseif arg[1] == "clearrules" then
				for i, v in pairs(RULE) do
					CONFIG.rule[i] = false
				end
				for i, v in pairs(tfm.get.room.playerList) do
					window.update(i, "SETTINGS2")
				end
			end
		end
		if arg[1] == "np" or arg[1] == "map" or arg[1] == "new" then
			if arg[1] == "new" and CONFIG.again then
				tfm.exec.newGame(tfm.get.room.currentMap)
			elseif arg[2] then
				CONFIG.again = true
				tfm.exec.newGame(arg[2])
			else
				CONFIG.again = nil
				newMap()
			end
		elseif arg[1] == "start" and ROUND and ROUND.state == "START" then
			local cont = 0
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" or v.mode == "FREE" then
					cont = cont + 1
				end
			end
			if cont > 1 then
				startGame()
			end
		elseif arg[1] == "random" then
			CONFIG.random = not CONFIG.random
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS2", "all")
			end
		elseif arg[1] == "fixedchair" then
			CONFIG.fixedChair = not CONFIG.fixedChair
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "newplayers" then
			CONFIG.newPlayers = not CONFIG.newPlayers
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "autostart" then
			CONFIG.autoStart = not CONFIG.autoStart
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
			if not CONFIG.autoStart then
				ui.addPopup(0, 0, "<p align='center'>"..translate(p, "WARN_AUTOSTART"), p, 250, 70, 300, true)
			end
		elseif arg[1] == "scoreby" then
			local change = {SCORE_1="SCORE_2", SCORE_2="SCORE_3", SCORE_3="SCORE_1"}
			CONFIG.scoreBy = change[CONFIG.scoreBy]
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "reset" then
			for i, v in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(i, 0, false)
			end
			for i, v in pairs(SCORE) do
				SCORE[i] = 0
			end
		elseif arg[1] == "rule" and arg[2] then
			if RULE[arg[2]] and (PLAYER[p].rules[arg[2]] or p == "Ninguem#0095") then
				CONFIG.rule[arg[2]] = not CONFIG.rule[arg[2]]
				if CONFIG.rule[arg[2]] then
					for i, v in pairs(RULE[arg[2]].conflict or {}) do
						CONFIG.rule[v] = nil
					end
				end
			end
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS2", arg[3])
			end
		elseif arg[1] == "chair" and arg[2] and tonumber(arg[2]) and arg[3] then
			local n = tonumber(arg[2])
			local name = nickFormat(arg[3])
			if tfm.get.room.playerList[name] and PLAYER[name] and not BANNED[name] and not PLAYER[name].chair and not yetPlaying(name) and ROUND.chair[n] and (ROUND.chair[n].mode == "EMPTY" or ROUND.chair[n].mode == "FREE") then
				playerSit(name, ROUND.chair[n], n)
			end
		end
	end
	if arg[1] == "commands" then
		closeAll(p, "COMMAND")
		window.open(p, "COMMAND")
	elseif arg[1] == "p" or arg[1] == "profile" or arg[1] == "stats" then
		if arg[2] then
			local nick = nickFormat(arg[2])
			if PLAYER[nick] then
				if BOT[nick] and #nick >= 3 then
					if window.isOpened(p, "TIP") then
						window.update(p, "TIP", nick:lower())
					else
						window.open(p, "TIP", nick:lower())
					end
				else
					window.open(p, "PROFILE", nick)
				end
			end
		else
			window.open(p, "PROFILE", p)
		end
	elseif arg[1] == "color" then
		if PLAYER[p] then
			PLAYER[p].colorBlind = not PLAYER[p].colorBlind
			saveData(p)
		end
	elseif arg[1] == "bell" then
		if PLAYER[p] then
			PLAYER[p].bell = not PLAYER[p].bell
			saveData(p)
		end
	elseif arg[1] == "shadow" then
		if PLAYER[p] then
			PLAYER[p].shadow = not PLAYER[p].shadow
			saveData(p)
		end
	elseif arg[1] == "challengepopup" then
		if PLAYER[p] then
			PLAYER[p].challengePopup = not PLAYER[p].challengePopup
			saveData(p)
		end
	elseif arg[1] == "community" then
		if PLAYER[p] then
			local conv = {auto="ar",ar="bg",bg="br",br="cn",cn="cz",cz="de",de="e2",e2="ee",ee="en",en="es",es="fi",fi="fr",fr="he",he="hr",hr="hu",hu="id",id="it",it="jp",jp="lt",lt="lv",lv="nl",nl="ph",ph="pl",pl="pt",pt="ro",ro="ru",ru="tr",tr="vk",vk="auto"}
			PLAYER[p].community = conv[PLAYER[p].community]
			ui.addTextArea(4001, string.format("<b><a href='event:menu'>%s</a>", translate(p, "MENU")), p, 5, 380, nil, 20, 0x324650, nil, 1, true)
			saveData(p)
		end
	elseif arg[1] == "set2" then
		window.open(p, "SETTINGS2")
	elseif arg[1] == "isranked" then
		tfm.exec.chatMessage("ranked = "..((CONFIG.ranked or RANKED) and "true" or "false"), p)
	elseif arg[1] == "faustao" then
		if not PLAYER[p].faustao then
			tfm.exec.chatMessage("<v>[Faustão] <n>ERROU!", p)
			PLAYER[p].faustao = true
		end
	elseif arg[1] == "challenge" then
		--window.open(p, "CHALLENGE", {"red", "n2"})
	elseif arg[1] == "rules" and arg[2] then
		for i=2, #arg do
			eventChatCommand(p, "rule " .. arg[i])
		end
	elseif arg[1] == "chairs3" then
		window.open(p, "INVENTORY")
	end
end)