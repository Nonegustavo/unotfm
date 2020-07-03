function chair(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local chairs = {}
	local pos = {}
	local name = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and n ~= i then
			table.insert(chairs, v)
			table.insert(pos, {i, v.x})
			name[i] = v.owner
			if v.action and v.action.name == "SKIP" then
				for j, w in pairs(v.action.img) do
					tfm.exec.removeImage(w)
				end
			end
		end
	end
	ROUND.team[1] = {}
	ROUND.team[2] = {}
	ROUND.team[3] = {}
	ROUND.team[4] = {}
	ROUND.team[5] = {}
	local max = #pos
	for i=1, max do
		local rand = table.remove(pos, math.random(#pos))
		ROUND.chair[rand[1]] = table.remove(chairs)
		ROUND.chair[rand[1]].x = rand[2]
		local c = ROUND.chair[rand[1]]
		if c.owner ~= "" and PLAYER[c.owner] then
			PLAYER[c.owner].chair = rand[1]
		end
		if #c.hand == 1 then
			c.uno = "uno"
		end
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			if v.action and v.action.name == "SKIP" then
				v.action.img = {tfm.exec.addImage(IMG.misc.web, "!1000", v.x-50, 30)}
			end
			if v.owner == name[i] then
				unlockChair(v.owner, "guitar")
			end
			if ROUND.gameMode.team then
				local next = nextChair(i)
				local previous = previousChair(i)
				if v.team == ROUND.chair[next].team or v.team == ROUND.chair[previous].team then
					unlockChair(ROUND.chair[i].owner, "honey")
				end
			end
			drawChair(i)
			updateHand(i)
			explosion(3, v.x, 100, 20, 10)
		end
		if v.mode ~= "DELETED" then
			if v.team then
				ROUND.team[v.team][i] = true
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end