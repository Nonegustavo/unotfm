function wish(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if #ROUND.pile > 1 then
		local o = {}
		for i=1, 3 do
			table.insert(o, math.random(#ROUND.pile-1))
		end
		local player = ROUND.chair[n].owner
		--local y = drawTopCard()
		--local top = tfm.exec.addImage(IMG.misc.wish, "!0", 405, y-25)
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!100", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.pile[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.pile[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.pile[o[3]], 470, 200, player, "!1000", "big")
		local images = {img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		local card1 = ROUND.pile[o[1]]
		local card2 = ROUND.pile[o[2]]
		local card3 = ROUND.pile[o[3]]
		if card1[1] == card2[1] and card1[2] == card2[2] and card1[1] == card3[1] and card1[2] == card3[2] then
			unlockChair(ROUND.chair[n].owner, "shenlong")
		end
		ROUND.chair[n].action = {
			name = "WISH",
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

function makeWish(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].action = false
	local choice = table.remove(ROUND.pile, card)
	local rand = math.random(#ROUND.chair[n].hand)
	discardEffect(n, rand)
	local discard = table.remove(ROUND.chair[n].hand, rand)
	if not discard[3] then
		table.insert(ROUND.pile, 1, discard)
	end
	table.insert(ROUND.chair[n].hand, choice)
	if discard[1] == "black" then
		unlockChair(ROUND.chair[n].owner, "font")
	end
	sortHand(ROUND.chair[n].hand)
	missCard(n, choice, 2000)
	explosion(5, ROUND.chair[n].x, 100, 5, 10)
	passTurn()
	batataTimer(n)
	updateHand(n)
end