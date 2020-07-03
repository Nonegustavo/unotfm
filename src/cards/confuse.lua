function confuse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].confuse = true
	explosion(14, ROUND.chair[n].x, 100, 20, 20)
	passTurn()
	batataTimer(n)
end