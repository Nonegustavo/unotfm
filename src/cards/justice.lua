function justice(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local qtd = 0
	
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n and #v.hand < #ROUND.chair[n].hand then
			qtd = qtd + 1
			explosion(9, v.x, 135, 5, 10)
			explosion(35, v.x, 135, 3, 5)
		end
	end
	
	if qtd >= #ROUND.chair[n].hand then
		qtd = #ROUND.chair[n].hand - 1
	end

	if qtd > 0 then
		ROUND.time = GLOBAL_TIME + 10000
		ROUND.chair[n].action = {
			name = "JUSTICE",
		}
		addFunctionTimer(function()
			ROUND.chair[n].action = false
			discardCard(n, qtd)
			mimicDiscard(n, qtd)
			explosion(9, ROUND.chair[n].x, 135, 5, 10)
			explosion(35, ROUND.chair[n].x, 135, 3, 5)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			updateHand(n)
			updateScore(n)
			passTurn()
			updateShadow(n)
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end, 1000)
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end