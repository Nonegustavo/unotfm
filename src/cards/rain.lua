function rain(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if n ~= i then
			tryDraw(i, 1)
		end
	end
	for i=1, 40 do
		tfm.exec.displayParticle(34, math.random(799), 15, 0, math.random()*5, 0, 0, nil)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end