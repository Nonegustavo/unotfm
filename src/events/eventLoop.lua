GLOBAL_TIME = 0
onEvent("Loop", function(current, remaining)
	-- controle de tempo e timers
	GLOBAL_TIME = GLOBAL_TIME + 500
	local tt = os.time()
	if validMap() then
		if ROUND.state == "START" then
			if ROUND.time < GLOBAL_TIME and CONFIG.autoStart or allChairs() then
				local cont = 0
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" or v.mode == "FREE" then
						cont = cont + 1
					end
				end
				if cont > 1 then
					startGame()
				else
					ROUND.time = GLOBAL_TIME + 15000
				end
			else
				if CONFIG.autoStart then
					local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
					ui.addTextArea(17, string.format("<p align='center'><font color='#%s' size='30px'>%i", ROUND.color[1], time), nil, 300, 200, 200, nil, 0, 0, 0, false)
				else
					ui.removeTextArea(17)
				end
				for i, v in pairs(PLAYER) do
					if v.chairDelayTimer and v.chairDelayTimer.time < GLOBAL_TIME then
						if v.chairDelayTimer.img then
							tfm.exec.removeImage(v.chairDelayTimer.img)
						end
						v.chairDelayTimer = nil
						v.spaceDelay = 0
					end
				end
			end
		elseif ROUND.state == "MULLIGAN" then
			if ROUND.time < GLOBAL_TIME then
				roundBegin()
			else
				local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
				ui.addTextArea(17, string.format("<p align='center'><font color='#%s' size='30px'>%i", ROUND.color[1], time), nil, 300, 200, 200, nil, 0, 0, 0, false)
			end
		elseif ROUND.state == "PLAY" then
			if remaining < 0 then
				local name = ""
				local score = math.huge
				local cards = math.huge
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						local hand = scoreHand(i)
						if hand == score then
							if #v.hand == cards and math.random()>0.5 then
								name = v.owner
								score = hand
								cards = #v.hand
							elseif #v.hand < cards then
								name = v.owner
								score = hand
								cards = #v.hand
							end
						elseif hand < score then
							name = v.owner
							score = hand
							cards = #v.hand
						end
					end
				end
				endGame(name, nil, nil, "TIME")
			else
				
				updateTurnTimer()
				if remaining < 60000  then
					blinkAllert()
					if not ROUND.chatWarning then
						for i, v in pairs(tfm.get.room.playerList) do
							tfm.exec.chatMessage("<rose>"..translate(i, "TIME_REMAINING"), i)
						end
						ROUND.chatWarning = true
						addRule("flash")
					end
				elseif ROUND.limbo and ROUND.limbo-GLOBAL_TIME < 5000 then
					blinkAllert()
				end
				if ROUND.chair[ROUND.turn].confuse or isCursed(ROUND.turn, "poison") then
					BOT.A.autoPlay()
				elseif BOT[ROUND.chair[ROUND.turn].owner] then
					BOT[ROUND.chair[ROUND.turn].owner].autoPlay()
				elseif ROUND.time < GLOBAL_TIME then
					autoPlay()
				end
				if ROUND.turn and (ROUND.chair[ROUND.turn].peace or ROUND.chair[ROUND.turn].peace2) then
					for i=1, 3 do
						tfm.exec.displayParticle(32, math.random(430,470), math.random(210,230), 0, -math.random(), 0, 0)
						tfm.exec.displayParticle(31, math.random(430,470), math.random(210,230), 0, -math.random(), 0, 0)
					end
				end
				confusionEffect()
				for i, v in pairs(ROUND.chair) do
					if i ~= ROUND.turn and v.mode == "BUSY" and BOT[v.owner] and BOT[v.owner].eventLoop then
						BOT[v.owner].eventLoop(i)
					end
					if v.mode == "BUSY" and tfm.get.room.playerList[v.owner] then
						local x = tfm.get.room.playerList[v.owner].x
						if x < v.x-30 or x > v.x+30 then
							if not v.outChair then
								v.outChair = tfm.exec.addImage(IMG.misc.handLayer, "!2000", 0, 320, v.owner)
								local txt = string.format("<p align='center'><font size='30px'>%s", translate(v.owner, "CHAIR_ALLERT"))
								ui.addTextArea(15, "<font color='#000000'>"..txt, v.owner, 0, 350, 800, nil, 0, 0, 0, false)
								ui.addTextArea(16, "<font color='#ffffff'>"..txt, v.owner, 1, 351, 800, nil, 0, 0, 0, false)
							end
						elseif v.outChair then
							tfm.exec.removeImage(v.outChair)
							ui.removeTextArea(15, v.owner)
							ui.removeTextArea(16, v.owner)
							v.outChair = nil
						end
					end
				end
			end
		elseif ROUND.state == "FINISH" then
			if ROUND.time < GLOBAL_TIME then
				for i, v in pairs(ROUND.chair) do
					tfm.exec.giveCheese(v.owner)
					tfm.exec.playerVictory(v.owner)
				end
				if CONFIG.again then
					tfm.exec.newGame(tfm.get.room.currentMap)
				else
					newMap()
				end
			else
				local b = {0, 1, 2, 4, 9, 11, 13}
				local x, y, id = math.random(800), math.random(400), b[math.random(#b)]
				explosion(id, x, y, 20, 20)
			end
		end
	end
	for i, v in pairs(PLAYER) do
		if v.ctrl and v.ctrl < os.time() then
			v.ctrl = false
		end
		if isCoffee(i) then
			unlockChair(i, "coffee")
		end
	end
	for i, v in pairs({delImagesTimer, delObjectTimer, delTxtTimer, execFunctionTimer, teleportCloud}) do
		if os.time() > tt+10 then
			break
		else
			v(tt)
		end
	end
end)