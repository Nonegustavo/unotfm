BOT.A = { -- Confusão
	img = "16004ade907.png",
	chair = "test",
	medal = "none",
	victory = 801000,
	autoPlay = function ()
		if ROUND.chair[ROUND.turn].mode == "BUSY" then
			sayUno(ROUND.turn)
			if ROUND.chair[ROUND.turn].action then
				if ROUND.chair[ROUND.turn].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].action.op) do
						table.insert(pool, i)
					end
					ROUND.chair[ROUND.turn].action.func(ROUND.turn, pool[math.random(#pool)])
				elseif ROUND.chair[ROUND.turn].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					ROUND.chair[ROUND.turn].confuse = false
					paintCard(pool[math.random(#pool)], ROUND.turn)
				elseif ROUND.chair[ROUND.turn].action.name == "TRACKING" then
					drawCardTracking(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "WISH" then
					ROUND.chair[ROUND.turn].confuse = false
					makeWish(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "BAN" then
					ROUND.chair[ROUND.turn].confuse = false
					makeBan(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "RULE" then
					ROUND.chair[ROUND.turn].confuse = false
					selectRule(ROUND.turn, math.random(1,2))
				end
			else
				if canPlayHand(ROUND.turn) then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].hand) do
						if canPlay(ROUND.turn, i) then
							table.insert(pool, i)
						end
					end
					if math.random(0,#pool) > 0 then
						playCard(ROUND.turn, pool[math.random(#pool)])
					else
						if ROUND.chair[ROUND.turn].draw then
							ROUND.chair[ROUND.turn].confuse = false
							eventMouse(ROUND.chair[ROUND.turn].owner, 680, 280, true)
						else
							eventMouse(ROUND.chair[ROUND.turn].owner, 350, 220, true)
						end
					end
				else
					if not (ROUND.chair[ROUND.turn].draw and not ROUND.chair[ROUND.turn].played) then
						eventMouse(ROUND.chair[ROUND.turn].owner, 350, 220, true)
					else
						ROUND.chair[ROUND.turn].confuse = false
						eventMouse(ROUND.chair[ROUND.turn].owner, 680, 280, true)
					end
				end
			end
		end
	end
}