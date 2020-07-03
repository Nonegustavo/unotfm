function mimic(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "MIMIC",
		img = image,
		op = option,
		func = makeMimic
	}
	resetTimer()
	updateTurnTimer()
end

function makeMimic(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			ROUND.chair[n].mimic = target
			local img = tfm.exec.addImage(IMG.misc.linked, "!1000", ROUND.chair[n].x-50, 30)
			local img2 = tfm.exec.addImage(IMG.misc.linked, "!1000", ROUND.chair[target].x-50, 30)
			TIMER.img[img] = os.time()+1000
			TIMER.img[img2] = os.time()+1000
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

function mimicDraw(n, qtd, recursion)
	for i, v in pairs(ROUND.chair) do
		if v.mimic == n and (not recursion or v.owner ~= "Icemice") then
			tryDraw(i, qtd)
		end
	end
end

function mimicDiscard(n, qtd)
	local winners = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and v.mimic == n then
			discardCard(i, qtd)
			if #v.hand == 0 then
				table.insert(winners, i)
			end
		end
	end
	return winners
end

