function gift(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if v.owner ~= "Papaille" and (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "GIFT",
		img = image,
		op = option,
		func = makeGift
	}
	resetTimer()
	updateTurnTimer()
end

function makeGift(n, target, qtd)
	qtd = qtd or 1
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" and (ROUND.chair[target].owner ~= "Papaille" or ROUND.chair[n].owner == "Jingle") then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			ROUND.chair[n].action = false
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventDonate then
				BOT[ROUND.chair[target].owner].eventDonate(ROUND.chair[n].owner)
			end
			if qtd >= 5 then
				unlockChair(ROUND.chair[n].owner, "heart")
			end
			if qtd > #ROUND.chair[n].hand then
				qtd = #ROUND.chair[n].hand
			end
			for i=1, qtd do
				local rand = math.random(#ROUND.chair[n].hand)
				temp = table.remove(ROUND.chair[n].hand, rand)
				if temp[2] == "draw4" then
					unlockChair(ROUND.chair[n].owner, "coca")
				end
				discardEffect(n, rand)
				table.insert(ROUND.chair[target].hand, temp)
			end
			missCard(target, qtd == 1 and temp, 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			sortHand(ROUND.chair[target].hand)
			ROUND.chair[target].uno = nil
			ROUND.chair[target].loveList = ROUND.chair[target].loveList or {}
			table.insert(ROUND.chair[target].loveList, ROUND.chair[n].owner)
			updateHand(n)
			updateHand(target)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			if ROUND.chair[n].loveList then
				for i, v in pairs(ROUND.chair[n].loveList) do
					if v == ROUND.chair[target].owner then
						unlockChair(ROUND.chair[n].owner, "kiss")
						break
					end
				end
			end
			updateScore(n)
			updateScore(target)
			showCardsGainned(n, -qtd)
			showCardsGainned(target, qtd)
			if mustBeEliminated(target) then
				eliminate(target)
				unlockChair(ROUND.chair[n].owner, "snowman")
			end
			if #ROUND.chair[n].hand == 0 then
				local name = ROUND.chair[n].owner
				endGame(ROUND.chair[n].owner)
				unlockChair(name, "gift")
			else
				passTurn()
				ROUND.chair[n].confuse = false
				batataTimer(n)
				updateShadow(n)
			end
		end
	else
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		passTurn()
		batataTimer(n)
		updateShadow(n)
	end
end