function resetTimer()
	local t = 10000
	if isCursed(ROUND.turn, "time") then
		t = 3000
	elseif ROUND.gameMode.flash or ROUND.chair[ROUND.turn].mode == "EMPTY" then
		t = 5000
	end
	ROUND.time = GLOBAL_TIME + t
end

function canPlay(n, c)
	checkVars("canPlay", {n, c}, {"number", {"number", "table"}}, recursion)
	local card = type(c) == "number" and ROUND.chair[n].hand[c] or c -- carta a ser comparada
	local top = ROUND.topCard.card -- carta do topo
	if not top then return false end
	local can = {
			n0 = {"x","n1"},
			n1 = {"n0","n2"},
			n2 = {"n1","n3"},
			n3 = {"n2","n4"},
			n4 = {"n3","n5"},
			n5 = {"n4","n6"},
			n6 = {"n5","n7"},
			n7 = {"n6","n8"},
			n8 = {"n7","n9"},
			n9 = {"n8","x"},
		}
	local trafficMatch = {
		odd = {n1=1, n3=1, n5=1, n7=1, n9=1},
		even = {n0=1, n2=1, n4=1, n6=1, n8=1}
	}
	local mix = {mix1=true, mix2=true, mix3=true}
	local bg = {blue=true, green=true}
	if card.lock then return false end
	if ROUND.turn == n then
		if ROUND.accumulated then
			local numeric = isNumeric(card)
			local peace = numeric or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1))
			--return ROUND.gameMode.hell and not (isNumeric(card) or isNumeric(top)) and not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1)) or ROUND.accumulated.allowed[card[2]]
			
			return (ROUND.gameMode.hell and not numeric or ROUND.accumulated.allowed[card[2]]) and peace
		else
			local numeric = isNumeric(card) -- carta é numerica
			local hell = ROUND.gameMode.hell and not (numeric or isNumeric(top)) -- satisfaz a regra do inferno
			local peace = numeric or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1)) -- satisfaz a regra da paz e final limpo
			local traffic = not ROUND.traffic or not (trafficMatch[ROUND.traffic][card[2]] and #ROUND.chair[n].hand == 1) -- satisfaz a regra do par ou ímpar
			local matchSymbol = false
			if ROUND.gameMode.neighbor and numeric then
				matchSymbol = can[card[2]][1] == top[2] or can[card[2]][2] == top[2]
			else
				matchSymbol = card[2] == top[2] or (mix[card[2]] and mix[top[2]])
			end
			local matchColor = card[1] == top[1] or (ROUND.gameMode.bluegreen and bg[card[1]] and bg[top[1]]) or card[1] == "black" -- combina a cor
			local whiteList = not ROUND.chair[n].whiteList or ROUND.chair[n].whiteList[c]
			return (hell or matchSymbol or matchColor) and peace and whiteList and traffic
		end
	elseif ROUND.gameMode.jumpin and not ROUND.chair[ROUND.turn].action and card[2] ~= "black" and card[2] == top[2] and (card[1] == top[1] or (ROUND.gameMode.bluegreen and bg[card[1]] and bg[top[1]])) then -- condições pro corte
		return (isNumeric(card) or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1))) and (not ROUND.traffic or not (trafficMatch[ROUND.traffic][card[2]] and #ROUND.chair[n].hand == 1))
	end
end

function canPlayHand(n, card)
	for i, v in pairs(ROUND.chair[n].hand) do
		if canPlay(n, i) then
			return true
		end
	end
end

function mustBeEliminated(n)
	return (ROUND.limit and #ROUND.chair[n].hand > ROUND.limit or bombInHand(n)) and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[n].owner ~= "Charlotte"
end

function limboTimer()
	if ROUND.gameMode.limbo then
		if ROUND.limbo then
			if GLOBAL_TIME > ROUND.limbo and ROUND.limit > 1 then
				ROUND.limit = ROUND.limit - 1
				for i, v in pairs(ROUND.chair) do
					if mustBeEliminated(i) then
						eliminate(i)
					else
						updateScore(i)
						explosion(0, v.x, 135, 5, 20)
					end
				end
				ui.removeTextArea(28)
				ROUND.limbo = GLOBAL_TIME+60000
				if ROUND.limit == 4 then
					for i, v in pairs(ROUND.chair) do
						if v.mode == "BUSY" then
							unlockChair(v.owner, "bones")
						end
					end
				end
			end
		else
			ROUND.limbo = GLOBAL_TIME+60000
		end
	end
end

function randomActionCard()
	local symbol = {"draw2", "draw2", "draw2", "skip", "skip", "skip", "reverse", "reverse", "reverse"}
	local color = {"red", "blue", "green", "yellow"}
	local nope = {mix=true, chess=true, box=true, bomb=true, batata=true, draw99=true, half=true}
	for i, v in pairs(RULE) do
		if (ROUND.gameMode[i] or (ROUND.gameMode.mess and not RULE[i].notMess)) and RULE[i].card and not nope[i] then
			table.insert(symbol, i)
		end
	end
	return {color[math.random(#color)], symbol[math.random(#symbol)]}
end

function isEndGame(form)
	if ROUND.state == "PLAY" then
		local win = {}
		local live = {}
		local card = (form=="PLAY" or form=="JUMPIN") and ROUND.topCard.card
		for i, v in pairs(ROUND.chair) do
			if v.mode == "BUSY" then
				table.insert(live, v.owner)
				if #v.hand == 0 then
					table.insert(win, v.owner)
				end
			end
		end
		if #win > 0 then
			if form == "BAN" then
				for i, v in pairs(win) do
					unlockChair(v, "ufo")
				end
			elseif form == "LINK" then
				for i, v in pairs(win) do
					if ROUND.chair[PLAYER[v].chair].mimic then
						unlockChair(v, "bill")
					end
				end
			end
		end
		if #win == 1 then
			endGame(win[1], card, nil, form)
		elseif #win > 1 then
			for i, v in pairs(win) do
				unlockChair(v, "horn")
			end
			endGame(nil, nil, win, form)
		elseif live == 1 then
			endGame(live[1], nil, nil, "ELIMINATION")
		elseif live == 2 and ROUND.gameMode.team and ROUND.chair[live[1]].team == ROUND.chair[live[2]].team then
			endGame(live[1], nil, nil, "ELIMINATION")
		end
		return #win > 0
	end
end

function resetBatata(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "batata" then
			return false
		end
	end
	ROUND.chair[n].batata = 1
end

function batataTimer(n, dontReset)
	local found = false
	local index = false
	local locked = false
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "batata" then
			found = v
			index = i
		end
		if v.lock then
			v.lock = false
			locked = true
		end
	end
	if not dontReset then
		if ROUND.chair[n].cardsPlayed == 0 and ROUND.love ~= 0 then
			if PLAYER[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].faustao then
				tfm.exec.chatMessage("Reverse chain broke (batataTimer)", ROUND.chair[n].owner)
			end
			ROUND.love = 0
		end
		ROUND.chair[n].cardsPlayed = 0
	end
	if found then
		ROUND.chair[n].batata = ROUND.chair[n].batata + 1
		if ROUND.chair[n].batata > 5 then
			missCard(n, found, 2000)
			local card = table.remove(ROUND.chair[n].hand, index)
			eliminate(n)
			changeColorBatata(card)
			local pool = {}
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					table.insert(pool, i)
				end
			end
			local target = pool[math.random(#pool)]
			if target then
				table.insert(ROUND.chair[target].hand, card)
				missCard(target, card, 2000)
				explosion(5, ROUND.chair[target].x, 100, 5, 10)
				sortHand(ROUND.chair[target].hand)
				showCardsGainned(target, 1)
				updateHand(target)
				updateScore(target)
				if mustBeEliminated(target) then
					eliminate(target)
				end
			end
		else
			updateHand(n)
		end
	elseif locked then
		updateHand(n)
	else
		ROUND.chair[n].batata = 1
	end
	
end

function changeColorBatata(card)
	local pool = {red=1, blue=1, yellow=1, green=1}
	pool[card[1]] = nil
	local color = {}
	for i, v in pairs(pool) do
		table.insert(color, i)
	end
	--local color = {"red", "blue", "yellow", "green"}
	card[1] = color[math.random(#color)]
end

function actionCardEffect()
	local fx = {red=13, blue=1, yellow=11, green=9}
	y = 210 - (#ROUND.pile/108 * 10)
	for i=1, 10 do
		local vel = i/10*75
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 430, y+vel, -math.random(7,15)/5, (vel-37)/20, 0, 0)
	end
	for i=1, 10 do
		local vel = i/10*75
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 480, y+vel, math.random(7,15)/5, (vel-37)/20, 0, 0)
	end
end

function actionCard(n, action)
	ROUND.chair[n].action = {name="PLAY"}
	ROUND.time = GLOBAL_TIME + 10000
	addFunctionTimer(function()
		ROUND.chair[n].action = nil
		if action then
			action(n)
		else
			n0(n)
		end
	end, 1000)
end


function isCursed(n, curse)
	return ROUND.chair[n].curse == curse
end

function winningEffect()
	if ROUND.chatWarning then
		if ROUND.winningEffect then
			tfm.exec.removeImage(ROUND.winningEffect)
		end
		local winning = false
		local score = math.huge
		for i, v in pairs(ROUND.chair) do
			local qtd = scoreHand(i)
			if v.mode ~= "DELETED" and qtd < score then
				winning = i
				score = qtd
				if #v.hand == 0 then
					break
				end
			end
		end
		if winning then
			ROUND.winningEffect = tfm.exec.addImage(IMG.misc.winning, "!1000", ROUND.chair[winning].x-50, -5, p)
		end
	end
end

function isAstral()
	if ROUND and ROUND.state == "PLAY" then
		local cont = 0
		local all = 0
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				all = all + 1
				if #v.hand == 1 then
					cont = cont + 1
				end
			end
		end
		if cont == all and cont >= 6 then
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					unlockChair(v.owner, "astral")
				end
			end
		end
	end
end

function isCuphead()
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and #v.hand == 1 and v.hand2 and #v.hand2 == 1 then
			unlockChair(v.owner, "cuphead")
		end
	end
end

function isCoffee(p)
	if PLAYER[p] then
		if PLAYER[p].coffee then
			return os.time() - PLAYER[p].coffee > 14400000
		else
			PLAYER[p].coffee = os.time()
		end
	end
end 

function saidUno()
	for i, v in pairs(ROUND.chair) do
		if v.uno == "uno" then
			v.saidUno = true
		end
	end
end

function addBlockPoint(p)
	if PLAYER[p] and PLAYER[p].block and validRoom() then
		PLAYER[p].block = PLAYER[p].block + 1
		if PLAYER[p].block >= 100 then
			unlockChair(p, "football")
		end
	end
end

function shieldInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "half" then
			return true
		end
	end
end

function chestInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "chest" then
			return true
		end
	end
end

function tryDraw(n, qtd, ever, pass, recursion)
	if ROUND.chair[n].mode ~= "DELETED" then
		if not isCursed(n, "ice") then
			if isCursed(n, "anvil") then
				qtd = qtd + 1
			end
			if shieldInHand(n) and qtd > 1 then
				qtd = math.ceil(qtd / 2)
				missCard(n, {"black","half"}, 2000)
			end
			mimicDraw(n, qtd, recursion)
			if ROUND.chair[n].owner == "Icemice" then
				local pool = {}
				for i, v in pairs(ROUND.chair) do
					if i~=n and v.mode ~= "DELETED" then
						table.insert(pool, i)
					end
				end
				if #pool > 0 then
					local rand = pool[math.random(#pool)]
					tryDraw(rand, 1, false, false, true)
					local img = tfm.exec.addImage(IMG.misc.pow, "!1000", ROUND.chair[rand].x-50, 30)
					TIMER.img[img] = os.time()+1000
					explosion(11, ROUND.chair[rand].x, 80, 10, 20)
				end
			end
			if (isCursed(n, "thorn") or ever and ROUND.subitDeath) and ROUND.chair[n].owner ~= "Charlotte" then
				eliminate(n, pass)
			else
				drawCard(n, qtd)
				if mustBeEliminated(n) then
					eliminate(n, pass)
				end
			end
		else
			updateHand(n)
		end
	end
end

function whichCard(n, x)
	local chair = ROUND.chair[n]
	if #chair.hand > 16 then
		local i = #chair.hand
		while i > 0 do
			local xx = (i-1)/(#chair.hand-1)*750
			if x > xx and x < xx+50 then
				return i, chair.hand[i]
			end
			i = i - 1
		end
	else
		for i=1, #chair.hand do
			local xx = 400-#chair.hand*25+50*(i-1)
			if x > xx and x < xx+50 then
				return i, chair.hand[i]
			end
		end
	end
end

function whichPlayer(n, x)
	for i, v in pairs(ROUND.chair) do
		if x > v.x - 30 and x < v.x + 30 then
			return i
		end
	end
end

function nextChair(n)
	local sum = {LEFT = -1, RIGHT = 1}
	local cont = 20
	n = n or 1
	repeat
		n = n + sum[ROUND.flow or "LEFT"]
		n = n > #ROUND.chair and 1 or n < 1 and #ROUND.chair or n
		cont = cont - 1
		if cont <= 0 then
			n = nil
			break
		end
	until ROUND.chair[n].mode == "BUSY" or ROUND.chair[n].mode == "FREE"
	return n
end

function previousChair(n)
	local sum = {LEFT = 1, RIGHT = -1}
	repeat
		n = n + sum[ROUND.flow]
		n = n > #ROUND.chair and 1 or n < 1 and #ROUND.chair or n
	until ROUND.chair[n].mode == "BUSY" or ROUND.chair[n].mode == "FREE"
	return n
end

function giveCard(n, card, dontPass)
	explosion(5, ROUND.chair[n].x, 100, 5, 5)
	table.insert(ROUND.chair[n].hand, card)
	sortHand(ROUND.chair[n].hand)
	ROUND.chair[n].uno = nil
	updateHand(n)
	--updateShadow(n)
	updateScore(n)
	if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
		ROUND.chair[n].maxHand = #ROUND.chair[n].hand
	end
	if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
		unlockChair(ROUND.chair[n].owner, "trash")
	end
	showCardsGainned(n, 1)
	if not dontPass then
		passTurn()
		batataTimer(n)
	end
end

function sortHand(hand)
	table.sort(hand, function(a, b)
		if type(a) == "table" and type(b) == "table" then
			local s = {compass=-1, shield=0, n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9, skip=10, reverse=11, draw2=12, wild=13, simon=13, draw4=14, chair=15, carousel=16, spy=17 , flood=18, gift=19, imitate=20, death=21, peace=22, luck=23, web=24, box=25, wish=26, trade=27, meep=28, equality=29, rain=30, portal=31, rule=32, steal=33, thunder=34, ink=35, confuse=36, batata=37, curse=38, tornado=39, theft=40, ban=41, dice=42, paradox=43, oddeven=44, mimic=45, justice=46, key=47, share=48, pawn=60, rook=61, knight=62, bishop=63, queen=64, king=65, mix1=70, mix2=71, mix3=72, custom=80, clone=81, random=82, bomb=83, draw99=84, chest=100, magnet=200, half=300}
			local c = {red=0, blue=1, yellow=2, green=3, black=4}
			if a[1] == b[1] then
				return s[a[2]] < s[b[2]]
			else
				return c[a[1]] < c[b[1]]
			end
		end
	end)
end

function drawCardTracking(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	if ROUND.gameMode.fastdraw then
		if ROUND.chair[n].peace and not isNumeric(ROUND.deck[card]) then
			local new = drawCard(n, 1, "PASS", card)
				ROUND.chair[n].action = false
				if ROUND.gameMode.overload and #ROUND.chair[n].hand > 10 or bombInHand(n) or #ROUND.chair[n].hand > 30 then
					eliminate(n, true)
				elseif ROUND.gameMode.insatisfaction then
					ROUND.chair[n].confuse = false
					passTurn()
					batataTimer(n)
					updateHand(n)
				else
					if ROUND.gameMode.satisfaction and not canPlayHand(n) then
						ROUND.chair[n].draw = false
						showNeedDraw(n)
					else
						showPass(n)
					end
				end
		else
			ROUND.chair[n].action = false
			fastDraw(n, card)
		end
	else
		mimicDraw(n, 1)
		local new = drawCard(n, 1, "PASS", card)
		ROUND.chair[n].action = false
		if ROUND.gameMode.overload and #ROUND.chair[n].hand > 10 or bombInHand(n) or #ROUND.chair[n].hand > 30 then
			eliminate(n, true)
		elseif ROUND.gameMode.insatisfaction then
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
			updateHand(n)
		else
			if ROUND.gameMode.satisfaction and not canPlayHand(n) then
				ROUND.chair[n].draw = false
				showNeedDraw(n)
			else
				showPass(n)
			end
		end
	end
end

function drawCard(n, qtd, cause, card)
	showCardsGainned(n, qtd)
	local new = {}
	local temp = true
	if ROUND.chair[n].owner == "Ninguem_v2" and #ROUND.actionPool > qtd then
		for i=1, qtd do
			table.insert(ROUND.chair[n].hand, table.remove(ROUND.actionPool, math.random(#ROUND.actionPool)))
		end
	else
		for i=1, qtd do
			if #ROUND.deck == 0 and #ROUND.pile > 1 then
				repeat
					if ROUND.pile[1] and ROUND.pile[1][4] then
						ROUND.pile[1][1] = ROUND.pile[1][4]
						ROUND.pile[1][4] = nil
					end
					table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
				until #ROUND.pile <= 1
				ROUND.deck = shuffleDeck(ROUND.deck)
				for i, v in pairs(ROUND.topCard.img) do
					tfm.exec.removeImage(v)
				end
				drawTopCard()
				for i=1, 10 do
					tfm.exec.displayParticle(3, 345, 230, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
				end
				explosion(35, 400, 250, 20, 20)
			end
			if #ROUND.chair[n].hand < CONST.maxHand and #ROUND.deck > 0 then
				temp = card and table.remove(ROUND.deck, card) or table.remove(ROUND.deck)
				table.insert(ROUND.chair[n].hand, temp)
				table.insert(new, temp)
			end
		end
	end
	if ROUND.chair[n].uno then
		ROUND.chair[n].uno = nil
		ui.removeTextArea(6, ROUND.chair[n].owner)
	end
	if #ROUND.chair[n].hand == 2 and canPlayHand(n) then
		showUno(n)
	end
	updateScore(n)
	sortHand(ROUND.chair[n].hand)
	updateHand(n, qtd == 1 and new or nil)
	showDeck()
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	if cause ~= "START" and qtd > ROUND.chair[n].maxDraw then
		ROUND.chair[n].maxDraw = qtd
		if qtd >= 16 and ROUND.accumulated then
			unlockChair(ROUND.chair[n].owner, "cards")
			for i, v in pairs(ROUND.accumulated.player) do
				if ROUND.chair[n].owner ~= i then
					unlockChair(i, "hell")
				end
			end
		end
	end
	if ROUND.accumulated then
		for i, v in pairs(ROUND.accumulated.player) do
			if ROUND.chair[n].owner == i then
				unlockChair(i, "circus")
				break
			end
		end
	end
	if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
		ROUND.chair[n].maxHand = #ROUND.chair[n].hand
	end
	if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
		unlockChair(ROUND.chair[n].owner, "trash")
	end
	if isIlluminati(n) then
		unlockChair(ROUND.chair[n].owner, "illuminati")
	end
	return temp
end

function drawCard2(n, qtd)
	if ROUND.chair[n].owner == "Ninguem_v2" and #ROUND.actionPool > qtd then
		for i=1, qtd do
			table.insert(ROUND.chair[n].hand2, table.remove(ROUND.actionPool, math.random(#ROUND.actionPool)))
		end
	else
		for i=1, qtd do
			table.insert(ROUND.chair[n].hand2, table.remove(ROUND.deck2))
		end
	end
	sortHand(ROUND.chair[n].hand2)
end

function discardCard(n, qtd)
	showCardsGainned(n, -qtd)
	for i=1, qtd do
		if #ROUND.chair[n].hand == 0 then
			break
		end
		local rand = math.random(#ROUND.chair[n].hand)
		discardEffect(n, rand)
		local discarted = table.remove(ROUND.chair[n].hand, rand)
		discarted.lock = false
		if not discarted[3] then
			table.insert(ROUND.pile, 1, discarted)
		end
	end
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].uno = "uno"
	end
	updateScore(n)
	drawTopCard()
	updateHand(n)
end

function changeHand(n)
	ROUND.chair[n].change = true
	ui.removeTextArea(28, ROUND.chair[n].owner)
	local qtd = #ROUND.chair[n].hand
	repeat
		table.insert(ROUND.deck, table.remove(ROUND.chair[n].hand))
	until #ROUND.chair[n].hand == 0
	ROUND.deck = shuffleDeck(ROUND.deck)
	drawCard(n, qtd, "MULLIGAN")
end

function playCard(n, card, start, jumpin, fastDraw)
	-- validando valores
	checkVars("playCard", {n, card}, {"number", {"number", "table"}})
	if not fastDraw then
		mimicDiscard(n, 1)
	end
	
	window.close(ROUND.chair[n].owner, "CHALLENGE")
	if not PLAYER[ROUND.chair[n].owner] or n ~= ROUND.turn or ROUND.chair[n].action then
		return false
	end
	local p = ROUND.chair[n].owner
	PLAYER[p].antiDoubleClick3 = PLAYER[p].antiDoubleClick3 or (os.time() - 5)
	if PLAYER[p].antiDoubleClick3 < os.time() or ever then
		PLAYER[p].antiDoubleClick3 = os.time() + 200
	else
		return false
	end
	if not start then
		ROUND.chair[n].cardsPlayed = ROUND.chair[n].cardsPlayed or 0
		ROUND.chair[n].cardsPlayed = ROUND.chair[n].cardsPlayed + 1
		if ROUND.chair[n].cardsPlayed >= 4 then
			unlockChair(ROUND.chair[n].owner, "space")
		end
		if PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage("Cards in this turn: ".. ROUND.chair[n].cardsPlayed, ROUND.chair[n].owner)
		end
	end
	if ROUND.chair[n].skin.id == "bog" and not PLAYER[ROUND.chair[n].owner].bell and math.random() > 0.7 then
		local x = ROUND.chair[n].x + (tfm.get.room.playerList[ROUND.chair[n].owner].isFacingRight and -15 or 15)
		tfm.exec.displayParticle(3, x, 110, 0, -1.7, 0, 0.05)
	end
	local hand = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		table.insert(hand, v)
	end
	for i, v in pairs(ROUND.chair) do
		if i ~= n and BOT[v.owner] and BOT[v.owner].eventRandom then
			BOT[v.owner].eventRandom(ROUND.chair[n].owner)
		end
	end
	local color = {"red","blue","yellow","green"}
	ROUND.topCard.card2 = ROUND.topCard.card or {color[math.random(#color)], "wild"}
	ROUND.chair[n].playedChair = true
	
	if type(card) == "table" then
		if not card[3] then
			table.insert(ROUND.pile, card)
		end
		ROUND.topCard.card = {card[1], card[2]}
	else
		discardEffect(n, card)
		card = table.remove(ROUND.chair[n].hand, card)
		if ROUND.gameMode.hell and card[1] ~= ROUND.topCard.card[1] and card[2] ~= ROUND.topCard.card[2] and card[1] ~= "black" then
			unlockChair(ROUND.chair[n].owner, "kratos")
		end
		if not card[3] then
			table.insert(ROUND.pile, card)
		end
		ROUND.topCard.card = {card[1], card[2]}
		updateScore(n)
		isAstral()
		isCuphead()
	end
	ROUND.love = ROUND.love or 0
	if card[2] ~= "reverse" and ROUND.love ~= 0 then
		if PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage("Reverse chain broke.", ROUND.chair[n].owner)
		end
		ROUND.love = 0
	end
	if ROUND.gameMode.black and (ROUND.topCard.card[1] == ROUND.topCard.card2[1]) and (ROUND.topCard.card[2] == ROUND.topCard.card2[2]) and ROUND.topCard.card[1] ~= "black" then
		local fx = {red=13, blue=1, yellow=11, green=9}
		local y = 210 - (#ROUND.pile/108 * 10)
		discardEffectRaw(430, y, fx[ROUND.topCard.card[1]])
		ROUND.topCard.card[1] = "black"
	end
	local y = drawTopCard()
	if ROUND.chair[n].played then
		local fx = {9, 2, 29, 3}
		for i=1, 20 do
			tfm.exec.displayParticle(fx[math.random(#fx)], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	else
		for i=1, 10 do
			tfm.exec.displayParticle(3, 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	end
	ROUND.chair[n].afk = false
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	if #ROUND.chair[n].hand == 0 then
		actionCardEffect()
		ROUND.chair[n].action = {name="PLAY"}
		ROUND.time = GLOBAL_TIME + 10000
		addFunctionTimer(function()
			ROUND.chair[n].action = nil
			--endGame(ROUND.chair[n].owner, card, false, jumpin and "JUMPIN")
			isEndGame(jumpin and "JUMPIN" or "PLAY")
		end, 1000)
	else
		if isNumeric(ROUND.topCard.card) then
			if jumpin then
				actionCardEffect()
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				addFunctionTimer(function()
					ROUND.chair[n].action = nil
					if _G[ROUND.topCard.card[2]] then
						_G[ROUND.topCard.card[2]](n, start, hand)
					else
						n0(n, start, hand)
					end
					updateShadow(n)
				end, 1000)
			else
				_G[ROUND.topCard.card[2]](n, start, hand)
			end
		elseif ROUND.chair[n].peace2 then
			if validRoom() then
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action or 0
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action + 1
				if PLAYER[ROUND.chair[n].owner].action >= 5000 then
					unlockChair(ROUND.chair[n].owner, "quartz")
				end
			end
			if isCursed(n, "shoe") then
				drawCard(n, 1)
				if mustBeEliminated(n) then
					eliminate(n)
				end
			end
			if ROUND.topCard.card[1] == "black" then
				ROUND.topCard.card[1] = ROUND.topCard.card2[1]
				drawTopCard()
			end
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
		else
			if validRoom() then
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action or 0
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action + 1
				if PLAYER[ROUND.chair[n].owner].action >= 5000 then
					unlockChair(ROUND.chair[n].owner, "quartz")
				end
			end
			actionCardEffect()
			ROUND.chair[n].action = {name="PLAY"}
			ROUND.time = GLOBAL_TIME + 10000
			addFunctionTimer(function()
				if ROUND.state == "PLAY" then
					ROUND.chair[n].action = nil
					if isCursed(n, "shoe") then
						drawCard(n, 1)
					end
					if mustBeEliminated(n) then
						if ROUND.topCard.card[1] == "black" then
							ROUND.topCard.card[1] = ROUND.topCard.card2[1]
							drawTopCard()
						end
						eliminate(n)
						passTurn()
					else
						if _G[ROUND.topCard.card[2]] then
							_G[ROUND.topCard.card[2]](n, start, hand)
						else
							n0(n, start, hand)
						end
					end
					updateShadow(n)
				end
			end, 1000)
		end
	end
	updateHand(n)
end

function shuffleDeck(deck)
	local new = {}
	for i=1, #deck do
		table.insert(new, table.remove(deck, math.random(#deck)))
	end
	return new
end

function passTurn(skipped)
	if ROUND.state ~= "PLAY" then
		return false
	end
	if isEndGame("LINK") then return end
	for i, v in pairs(tfm.get.room.playerList) do
		window.close(i, "CHALLENGE")
	end
	for i, v in pairs(ROUND.chair) do
		v.draw = false
		v.played = false
		v.whiteList = false
		v.autoPlay = false
		if #v.hand > 1 then
			ui.removeTextArea(6, v.owner)
		end
	end
	isAstral()
	isCuphead()
	saidUno()
	showAccumulated()
	ui.removeTextArea(7)
	ui.removeTextArea(19)
	local cont = 0
	local name = ""
	limboTimer()
	updateCurse()
	if ROUND.chair[ROUND.turn].uno == "one card" and #ROUND.chair[ROUND.turn].hand == 1 and ROUND.chair[ROUND.turn].mode ~= "DELETED" then
		for i, v in pairs(ROUND.chair) do
			if i ~= ROUND.turn and v.mode == "BUSY" then
				showChallenge(i)
			end
		end
	elseif #ROUND.chair[ROUND.turn].hand ~= 1 then
		ROUND.chair[ROUND.turn].uno = nil
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" then
			cont = cont + 1
			name = v.owner
		end
	end
	ui.removeTextArea(5)
	ROUND.turn = nextChair(ROUND.turn)
	if cont == 1 then
		endGame(name)
	elseif ROUND.turn then
		updateArrow()
		if PLAYER[ROUND.chair[ROUND.turn].owner] and PLAYER[ROUND.chair[ROUND.turn].owner].bell and tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner] then
			tfm.exec.killPlayer(ROUND.chair[ROUND.turn].owner)
			tfm.exec.respawnPlayer(ROUND.chair[ROUND.turn].owner)
			tfm.exec.movePlayer(ROUND.chair[ROUND.turn].owner, tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner].x, tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner].y)
		end
		if ROUND.chair[ROUND.turn].peace then
			if ROUND.chair[ROUND.turn].peace > 1 then
				ROUND.chair[ROUND.turn].peace = ROUND.chair[ROUND.turn].peace - 1
				ui.addTextArea(19, "<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[ROUND.turn].owner, "ONLY_NUMBERS"), ROUND.chair[ROUND.turn].owner, 100, 305, 600, nil, 0, 0, 0, false)
			else
				ROUND.chair[ROUND.turn].peace = nil
			end
		end
		if ROUND.chair[ROUND.turn].peace2 then
			if ROUND.chair[ROUND.turn].peace2 > 1 then
				ROUND.chair[ROUND.turn].peace2 = ROUND.chair[ROUND.turn].peace2 - 1
			else
				ROUND.chair[ROUND.turn].peace2 = nil
			end
		end
		if ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "SKIP" then
			local turn = ROUND.turn
			addFunctionTimer(function()
				if turn ~= ROUND.turn then
					return
				end
				if not isCursed(ROUND.turn, "ice") then
					if ROUND.accumulated then
						if isCursed(ROUND.turn, "thorn") then
							eliminate(ROUND.turn)
						else
							drawCard(ROUND.turn, ROUND.accumulated.cards)
							if mustBeEliminated(ROUND.turn) then
								eliminate(ROUND.turn)
							end
						end
						ROUND.accumulated = false
						ui.removeTextArea(2)
					end
				else
					ROUND.accumulated = false
					ui.removeTextArea(2)
				end
				for i, v in pairs(ROUND.chair[ROUND.turn].action.img) do
					tfm.exec.removeImage(v)
				end
				explosion(1, ROUND.chair[ROUND.turn].x, 80, 20, 30)
				ROUND.chair[ROUND.turn].action = false
				passTurn()
				updateShadow(ROUND.turn)
			end, 1000)
		else
			ROUND.chair[ROUND.turn].mimic = false
			if #ROUND.chair[ROUND.turn].hand == 2 and canPlayHand(ROUND.turn) then
				if BOT[ROUND.chair[ROUND.turn].owner] then
					ROUND.chair[ROUND.turn].uno = "uno"
				else
					showUno(ROUND.turn)
				end
			end
			if (not ROUND.gameMode.nochallenge and ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.accumulated then
				showChallenge(ROUND.turn)
			end
			if not canPlayHand(ROUND.turn) or ROUND.accumulated then
				showNeedDraw(ROUND.turn)
			end
			if ROUND.accumulated then
				local txt = ""
				if ROUND.gameMode.supercombo then
					if ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99" then
						if ROUND.gameMode.nochallenge then
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS_FOUR_ANTICHALLENGE"))
						else
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS_FOUR"))
						end
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS"))
					end
				elseif ROUND.gameMode.hell then
					if ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99" then
						if ROUND.gameMode.nochallenge then
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL_FOUR_ANTICHALLENGE"))
						else
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL_FOUR"))
						end
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL"))
					end
				elseif ROUND.accumulated.allowed.draw2 then
					txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_TWO"))
				elseif ROUND.accumulated.allowed.draw4 then
					if ROUND.gameMode.nocombo then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_CHALLENGE"))
					elseif ROUND.accumulated.nochallenge then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_FOUR_ANTICHALLENGE"))
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_FOUR"))
					end
				end
				ui.addTextArea(19, string.format(txt, ROUND.accumulated.cards), ROUND.chair[ROUND.turn].owner, 100, 305, 600, nil, 0, 0, 0, false)
			else
				ROUND.chair[ROUND.turn].playedChair = true
			end
			updateShadow(ROUND.turn)
		end
		resetTimer()
		updateTurnTimer()
		winningEffect()
	else
		endGame()
	end
end

function validPlay(hand, card)
	if ROUND.accumulated then
		for i, v in pairs(hand) do
			if ROUND.accumulated.allowed[v[2]] then
				return true
			end
		end
	else
		for i, v in pairs(hand) do
			if v == true or ((v[1] == "black" or card[1] == v[1] or card[2] == v[2]) and (isNumeric(v) or not ROUND.chair[ROUND.turn].peace)) then
				return true
			end
			if ROUND.gameMode.hell and not isNumeric(v) and not isNumeric(card) and not ROUND.chair[ROUND.turn].peace then
				return true
			end
		end
	end
end

function validPlayColor(hand, card)
	for i, v in pairs(hand) do
		if card[1] == v[1] then
			return true
		end
	end
end

function validPlayNumber(hand, card)
	for i, v in pairs(hand) do
		if card[2] == v[2] then
			return true
		end
	end
end

function validPlayNumberColor(hand, card)
	for i, v in pairs(hand) do
		if card[2] == v[2] and card[1] == v[1] then
			return true
		end
	end
end

function validPlaySame(hand, card)
	for i, v in pairs(hand) do
		if card[1] == v[1] and card[2] == v[2] then
			return true
		end
	end
end

function sayUno(n)
	ROUND.chair[n].uno = "uno"
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].saidUno = true
		updateScore(n)
	end
	ui.removeTextArea(6, ROUND.chair[n].owner)
	ui.removeTextArea(7)
	if ROUND.accumulated and ROUND.topCard.card[2] == "draw4" then
		showChallenge(ROUND.turn)
	end
	for i, v in pairs(ROUND.chair) do
		if v.uno == "one card" and ROUND.turn ~= i then
			for j, w in pairs(ROUND.chair) do
				if j ~= i then
					showChallenge(j)
				end
			end
		end
	end
	if ROUND.chair[n].skin.id == "psycho" then
		local img = tfm.exec.addImage(IMG.misc.psychoBlink, "_1000", ROUND.chair[n].x-50, 20)
		TIMER.img[img] = os.time()+500
	end
	for i=1, 20 do
		local vx = (math.random()-0.5) * 5
		local vy = (math.random()-1) * 5
		tfm.exec.displayParticle(math.random(21, 24), 720, 220, vx, vy, 0, 0.1, ROUND.chair[n].owner)
	end
end

function clickChallenge(n)
	local findPlayer = false
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" and v.uno == "one card" and i ~= ROUND.turn and #v.hand == 1 then
			tryDraw(i, ROUND.gameMode.hard and 4 or 2, true)
			unlockChair(ROUND.chair[n].owner, "rip")
			findPlayer = true
			local img = tfm.exec.addImage(IMG.misc.challenge, "!1000", ROUND.chair[n].x-50, 30)
			local img2 = tfm.exec.addImage(IMG.misc.fail, "!1000", v.x-50, 30)
			ui.addTextArea(21, string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "UNO_FAIL")), v.owner, 200, 305, 400, nil, 0, 0, 0, false)
			table.insert(TIMER.txt, {time=os.time()+5000, id=21, player=v.owner})
			TIMER.img[img] = os.time()+2000
			TIMER.img[img2] = os.time()+2000
		end
	end
	if findPlayer then
		ui.removeTextArea(7)
		if (ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.accumulated then
			showChallenge(ROUND.turn)
		end
	elseif (not ROUND.gameMode.nochallenge and ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.turn == n and ROUND.accumulated and not ROUND.accumulated.click and not ROUND.chair[n].action then
		-- COLOCAR PRA APARECER A JANELA AQUI
		if PLAYER[ROUND.chair[n].owner].challengePopup then
			closeAll(ROUND.chair[n].owner, "CHALLENGE")
			window.open(ROUND.chair[n].owner, "CHALLENGE", ROUND.topCard.card2)
		else
			challengeDrawFour(n)
		end
	end
end

function challengeDrawFour(n)
	if ROUND.accumulated.click then
		return false
	end
	ui.removeTextArea(7, ROUND.chair[n].owner)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	ROUND.accumulated.click = true
	ROUND.time = GLOBAL_TIME + 10000
	ui.removeTextArea(2)
	ui.removeTextArea(7)
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	local img = {
		tfm.exec.addImage(IMG.misc.challenge, "!1000", ROUND.chair[n].x-50, 30),
	}
	local prev = ROUND.accumulated.n
	local hand = ROUND.accumulated.hand
	local namePlayer = ROUND.accumulated.p
	local win = false
	local card = false
	local bg = {blue=true, green=true}
	for i in ipairs(hand) do
		if hand[i][1] == ROUND.topCard.card2[1] or (ROUND.gameMode.bluegreen and bg[hand[i][1]] and bg[ROUND.topCard.card2[1]]) then
			win = true
			card = hand[i]
		end
	end
	ROUND.chair[n].action = {name="challenge"}
	if validRoom() then
		local p = ROUND.chair[n].owner
		if win and PLAYER[p].challenge then
			PLAYER[p].challenge = PLAYER[p].challenge + 1
			if PLAYER[p].challenge >= 3 then
				unlockChair(p, "got")
			end
		else
			PLAYER[p].challenge = 0
		end
		saveData(p)
	end
	addFunctionTimer(function(w, im, nn, p)
		if ROUND.state ~= "PLAY" then
			return false
		end
		for i, v in pairs(im) do
			tfm.exec.removeImage(v)
		end
		ui.removeTextArea(19)
		ui.removeTextArea(21)
		local qtd = 4
		if ROUND.topCard.card[2] == "draw99" then
			qtd = 99
		end
		if ROUND.accumulated then
			if w then
				missCard(p, card, 2000)
				if ROUND.accumulated.cards > qtd then
					tryDraw(p, qtd, true, true)
					tryDraw(nn, ROUND.accumulated.cards-qtd, true)
				else
					tryDraw(p, ROUND.accumulated.cards, true)
				end
				ROUND.accumulated = nil
				showAccumulated()
				local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = os.time()+2000
				if #ROUND.chair[n].hand == 2 and canPlayHand(n) then
					showUno(n)
				end
				updateShadow(n)
			else
				local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = os.time()+2000
				if ROUND.turn == n then
					tryDraw(nn, ROUND.accumulated.cards+2, true)
					ROUND.accumulated = nil
					passTurn()
					updateShadow(n)
					batataTimer(n)
				end
			end
		end
		ROUND.chair[n].action = nil
	end, 3000, win, img, n, prev)
end

function isNumeric(card)
	local can = {n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9}
	return can[card[2]]
end

function fastDraw(n, pos)
	if #ROUND.deck == 0 and #ROUND.pile > 1 then
		repeat
			if ROUND.pile[1][4] then
				ROUND.pile[1][1] = ROUND.pile[1][4]
				ROUND.pile[1][4] = nil
			end
			table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
		until #ROUND.pile == 1
		ROUND.deck = shuffleDeck(ROUND.deck)
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 210, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
		drawTopCard()
	end
	if ROUND.chair[n].peace and not pos and not isNumeric(ROUND.deck[#ROUND.deck]) then
		drawCard(n, 1)
		if bombInHand(n) then
			eliminate(n, true)
		else
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
		end
	else
		if isCursed(n, "anvil") then
			drawCard(n, 0)
		end
		local card = pos and table.remove(ROUND.deck, pos) or table.remove(ROUND.deck)
		showDeck()
		ROUND.chair[n].maxDraw = 1
	if card then
		if card[2] == "bomb" then
			table.insert(ROUND.pile, card)
			eliminate(n, true)
		else
			explosion(35, 400, 250, 20, 20)
			playCard(n, card, false, false, true)
		end
	else
		ROUND.chair[n].confuse = false
		passTurn()
		batataTimer(n)
		end
	end
end

function isIlluminati(n)
	if CONFIG.ranked and not ROUND.chair[n].illuminati then
		local cont = 0
		for i, v in pairs(ROUND.chair[n].hand) do
			if v[2] == "draw4" then
				cont = cont + 1
			end
		end
		if cont == 4 then
			ROUND.chair[n].illuminati = true
			unlockChair(ROUND.chair[n].owner, "illuminati")
		end
	end
end

function autoPlay()
	local chair = ROUND.chair[ROUND.turn]
	local turn = ROUND.turn
	local n = ROUND.turn
	local afk = ROUND.chair[ROUND.turn].afk
	local autoplay = chair.autoPlay
	if chair.mode == "BUSY" then
		BOT.B.autoPlay()
		if afk and not autoplay and chair.mode ~= "DELETED" then
			kickPlayer(chair.owner, false)
		end
		chair.autoPlay = true
	elseif chair.mode == "FREE" then
		if ROUND.accumulated and ROUND.subitDeath then
			eliminate(ROUND.turn, true)
		else
			if ROUND.accumulated then
				drawCard(ROUND.turn, ROUND.accumulated.cards, "PENALTY")
				ROUND.accumulated = nil
				ui.removeTextArea(2)
			end
			if chair.team then
				ROUND.team[chair.team][ROUND.turn] = nil
				chair.team = false
			end
			repeat
				local card = table.remove(chair.hand)
				if card and not card[3] then
					table.insert(ROUND.pile, 1, card)
				end
			until #chair.hand <= 0
			drawTopCard()
			passTurn()
			chair.mode = "DELETED"
			ui.removeTextArea(n+1000)
			ui.removeTextArea(n+1010)
			for i, v in pairs(chair.skin.img) do
				tfm.exec.removeImage(v)
			end
			batataTimer(n)
			local cont = 0
			local name = ""
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					cont = cont + 1
					name = v.owner
				end
			end
			if cont == 1 then
				endGame(name)
			end
		end
	else
		passTurn()
	end
end

function tracking(n)
	local o = {}
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if #ROUND.deck == 0 then
		repeat
			if ROUND.pile[1] and ROUND.pile[1][4] then
				ROUND.pile[1][1] = ROUND.pile[1][4]
				ROUND.pile[1][4] = nil
			end
			table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
		until #ROUND.pile <= 1
		ROUND.deck = shuffleDeck(ROUND.deck)
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 230, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
		explosion(35, 400, 250, 20, 20)
		drawTopCard()
		showDeck()
	end
	if #ROUND.deck > 0 then
		for i=1, 3 do
			table.insert(o, math.random(#ROUND.deck))
		end
		local player = ROUND.chair[n].owner
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!1000", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.deck[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.deck[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.deck[o[3]], 470, 200, player, "!1000", "big")
		local images = {img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		ROUND.chair[n].action = {
			name = "TRACKING",
			img = images,
			card = o
		}
	else
		ui.removeTextArea(18)
		ROUND.chair[n].draw = true
		showPass(n)
	end
	resetTimer()
	updateTurnTimer()
end

function eliminate(n, pass, final)
	if ROUND.chair[n].owner ~= "Charlotte" and ROUND.chair[n].mode ~= "DELETED" then
		for i, v in pairs(ROUND.chair) do
			if BOT[v.owner] and BOT[v.owner].eventEliminate then
				BOT[v.owner].eventEliminate(ROUND.chair[n].owner)
			end
		end
		local chair = ROUND.chair[n]
		if PLAYER[chair.owner] then
			PLAYER[chair.owner].match = "x"
			saveData(chair.owner)
		end
		local pool = {0, 2, 3, 11, 13}
			for i=1, 40 do
				local vx = (math.random()-0.5) * 5
				local vy = (math.random()-0.5) * 5
				local particle = pool[math.random(#pool)]
				tfm.exec.displayParticle(particle, chair.x, 140, vx, vy, 0, 0)
			end
		local p = chair.owner
		chair.score = scoreHand(n)
		if p == "Snowy" then
			chair.mode = "DELETED"
			local chairs = {}
			local cardsByChairs = {}
			for i, v in pairs(ROUND.chair) do
				if i ~= n and v.mode ~= "DELETED" then
					table.insert(chairs, i)
					cardsByChairs[i] = 0
				end
			end
			for i=1, #chair.hand do
				local rand = chairs[math.random(#chairs)]
				cardsByChairs[rand] = cardsByChairs[rand] + 1
			end
			for i, v in pairs(cardsByChairs) do
				if v > 0 then
					local card = false
					for j=1, v do
						card = table.remove(chair.hand, math.random(#chair.hand))
						table.insert(ROUND.chair[i].hand, card)
					end
					sortHand(ROUND.chair[i].hand)
					updateHand(i)
					updateScore(i)
					explosion(5, ROUND.chair[i].x, 100, 5, 10)
					missCard(i, card, 2000)
					showCardsGainned(i, v)
					if mustBeEliminated(i) then
						eliminate(i)
					end
				end
			end
		else
			for i=1, #chair.hand do
				local card = chair.hand[i]
				if card and not card[3] then
					table.insert(ROUND.pile, 1, card)
				end
			end
		end
		drawTopCard()
		if pass then
			passTurn()
		end
		chair.mode = "DELETED"
		system.bindMouse(p, false)
		tfm.exec.giveMeep(p, false)
		drawChair(n)
		for i, v in pairs(chair.imgHand) do
			tfm.exec.removeImage(v)
		end
		for i, v in pairs(chair.imgShadow) do
			tfm.exec.removeImage(v)
		end
		if chair.action then
			for i, v in pairs(chair.action.img or {}) do
				tfm.exec.removeImage(v)
			end
		end
		if chair.outChair then
			tfm.exec.removeImage(chair.outChair)
			ui.removeTextArea(15, p)
			ui.removeTextArea(16, p)
			chair.outChair = nil
		end
		if chair.team then
			ROUND.team[chair.team][n] = nil
			chair.team = nil
		end
		ui.removeTextArea(5, p)
		ui.removeTextArea(6, p)
		ui.removeTextArea(7, p)
		ui.removeTextArea(10, p)
		ui.removeTextArea(11, p)
		ui.removeTextArea(12, p)
		ui.removeTextArea(15, p)
		ui.removeTextArea(16, p)
		ui.removeTextArea(18, p)
		ui.removeTextArea(19, p)
		if PLAYER[p] then
			PLAYER[p].chair = nil
		end
		if not final then
			local cont = {}
			local name = ""
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					table.insert(cont, i)
					name = v.owner
				end
			end
			if #cont == 1 then
				endGame(name, nil, nil, "ELIMINATION")
			elseif #cont == 2 and ROUND.gameMode.team then
				local win = true
				local team = ROUND.chair[PLAYER[name].chair].team
				for i, v in pairs(cont) do
					if not ROUND.team[team][v] then
						win = false
						break
					end
				end
				if win then
					endGame(name, nil, nil, "ELIMINATION")
				end
			end
		end
	elseif pass then
		passTurn()
	end
end

function jumpIn(ini, final)
	if ROUND.love ~= 0 then
		if PLAYER[ROUND.chair[final].owner].faustao then
			tfm.exec.chatMessage("Reverse chain broke (passTurn)", ROUND.chair[final].owner)
		end
		ROUND.love = 0
	end
	if ROUND.chair[ini].action then
		for i, v in pairs(ROUND.chair[n].action.img or {}) do
			tfm.exec.removeImage(v)
		end
	end
	for i, v in pairs(tfm.get.room.playerList) do
		window.close(i, "CHALLENGE")
	end
	ROUND.chair[ini].action = nil
	repeat
		explosion(35, ROUND.chair[ROUND.turn].x, 80, 10, 10)
		local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
		TIMER.img[img] = os.time()+500
		ROUND.chair[ROUND.turn].peace = nil
		if ROUND.chair[ROUND.turn].peace2 then
			ROUND.chair[ROUND.turn].peace2 = ROUND.chair[ROUND.turn].peace2 - 1
			if ROUND.chair[ROUND.turn].peace2 < 1 then
				ROUND.chair[ROUND.turn].peace2 = nil
			end
		end
		ROUND.turn = nextChair(ROUND.turn)
	until ROUND.turn == final
	explosion(11, ROUND.chair[final].x, 80, 40, 30)
	if #ROUND.chair[final].hand == 2 then
		ROUND.chair[final].uno = "uno"
	end
	updateArrow()
	updateShadow(ini)
end

function yetPlaying(p)
	for i, v in pairs(ROUND.chair or {}) do
		if p == v.owner then
			return true
		end
	end
end