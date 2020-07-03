onEvent("NewPlayer", function(p)
	-- carregar dados e preparar o jogador para a sala
	if validMap() or true and p then
		ui.setMapName("UNO!"..(ROUND and ROUND.gameMode and ROUND.gameMode.limit and "<r> -&gt;" or ""))
		ui.addTextArea(4001, string.format("<p align='center'><b><a href='event:menu'>%s</a>", translate(p, "MENU")), p, 5, 380, 80, 20, 0x324650, nil, 1, true)
		ui.addTextArea(4002, string.format("<p align='center'><b><a href='event:openinventory'>%s</a>", translate(p, "INVENTORY")), p, 715, 380, 80, 20, 0x324650, nil, 1, true)
		translatedChatMessage("WELCOME_TEXT", p)
		translatedChatMessage("WELCOME_DISCORD", p)
		if not PLAYER[p] then
			PLAYER[p] = instanceData()
		end
		system.loadPlayerData(p)
		system.bindKeyboard(p, 0, true, true) -- Esquerda
		system.bindKeyboard(p, 1, true, true) -- Cima
		system.bindKeyboard(p, 2, true, true) -- Direita
		system.bindKeyboard(p, 3, true, true) -- Baixo
		system.bindKeyboard(p, 72, true, true) -- H
		system.bindKeyboard(p, 67, true, true) -- C
		system.bindKeyboard(p, 85, true, true) -- U
		system.bindKeyboard(p, 80, true, true) -- P
		system.bindKeyboard(p, 76, true, true) -- L
		system.bindKeyboard(p, 79, true, true) -- O
		system.bindKeyboard(p, 78, true, true) -- N
		system.bindKeyboard(p, 32, true, true) -- espaço
		system.bindKeyboard(p, 17, true, true) -- ctrl
		system.bindKeyboard(p, 17, false, true) -- ctrl down
		if ROUND.chair then
			for i, v in pairs(ROUND.chair) do
				drawChair(i, p)
			end
		end
		if ROUND.gameMode then
			showRules(p)
		end
		if ROUND.state == "START" then
			startTip(p)
		elseif ROUND.state == "MULLIGAN" then
			showDeck(p)
		elseif ROUND.state == "PLAY" then
			updateArrow(p)
			updateFlow(p)
			showDeck(p)
			drawTopCard(p)
			showAccumulated(p)
			showRules(p)
			if ROUND.portal then
				table.insert(ROUND.portal.img, tfm.exec.addImage(IMG.misc[ROUND.portal.side], "!50000", 0, 0, p))
			end
		elseif ROUND.state == "FINISH" then
			showDeck(p)
			drawTopCard(p)
		end
		giveTip(p)
		tfm.exec.addPhysicObject(0, 400, 530, {height=10, width=3000})
		tfm.exec.respawnPlayer(p)
	end
	if SCORE[p] then
		tfm.exec.setPlayerScore(p, SCORE[p])
	elseif tfm.get.room.playerList[p] then
		SCORE[p] = tfm.get.room.playerList[p].score
	end
end)