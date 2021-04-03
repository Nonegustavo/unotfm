function picnicFlag(n)
	local pool = {}
	local lastCard = {0,0}
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[1] == lastCard[1] and v[2] == lastCard[2] then
			table.insert(pool, i)
		else
			lastCard = v
		end
	end
	if #pool > 0 then
		local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		local option = {}
		for i, v in pairs(ROUND.chair) do
			if v.owner ~= "Papaille" and (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
				table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
				option[i] = true
			end
		end
		ROUND.chair[n].action = {
			name = "PICNIC",
			img = image,
			op = option,
			card = pool[math.random(#pool)],
			func = makePicnicGift
		}
		resetTimer()
		updateTurnTimer()
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end

function makePicnicGift(n, target)
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" and (ROUND.chair[target].owner ~= "Papaille" or ROUND.chair[n].owner == "Jingle") then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventDonate then
				BOT[ROUND.chair[target].owner].eventDonate()
			end
			local find = ROUND.chair[n].action.card
			ROUND.chair[n].action = false
			missCard(target, ROUND.chair[n].hand[find], 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			discardEffect(n, find)
			donateByIndex(n, target, find)
			sortHand(ROUND.chair[target].hand)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			showCardsGainned(n, -1)
			showCardsGainned(target, 1)
			updateScore(n)
			updateScore(target)
			--drawTopCard()
			updateHand(n)
			updateHand(target)
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			if mustBeEliminated(target) then
				eliminate(target)
			end
			if #ROUND.chair[n].hand == 0 then
				local name = ROUND.chair[n].owner
				endGame(ROUND.chair[n].owner)
				unlockChair(name, "gift")
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

function cloudFlag(n) -- metal
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	local r = table.remove(pool, math.random(#pool))
	if r then
		local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
		TIMER.img[img] = os.time()+500
		explosion(0, ROUND.chair[r].x, 115, 10, 30)
		tryDraw(r, math.random(2))
	end
	passTurn()
	batataTimer(n)
end

function starFlag(n) -- paper
	giveCard(n, {"black","wild",true,true}, true)
	missCard(n, {"black","wild",true,true}, 2000)
	if mustBeEliminated(n) then
		eliminate(n)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function leafFlag(n) -- carpet
	local number = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		if isNumeric(v) then
			table.insert(number, i)
		end
	end
	if #number > 0 then
		local discarted = table.remove(ROUND.chair[n].hand, number[math.random(#number)])
		discarted.lock = false
		if not discarted[3] then
			table.insert(ROUND.pile, discarted)
		end
		missCard(n, discarted, 2000)
		local img = tfm.exec.addImage(IMG.misc.burn, "!1000", ROUND.chair[n].x-25, 20)
		TIMER.img[img] = os.time()+2000
		tryDraw(n, 1)
		if ROUND.chair[n].mode ~= "DELETED" and #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
			updateScore(n)
		end
		--drawTopCard()
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end