function thunder(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and v.owner ~= "Drekkemaus" then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	for i=1, 2 do
		local r = table.remove(pool, math.random(#pool))
		if r then
			local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
			TIMER.img[img] = os.time()+500
			explosion(0, ROUND.chair[r].x, 115, 10, 30)
			tryDraw(r, math.random(5))
			if n == r and ROUND.chair[n].mode == "DELETED" then
				unlockChair(ROUND.chair[n].owner, "apple")
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end