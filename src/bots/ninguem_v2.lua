BOT.Ninguem_v2 = {
	img = "1712da199c2.png",
	chair = "max",
	medal = "none",
	victory = 0,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" then
				eventEmotePlayed("Ninguem_v2", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.3 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
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