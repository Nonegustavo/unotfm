function ban(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if #ROUND.pile > 1 then
		local o = {}
		local pool = {}
		local rand = false
		for i, v in pairs(ROUND.chair[n].hand) do
			table.insert(pool, i)
		end
		for i=1, 3 do
			if #pool >= 1 then
				rand = table.remove(pool, math.random(#pool))
			end
			table.insert(o, rand)
		end
		local player = ROUND.chair[n].owner
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!100", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.chair[n].hand[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.chair[n].hand[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.chair[n].hand[o[3]], 470, 200, player, "!1000", "big")
		local images = {img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		ROUND.chair[n].action = {
			name = "BAN",
			img = images,
			card = o
		}
		resetTimer()
		updateTurnTimer()
	else
		passTurn()
		batataTimer(n)
	end
end

function banCard(deck, card)
	local lastCard = false
	local qtd = 0
	repeat
		local notFind = true
		for i, v in pairs(deck) do
			if card[2] == v[2] then
				qtd = qtd + 1
				lastCard = v
				notFind = false
				table.remove(deck, i)
				break
			end
		end
	until notFind
	return lastCard, qtd
end

function makeBan(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].action = false
	local choice = ROUND.chair[n].hand[card]
	local rand = math.random(#ROUND.chair[n].hand)
	banCard(ROUND.pile, choice)
	banCard(ROUND.deck, choice)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			local c, qtd = banCard(v.hand, choice)
			if c then
				missCard(i, c, 2000)
				local img = tfm.exec.addImage(IMG.misc.burn, "!1000", v.x-25, 20)
				TIMER.img[img] = os.time()+2000
				if #v.hand == 1 then
					v.uno = "uno"
				end
				showCardsGainned(i, -qtd)
				updateHand(i)
				updateScore(i)
			end
		end
	end
	ROUND.gameMode[choice[2]] = nil
	drawTopCard()
	showDeck()
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
	end
	if not isEndGame("BAN") then
		passTurn()
		batataTimer(n)
	end
end