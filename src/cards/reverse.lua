function reverse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local cont = 0
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" or v.mode == "FREE" then
			cont = cont + 1
		end
	end
	if cont == 2 then
		skip(n)
	else
		local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
		ROUND.flow = arrow[ROUND.flow]
		updateFlow(nil, ROUND.flowLight)
		ROUND.love = ROUND.love or 0
		ROUND.love = ROUND.love + 1
		if PLAYER[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage(ROUND.love .. " reverses in a row.", ROUND.chair[n].owner)
		end
		if ROUND.love >= 4 then
			unlockChair(ROUND.chair[n].owner, "truelove")
			unlockChair(ROUND.chair[nextChair(n)].owner, "truelove")
		end
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
		for i=0, 800, 20 do
			tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
		end
	end
end