function half(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","half"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","half"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","half"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","half"}, 530, 200, player, "!1000", "big")
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