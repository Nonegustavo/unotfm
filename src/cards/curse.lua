function curse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {}
	for i, v in pairs(CURSE) do
		if not (ROUND.gameMode.mess and i=="shoe") then
			table.insert(pool, i)
		end
	end
	local player = 0
	local rand = pool[math.random(#pool)]
	ROUND.curse = rand
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			player = player + 1
		end
		if BOT[v.owner] and BOT[v.owner].eventCurse then
			BOT[v.owner].eventCurse(ROUND.curse)
		end
	end
	ROUND.curseTime = CURSE[rand].turns * player + 2
	ROUND.time = GLOBAL_TIME + 10000
	ROUND.chair[n].action = {
		name = "CURSE",
	}
	--local img = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0)
	local img2 = tfm.exec.addImage(CURSE[rand].img, "!1000", 383, 200)
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(i, CURSE[rand].desc), i, 150, 245, 500, nil, 1, 1, 0.7, false)
	end
	showDeck()
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if v.owner ~= "Elisah" then
				v.curse = ROUND.curse
			end
			updateHand(i)
		end
	end
	addFunctionTimer(function()
		ROUND.chair[n].action = false
		ui.removeTextArea(71)
		--tfm.exec.removeImage(img)
		tfm.exec.removeImage(img2)
		passTurn()
		updateShadow(n)
	end, 4000)
end

function showCurse(p)
	PLAYER[p].curseDelay = PLAYER[p].curseDelay or 0
	if ROUND.curse and PLAYER[p].curseDelay < os.time() then
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(p, CURSE[ROUND.curse].desc), p, 150, 245, 500, nil, 1, 1, 0.7, false)
		table.insert(TIMER.txt, {time=os.time()+4000, id=71})
		PLAYER[p].curseDelay = os.time()+5000
	end
end

function updateCurse()
	ui.removeTextArea(70)
	if ROUND.curseImage then
		tfm.exec.removeImage(ROUND.curseImage)
	end
	if ROUND.curse and ROUND.curseTime then
		ROUND.curseTime = ROUND.curseTime - 1
		if ROUND.curseTime <= 0 then
			ROUND.curse = nil
			showDeck()
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					v.curse = nil
					updateHand(i)
				end
			end
		else
			ui.addTextArea(70, string.format("<a href='event:curse'><p align='center'><font color='#%s' size='30px'>%s", ROUND.color[2], ROUND.curseTime), nil, 375, 240, 50, nil, 0, 0, 0, false)
			ROUND.curseImage = tfm.exec.addImage(CURSE[ROUND.curse].img, "!1000", 383, 200)
		end
	end
end