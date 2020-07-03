function random(n)
	ROUND.time = GLOBAL_TIME + (ROUND.gameMode.flash and 5000 or 10000)
	ROUND.chair[n].action = {name="random"}
	ROUND.topCard.card = randomActionCard()
	ROUND.topCard.card[3] = nil
	drawTopCard()
	local y = drawTopCard()
	tfm.exec.displayParticle(12, 455, y+37, 0, 0, 0, 0)
	ROUND.chair[n].action = nil
	_G[ROUND.topCard.card[2]](n)
end