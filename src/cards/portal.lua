function portal(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local s = {blue="orange", orange="blue"}
	ROUND.portal.side = s[ROUND.portal.side]
	IMG.skin.classic = IMG.skin[ROUND.portal.side]
	for i, v in pairs(ROUND.portal.img) do
		tfm.exec.removeImage(v)
	end
	local color = {blue = 0x000835, orange= 0x351D00}
	--ui.addTextArea(90002, "", nil, 0, 0, 800, 400, color[ROUND.portal.side], color[ROUND.portal.side], 1, false)
	ROUND.deck, ROUND.deck2 = ROUND.deck2, ROUND.deck
	ROUND.pile, ROUND.pile2 = ROUND.pile2, ROUND.pile
	ROUND.gameMode, ROUND.gameMode2 = ROUND.gameMode2, ROUND.gameMode
	ROUND.subitDeath, ROUND.subitDeath2 = ROUND.subitDeath2, ROUND.subitDeath
	ROUND.limit, ROUND.limit2 = ROUND.limit2, ROUND.limit
	ROUND.limbo, ROUND.limbo2 = ROUND.limbo2, ROUND.limbo
	ROUND.curse, ROUND.curse2 = ROUND.curse2, ROUND.curse
	ROUND.curseTime, ROUND.curseTime2 = ROUND.curseTime2, ROUND.curseTime
	ROUND.simon, ROUND.simon2 = ROUND.simon2, ROUND.simon
	ROUND.traffic, ROUND.traffic2 = ROUND.traffic2, ROUND.traffic
	if ROUND.curseImage then
		tfm.exec.removeImage(ROUND.curseImage)
	end
	if ROUND.trafficImage then
		tfm.exec.removeImage(ROUND.trafficImage)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			v.hand, v.hand2 = v.hand2, v.hand
			v.luck, v.luck2 = v.luck2, v.luck
			v.peace, v.peace2 = v.peace2, v.peace
			v.confuse, v.confuse2 = v.confuse2, v.confuse
			v.compass, v.compass2 = v.compass2, v.compass
			v.batata, v.batata2 = v.batata2, v.batata
			v.curse, v.curse2 = v.curse2, v.curse
			v.notTrash, v.notTrash2 = v.notTrash2, v.notTrash
			v.meep, v.meep2 = v.meep2, v.meep
			v.mimic, v.mimic2 = v.mimic2, v.mimic
			--v.team, v.team2 = v.team2, v.team
			if v.action then
				for j, w in pairs(v.action.img or {}) do
					tfm.exec.removeImage(w)
				end
				v.action.img = {}
			end
			temp = v.action
			v.action = v.action2
			v.action2 = temp
			if v.action then
				if v.action.name == "SKIP" then
					v.action.img = {tfm.exec.addImage(IMG.misc.web, "!1000", v.x-50, 30)}
				end
			end
			if v.meep then
				tfm.exec.giveMeep(i)
			else
				tfm.exec.giveMeep(i, false)
			end
			explosion(3, v.x, 135, 3, 20)
			if #v.hand == 1 then
				v.uno = "uno"
				updateScore(i)
			end
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
				sortHand(v.hand)
				updateHand(i)
			end
		end
	end
	showDeck()
	clearTopCard()
	--local y = drawTopCard()
	addTopCard(ROUND.topCard.card, nil, true)
	explosion(3, 455, y+37, 5, 40)
	updateCurse()
	if ROUND.subitDeath and not ROUND.cloud.obj then
		ROUND.cloud.obj = tfm.exec.addShamanObject(63, 400, 500, 0, 2, 0, false)
		ROUND.cloud.delay = os.time()+5000
		tfm.exec.addImage(IMG.misc.cloud, "#"..ROUND.cloud.obj, -1200, -500)
	elseif not ROUND.subitDeath and ROUND.cloud.obj then
		tfm.exec.removeObject(ROUND.cloud.obj)
		ROUND.cloud.obj = false
	end
	for i, v in pairs(ROUND.imgRule) do
		tfm.exec.removeImage(v)
	end
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
	end
	if ROUND.traffic then
		ROUND.trafficImage = tfm.exec.addImage(IMG.misc[ROUND.traffic], "!1000", 265, 195)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
	ui.removeTextArea(28)
	--table.insert(TIMER.txt, {time=os.time()+100, id=90002})
	
	
	ROUND.portal.img = {tfm.exec.addImage(IMG.misc[ROUND.portal.side], "!50000", 0, 0)}
	--if ROUND.portal.side == "blue" then
	--  tfm.exec.snow(999999)
	--else
	--  tfm.exec.snow(0)
	--end
end