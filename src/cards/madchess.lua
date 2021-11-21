function effectPawn(n)
	tryDraw(previousChair(n), 1)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectRook(n)
	tryDraw(previousChair(n), 2)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectKnight(n)
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	ROUND.turn = nextChair(ROUND.turn)
	tryDraw(ROUND.turn, 1)
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	batataTimer(n)
	updateHand(n)
	ROUND.chair[n].confuse = false
end

function effectBishop(n)
	makeGift(n, previousChair(n), 1)
end

function effectQueen(n)
	local prev = previousChair(n)
	if #ROUND.chair[prev].hand < 10 then
		tryDraw(prev, 10-#ROUND.chair[prev].hand)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectKing(n)
	makeGift(n, previousChair(n), #ROUND.chair[n].hand-1)
end

function pawn(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local effect = {pawn=effectPawn, rook=effectRook, bishop=effectBishop, knight=effectKnight, queen=effectQueen, king=effectKing}
	local text = {pawn="KILL_PAWN", rook="KILL_ROOK", bishop="KILL_BISHOP", knight="KILL_KNIGHT", queen="KILL_QUEEN", king="KILL_KING"}
	if effect[ROUND.topCard.card2[2]] then
		if validRoom() then
			local player = ROUND.chair[n].owner
			PLAYER[player].chess = PLAYER[player].chess + 1
			if PLAYER[player].chess >= 25 then
				unlockChair(player, "chess")
			end
		end
		effect[ROUND.topCard.card2[2]](n)
		local y = 195 - (#ROUND.pile/108 * 10)
		for i, v in pairs(tfm.get.room.playerList) do
			ui.addTextArea(34, string.format("<p align='center'><font color='#ffffff'>%s", translate(i, text[ROUND.topCard.card2[2]])), i, 400, y, 110, nil, 0, 0, 0, false)
		end
		table.insert(TIMER.txt, {time=os.time()+2000, id=34})
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end
rook, knight, bishop = pawn, pawn, pawn

function queen(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","queen"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","queen"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","queen"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","queen"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end

function king(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","king"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","king"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","king"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","king"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end