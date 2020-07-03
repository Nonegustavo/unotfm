function trade(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "TRADE",
		img = image,
		op = option,
		func = makeTrade
	}
	resetTimer()
	updateTurnTimer()
end

function makeTrade(n, target)
	if target then
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			local aux = ROUND.chair[n].hand
			ROUND.chair[n].hand = ROUND.chair[target].hand
			ROUND.chair[target].hand = aux
			updateHand(n)
			updateHand(target)
			if #ROUND.chair[target].hand == 1 then
				ROUND.chair[target].uno = "uno"
			else
				ROUND.chair[target].uno = nil
			end
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			else
				ROUND.chair[n].uno = nil
			end
			if isIlluminati(n) then
				unlockChair(ROUND.chair[n].owner, "illuminati")
			end
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if chestInHand(n) then
				unlockChair(ROUND.chair[n].owner, "chest")
			end
			if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
				ROUND.chair[n].maxHand = #ROUND.chair[n].hand
			end
			if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
				unlockChair(ROUND.chair[n].owner, "trash")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			updateScore(n)
			updateScore(target)
			explosion(3, ROUND.chair[n].x, 135, 5, 20)
			explosion(3, ROUND.chair[target].x, 135, 5, 20)
			tfm.exec.displayParticle(37, ROUND.chair[target].x, 90, 0, 0, 0, 0)
			tfm.exec.displayParticle(37, ROUND.chair[ROUND.turn].x, 90, 0, 0, 0, 0)
			passTurn()
			ROUND.chair[n].confuse = false
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end