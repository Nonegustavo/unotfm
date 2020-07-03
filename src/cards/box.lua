function box(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") then
			giveCard(i, {"black","random",true,true}, true)
			missCard(i, {"black","random",true,true}, 2000)
			if mustBeEliminated(i) then
				eliminate(i)
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end