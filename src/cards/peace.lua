function peace(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local y = 210 - (#ROUND.pile/108 * 10)
	explosion(32, 455, y, 20, 30)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			v.peace2 = 3
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end