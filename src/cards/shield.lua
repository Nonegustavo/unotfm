function shield(n)
	if ROUND.accumulated then
		ROUND.accumulated.player[ROUND.chair[n].owner] = true
		addBlockPoint(ROUND.chair[n].owner)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end