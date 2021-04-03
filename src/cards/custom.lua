function custom(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local needChoice = false
	local onlyOthers = false
	local skipAction = false
	local nextPlayer = false
	local previousPlayer = false
	for i, v in pairs(ROUND.custom) do
		if v.who == "CHOOSE" or v.who2 == "CHOOSE" then
			needChoice = true
			if v.action == "DONATE" or v.action == "SWAP" or v.action == "TRADE" then
				if v.who == "YOURSELF" or v.who2 == "YOURSELF" then
					onlyOthers = true
				elseif v.who == "NEXT" or v.who2 == "NEXT" then
					nextPlayer = true
				elseif v.who == "PREVIOUS" or v.who2 == "PREVIOUS" then
					previousPlayer = true
				end
			elseif v.action == "SKIP" then
				skipAction = true
			end
		end
	end
	if needChoice then
		local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		local options = {}
		local cont = 0
		for i, v in pairs(ROUND.chair) do
			if (v.mode == "BUSY" or v.mode == "FREE") and not(skipAction and v.action) and not(i == n and onlyOthers) and not(nextPlayer and i == nextChair(n)) and not(previousPlayer and i == previousChair(n)) then
				table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
				options[i] = true
				cont = cont + 1
			end
		end
		if cont > 0 then
			ROUND.chair[n].action = {
				name = "CUSTOM",
				img = image,
				op = options,
				func = makeCustomAction,
			}
			resetTimer()
			updateTurnTimer()
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	else
		makeCustomAction(n)
	end
end

function makeCustomAction(n, target)
	if target and ROUND.chair[n].action.op[target] or not target then
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		local can = {} -- pode apenas os não alvos
		local pool2 = {} -- pode todos (não doze, é POOL2)
		local prev = previousChair(n)
		local prox = nextChair(n)
		local yourself = n
		local sort = 0
		local returnedValues = {}
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				can[i] = true
				table.insert(pool2, i)
				returnedValues[i] = {0, 0, 0, 0, 0}
			end
		end
		for i, v in pairs(ROUND.custom) do
			if v.who == "YOURSELF" or v.who2 == "YOURSELF" then
				can[n] = false
			elseif v.who == "CHOOSE" or v.who2 == "CHOOSE" and target then
				can[target] = false
			elseif v.who == "NEXT" or v.who2 == "NEXT" then
				can[prox] = false
			elseif v.who == "PREVIOUS" or v.who2 == "PREVIOUS" then
				can[prev] = false
			elseif v.who == "RANDOM" then
				sort = 1
			elseif v.who == "RANDOM2" then
				sort = 2
			elseif v.who == "RANDOM3" then
				sort = 3
			end
		end
		local pool = {}
		for i, v in pairs(can) do
			if v then
				table.insert(pool, i)
			end
		end
		local rand = {}
		local randomTarget = false
		if sort == 1 and #pool2 > 0 then
			randomTarget = table.remove(pool2, math.random(#pool2))
		else
			for i=1, sort do
				if #pool > 0 then
					table.insert(rand, table.remove(pool, math.random(#pool)))
				else
					break
				end
			end
		end
		local t = {}
		t.yourself = yourself
		t.target = target
		t.prev = prev
		t.prox = prox
		t.randomTarget = randomTarget
		t.rand = rand
		if target then
			local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[target].x-50, 15)
			TIMER.img[img] = os.time()+500
		end
		for i, v in pairs(ROUND.custom) do
			if customEffects[v.action] then
				customEffects[v.action](v, i, t, returnedValues)
			end
		end
		isEndGame()
		ROUND.chair[n].confuse = false
		passTurn()
		batataTimer(n)
	end
end

customEffects = {
	DRAW = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			makeDraw(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					makeDraw(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					makeDraw(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			makeDraw(targets.rand[1], action, num, returnedValues)
			makeDraw(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			makeDraw(targets.rand[1], action, num, returnedValues)
			makeDraw(targets.rand[2], action, num, returnedValues)
			makeDraw(targets.rand[3], action, num, returnedValues)
		end
	end,
	ELIMINATE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			eliminate(unique[action.who], false, true)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					eliminate(i, false, true)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					eliminate(i, false, true)
				end
			end
		elseif action.who == "RANDOM2" then
			eliminate(targets.rand[1], false, true)
			eliminate(targets.rand[2], false, true)
		elseif action.who == "RANDOM3" then
			eliminate(targets.rand[1], false, true)
			eliminate(targets.rand[2], false, true)
			eliminate(targets.rand[3], false, true)
		end
	end,
	SKIP = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			makeSkip(unique[action.who])
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					makeSkip(i)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					makeSkip(i)
				end
			end
		elseif action.who == "RANDOM2" then
			makeSkip(targets.rand[1])
			makeSkip(targets.rand[2])
		elseif action.who == "RANDOM3" then
			makeSkip(targets.rand[1])
			makeSkip(targets.rand[2])
			makeSkip(targets.rand[3])
		end
	end,
	TRADE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] and unique[action.who2] then
			makeCustomTrade(unique[action.who], unique[action.who2])
		end
	end,
	SWAP = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		local index = {YOURSELF="yourself", NEXT="prox", PREVIOUS="prev", CHOOSE="target", RANDOM="randomTarget"}
		if unique[action.who] and unique[action.who2] then
			makeSwap(unique[action.who], unique[action.who2])
			local temp = targets[index[action.who]]
			targets[index[action.who]] = targets[index[action.who2]]
			targets[index[action.who2]] = temp
		end
	end,
	SHOW = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			customShow(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					customShow(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					customShow(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			customShow(targets.rand[1], action, num, returnedValues)
			customShow(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			customShow(targets.rand[1], action, num, returnedValues)
			customShow(targets.rand[2], action, num, returnedValues)
			customShow(targets.rand[3], action, num, returnedValues)
		end
	end,
	DISCARD = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			customDiscard(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					customDiscard(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					customDiscard(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			customDiscard(targets.rand[1], action, num, returnedValues)
			customDiscard(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			customDiscard(targets.rand[1], action, num, returnedValues)
			customDiscard(targets.rand[2], action, num, returnedValues)
			customDiscard(targets.rand[3], action, num, returnedValues)
		end
	end,
	DONATE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] and unique[action.who2] then
			makeCustomDonate(unique[action.who], unique[action.who2], action, num, returnedValues)
		end
	end,
}

function makeCustomDonate(n, m, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n and m then
		if unt then
			returnedValues[n][num] = donateUntil(n, m, tonumber(unt), action.condition)
		elseif ret then
			returnedValues[n][num] = donateCommon(n, m, returnedValues[n][tonumber(ret)], action.condition)
		elseif x and y then
			returnedValues[n][num] = donateCommon(n, m, math.random(tonumber(x), tonumber(y)), action.condition)
		elseif tonumber(action.amount) then
			returnedValues[n][num] = donateCommon(n, m, tonumber(action.amount), action.condition)
		end
		updateScore(n)
		updateScore(m)
		--drawTopCard()
		updateHand(n)
		updateHand(m)
	end
end

function donateCommon(n, m, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" and qtd > 0 then
		local cont = 0
		local card = false
		for i=1, qtd do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				donateByIndex(n, m, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		sortHand(ROUND.chair[m].hand)
		if cont > 0 then
			missCard(m, cont == 1 and card, 2000)
			explosion(5, ROUND.chair[m].x, 100, 5, 10)
			showCardsGainned(n, -cont)
			showCardsGainned(m, cont)
		end
		if mustBeEliminated(n) then
			eliminate(n)
		end
		return cont
	end
	return qtd
end

function donateUntil(n, m, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" and qtd < #ROUND.chair[n].hand then
		local discarted = #ROUND.chair[n].hand - qtd
		local cont = 0
		local card = false
		for i=1, discarted do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				donateByIndex(n, m, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		sortHand(ROUND.chair[m].hand)
		if cont > 0 then
			missCard(m, cont == 1 and card, 2000)
			explosion(5, ROUND.chair[m].x, 100, 5, 10)
			showCardsGainned(n, -cont)
			showCardsGainned(m, cont)
		end
		if mustBeEliminated(n) then
			eliminate(n)
		end
		return cont
	end
	return 0
end

function donateByIndex(n, m, card)
	local discarted = table.remove(ROUND.chair[n].hand, card)
	table.insert(ROUND.chair[m].hand, discarted)
end

function customDiscard(n, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n then
		if unt then
			returnedValues[n][num] = discardUntil(n, tonumber(unt), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif ret then
			returnedValues[n][num] = discardCommon(n, returnedValues[n][tonumber(ret)], action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif x and y then
			returnedValues[n][num] = discardCommon(n, math.random(tonumber(x), tonumber(y)), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif tonumber(action.amount) then
			returnedValues[n][num] = discardCommon(n, tonumber(action.amount), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		end
		updateScore(n)
		--drawTopCard()
		updateHand(n)
	end
end

function discardCommon(n, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > 0 then
		local cont = 0
		local card = false
		for i=1, qtd do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				discardByIndex(n, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		if cont == 1 then
			missCard(n, card, 2000)
		end
		showCardsGainned(n, -cont)
		return cont
	end
	return qtd
end

function discardUntil(n, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and qtd < #ROUND.chair[n].hand then
		local discarted = #ROUND.chair[n].hand - qtd
		local cont = 0
		local card = false
		for i=1, discarted do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				discardByIndex(n, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		if cont == 1 then
			missCard(n, card, 2000)
		end
		showCardsGainned(n, -cont)
		return cont
	end
	return 0
end

function discardByIndex(n, card)
	local discarted = table.remove(ROUND.chair[n].hand, card)
	discarted.lock = false
	if not discarted[3] then
		table.insert(ROUND.pile, 1, discarted)
	end
end

function resultCards(hand, mode)
	local pool = {}
	local comp = {RED="red", BLUE="blue", YELLOW="yellow", GREEN="green", WILD="black", SAME=ROUND.topCard.card[1]}
	for i, v in pairs(hand) do
		if mode == "ANY" or v[1] == comp[mode] or mode == "NUMBER" and isNumeric(v) or mode == "ACTION" and not isNumeric(v) then
			table.insert(pool, i)
		end
	end
	return pool
end

function customShow(n, action, num, returnedValues)
	if n and ROUND.chair[n].mode ~= "DELETED" then
		local pool = resultCards(ROUND.chair[n].hand, action.condition)
		if #pool > 0 then
			missCard(n, ROUND.chair[n].hand[pool[math.random(#pool)]], 2000)
			returnedValues[n][num] = 1
		end
	end
end

function makeSwap(n, m)
	if n and m and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" then
		for j, w in pairs(ROUND.chair[n].skin.img) do
			tfm.exec.removeImage(w)
		end
		for j, w in pairs(ROUND.chair[m].skin.img) do
			tfm.exec.removeImage(w)
		end
		local temp = ROUND.chair[n].x
		ROUND.chair[n].x = ROUND.chair[m].x
		ROUND.chair[m].x = temp
		temp = ROUND.chair[n]
		ROUND.chair[n] = ROUND.chair[m]
		ROUND.chair[m] = temp
		if ROUND.gameMode.team then
			ROUND.team[1] = {}
			ROUND.team[2] = {}
			ROUND.team[3] = {}
			ROUND.team[4] = {}
			ROUND.team[5] = {}
			for i, v in pairs(ROUND.chair) do
				ROUND.team[v.team][i] = true
			end
		end
		for i, v in pairs({n, m}) do
			tfm.exec.movePlayer(ROUND.chair[v].owner, ROUND.chair[v].x, 110)
			if #ROUND.chair[v].hand == 1 then
				ROUND.chair[v].uno = "uno"
			end
			drawChair(v)
			explosion(3, ROUND.chair[v].x, 100, 20, 10)
		end
	end
end

function makeCustomTrade(n, target)
	if n and target and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[target].mode ~= "DELETED" then
		local aux = ROUND.chair[n].hand
		ROUND.chair[n].hand = ROUND.chair[target].hand
		ROUND.chair[target].hand = aux
		updateHand(n)
		updateHand(target)
		if #ROUND.chair[target].hand == 1 then
			ROUND.chair[target].uno = "uno"
		else
			ROUND.chair[target].uno = nil
		end
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		else
			ROUND.chair[n].uno = nil
		end
		if isIlluminati(n) then
			unlockChair(ROUND.chair[n].owner, "illuminati")
		end
		if isIlluminati(target) then
			unlockChair(ROUND.chair[target].owner, "illuminati")
		end
		if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
			ROUND.chair[n].maxHand = #ROUND.chair[n].hand
		end
		if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
			ROUND.chair[target].maxHand = #ROUND.chair[target].hand
		end
		updateScore(n)
		updateScore(target)
		explosion(3, ROUND.chair[n].x, 135, 5, 20)
		explosion(3, ROUND.chair[target].x, 135, 5, 20)
		tfm.exec.displayParticle(37, ROUND.chair[target].x, 90, 0, 0, 0, 0)
		tfm.exec.displayParticle(37, ROUND.chair[ROUND.turn].x, 90, 0, 0, 0, 0)
	end
end

function makeSkip(n)
	if n and ROUND.chair[n].mode ~= "DELETED" and not ROUND.chair[n].action then
		ROUND.chair[n].action = {
			name = "SKIP",
			img = {tfm.exec.addImage(IMG.misc.web, "!1000", ROUND.chair[n].x-50, 30)}
		}
		explosion(1, ROUND.chair[n].x, 80, 20, 30)
	end
end

function makeDraw(n, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n then
		if unt then
			returnedValues[n][num] = drawUntil(n, tonumber(unt))
		elseif ret then
			returnedValues[n][num] = commonDraw(n, returnedValues[n][tonumber(ret)])
		elseif x and y then
			returnedValues[n][num] = commonDraw(n, math.random(tonumber(x), tonumber(y)))
		elseif tonumber(action.amount) then
			returnedValues[n][num] = commonDraw(n, tonumber(action.amount))
		end
	end
end

function drawUntil(n, qtd)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > #ROUND.chair[n].hand then
		local drawed = qtd - #ROUND.chair[n].hand
		tryDraw(n, drawed)
		return drawed
	end
	return 0
end

function commonDraw(n, qtd)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > 0 then
		tryDraw(n, qtd)
	end
	return qtd
end