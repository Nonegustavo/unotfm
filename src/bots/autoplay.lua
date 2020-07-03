BOT.B = { -- Autoplay
	img = "16004ade907.png",
	chair = "test",
	medal = "none",
	victory = 801000,
	autoPlay = function ()
		local n = ROUND.turn
		if ROUND.chair[n].mode == "BUSY" then
			if ROUND.chair[n].action then
				if ROUND.chair[n].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[n].action.op) do
						table.insert(pool, i)
					end
					ROUND.chair[n].action.func(n, pool[math.random(#pool)])
				elseif ROUND.chair[n].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					paintCard(pool[math.random(#pool)], n)
				elseif ROUND.chair[n].action.name == "TRACKING" then
					drawCardTracking(n, ROUND.chair[n].action.card[math.random(3)])
					eventMouse(ROUND.chair[n].owner, 350, 220, true)
				elseif ROUND.chair[n].action.name == "WISH" then
					makeWish(n, ROUND.chair[n].action.card[math.random(3)])
					eventMouse(ROUND.chair[n].owner, 350, 220, true)
				elseif ROUND.chair[n].action.name == "RULE" then
					selectRule(n, math.random(1,2))
				elseif ROUND.chair[n].action.name == "IMITATE" then
					emoteVerify(true)
				end
			elseif ROUND.chair[n].flag == "circuit" and not ROUND.chair[n].circuitPlayed and canPlayHand(n) then
				local pool = {}
				for i, v in pairs(ROUND.chair[n].hand) do
					if canPlay(n, i) then
						table.insert(pool, i)
					end
				end
				if #ROUND.chair[n].hand == 2 then
					sayUno(n)
				end
				ROUND.chair[n].circuitPlayed = true
				ROUND.chair[n].flag = "circuitused"
				drawChair(n)
				local img = tfm.exec.addImage(IMG.misc.robot, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = GLOBAL_TIME+500
				playCard(n, pool[math.random(#pool)])
			else
				local m = n
				eventMouse(ROUND.chair[n].owner, 350, 220, true)
				eventMouse(ROUND.chair[n].owner, 680, 280, true)
				if m == ROUND.turn then
					ROUND.time = GLOBAL_TIME + 3000
					updateTurnTimer()
				end
			end
		end
	end
}