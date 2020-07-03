function rule(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local can = {}
	for i, v in pairs(RULE) do
		if v.rulecard then
			can[i] = true
		end
	end
	local pool = {}
	for i, v in pairs(ROUND.gameMode) do
		can[i] = nil
		for j, w in pairs(RULE[i].conflict or {}) do
			can[w] = nil
		end
	end
	for i, v in pairs(can) do
		table.insert(pool, i)
	end
	if #pool == 1 then
		addRule(pool[math.random(#pool)])
		passTurn()
		batataTimer(n)
	elseif #pool > 1 then
		local options = {}
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverRule, "!1000", ROUND.chair[n].x-50, 20)
		local images = {img, tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		for i=1, 2 do
			local name = table.remove(pool, math.random(#pool))
			options[i] = name
			table.insert(images, tfm.exec.addImage(IMG.misc.tip, "!1000", i*160+75, 190, ROUND.chair[n].owner))
			table.insert(images, tfm.exec.addImage(RULE[name].imgDesc, "!1000", i*160+80, 275, ROUND.chair[n].owner))
			local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s", translate(ROUND.chair[n].owner, RULE[name].name), translate(ROUND.chair[n].owner, RULE[name].desc))
			ui.addTextArea(50000+i, text, ROUND.chair[n].owner, i*160+80, 200, 150, 150, 0, 0, 0, false)
		end
		resetTimer()
		updateTurnTimer()
		showAccumulated()
		ROUND.chair[n].action = {
			name = "RULE",
			img = images,
			op = options,
		}
	else
		passTurn()
		batataTimer(n)
	end
end

function ruleBoss(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell then
		ROUND.accumulated = nil
	end
	local pool = {"red", "blue", "yellow", "green"}
	local options = {}
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverRule, "!1000", ROUND.chair[n].x-50, 20)
	local images = {img, tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	for i=1, 2 do
		local name = table.remove(pool, math.random(#pool))
		options[i] = name
		table.insert(images, tfm.exec.addImage(IMG.misc.tip, "!1000", i*160+75, 190, ROUND.chair[n].owner))
		table.insert(images, tfm.exec.addImage(RULE[name].imgDesc, "!1000", i*160+80, 275, ROUND.chair[n].owner))
		local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s", translate(ROUND.chair[n].owner, RULE[name].name), translate(ROUND.chair[n].owner, RULE[name].desc))
		ui.addTextArea(50000+i, text, ROUND.chair[n].owner, i*160+80, 200, 150, 150, 0, 0, 0, false)
	end
	resetTimer()
	updateTurnTimer()
	showAccumulated()
	ROUND.chair[n].action = {
		name = "RULE",
		img = images,
		op = options,
	}
end

function selectRule(n, option)
	ui.removeTextArea(50001)
	ui.removeTextArea(50002)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	addRule(ROUND.chair[n].action.op[option])
	local name = ROUND.chair[n].action.op[option]
	local y = 195 - (#ROUND.pile/108 * 10)
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(34, string.format("<p align='center'><font color='#ffffff'>%s", translate(i, RULE[name].name)), i, 350, y, 210, nil, 0, 0, 0, false)
	end
	table.insert(TIMER.txt, {time=os.time()+2000, id=34}) 
	ROUND.chair[n].action = false
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
	updateShadow(n)
end

function addRule(name)
	ROUND.gameMode[name] = true
	for i, v in pairs(ROUND.imgRule) do
		tfm.exec.removeImage(v)
	end
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
		if window.isOpened(i, "TIP") then
			window.update(i, "TIP", name)
		else
			window.open(i, "TIP", name)
		end
	end
	addFunctionTimer(function()
		for i, v in pairs(tfm.get.room.playerList) do
			window.close(i, "TIP")
		end
	end, 4000)
	if RULE[name].card then
		for i, v in pairs(DECK[name]) do
			table.insert(ROUND.deck, math.random(#ROUND.deck+1), v)
		end
		showDeck()
		if not ROUND.subitDeath then
			local randomColor = RULE[name].card.color
			local card = RULE[name].card.name or name
			show = {randomColor[math.random(#randomColor)],card}
			local y = 195 - (#ROUND.deck/108 * 10)
			local img = showCard(show, 320, y, nil, "!1000")
			for i, v in pairs(img) do
				TIMER.img[v] = os.time()+2000
			end
			ui.addTextArea(90000, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "000000")..#DECK[name], nil, 320, y+76, 51, 60, 0, 0, 0, false)
			ui.addTextArea(90001, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "FFFFFF")..#DECK[name], nil, 320, y+75, 50, 60, 0, 0, 0, false)
			table.insert(TIMER.txt, {time=os.time()+2000, id=90000})
			table.insert(TIMER.txt, {time=os.time()+2000, id=90001})
		end
	elseif name == "revelation" then
		showDeck()
	elseif name == "overload" then
		ROUND.limit = 10
		for i, v in pairs(ROUND.chair) do
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
			end
		end
	elseif name == "limbo" then
		ROUND.limit = 12
		for i, v in pairs(ROUND.chair) do
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
			end
		end
	elseif name == "camouflage" or name == "shiny" then
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				updateScore(i)
			end
		end
	end
end