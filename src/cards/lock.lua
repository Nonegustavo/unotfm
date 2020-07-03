function key(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local count = 0
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" then
			local pool = {}
			for j, w in pairs(v.hand) do
				if not w.lock then
					table.insert(pool, j)
				end
			end
			if #pool > 0 then
				local rand = table.remove(pool, math.random(#pool))
				v.hand[rand].lock = true
				if #pool > 0 then
					local rand = table.remove(pool, math.random(#pool))
					v.hand[rand].lock = true
				end
				updateHand(i)
				for j=1, 5 do
					local vx = (math.random()-0.5) * 5
					local vy = (math.random()-1) * 8
					tfm.exec.displayParticle(13, v.x, 140, vx, vy, 0, 0.1)
				end
			end
			count = count + #pool
		end
	end
	if count == 0 then
		unlockChair(ROUND.chair[n].owner, "samson")
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end