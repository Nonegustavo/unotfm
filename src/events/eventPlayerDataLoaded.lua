onEvent("PlayerDataLoaded", function(p, data)
	if p:sub(1,1) ~= "*" and PLAYER[p] then
		playerData.unpack(p, data)
		local stats = playerData.load(p, "uno") or newData()
		playerData.save(p, "uno", stats)
		if stats then
			PLAYER[p].stats.spectator = tonumber(stats.spectator)
			PLAYER[p].stats.round = tonumber(stats.round)
			PLAYER[p].stats.victory.all = tonumber(stats.win)
			PLAYER[p].stats.victory.team = stats.team and tonumber(stats.team) or 0
			PLAYER[p].stats.victory.red = tonumber(stats.red)
			PLAYER[p].stats.victory.blue = tonumber(stats.blue)
			PLAYER[p].stats.victory.green = tonumber(stats.green)
			PLAYER[p].stats.victory.yellow = tonumber(stats.yellow)
			PLAYER[p].stats.victory.wild = tonumber(stats.wild)
			PLAYER[p].stats.victory.cian = tonumber(stats.cian or "0")
			PLAYER[p].stats.victory.orange = tonumber(stats.orange or "0")
			PLAYER[p].stats.victory.pink = tonumber(stats.pink or "0")
			PLAYER[p].stats.victory.purple = tonumber(stats.purple or "0")
			PLAYER[p].stats.victory.white = tonumber(stats.white or "0")
			PLAYER[p].stats.victory.mess = tonumber(stats.mess or "0")
			PLAYER[p].stats.victory.lightWin = tonumber(stats.lightWin or "0")
			PLAYER[p].stats.victory.darkWin = tonumber(stats.darkWin or "0")
			PLAYER[p].skin = unpackChair(stats.skin)
			PLAYER[p].rules = unpackRules(stats.rules)
			PLAYER[p].trophy = unpackTrophy(stats.trophy)
			PLAYER[p].flags = unpackFlag(stats.flags or "1")
			PLAYER[p].skinEquiped = stats.skinEquiped
			PLAYER[p].trophyEquiped = stats.trophyEquiped
			PLAYER[p].flagEquipped = stats.flagEquipped or "default"
			PLAYER[p].shadow = stats.shadow ~= "0"
			PLAYER[p].challengePopup = stats.challengePopup ~= "0"
			PLAYER[p].colorBlind = stats.colorblind == "1" or false
			PLAYER[p].bell = stats.bell == "1" or false
			PLAYER[p].community = stats.community or "auto"
			--PLAYER[p].match = stats.match or "x"
			PLAYER[p].challenge = stats.challenge and tonumber(stats.challenge) or 0
			PLAYER[p].pencil = stats.pencil and tonumber(stats.pencil) or 0
			PLAYER[p].chess = stats.chess and tonumber(stats.chess) or 0
			PLAYER[p].portal1 = stats.portal1 and tonumber(stats.portal1) or 0
			PLAYER[p].portal2 = stats.portal2 and tonumber(stats.portal2) or 0
			PLAYER[p].block = stats.block and tonumber(stats.block) or 0
			PLAYER[p].action = stats.action and tonumber(stats.action) or 0
			PLAYER[p].dayStreak = stats.dayStreak and tonumber(stats.dayStreak) or 0
			PLAYER[p].lastDayPlayed = stats.lastDayPlayed and tonumber(stats.lastDayPlayed) or 0
			--PLAYER[p].powerup.shiny = stats.shiny and tonumber(stats.shiny) or 0
			--PLAYER[p].powerup.uno = stats.uno and tonumber(stats.uno) or 0
			--PLAYER[p].powerup.bot = stats.bot and tonumber(stats.bot) or 0
			--PLAYER[p].powerup.mallet = stats.mallet and tonumber(stats.mallet) or 0
			--PLAYER[p].powerup.lamp = stats.lamp and tonumber(stats.lamp) or 0
			--PLAYER[p].powerup.rematch = stats.rematch and tonumber(stats.rematch) or 0
		end
		local cont = 0
		for i, v in pairs(PLAYER[p].skin) do
			cont = cont + 1
		end
		if cont >= 120 then
			system.giveEventGift(p, TITLE.king_of_thrones)
		end
		cont = 0
		for i, v in pairs(PLAYER[p].rules) do
			cont = cont + 1
		end
		if cont >= CONFIG.qtdRule then
			system.giveEventGift(p, TITLE.foul_play)
			unlockRule(p, "custom", true)
			unlockChair(p, "candy", true)
		end
		unlockRule(p, "elise", true)
		unlockChair(p, "random", true)
		PLAYER[p].loaded = true
		saveData(p)
	end
end)