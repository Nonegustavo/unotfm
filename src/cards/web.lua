function web(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and not v.action or i == n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "WEB",
		img = image,
		op = option,
		func = makeWeb
	}
	resetTimer()
	updateTurnTimer()
end

function makeWeb(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			ROUND.chair[target].action = {
				name = "SKIP",
				img = {tfm.exec.addImage(IMG.misc.web, "!1000", ROUND.chair[target].x-50, 30)}
			}
			explosion(1, ROUND.chair[target].x, 80, 20, 30)
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventWeb then
				BOT[ROUND.chair[target].owner].eventWeb()
			end
			if ROUND.chair[n].web and ROUND.chair[n].web[target] then
				unlockChair(ROUND.chair[n].owner, "spider")
			end
			ROUND.chair[n].web = ROUND.chair[n].web or {}
			ROUND.chair[n].web[target] = true
			passTurn()
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end