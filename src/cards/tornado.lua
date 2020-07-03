function tornado(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	local hands = {}
	
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" then
			for j, w in pairs(v.hand) do
				table.insert(pool, w)
			end
			hands[i] = #v.hand
			explosion(3, v.x, 135, 3, 20)
			--tfm.exec.displayParticle(37, v.x, 90, 0, 0, 0, 0)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(35, v.x+math.random(-50,50), math.random(70,120), 0, 0, 0, 0)
		end
	end
	addFunctionTimer(function()
		for i=1, 50 do
			tfm.exec.displayParticle(35, math.random(800), math.random(70,120), 0, 0, 0, 0)
		end
		addFunctionTimer(function()
			for i=1, 20 do
				tfm.exec.displayParticle(35, math.random(800), math.random(70,120), 0, 0, 0, 0)
			end
		end, 500)
	end, 500)
	
	for i, v in pairs(ROUND.chair) do
		if hands[i] then
			local hand = {}
			for i=1, hands[i] do
				table.insert(hand, table.remove(pool, math.random(#pool)))
			end
			v.hand = hand
			sortHand(v.hand)
			updateHand(i)
			updateScore(i)
		end
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end