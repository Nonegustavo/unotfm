BOT.Snowy = {
	img = "167d2c921bb.png",
	chair = "fire",
	medal = "snowy",
	victory = 0,
	eventWelcome = function ()
		BOT.Snowy.title = false
		BOT.Snowy.chat = false
		BOT.Snowy.talk = false
		local pool = {"QUOTE_88", "QUOTE_89"}
		quote("Snowy", pool[math.random(#pool)])
	end,
	eventWin = function ()
		quote("Snowy", "QUOTE_96")
	end,
	eventDonate = function (p)
		if math.random() > 0.5 then
			quote("Snowy", "QUOTE_90", p)
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Snowy", "QUOTE_91")
		end
	end,
	eventEliminate = function (name)
		if name == "Snowy" then
			if math.random() > 0.5 then
				quote("Snowy", "QUOTE_95", name)
			end
		elseif math.random() > 0.8 then
			quote("Snowy", "QUOTE_97", name)
		end
	end,
	eventLose = function (name)
		unlockTrophy(name, "snowy")
	end,
	eventChat = function (p, msg)
		if not BOT.Snowy.talk then
			if string.find(msg, "jingle") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_100")
				BOT.Snowy.talk = true
			elseif string.find(msg, "papaille") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_98")
				BOT.Snowy.talk = true
			elseif string.find(msg, "icemice") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_101")
				addFunctionTimer(quote, 5000, "Snowy", "QUOTE_102")
				BOT.Snowy.talk = true
			end
		end
	end,
	eventRandom = function (name)
		if not BOT.Snowy.title then
			if tfm.get.room.playerList[name] and tfm.get.room.playerList[name].title == 244 then
				quote("Snowy", "QUOTE_99", name)
				BOT.Snowy.title = true
			elseif math.random() > 0.985 then
				quote("Snowy", "QUOTE_92")
				BOT.Snowy.title = true
			end
		end
		if not BOT.Snowy.chat and math.random() > 0.985 then
			quote("Snowy", "QUOTE_93")
			addFunctionTimer(quote, 3000, "Icemice", "QUOTE_94")
			BOT.Snowy.chat = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Snowy", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and ROUND.topCard.card[2] == v[2] then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		botMakeAction()
	end
}