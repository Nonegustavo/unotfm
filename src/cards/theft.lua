function theft(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode ~= "DELETED") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "THEFT",
		img = image,
		op = option,
		func = makeTheft
	}
	resetTimer()
	updateTurnTimer()
end

function makeTheft(n, target)
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			ROUND.chair[n].action = false
			--
			local found = {}
			for i, v in pairs(ROUND.chair[target].hand) do
				if v[1] == "black" then
					table.insert(found, i)
				end
			end
			
			if #found > 0 then
				local rand = found[math.random(#found)]
				temp = table.remove(ROUND.chair[target].hand, rand)
				discardEffect(target, rand)
				table.insert(ROUND.chair[n].hand, temp)
				
				missCard(n, temp, 2000)
				explosion(5, ROUND.chair[n].x, 100, 5, 10)
				sortHand(ROUND.chair[n].hand)
				ROUND.chair[n].uno = nil
				updateHand(n)
				updateHand(target)
				if #ROUND.chair[target].hand == 1 then
					ROUND.chair[target].uno = "uno"
				end
				if isIlluminati(n) then
					unlockChair(ROUND.chair[n].owner, "illuminati")
				end
				if temp[2] == "draw4" then
					if ROUND.chair[n].theft then
						unlockChair(ROUND.chair[n].owner, "gaga")
					else
						ROUND.chair[n].theft = true
					end
				end
				updateScore(n)
				updateScore(target)
				showCardsGainned(n, 1)
				showCardsGainned(target, -1)
			end
			--
			
			if #ROUND.chair[target].hand == 0 then
				local name = ROUND.chair[target].owner
				endGame(ROUND.chair[target].owner)
				unlockChair(target, "gift")
			else
				passTurn()
				ROUND.chair[n].confuse = false
				batataTimer(n)
				updateShadow(n)
			end
		end
	else
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		passTurn()
		batataTimer(n)
		updateShadow(n)
	end
end