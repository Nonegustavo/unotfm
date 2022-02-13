function scoreHand(n)
	local sum = {n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9, skip=20, reverse=20, draw2=20, wild=50, draw4=50, peace=20, death=20, carousel=20, trade=20, gift=20, random=20, spy=20, tornado=20, chair=20, imitate=20, silence=20, equal=20}
	local score = 0
	for i, v in pairs(ROUND.chair[n].hand) do
		score = score + (sum[v[2]] or 20)
	end
	return score
end

function endGame(p, card, winners, mode)
	if ROUND.state == "FINISH" then
		return false
	end
	winningEffect()
	ROUND.state = "FINISH"
	ROUND.time = GLOBAL_TIME + 10000
	local score = 0
	local qtdPlayers = 0
	for i, v in pairs(ROUND.chair) do
		if v.owner and v.owner ~= "" then
			qtdPlayers = qtdPlayers + 1
		end
	end
	for i=10001, 10005 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(10)
	ui.removeTextArea(11)
	ui.removeTextArea(12)
	ui.removeTextArea(27)
	ui.removeTextArea(32)
	ui.removeTextArea(33)
	if p and ROUND.chair[PLAYER[p].chair].mode == "BUSY" then
		local pp = false
		local ccont = 0
		local qtdBots = 0
		if ROUND.chair[PLAYER[p].chair].team then
			for i, v in pairs(ROUND.team[ROUND.chair[PLAYER[p].chair].team]) do
				ccont = ccont + 1
				if PLAYER[p].chair ~= i and ROUND.chair[i].owner ~= "" and PLAYER[ROUND.chair[i].owner] and PLAYER[ROUND.chair[i].owner].chair then
					pp = ROUND.chair[i].owner
					break
				end
				if ccont >= 2 then
				--  break
				end
			end
		end
		if BOT[p] and BOT[p].eventWin then
			BOT[p].eventWin()
		end
		if pp and BOT[pp] and BOT[pp].eventWin then
			BOT[pp].eventWin()
		end
		ROUND.turn = nextChair(ROUND.turn)
		-- rules
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		if pp then
			for i, v in pairs(PLAYER) do
				ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", string.format(translate(i, "TEAM_WON"), nickHashtag(p), nickHashtag(pp))), i, 0, 160, 800, 400, 1, 1, 0.7, false)
				tfm.exec.chatMessage("<j>"..string.format(translate(i, "TEAM_WON"), nickHashtag(p), nickHashtag(pp)), i)
				if not v.chair then
					v.chairDelay = 0
				end
			end
		else
			for i, v in pairs(PLAYER) do
				ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", string.format(translate(i, "PLAYER_WON"), nickHashtag(p))), i, 0, 160, 800, 400, 1, 1, 0.7, false)
				tfm.exec.chatMessage("<j>"..string.format(translate(i, "PLAYER_WON"), nickHashtag(p)), i)
				if not v.chair then
					v.chairDelay = 0
				end
			end
		end
		for i, v in pairs(ROUND.chair) do
			updateHand(i)
			if BOT[v.owner] then
				CONFIG.chair[i] = nil
				if BOT[v.owner].eventLose then
					BOT[v.owner].eventLose(p)
				end
				qtdBots = qtdBots + 1
			elseif v.owner ~= "" then
				if (v.mode == "BUSY" or v.score) and v.owner ~= p and v.owner ~= pp then
					local tempScore = scoreHand(i)
					score = score + tempScore
					if not BOT[p] then
						SCORE[p] = SCORE[p] and (SCORE[p] + tempScore) or tempScore
					end
					if CONFIG.scoreBy == "SCORE_2" then
						tfm.exec.setPlayerScore(v.owner, tempScore, true)
					else
						ui.addTextArea(3010+i, "<p align='center'><font size='30px' color='#000000'><b>"..tempScore, nil, v.x-49, 331, 100, nil, 0, 0, 0, false)
						ui.addTextArea(3000+i, "<p align='center'><font size='30px'><b><j>"..tempScore, nil, v.x-50, 330, 100, nil, 0, 0, 0, false)
					end
				end
				if v.owner and v.owner ~= "" and PLAYER[v.owner] then
					if (CONFIG.ranked and tfm.get.room.uniquePlayers >= 4) or RANKED then
						PLAYER[v.owner].stats.round = PLAYER[v.owner].stats.round + 1
						if PLAYER[v.owner].stats.round >= 1000 then
							unlockChair(v.owner, "stone")
						elseif PLAYER[v.owner].stats.round >= 100 then
							unlockChair(v.owner, "wood")
						end
						if PLAYER[v.owner].stats.round >= 2500 then
							unlockChair(v.owner, "cat")
						end
						if PLAYER[v.owner].stats.round >= 5000 then
							unlockChair(v.owner, "garden")
						end
						if PLAYER[v.owner].stats.round >= 7500 then
							unlockChair(v.owner, "friend")
						end
						if PLAYER[v.owner].stats.round >= 10000 then
							unlockChair(v.owner, "anvil")
						end
						if not v.playedChair then
							unlockChair(v.owner, "bog")
						end
						if ROUND.chair[nextChair(i)].skin.id == "vampire" or ROUND.chair[previousChair(i)].skin.id == "vampire" then
							unlockChair(v.owner, "vampire")
						end
						local today = math.floor(os.time()/86400000)
						if PLAYER[v.owner].lastDayPlayed and PLAYER[v.owner].lastDayPlayed ~= today then
							if PLAYER[v.owner].lastDayPlayed + 1 == today then
								PLAYER[v.owner].dayStreak = PLAYER[v.owner].dayStreak + 1
							else
								PLAYER[v.owner].dayStreak = 1
							end
							PLAYER[v.owner].lastDayPlayed = today
							if PLAYER[v.owner].dayStreak >= 7 then
								unlockChair(v.owner, "fashion")
							end
							if PLAYER[v.owner].dayStreak >= 15 then
								unlockChair(v.owner, "undertale")
							end
						end
					end
				else
					CONFIG.chair[i] = nil
				end
			end
		end
		if pp then
			score = math.ceil(score/2)
		end
		if CONFIG.scoreBy == "SCORE_1" then
			tfm.exec.setPlayerScore(p, score, true)
			ui.addTextArea(3010+PLAYER[p].chair, "<p align='center'><font size='30px' color='#000000'><b>"..score, nil, ROUND.chair[PLAYER[p].chair].x-49, 51, 100, nil, 0, 0, 0, false)
			ui.addTextArea(3000+PLAYER[p].chair, "<p align='center'><font size='30px'><b><vp>"..score, nil, ROUND.chair[PLAYER[p].chair].x-50, 50, 100, nil, 0, 0, 0, false)
			if pp then
				tfm.exec.setPlayerScore(pp, score, true)
				ui.addTextArea(3010+PLAYER[pp].chair, "<p align='center'><font size='30px' color='#000000'><b>"..score, nil, ROUND.chair[PLAYER[pp].chair].x-49, 51, 100, nil, 0, 0, 0, false)
				ui.addTextArea(3000+PLAYER[pp].chair, "<p align='center'><font size='30px'><b><vp>"..score, nil, ROUND.chair[PLAYER[pp].chair].x-50, 50, 100, nil, 0, 0, 0, false)
			end
		elseif CONFIG.scoreBy == "SCORE_3" then
			tfm.exec.setPlayerScore(p, 1, true)
			if pp then
				tfm.exec.setPlayerScore(pp, 1, true)
			end
		end
		PLAYER[p].chairDelay = 0
		if pp then
			PLAYER[pp].chairDelay = 0
		end
		ROUND.winner = p
		local contRules = 0
		for i, v in pairs(ROUND.gameMode) do
			unlockRule(p, i)
			if pp then
				unlockRule(pp, i)
			end
			contRules = contRules + 1
		end
		if countRules(PLAYER[p].rules) >= CONFIG.qtdRule then
			unlockChair(p, "candy", true)
			unlockRule(p, "custom", true)
			system.giveEventGift(p, TITLE.foul_play)
		end
		if pp then
			if countRules(PLAYER[pp].rules) >= CONFIG.qtdRule then
				unlockChair(pp, "candy", true)
				unlockRule(pp, "custom", true)
			end
		end
		if not BOT[p] and not ROUND.spectator and qtdBots == 9 then
			local canUnlock = true
			for i, v in pairs(ROUND.gameMode) do
				if RULE[i].type ~= "BOSS" and RULE[i].type ~= "EXTRA" then
					canUnlock = false
					break
				end
			end
			if canUnlock then
				unlockFlag(p, "circuit", true)
			end
			unlockChair(p, "max", true)
		end
		if OWNER ~= "Ninguem#0095" and PLAYER[OWNER] and tfm.get.room.uniquePlayers >= qtdPlayers and math.random(100) <= qtdPlayers*5 then
			for i, v in pairs(PLAYER) do
				if v.chair then
					unlockChair(i, "show", true)
				else
					unlockChair(i, "smartphone", true)
				end
			end
		end
		addFunctionTimer(function()
			if (CONFIG.ranked and qtdPlayers >= 4 and tfm.get.room.uniquePlayers >= 4) or RANKED then
				if pp then
					PLAYER[p].stats.victory.team = PLAYER[p].stats.victory.team + 1
					PLAYER[pp].stats.victory.team = PLAYER[pp].stats.victory.team + 1
					if PLAYER[p].stats.victory.team >= 100 then
						unlockChair(p, "breakfast")
					end
					if PLAYER[pp].stats.victory.team >= 100 then
						unlockChair(pp, "breakfast")
					end
					if PLAYER[p].stats.victory.team >= 250 then
						unlockChair(p, "hamburguer")
					end
					if PLAYER[pp].stats.victory.team >= 250 then
						unlockChair(pp, "hamburguer")
					end
					if PLAYER[p].stats.victory.team >= 487.5 then
						unlockChair(p, "croissant")
					end
					if PLAYER[pp].stats.victory.team >= 487.5 then
						unlockChair(pp, "croissant")
					end
					if PLAYER[p].stats.victory.team >= 600 then
						unlockChair(p, "toast")
					end
					if PLAYER[pp].stats.victory.team >= 600 then
						unlockChair(pp, "toast")
					end
					if PLAYER[p].stats.victory.team >= 1000 then
						unlockChair(p, "pizza")
					end
					if PLAYER[pp].stats.victory.team >= 1000 then
						unlockChair(pp, "pizza")
					end
					
					if PLAYER[p].stats.victory.team >= 10 then
						unlockRule(p, "team", true)
					end
					if PLAYER[pp].stats.victory.team >= 10 then
						unlockRule(pp, "team", true)
					end
					if p == "Elise" then
						unlockChair(pp, "marine")
					end
					if pp and not BOT[p] and not BOT[pp] then
						if tfm.get.room.playerList[p].spouseId == tfm.get.room.playerList[pp].id then
							unlockChair(p, "cisne")
							unlockChair(pp, "cisne")
						end
					end
					if card then
						for i, v in pairs(ROUND.chair[PLAYER[pp].chair].hand) do
							if card[1] == v[1] and card[2] == v[2] then
								unlockChair(p, "eclipse")
								break
							end
						end
					end
				elseif not BOT[p] then
					PLAYER[p].stats.victory.all = PLAYER[p].stats.victory.all + 1
					if PLAYER[p].stats.victory.all >= 1000 then
						unlockChair(p, "diamond")
					elseif PLAYER[p].stats.victory.all >= 100 then
						unlockChair(p, "gold")
					end
					if PLAYER[p].stats.victory.all >= 2000 then
						unlockChair(p, "unicorn")
					end
					if PLAYER[p].stats.victory.all >= 3000 then
						unlockChair(p, "cheese")
						system.giveEventGift(p, TITLE.uno)
					end
				end
				if card then
					if ROUND.portal.side == "orange" then
						if card[1] == "red" then
							PLAYER[p].stats.victory.red = PLAYER[p].stats.victory.red + 1
							if PLAYER[p].stats.victory.red >= 100 then
								unlockChair(p, "fire")
							end
							if PLAYER[p].stats.victory.red >= 300 then
								unlockFlag(p, "picnic")
							end
							unlockChair(p, "red")
						elseif card[1] == "blue" then
							PLAYER[p].stats.victory.blue = PLAYER[p].stats.victory.blue + 1
							if PLAYER[p].stats.victory.blue >= 100 then
								unlockChair(p, "water")
							end
							if PLAYER[p].stats.victory.blue >= 300 then
								unlockFlag(p, "metal")
							end
							unlockChair(p, "blue")
						elseif card[1] == "yellow" then
							PLAYER[p].stats.victory.yellow = PLAYER[p].stats.victory.yellow + 1
							if PLAYER[p].stats.victory.yellow >= 100 then
								unlockChair(p, "earth")
							end
							if PLAYER[p].stats.victory.yellow >= 300 then
								unlockFlag(p, "paper")
							end
							unlockChair(p, "yellow")
						elseif card[1] == "green" then
							PLAYER[p].stats.victory.green = PLAYER[p].stats.victory.green + 1
							if PLAYER[p].stats.victory.green >= 100 then
								unlockChair(p, "air")
							end
							if PLAYER[p].stats.victory.green >= 300 then
								unlockFlag(p, "carpet")
							end
							unlockChair(p, "green")
						elseif card[1] == "black" then
							PLAYER[p].stats.victory.wild = PLAYER[p].stats.victory.wild + 1
							if PLAYER[p].stats.victory.wild >= 100 then
								unlockChair(p, "rainbow")
							end
							if PLAYER[p].stats.victory.wild >= 300 then
								unlockFlag(p, "disco")
							end
							unlockChair(p, "white")
						end
					else
						if card[1] == "red" then
							PLAYER[p].stats.victory.cian = PLAYER[p].stats.victory.cian + 1
							if PLAYER[p].stats.victory.cian >= 15 then
								unlockChair(p, "toxic")
							end
							unlockChair(p, "cyan")
						elseif card[1] == "blue" then
							PLAYER[p].stats.victory.orange = PLAYER[p].stats.victory.orange + 1
							if PLAYER[p].stats.victory.orange >= 15 then
								unlockChair(p, "thunder")
							end
							unlockChair(p, "orange")
						elseif card[1] == "yellow" then
							PLAYER[p].stats.victory.purple = PLAYER[p].stats.victory.purple + 1
							if PLAYER[p].stats.victory.purple >= 15 then
								unlockChair(p, "dark")
							end
							unlockChair(p, "purple")
						elseif card[1] == "green" then
							PLAYER[p].stats.victory.pink = PLAYER[p].stats.victory.pink + 1
							if PLAYER[p].stats.victory.pink >= 15 then
								unlockChair(p, "crystal")
							end
							unlockChair(p, "pink")
						elseif card[1] == "black" then
							PLAYER[p].stats.victory.white = PLAYER[p].stats.victory.white + 1
							if PLAYER[p].stats.victory.white >= 15 then
								unlockChair(p, "light")
							end
							unlockChair(p, "black")
						end
					end
					if card[2] == "batata" then
						unlockChair(p, "potato")
					end
					if card[2] == "thunder" then
						unlockChair(p, "pikachu")
					end
					if card[2] == "portal" and card[1] == "green" and ROUND.portal.side == "blue" then
						unlockChair(p, "forest")
					end
					if mode == "JUMPIN" then
						unlockChair(p, "popcorn")
					end
					if ROUND.subitDeath then
						unlockChair(p, "help")
						if card[2] == "tornado" then
							unlockChair(p, "mountain")
						end
					end
				elseif mode then
					if mode == "ELIMINATION" then
						unlockChair(p, "skull")
						if pp then
							unlockChair(pp, "skull")
						end
					elseif mode == "TIME" then
						unlockChair(p, "time")
						if pp then
							unlockChair(pp, "time")
						end
					end
				end
				if os.time() - ROUND.startTime < 60000 then
					unlockChair(p, "chocolate")
					if pp then
						unlockChair(pp, "chocolate")
					end
				end
				-- candy
				if ROUND.chair[PLAYER[p].chair].luck then
					unlockChair(p, "mermaid")
				end
				-- CONFUSO
				if ROUND.chair[PLAYER[p].chair].confuse or isCursed(PLAYER[p].chair, "poison") then
					unlockChair(p, "pineapple")
				end
				if ROUND.accumulated then
					unlockChair(p, "king")
				end
				if ROUND.chair[PLAYER[p].chair].underTime then
					unlockChair(p, "angel")
				end
				if ROUND.chair[PLAYER[p].chair].maxDraw == 0 then
					unlockChair(p, "luck")
				end
				if ROUND.chair[PLAYER[p].chair].maxHand >= 15 then
					unlockChair(p, "junky")
				end
				if ROUND.gameMode.mess then
					if not BOT[p] then
						PLAYER[p].stats.victory.mess = PLAYER[p].stats.victory.mess or 0
						PLAYER[p].stats.victory.mess = PLAYER[p].stats.victory.mess + 1
						if PLAYER[p].stats.victory.mess >= 50 then
							unlockFlag(p, "cloud")
						end
						unlockChair(p, "psycho")
					end
					if pp and PLAYER[pp] then
						PLAYER[pp].stats.victory.mess = PLAYER[pp].stats.victory.mess + 1
						if PLAYER[pp].stats.victory.mess >= 50 then
							unlockFlag(pp, "cloud")
						end
						unlockChair(pp, "psycho")
					end
				end
				if not ROUND.chair[PLAYER[p].chair].saidUno then
					unlockChair(p, "bootcamp")
				end
				if moonPhase() == 5 then
					unlockChair(p, "moon")
				end
				if contRules == 0 then
					unlockChair(p, "old")
				elseif contRules >= 5 then
					unlockChair(p, "flamingo")
				end
				if ROUND.gameMode.portal or ROUND.gameMode.mess then
					if ROUND.portal.side == "orange" then
						PLAYER[p].portal1 = 1
						PLAYER[p].stats.victory.lightWin = PLAYER[p].stats.victory.lightWin + 1
						if PLAYER[p].stats.victory.lightWin >= 10 then
							unlockChair(p, "lightfury")
						end
						if pp and not BOT[pp] then
							PLAYER[pp].portal1 = 1
							PLAYER[pp].stats.victory.lightWin = PLAYER[pp].stats.victory.lightWin + 1
							if PLAYER[pp].stats.victory.lightWin >= 10 then
								unlockChair(pp, "lightfury")
							end
						end
					elseif ROUND.portal.side == "blue" then
						PLAYER[p].portal2 = 1
						PLAYER[p].stats.victory.darkWin = PLAYER[p].stats.victory.darkWin + 1
						if PLAYER[p].stats.victory.darkWin >= 10 then
							unlockChair(p, "toothless")
						end
						if pp and not BOT[pp] then
							PLAYER[pp].portal2 = 1
							PLAYER[pp].stats.victory.darkWin = PLAYER[pp].stats.victory.darkWin + 1
							if PLAYER[pp].stats.victory.darkWin >= 10 then
								unlockChair(pp, "toothless")
							end
						end
					end
					if (PLAYER[p].portal1 + PLAYER[p].portal2) == 2 then
						unlockChair(p, "wonderland")
					end
					if pp and (PLAYER[pp].portal1 + PLAYER[pp].portal2) == 2 then
						unlockChair(pp, "wonderland")
					end
				end
				if not BOT[p] then
					if not RANKED and tfm.get.room.playerList[p].score+score >= 3000 then
						unlockChair(p, "shaman")
					end
					if RANKED then
						PLAYER[p].stats.ranking.scoreWeek = PLAYER[p].stats.ranking.scoreWeek + score
					end
				end
				if pp then
					if not BOT[pp] then
						if not RANKED and tfm.get.room.playerList[pp].score+score >= 3000 then
							unlockChair(pp, "shaman")
						end
						if RANKED then
							PLAYER[pp].stats.ranking.scoreWeek = PLAYER[pp].stats.ranking.scoreWeek + score
						end
					end
				end
				if not BOT[p] and useFraise(p) then
					unlockChair(p, "fraise")
				end
				if not BOT[p] and useFish(p) then
					unlockChair(p, "aquarium")
				end
				if not BOT[p] and useTree(p) then
					unlockChair(p, "chimney")
				end
				if not BOT[p] and isNaked(p) then
					unlockChair(p, "simpsons")
				end
				addFunctionTimer(function()
					for i, v in pairs(PLAYER) do
						if not BOT[i] and tfm.get.room.playerList[i] and i:sub(1,1) ~= "*" then
							if not v.chair then
								v.stats.spectator = v.stats.spectator + 1
								if v.stats.spectator >= 1000 then
									unlockChair(i, "cine")
								elseif v.stats.spectator >= 100 then
									unlockChair(i, "beach")
								end
								if v.stats.spectator >= 2500 then
									unlockChair(i, "newspaper")
								end
								if v.stats.spectator >= 5000 then
									unlockChair(i, "radio")
								end
								if v.stats.spectator >= 7500 then
									unlockChair(i, "television")
								end
								if v.stats.spectator >= 10000 then
									unlockChair(i, "computer")
								end
							end
							
						end
						saveData(i)
					end
				end, 500)
			end
		end,500)
	elseif winners then
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		for i, v in pairs(PLAYER) do
			ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", translate(i, "PLAYER_TIED")).."\n<font size='30px'>"..table.concat(winners, ", "), i, 0, 160, 800, 400, 1, 1, 0.7, false)
			tfm.exec.chatMessage("<j>"..translate(i, "PLAYER_TIED").."("..table.concat(winners, ", ")..")", i)
			if not v.chair then
				v.chairDelay = 0
			end
		end
	else
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		for i, v in pairs(PLAYER) do
			ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", translate(i, "PLAYER_LOST")), i, 0, 160, 800, 400, 1, 1, 0.7, false)
			tfm.exec.chatMessage("<j>"..translate(i, "PLAYER_LOST"), i)
			if not v.chair then
				v.chairDelay = 0
			end
		end
		if CONFIG.ranked and qtdPlayers >= 4 and tfm.get.room.uniquePlayers >= 4 then
			for i, v in pairs(PLAYER) do
				if not BOT[i] and tfm.get.room.playerList[i] and i:sub(1,1) ~= "*" then
					if not v.chair and v.notAfk then
						v.stats.spectator = v.stats.spectator + 1
						if v.stats.spectator >= 1000 then
							unlockChair(i, "cine")
						elseif v.stats.spectator >= 100 then
							unlockChair(i, "beach")
						end
					end
					saveData(i)
				end
			end
		end
	end
	--if not ROUND.startTime or os.time() - ROUND.startTime < 180000 then
	--	CONFIG.noRules = true
	--end
end