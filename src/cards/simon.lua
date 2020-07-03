function simon(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local images = {img, l}
	if ROUND.simon then
		table.insert(images, tfm.exec.addImage(IMG.simon.red[ROUND.portal.side], "!1000", 170, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.blue[ROUND.portal.side], "!1000", 290, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.yellow[ROUND.portal.side], "!1000", 410, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.green[ROUND.portal.side], "!1000", 530, 225, player))
		ROUND.chair[n].action = {
			name = "WILD",
			img = images,
			simon = 1
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
	end
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end