function carousel(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local hand = ROUND.chair[n].hand
	local aux = {}
	local c = n
	repeat
		c = nextChair(c)
		aux = ROUND.chair[c].hand
		ROUND.chair[c].hand = hand
		hand = aux
		if #ROUND.chair[c].hand == 1 then
			ROUND.chair[c].uno = "uno"
		else
			ROUND.chair[c].uno = nil
		end
		if isIlluminati(c) then
			unlockChair(ROUND.chair[c].owner, "illuminati")
		end
		if #ROUND.chair[c].hand > ROUND.chair[c].maxHand then
			ROUND.chair[c].maxHand = #ROUND.chair[c].hand
		end
		if #ROUND.chair[c].hand > 25 and not ROUND.chair[c].notTrash then
			unlockChair(ROUND.chair[c].owner, "trash")
		end
		if ROUND.chair[c].mode == "BUSY" then
			updateHand(c)
		end
		updateScore(c)
		explosion(3, ROUND.chair[c].x, 135, 3, 20)
		explosion(35, ROUND.chair[c].x, 135, 3, 5)
	until c == n
	if chestInHand(n) then
		unlockChair(ROUND.chair[n].owner, "chest")
	end
	local vel = {RIGHT=12, LEFT=-12}
	for i=-500, 1300, 50 do
		tfm.exec.displayParticle(35, i, math.random(130,150), vel[ROUND.flow], 0, 0, 0)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end