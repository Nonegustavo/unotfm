function steal(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and i ~= n then
			local action = {}
			for i, v in pairs(v.hand) do
				if not isNumeric(v) then
					table.insert(action, i)
				end
			end
			if #action > 0 then
				local rand = action[math.random(#action)]
				discardEffect(i, rand)
				local discarted = table.remove(v.hand, rand)
				discarted.lock = false
				if not discarted[3] then
					table.insert(ROUND.pile, discarted)
				end
				missCard(i, discarted, 2000)
				local img = tfm.exec.addImage(IMG.misc.burn, "!1000", ROUND.chair[i].x-25, 20)
				TIMER.img[img] = os.time()+2000
				tryDraw(i, 1)
				if #v.hand == 1 then
					v.uno = "uno"
				end
				updateScore(i)
			end
		end
		drawTopCard()
	end
	if not isEndGame("BAN") then
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end