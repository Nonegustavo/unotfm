BOT.Elisah = {
	img = "163137ccd95.png",
	chair = "shaman",
	medal = "elisah",
	victory = 45000,
	eventWelcome = function ()
		BOT.Elisah.chat = false
		BOT.Elisah.ice = false
		BOT.Elisah.shoe = false
		BOT.Elisah.thorn = false
		BOT.Elisah.poison = false
		BOT.Elisah.anvil = false
		BOT.Elisah.time = false
		quote("Elisah", "QUOTE_54")
	end,
	eventStart = function ()
		if math.random() > 0.5 then
			quote("Elisah", "QUOTE_55")
			addFunctionTimer(quote, 3000, "Elisah", "QUOTE_56")
		end
	end,
	eventPenalty = function ()
		local pool = {"QUOTE_69", "QUOTE_70"}
		if math.random() > 0.5 then
			quote("Elisah", pool[math.random(#pool)])
		end
	end,
	eventCurse = function (curse)
		txt = {anvil="QUOTE_57", ice="QUOTE_58", shoe="QUOTE_59", thorn="QUOTE_60", time="QUOTE_61", poison="QUOTE_62"}
		if not BOT.Elisah[curse] then
			if curse == "ice" and math.random() > 0.5 then
				addFunctionTimer(quote, 1000, "Elisah", "QUOTE_71")
			elseif math.random() > 0.5 then
				addFunctionTimer(quote, 1000, "Elisah", txt[curse])
				BOT.Elisah[curse] = true
			end
		end
	end,
	eventWin = function ()
		local pool = {"QUOTE_63", "QUOTE_64"}
		quote("Elisah", pool[math.random(#pool)])
	end,
	eventLose = function (p)
		local pool = {"QUOTE_65", "QUOTE_66"}
		if p and math.random() > 0.5 then
			quote("Elisah", pool[math.random(#pool)], p)
		end
		unlockTrophy(p, "elisah")
	end,
	eventChat = function (p, msg)
		if msg == "Elisah" and not BOT.Elisah.chat then
			addFunctionTimer(quote, 3000, "Elisah", "QUOTE_67", p)
			addFunctionTimer(quote, 5000, "Elisah", "QUOTE_68")
			BOT.Elisah.chat = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Elisah", ROUND.chair[ROUND.turn].action.action)
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
	autoPlay = function ()
		local action = botMakeAction()
		if action == "DRAW" then
			BOT.Elisah.eventPenalty()
		end
	end
}