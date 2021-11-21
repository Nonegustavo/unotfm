function randomGameMode()
	local rules = getRule(tfm.get.room.xmlMapInfo.xml)
	if rules and ((CONFIG.ranked and (tfm.get.room.uniquePlayers >= 6 or CONFIG.eventRoom)) or CONFIG.test or #rules == 0) then
		for i, v in pairs(rules) do
			ROUND.gameMode[v] = true
		end
	elseif not CONFIG.random then
		if CONFIG.noRules then
			CONFIG.noRules = false
		else
			local modes = {"nou","nou","mini","maxi","jumpin","jumpin","jumpin","stack","stack","stack","supercombo","supercombo","mulligan","mulligan","mulligan","rule","rule","random","tracking","limit","flash","chess","chess","ninguem_v2"}
			for i, v in pairs(RULE) do
				if v.public then
					table.insert(modes, i)
				end
			end
			local cont = 0
			if CONFIG.ranked and not RANKED and tfm.get.room.uniquePlayers >= 8 and math.random() > 0.85 then
				cont = cont + 1
				ROUND.gameMode.team = true
			end
			while (math.random(1,10) > 4+cont) and (#modes > 0) and cont < 4 do
				local n = table.remove(modes, math.random(#modes))
				cont = cont + 1
				ROUND.gameMode[n] = true
				for i, v in pairs(RULE[n].conflict or {}) do
					ROUND.gameMode[v] = nil
				end
				if n == "satisfaction" or n == "portal" then
					ROUND.gameMode.stack = true
					for i, v in pairs(RULE.stack.conflict or {}) do
						ROUND.gameMode[v] = nil
					end
				end
			end
		end
	else
		for i, v in pairs(CONFIG.rule) do
			if v then
				ROUND.gameMode[i] = true
			end
		end
	end
	if ROUND.gameMode.custom then
		RULE.custom.customDesc = CONFIG.custom.desc
		ROUND.custom = {}
		for i, v in pairs(CONFIG.custom.action) do
			ROUND.custom[i] = {}
			for j, w in pairs(v) do
				ROUND.custom[i][j] = w
			end
		end
	end
end

function startGame()
	ROUND.state = "WAIT"
	ui.removeTextArea(31)
	ROUND.flow = "RIGHT"
	ROUND.deck = {}
	ROUND.actionPool = {}
	local color = {"red","blue","yellow","green"}
	DECK.batata[1][1] = color[math.random(#color)]
	local skins = {}
	for i, v in pairs(DECK) do
		if RULE[i] and i ~= "bomb" and not RULE[i].notMess then
			for _, w in pairs(v) do
				table.insert(ROUND.actionPool, {w[1], w[2], true, true})
			end
		end
	end
	if ROUND.gameMode.noaction then
		for i, v in pairs(DECK.numbers) do
			table.insert(ROUND.deck, {v[1], v[2]})
		end
	elseif ROUND.gameMode.mess then
		for i, v in pairs(DECK.mess) do
			table.insert(ROUND.deck, {v[1], v[2]})
		end
		for i, mode in pairs(RULE) do
			if DECK[i] and i ~= "bomb" and not mode.notMess then
				for _, v in pairs(DECK[i]) do
					table.insert(ROUND.deck, {v[1], v[2]})
				end
			end
		end
	else
		for i, v in pairs(DECK.vanilla) do
			table.insert(ROUND.deck, {v[1], v[2]})
		end
		for i, mode in pairs(RULE) do
			if ROUND.gameMode[i] and DECK[i] and i ~= "bomb" then
				for _, v in pairs(DECK[i]) do
					table.insert(ROUND.deck, {v[1], v[2]})
				end
			end
		end
		if ROUND.gameMode.supercombo then
			local pool = {{"red","shield"},{"blue","shield"},{"green","shield"},{"yellow","shield"}}
			for i=1, #ROUND.deck do
				if ROUND.deck[i][2] == "n0" then
					ROUND.deck[i] = table.remove(pool)
				end
			end
		end
		if ROUND.gameMode.simon then
			for i=1, 4 do
				for j, v in pairs(ROUND.deck) do
					if v[2] == "wild" then
						table.remove(ROUND.deck, j)
						break
					end
				end
			end
		end
		if ROUND.gameMode.custom then
			for i, v in pairs(CONFIG.custom.color) do
				for j=1, v do
					table.insert(ROUND.deck, {i,"custom"})
				end
			end
		end
	end
	ROUND.deck = shuffleDeck(ROUND.deck)
	updateFlow()
	local cont = 0
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" then
			cont = cont + 1
		else
			table.insert(pool, i)
		end
	end
	if cont % 2 == 1 and ROUND.gameMode.team then
		local chair = pool[math.random(#pool)]
		explosion(3, ROUND.chair[chair].x, 80, 10, 20)
		playerSit("Elise", ROUND.chair[chair], chair)
		if BOT.Elise.eventWelcome then
			BOT.Elise.eventWelcome()
		end
		cont = cont + 1
	end
	local max = math.ceil(cont/2)
	cont = 0
	local players = {}
	pool = {1, 2, 3, 4, 5}
	pool = shuffleDeck(pool)
	
	ROUND.gameMode2 = {}
	ROUND.deck2 = {}
	ROUND.pile2 = {}
	ROUND.portal = {side="orange", img={}}
	for i, v in pairs(ROUND.deck) do
		table.insert(ROUND.deck2, {v[1], v[2]})
	end
	ROUND.deck2 = shuffleDeck(ROUND.deck2)
	for i, v in pairs(ROUND.gameMode) do
		ROUND.gameMode2[i] = true
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "EMPTY" or v.mode == "FREE" or not PLAYER[v.owner] then
			v.mode = "DELETED"
			drawChair(i)
		else
			table.insert(skins, {player = v.owner, skin = v.skin.id})
			if BOT[v.owner] and BOT[v.owner].eventStart then
				BOT[v.owner].eventStart()
			end
			table.insert(players, i)
			ui.removeTextArea(32, v.owner)
			ui.removeTextArea(33, v.owner)
			local color = tonumber(ROUND.color[1], 16)
			ui.addTextArea(10, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], CONFIG.UNO), v.owner, 675, 205, 100, 20, -1, color, 1, false)
			ui.addTextArea(11, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(v.owner, "CHALLENGE")), v.owner, 675, 240, 100, 20, -1, color, 1, false)
			ui.addTextArea(12, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(v.owner, "PASS")), v.owner, 675, 275, 100, 20, -1, color, 1, false)
			if ROUND.gameMode.team then
				v.team = pool[(cont-1)%max+1]
				ROUND.team[v.team][i] = true
				drawChair(i)
				cont = cont + 1
			elseif not RANKED and not CONFIG.noFlags then
				v.flag = PLAYER[v.owner].flagEquipped
				drawChair(i)
			else
				v.flag = "default"
			end
		end
	end
	for i, v in pairs(ROUND.chair) do
		if not PLAYER[v.owner] then
			v.mode = "DELETED"
			drawChair(i)
		elseif v.mode ~= "DELETED" then
			local cards = ROUND.gameMode.maxi and 9 or ROUND.gameMode.mini and 4 or 7
			v.hand2 = {}
			if v.owner == "Buffy" then
				drawCard(i, cards-2, "START")
			elseif v.owner == "Elisah" then
				drawCard(i, cards-3, "START")
				local color = {"red", "blue", "yellow", "green"}
				for i=1, 3 do
					table.insert(v.hand, {table.remove(color, math.random(#color)), "curse", true})
				end
				showCardsGainned(i, cards)
				updateScore(i)
			elseif v.owner == "Papaille" then
				drawCard(i, cards+2, "START")
			else
				drawCard(i, cards, "START")
			end
			drawCard2(i, 4)
			local color = v.hand[1][1]
			local sameColor = true
			if ROUND.gameMode.bluegreen and (color == "green" or color == "blue") then
				for j, w in pairs(v.hand) do
					if w[1] ~= "green" or w[1] ~= "blue" then
						sameColor = false
						break
					end
				end
			else
				for j, w in pairs(v.hand) do
					if w[1] ~= color then
						sameColor = false
						break
					end
				end
			end
			if sameColor then
				unlockChair(v.owner, "loot")
			end
		end
	end
	ROUND.turn = players[math.random(#players)]
	if #skins >= 8 then
		local compare = skins[1].skin
		local isTheSame = true
		for i, v in pairs(skins) do
			if v.skin ~= compare then
				isTheSame = false
			end
		end
		if isTheSame then
			for i, v in pairs(skins) do
				unlockChair(v.player, "vangogh")
			end
		end
	end
	for i, v in pairs(PLAYER) do
		if not v.chair then
			--tfm.exec.chatMessage("<bl>"..translate(i, "TIP_26"), i)
			v.spaceDelay = 0
			v.lastChair = nil
			v.school = 0
		end
		if v.chairDelayTimer then
			if v.chairDelayTimer.img then
				tfm.exec.removeImage(v.chairDelayTimer.img)
			end
			v.chairDelayTimer = nil
		end
		if useTotoro(i) then
			unlockChair(i, "totoro")
		end
	end
	if ROUND.gameMode.mulligan then
		mulligan()
	else
		roundBegin()
	end
end

function roundBegin()
	ROUND.state = "PLAY"
	ROUND.time = GLOBAL_TIME + (ROUND.gameMode.flash and 5000 or 10000)
	ROUND.startTime = os.time()
	if ROUND.gameMode.limit then
		tfm.exec.setGameTime(360)
	else
		tfm.exec.setGameTime(720)
	end
	local rand = 0
	repeat
		rand = math.random(#ROUND.deck)
	until ROUND.deck[rand][2] ~= "draw4"
	playCard(ROUND.turn, table.remove(ROUND.deck, rand), true)
	if ROUND.gameMode.bomb or ROUND.gameMode.mess then
		table.insert(ROUND.deck, math.random(#ROUND.deck), {"black","bomb"})
	end
	if ROUND.gameMode.team then
		local color = {0xF11C25, 0x006DB8, 0x3CA646, 0xC858DB, 0xE99715}
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				for j, w in pairs(ROUND.team[v.team]) do
					if j ~= i then
						ui.addTextArea(90001, "<p align='center'><font color='#ffffff' size='10px'>"..translate(v.owner, "TEAM_DESCRIPTION"), v.owner, ROUND.chair[j].x-60, 20, 120, nil, color[v.team], 0xffffff, 1, false)
						break
					end
				end
				ui.addTextArea(50, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "TEAM_SHOW_CARD"), v.owner, 200, 375, 400, nil, nil, nil, 1, false)
			end
		end
		table.insert(TIMER.txt, {time=os.time()+10000, id=90001})
		table.insert(TIMER.txt, {time=os.time()+20000, id=50})
	elseif ROUND.gameMode.mess then
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				ui.addTextArea(50, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "TIP_21"), v.owner, 200, 375, 400, nil, nil, nil, 1, false)
			end
		end
		table.insert(TIMER.txt, {time=os.time()+20000, id=50})
	end
	returnCards()
	showDeck()
	updateArrow()
	ui.removeTextArea(28)
end

function mulligan()
	ROUND.state = "MULLIGAN"
	ROUND.time = GLOBAL_TIME+10000
	for i, v in pairs(ROUND.chair) do
		local txt = "<p align='center'><font size='14px' color='#ffffff'>"..translate(v.owner, "CHANGE_HAND")
		ui.addTextArea(28, txt, v.owner, 350, 293, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
	end
end

function returnCards()
	for i, v in pairs(ROUND.chair) do
		if PLAYER[v.owner] then
			local count = 0
			local card = false
			if v.flag == "cloud" and not ROUND.gameMode.mess then
				local card = math.random() > 0.05 and randomActionCard() or {"black", "wild"}
				local blacks = {random=1, simon=1, king=1, queen=1, clone=1, half=1, draw99=1}
				if blacks[card[2]] then
					card[1] = "black"
				end
				card[3] = true
				card[4] = true
				table.insert(v.hand, card)
				count = count + 1
			end
			if PARADOX[v.owner] then
				for j, w in pairs(PARADOX[v.owner]) do
					table.insert(v.hand, w)
				end
				card = PARADOX[v.owner][1]
				PARADOX[v.owner] = false
				count = count + 1
			end
			if count > 0 then
				local img = tfm.exec.addImage(IMG.misc.portal, "!1000", v.x-50, 5)
				TIMER.img[img] = os.time()+1500
				missCard(i, card, 2000)
				explosion(1, v.x, 80, 40, 40)
				showCardsGainned(i, ROUND.gameMode.mulligan and count or #v.hand)
				sortHand(v.hand)
				if mustBeEliminated(i) then
					eliminate(i)
				else
					updateHand(i)
					updateScore(i)
				end
			end
		end
	end
end