function draw4(n, hand)
	ui.removeTextArea(2)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	local target = nextChair(n)
	if ROUND.chair[target].action and ROUND.chair[target].action.name == "SKIP" then
		unlockChair(ROUND.chair[n].owner, "pumpkin")
	end
	if not ROUND.gameMode.nochallenge or not ROUND.gameMode.nocombo then
		if ROUND.accumulated then
			ROUND.accumulated.cards = ROUND.accumulated.cards + 4
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			addBlockPoint(ROUND.chair[n].owner)
			--
			if not hand then
				hand = {}
				for i, v in pairs(ROUND.chair[n].hand) do
					table.insert(hand, v)
				end
			end
			--
			ROUND.accumulated.hand = hand
			ROUND.accumulated.p = ROUND.chair[n].owner
			ROUND.accumulated.n = n
		else
			local hand = {}
			for i, v in pairs(ROUND.chair[n].hand) do
				table.insert(hand, v)
			end
			ROUND.accumulated = {allowed = {draw4=true}, player = {}, cards = 4, ["n"]=n, p=ROUND.chair[n].owner, ["hand"]=hand}
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			if ROUND.gameMode.supercombo then
				ROUND.accumulated.allowed = {draw2=true, draw4=true, draw99=true, shield=true}
			elseif ROUND.gameMode.nocombo then
				ROUND.accumulated.allowed.draw4 = nil
			end
		end
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","draw4"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","draw4"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","draw4"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","draw4"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	if ROUND.topCard.card2 and (ROUND.topCard.card2[2] == "wild" or ROUND.topCard.card2[2] == "draw4") and validRoom() then
		if PLAYER[player].pencil then
			PLAYER[player].pencil = PLAYER[player].pencil + 1
		else
			PLAYER[player].pencil = 0
		end
		if PLAYER[player].pencil >= 100 then
			unlockChair(player, "pencil")
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images,
		plusfour = true,
	}
	for i, v in pairs(ROUND.chair) do
		if v.skin.id == "illuminati" then
			local img = tfm.exec.addImage(IMG.misc.illuminatiEye, "_1000", v.x-50, 20)
			TIMER.img[img] = os.time()+500
		end
	end
	resetTimer()
	updateTurnTimer()
end