BOT.Icemice = {
	img = "167d2c9497a.png",
	chair = "diamond",
	medal = "snowy",
	victory = 0,
	eventWelcome = function ()
		--quote("Elise", "QUOTE_14")
	end,
	eventWin = function ()
		--quote("Elise", "QUOTE_15")
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Icemice", ROUND.chair[ROUND.turn].action.action)
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