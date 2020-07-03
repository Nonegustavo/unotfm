function wild(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","wild"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","wild"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","wild"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","wild"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	if ROUND.topCard.card2 and (ROUND.topCard.card2[2] == "wild" or ROUND.topCard.card2[2] == "draw4") and validRoom() then
		PLAYER[player].pencil = PLAYER[player].pencil or 0
		PLAYER[player].pencil = PLAYER[player].pencil + 1
		if PLAYER[player].pencil >= 100 then
			unlockChair(player, "pencil")
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

function paintCard(color, n, auto)
	for i, v in pairs(ROUND.chair[n].action.img or {}) do
		tfm.exec.removeImage(v)
	end
	
	ROUND.topCard.card[1] = color
	local y = drawTopCard()
	local particle = {red=21, blue=23, yellow=24, green=22}
	local plus = ROUND.chair[n].action.plusfour
	for i=1, 10 do
		tfm.exec.displayParticle(particle[color], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
	end
	if ROUND.topCard.card[2] == "king" or ROUND.topCard.card[2] == "queen" then
		ROUND.chair[n].action = false
		colorZeros(color, n)
		pawn(n)
	elseif ROUND.topCard.card[2] == "simon" then
		local action = ROUND.chair[n].action
		if action.simon == "FINAL" then
			ROUND.chair[n].action = false
			ROUND.simon = ROUND.simon or {}
			table.insert(ROUND.simon, color)
			local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
			TIMER.img[s] = os.time()+2000
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			updateShadow(n)
		else
			ROUND.chair[n].action = false
			if color == ROUND.simon[action.simon] then
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				if action.simon == #ROUND.simon then
					local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[n].x-50, 30)
					TIMER.img[img] = os.time()+1000
				end
				local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
				TIMER.img[s] = os.time()+1000
				addFunctionTimer(function()
					ROUND.chair[n].action = false
					local player = ROUND.chair[n].owner
					local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
					local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
					local images = {img, l}
					if action.simon < #ROUND.simon then
						table.insert(images, tfm.exec.addImage(IMG.simon.red[ROUND.portal.side], "!1000", 170, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.blue[ROUND.portal.side], "!1000", 290, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.yellow[ROUND.portal.side], "!1000", 410, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.green[ROUND.portal.side], "!1000", 530, 225, player))
						ROUND.chair[n].action = {
							name = "WILD",
							img = images,
							simon = action.simon + 1
						}
					else
						local t1 = showCard({"red","simon"}, 170, 200, player, "!1000", "big")
						local t2 = showCard({"blue","simon"}, 290, 200, player, "!1000", "big")
						local t3 = showCard({"yellow","simon"}, 410, 200, player, "!1000", "big")
						local t4 = showCard({"green","simon"}, 530, 200, player, "!1000", "big")
						for i, v in pairs({t1,t2,t3,t4}) do
							for j, w in pairs(v) do
								table.insert(images, w)
							end
						end
						ROUND.chair[n].action = {
							name = "WILD",
							img = images,
							simon = "FINAL"
						}
						if #ROUND.simon >= 6 then
							unlockChair(ROUND.chair[n].owner, "phone")
						end
					end
					resetTimer()
					updateTurnTimer()
					showAccumulated()
				end, 1000)
			else
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				addFunctionTimer(function()
					ROUND.chair[n].action = false
					color = ROUND.simon[action.simon]
					ROUND.topCard.card[1] = color
					local y = drawTopCard()
					local particle = {red=21, blue=23, yellow=24, green=22}
					for i=1, 10 do
						tfm.exec.displayParticle(particle[color], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
					end
					tryDraw(n, 1)
					local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[n].x-50, 30)
					TIMER.img[img] = os.time()+2000
					for i, v in pairs(PLAYER) do
						if v.faustao then
							local img2 = tfm.exec.addImage(IMG.misc.errou, "!1000", 480, 190, i)
							TIMER.img[img2] = os.time()+2000
						end
					end
					local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
					TIMER.img[s] = os.time()+2000
					colorZeros(color, n)
					passTurn()
					batataTimer(n)
					updateShadow(n)
				end, 1000)
			end
		end
	else
		ROUND.chair[n].action = false
		if ROUND.gameMode.nocombo and ROUND.gameMode.nochallenge and plus then
			ROUND.turn = nextChair(ROUND.turn)
			local target = ROUND.turn
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			tryDraw(target, 4)
			local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[target].x-50, 30)
			TIMER.img[img] = os.time()+1000
			explosion(35, ROUND.chair[target].x, 80, 50, 10)
			if ROUND.gameMode.overload and #ROUND.chair[target].hand > 10 or bombInHand(target) or #ROUND.chair[target].hand > 30 then
				eliminate(target)
			end
			updateShadow(n)
		else
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			updateShadow(n)
		end
	end
end

function colorZeros(color, n)
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" and v.flag == "disco" and math.random() > 0.75 then
			local pool = {}
			for j, w in pairs(v.hand) do
				if w[2] == "n0" then
					table.insert(pool, j)
				end
			end
			if #pool > 0 then
				table.insert(ROUND.pile, 1, table.remove(v.hand, pool[math.random(#pool)]))
				table.insert(v.hand, {color, "n0", true})
				sortHand(v.hand)
				missCard(i, {color, "n0"}, 1000)
				updateHand(i)
				local fx = {red=13, blue=1, yellow=11, green=9, black=0}
				for i=1, 20 do
					tfm.exec.displayParticle(fx[color], math.random(-50,50)+v.x, 15, 0, math.random()*4, 0, 0, nil)
				end
			end
		end
	end
end