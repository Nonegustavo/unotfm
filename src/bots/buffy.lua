BOT.Buffy = {
	img = "165e3e947ca.png",
	chair = "default",
	medal = "buffy",
	victory = 0,
	eventWelcome = function ()
		BOT.Buffy.uno = nil
		BOT.Buffy.play = nil
	end,
	eventWin = function ()
		if math.random() > 0.5 then
			quote("Buffy", "QUOTE_81")
			if math.random() > 0.5 then
				addFunctionTimer(quote, 4000, "Drekkemaus", "QUOTE_85")
			end
		end
	end,
	eventRandom = function (name)
		if name == "Buffy" and not BOT.Buffy.play and math.random() > 0.60 then
			quote("Buffy", "QUOTE_82")
			Bot.Buffy.play = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.8 then
				eventEmotePlayed("Buffy", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.9 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		if ROUND.chair[ROUND.turn].mode == "BUSY" then
			eventMouse(ROUND.chair[ROUND.turn].owner, 750, 210)
			if ROUND.chair[ROUND.turn].action then
				if ROUND.chair[ROUND.turn].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].action.op) do
						table.insert(pool, i)
					end
					local target = pool[math.random(#pool)]
					tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
					ROUND.chair[ROUND.turn].action.func(ROUND.turn, target)
				elseif ROUND.chair[ROUND.turn].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					paintCard(pool[math.random(#pool)], ROUND.turn)
				elseif ROUND.chair[ROUND.turn].action.name == "TRACKING" then
					drawCardTracking(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "WISH" then
					makeWish(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "BAN" then
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
					if #ROUND.chair[ROUND.turn].hand == 2 then
						sayUno(ROUND.turn)
						if not BOT.Buffy.uno and math.random() > 0.5 then
							quote("Buffy", "QUOTE_84")
							BOT.Buffy.uno = true
						end
					end
					playCard(ROUND.turn, pool[math.random(#pool)])
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