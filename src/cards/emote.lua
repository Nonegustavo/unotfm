function imitate(n)
	ui.removeTextArea(70)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {0, 1, 2, 3, 4, 5, 6, 7}
	local rand = pool[math.random(#pool)]
	local image = {tfm.exec.addImage(IMG.emote[rand], "!1000", 350, 190)}
	ROUND.chair[n].action = {
		name = "IMITATE",
		img = image,
		action = rand,
		player = {}
	}
	ROUND.time = GLOBAL_TIME + 10000
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" then
			ui.addTextArea(19, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "WARN_IMITATE"), v.owner, 100, 305, 600, nil, 0, 0, 0, false)
		end
	end
	updateTurnTimer()
	if BOT.Charlotte.sleep and rand == 6  then
		eventEmotePlayed("Charlotte", 6)
	end
end

function emoteVerify(final)
	local name = {}
	local actual = ROUND.turn
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and not ROUND.chair[ROUND.turn].action.player[i] then
			table.insert(name, i)
		end
	end
	local qtd = #name == 1 and 2 or 1
	if final or #name == 1 then
		if ROUND.turn and ROUND.chair[ROUND.turn] then
			for i, v in pairs(ROUND.chair[ROUND.turn].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[ROUND.turn].action = nil
		end
		for j, w in pairs(name) do
			local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[w].x-50, 30)
			TIMER.img[img] = os.time()+2000
			if ROUND.subitDeath then
				eliminate(w)
			elseif not isCursed(w, "ice") then
				if isCursed(w, "thorn") then
					eliminate(w)
				else
					drawCard(w, qtd)
					if mustBeEliminated(w) then
						eliminate(w)
					end
				end
				mimicDraw(w, qtd)
			end
		end
		passTurn()
		ROUND.chair[actual].confuse = false
		batataTimer(actual)
		updateShadow(actual)
	end
end