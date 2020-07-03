function ink(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local target = nextChair(ROUND.turn)
	local change = {}
	for i, v in pairs(ROUND.chair[target].hand) do
		if v[1] ~= "black" then
			if v[3] or v[2] == "batata" then
				v[1] = ROUND.topCard.card[1]
			else
				table.insert(ROUND.pile, 1, v)
				table.insert(change, i)
			end
		end
	end
	if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventInk then
		BOT[ROUND.chair[target].owner].eventInk(ROUND.topCard.card[1])
	end
	for i, v in pairs(change) do
		ROUND.chair[target].hand[v] = {ROUND.topCard.card[1], ROUND.chair[target].hand[v][2], true}
	end
	if ROUND.topCard.card[1] == "black" then
		unlockChair(ROUND.chair[target].owner, "gothic")
	end
	local fx = {red=13, blue=1, yellow=11, green=9, black=0}
	for i=1, 20 do
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-50,50)+ROUND.chair[target].x, 15, 0, math.random()*4, 0, 0, nil)
	end
	local qtd = #ROUND.chair[target].hand > 16 and 16 or #ROUND.chair[target].hand
	local maxx = math.floor(qtd*1.5)
	for i=1, maxx do
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
	end
	addFunctionTimer(function()
		for i=1, 20 do
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-50,50)+ROUND.chair[target].x, 15, 0, math.random()*4, 0, 0, nil)
		end
		local qtd = #ROUND.chair[target].hand > 16 and 16 or #ROUND.chair[target].hand
		local maxx = math.floor(qtd*1.5)
		for i=1, maxx do
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
		end
	end, 200)
	
	sortHand(ROUND.chair[target].hand)
	updateHand(target)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end