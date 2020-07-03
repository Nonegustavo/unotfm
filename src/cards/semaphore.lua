function oddeven(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if ROUND.traffic == "even" then
		ROUND.traffic = "odd"
	elseif ROUND.traffic == "odd" then
		ROUND.traffic = "even"
	else
		ROUND.traffic = math.random() > 0.5 and "odd" or "even"
	end
	if ROUND.trafficImage then
		tfm.exec.removeImage(ROUND.trafficImage)
	end
	ROUND.trafficImage = tfm.exec.addImage(IMG.misc[ROUND.traffic], "!1000", 265, 195)
	ROUND.chair[n].action = {
		name = "ODDEVEN",
	}
	local text = {odd = "FORBIDEN_ODD", even = "FORBIDEN_EVEN"}
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(i, text[ROUND.traffic]), i, 150, 245, 500, nil, 1, 1, 0.7, false)
	end
	if ROUND.traffic == "odd" then
		explosion(13, 290, 220, 15, 15)
		explosion(9, 290, 270, 15, 15)
	else
		explosion(9, 290, 220, 15, 15)
		explosion(13, 290, 270, 15, 15)
	end
	addFunctionTimer(function()
		ROUND.chair[n].action = false
		ui.removeTextArea(71)
		passTurn()
		updateShadow(n)
	end, 4000)
end