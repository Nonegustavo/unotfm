function magnet(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	
	local i = #ROUND.chair[n].hand
	local cont = 0
	local bg = {green = true, blue = true}
	while i > 0 do
		if ROUND.chair[n].hand[i][1] == ROUND.topCard.card[1] or (ROUND.gameMode.bluegreen and bg[ROUND.chair[n].hand[i][1]] and bg[ROUND.topCard.card[1]]) then
			discardByIndex(n, i)
			discardEffect(n, i)
			cont = cont + 1
		end
		i = i - 1
	end
	local xmax = ROUND.chair[n].x-450
	local ymax = 135-250
	local fx = {red=13, blue=1, yellow=11, green=9, black=1}
	local color = fx[ROUND.topCard.card[1]]
	local dist = math.ceil(math.sqrt(math.pow(xmax,2)+math.pow(ymax,2))/20)
	local qtd = cont * dist
	for i=0, qtd do
		local x = 450 + xmax*(i/qtd)
		local y = 250 + ymax*(i/qtd)
		tfm.exec.displayParticle(color, x+math.random(-8,8), y+math.random(-8,8), 0, 0, 0, 0, nil)
	end
	explosion(9, ROUND.chair[n].x, 135, 5, 10)
	explosion(35, ROUND.chair[n].x, 135, 3, 5)
	mimicDiscard(n, cont)
	if cont > 0 then
		showCardsGainned(n, -cont)
	end
	if cont >= 5 then
		unlockChair(ROUND.chair[n].owner, "mecatopus")
	end
	if #ROUND.chair[n].hand <= 0 then
		endGame(ROUND.chair[n].owner, ROUND.topCard.card)
	else
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		end
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
	updateHand(n)
	updateScore(n)
end