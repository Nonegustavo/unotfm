function batata(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	if ROUND.chair[n].batataFlag then
		unlockChair(ROUND.chair[n].owner, "sack")
	else
		ROUND.chair[n].batataFlag = true
	end
	ROUND.chair[n].action = {
		name = "BATATA",
		img = image,
		op = option,
		func = makeBatata
	}
	resetTimer()
	updateTurnTimer()
end

function makeBatata(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			local card = ROUND.topCard.card
			if ROUND.pile[#ROUND.pile][2] == "batata" then
				table.remove(ROUND.pile)
			end
			changeColorBatata(card)
			table.insert(ROUND.chair[target].hand, card)
			missCard(target, card, 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			sortHand(ROUND.chair[target].hand)
			showCardsGainned(target, 1)
			updateHand(target)
			updateScore(target)
			if mustBeEliminated(target) then
				eliminate(target)
			end
			ROUND.topCard.card = ROUND.topCard.card2
			drawTopCard()
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