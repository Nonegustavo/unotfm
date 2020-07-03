function luck(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].luck = true
	explosion(22, ROUND.chair[n].x, 120, 20, 20)
	updateScore(n)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end