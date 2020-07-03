onEvent("NewGame", function()
	addFunctionTimer(loadImages, 100)
	tfm.exec.snow(0)
	-- controle de início de partida
	for i=1000, 1020 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(27)
	for i=10000, 1005 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(70)
	for i, v in pairs(CONFIG.chair) do
		CONFIG.chair[i] = false
	end
	for i, v in pairs(ROUND.chair or {}) do
		ui.removeTextArea(1000+i)
		ui.removeTextArea(2000+i)
		ui.removeTextArea(3000+i)
		ui.removeTextArea(3010+i)
		system.bindMouse(v.owner, false)
		if v.owner ~= "" then
			CONFIG.chair[i] = v.owner
		end
	end
	for i=1, 30 do
		ui.removeTextArea(i)
	end
	for i, v in pairs(PLAYER) do
		v.ctrl = false
	end
	IMG.skin.classic = IMG.skin.orange
	-- AQUI
	if not validMap() then
		addFunctionTimer(function()
			newMap()
		end, 3500)
	else
		tfm.exec.addPhysicObject(3488, 400, 200, {type=14, width=3000, height=400, miceCollision=false})
		for i, v in pairs(PLAYER) do
			v.chair = nil
			v.notAfk = false
			colorNick(i)
			if v.chairDelay > 0 and tfm.get.room.uniquePlayers > 8 then
				v.spaceDelay = math.huge
				local t = v.chairDelay
				v.chairDelayTimer = {
					time = GLOBAL_TIME+3000+v.chairDelay
				}
				if v.chairDelay > 0 then
					v.chairDelayTimer.img = tfm.exec.addImage(IMG.misc.hourglass, "$"..i, -15, -45, i)
				end
			else
				v.spaceDelay = os.time()+3000
			end
			system.bindKeyboard(i, 32, true, true)
		end
		ROUND = {
			state = "START",
			time = GLOBAL_TIME+20000,
			deck = {},
			imgDeck = {},
			pile = {},
			history = {},
			gameMode = {},
			chair = {},
			team = {{},{},{},{},{}},
			topCard = {img={}, card=false},
			flow = "RIGHT",
			flowLight = 1,
			cloud = {},
			arrowImg = {},
			imgRule = {},
		}
		ROUND.chair = getChairs(tfm.get.room.xmlMapInfo.xml)
		ROUND.color = getColor(tfm.get.room.xmlMapInfo.xml)
		ROUND.cardSkin = getCardSkin(tfm.get.room.xmlMapInfo.xml)
		local bots = getBot(tfm.get.room.xmlMapInfo.xml)
		ROUND.bots = bots or {}
		local pool = {}
		for i, v in pairs(ROUND.chair) do
			drawChair(i)
			table.insert(pool, i)
		end
		randomGameMode()
		if ROUND.gameMode.overload then
			ROUND.limit = 10
			ROUND.limit2 = 10
		elseif ROUND.gameMode.limbo then
			ROUND.limit = 12
			ROUND.limit2 = 12
		else
			ROUND.limit = 30
			ROUND.limit2 = 30
		end
		
		ui.setMapName("UNO!"..(ROUND.gameMode.limit and "<r> -&gt;" or ""))
		for i, v in pairs(tfm.get.room.playerList) do
			showRules(i)
			startTip(i)
			giveTip(i)
		end
		if CONFIG.fixedChair then
			for i=1, 10 do
				if CONFIG.chair[i] and ROUND.chair[i] then
					playerSit(CONFIG.chair[i], ROUND.chair[i], i)
				end
			end
		end
		for i, v in pairs(ROUND.gameMode) do
			local name = nickFormat(i)
			if BOT[name] and not PLAYER[name].chair then
				local chair = table.remove(pool, math.random(#pool))
				if chair then
					explosion(3, ROUND.chair[chair].x, 80, 20, 20)
					playerSit(name, ROUND.chair[chair], chair)
					if BOT[name].eventWelcome then
						BOT[name].eventWelcome(chair)
					end
				else
					break
				end
			end
		end
		tfm.exec.setGameTime(5)
	end
end)