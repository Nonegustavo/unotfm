function spy(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and n ~= i then
			missCard(i, v.hand[math.random(#v.hand)], 2000)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end