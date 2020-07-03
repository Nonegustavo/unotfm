function meep(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].meep = true
	tfm.exec.giveMeep(ROUND.chair[n].owner)
	tfm.exec.displayParticle(10, ROUND.chair[n].x, 90, 0, 0, 0, 0, nil)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end