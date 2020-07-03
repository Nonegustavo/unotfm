BOT.Drekkemaus = {
	img = "15ed4ecf2e3.png",
	chair = "hell",
	medal = "drekkemaus",
	victory = 40000,
	eventWelcome = function ()
		if math.random() > 0.5 then 
			local pool = {"QUOTE_1", "QUOTE_3"}
			quote("Drekkemaus", pool[math.random(#pool)])
		else
			quote("Buffy", "QUOTE_73")
		end
		BOT.Drekkemaus.buffy = nil
		BOT.Drekkemaus.tracking = nil
		local pool = {"picnic", "metal", "paper", "carpet"}
		PLAYER.Drekkemaus.flagEquipped = pool[math.random(#pool)]
	end,
	eventWin = function ()
		local pool = {"QUOTE_9", "QUOTE_10"}
		if math.random() > 0.5 then
			quote("Drekkemaus", pool[math.random(#pool)])
			if math.random() > 0.5 then
				addFunctionTimer(quote, 3000, "Buffy", "QUOTE_83")
				addFunctionTimer(quote, 6000, "Drekkemaus", "QUOTE_87")
			end
		else
			quote("Buffy", "QUOTE_79")
		end
	end,
	eventLose = function (name)
		if math.random() > 0.5 then
			quote("Drekkemaus", "QUOTE_11")
		end
		if PLAYER[name].trophy.buffy then
			unlockTrophy(name, "drekkemaus")
		else
			unlockTrophy(name, "buffy")
		end
	end,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Drekkemaus", "QUOTE_5")
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.5 then
				eventEmotePlayed("Drekkemaus", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.5 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
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
	eventRandom = function (name)
		if name ~= "Buffy" and not BOT.Drekkemaus.buffy and math.random() > 0.985 then
			quote("Drekkemaus", "QUOTE_7", name)
			BOT.Drekkemaus.buffy = true
			if math.random() > 0.5 then
				addFunctionTimer(quote, 5000, "Buffy", "QUOTE_78")
			end
		end
	end,
	eventWeb = function ()
		if math.random() > 0.7 then
			quote("Drekkemaus", "QUOTE_6")
		end
	end,
	eventSorry = function ()
		if math.random() > 0.7 then
			quote("Drekkemaus", "QUOTE_4")
			local nextPlayer = nextChair(ROUND.turn)
			if ROUND.chair[nextPlayer].owner == "Buffy" then
				local pool = {"QUOTE_75", "QUOTE_76"}
				addFunctionTimer(quote, 5000, "Buffy", pool[math.random(#pool)])
			end
		end
	end,
	eventStart = function ()
		local pool = {"QUOTE_2", "QUOTE_12"}
		local rand = pool[math.random(#pool)]
		quote("Drekkemaus", rand)
		if rand == "QUOTE_2" then
			addFunctionTimer(quote, 5000, "Buffy", "QUOTE_74")
		end
	end,
	eventPenalty = function ()
		local previousPlayer = previousChair(ROUND.turn)
		if ROUND.chair[previousPlayer].owner == "Buffy" then
			quote("Drekkemaus", "QUOTE_86")
			addFunctionTimer(quote, 5000, "Buffy", "QUOTE_77")
		else
			local pool = {"QUOTE_8", "QUOTE_13"}
			if math.random() > 0.7 then
				quote("Drekkemaus", pool[math.random(#pool)])
			end
		end
	end,
	autoPlay = function ()
		local action = botMakeAction()
		if action == "TRACKING" and not BOT.Drekkemaus.tracking and math.random() > 0.7 then
			quote("Buffy", "QUOTE_80")
		elseif action == "BLOCK" or action == "CHALLENGE" then
			BOT.Drekkemaus.eventBlock()
		elseif action == "DRAW" then
			BOT.Drekkemaus.eventPenalty()
		elseif action == "PLAY" and ROUND.topCard.card[2] == "draw2" or ROUND.topCard.card[2] == "draw4" then
			BOT.Drekkemaus.eventSorry()
		end
	end
}