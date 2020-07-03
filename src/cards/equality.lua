function equality(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" or v.mode == "FREE" then
			if #v.hand > 3 then
				discardCard(i, #v.hand-3)
			elseif #v.hand < 3 then
				tryDraw(i, 3-#v.hand)
			end
			explosion(9, v.x, 135, 5, 10)
			explosion(35, v.x, 135, 3, 5)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end