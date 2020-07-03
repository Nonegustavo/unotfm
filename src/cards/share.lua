function share(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		table.insert(pool, {v[1], v[2], true, true})
	end
	if #ROUND.chair[n].hand > 10 then
		for i=1, #ROUND.chair[n].hand - 10 do
			table.remove(pool, math.random(#pool))
		end
	end
	local amount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	local poolPlayer = {}
	for i, v in pairs(ROUND.chair) do
		if i~=n and v.mode ~= "DELETED" then
			table.insert(poolPlayer, i)
		end
	end
	for i, v in pairs(pool) do
		local target = poolPlayer[math.random(#poolPlayer)]
		table.insert(ROUND.chair[target].hand, v)
		amount[target] = amount[target] + 1
	end
	
	for i, v in pairs(ROUND.chair) do
		if amount[i] > 0 then
			missCard(i, nil, 2000)
			explosion(5, v.x, 100, 5, 10)
			sortHand(v.hand)
			v.uno = nil
			updateHand(i)
			updateScore(i)
			showCardsGainned(i, amount[i])
			if mustBeEliminated(i) then
				eliminate(i)
			end
		end
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end