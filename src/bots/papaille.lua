BOT.Papaille = {
	img = "16004ade907.png",
	chair = "candy",
	medal = "noel",
	victory = 801000,
	eventWin = function ()
		if math.random(2) == 1 then
			quote("Papaille", "QUOTE_36")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 3000, "Jingle", "QUOTE_37")
			end
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Papaille", "QUOTE_31")
		end
	end,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Papaille", "QUOTE_33")
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.5 then
				eventEmotePlayed("Papaille", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
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
		local action = botMakeAction()
		if action == "DRAW" then
			BOT.Papaille.eventPenalty()
		elseif action == "BLOCK" then
			BOT.Papaille.eventBlock()
		end
	end
}