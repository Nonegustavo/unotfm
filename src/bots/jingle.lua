BOT.Jingle = {
	img = " 16004adc40b.png",
	chair = "gift",
	medal = "noel",
	victory = 251200,
	eventStart = function ()
		local dialog = math.random(4)
		if dialog == 1 then
			quote("Papaille", "QUOTE_17")
			if math.random(3) > 1 then
				addFunctionTimer(quote, 5000, "Jingle", "QUOTE_18")
			end
		elseif dialog == 2 then
			quote("Jingle", "QUOTE_19")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_20")
				if math.random(2) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_21")
				end
			end
		elseif dialog == 3 then
			quote("Jingle", "QUOTE_22")
			if math.random(3) > 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_23")
				if math.random(2) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_24")
				end
			end
		elseif dialog == 4 then
			quote("Jingle", "QUOTE_25")
			if math.random(5) > 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_26")
				if math.random(5) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_27")
				end
			end
		end
	end,
	
	eventBlock = function ()
		if math.random() > 0.5 then
			local n = nextChair(ROUND.turn)
			quote("Jingle", "QUOTE_32", ROUND.chair[n].owner)
		end
	end,
	eventDonate = function ()
		if math.random() > 0.7 then
			quote("Jingle", "QUOTE_29")
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Jingle", "QUOTE_30")
		end
	end,
	eventWin = function ()
		if math.random(2) == 1 then
			quote("Jingle", "QUOTE_34")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 3000, "Papaille", "QUOTE_35")
			end
		end
	end,
	eventLose = function (name)
		unlockTrophy(name, "noel")
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.6 then
				eventEmotePlayed("Jingle", ROUND.chair[ROUND.turn].action.action)
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
		local action, target = botMakeAction()
		if action == "GIFT" then
			quote("Jingle", "QUOTE_28", ROUND.chair[target].owner)
		elseif action == "DRAW" then
			BOT.Jingle.eventPenalty()
		elseif action == "BLOCK" then
			BOT.Jingle.eventBlock()
		end
	end
}