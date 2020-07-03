BOT.Charlotte = {
	sleep = true,
	imgAwake = "16114b7cd0c.png",
	imgSleepy = "16114b83a04.png",
	img = "16114b83a04.png",
	chair = "wood",
	medal = "charlotte",
	victory = 1000,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Charlotte", "QUOTE_49")
		end
	end,
	eventInk = function (color)
		if ROUND.gameMode[color] then
			quote("Charlotte", "QUOTE_52")
		elseif not BOT.Charlotte.sleep then
			quote("Charlotte", "QUOTE_51")
		end
	end,
	eventPenalty = function ()
		local pool = {"QUOTE_47", "QUOTE_51"}
		if not BOT.Charlotte.sleep and math.random() > 0.5 then
			quote("Charlotte", pool[math.random(#pool)])
		end
	end,
	eventEliminate = function (name)
		local pool = {"QUOTE_48", "QUOTE_53"}
		if not BOT.Charlotte.sleep and math.random() > 0.5 then
			quote("Charlotte", pool[math.random(#pool)], name)
		end
	end,
	eventWelcome = function (i)
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
		BOT.Charlotte.sleep = true
		BOT.Charlotte.chat = false
		drawChair(i)
	end,
	eventWin = function ()
		quote("Charlotte", "QUOTE_45")
		if math.random() > 0.5 then
			addFunctionTimer(quote, 3000, "Charlotte", "QUOTE_46")
		end
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
	end,
	eventLose = function ()
		if BOT.Charlotte.sleep then
			quote("Charlotte", "QUOTE_43")
		elseif math.random() > 0.5 then
			quote("Charlotte", "QUOTE_44")
		end
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
	end,
	eventLoop = function (n)
		if not BOT.Charlotte.sleep then
			if ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Charlotte", ROUND.chair[ROUND.turn].action.action)
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
		end
	end,
	eventChat = function (p, msg)
		if not BOT.Charlotte.sleep and string.find(msg, "CHARLOTTE") and not BOT.Charlotte.chat then
			addFunctionTimer(quote, 3000, "Charlotte", "QUOTE_50")
			BOT.Charlotte.chat = true
		end
	end,
	autoPlay = function ()
		ROUND.chair[ROUND.turn].afk = false
		if BOT.Charlotte.sleep then
			if #ROUND.chair[ROUND.turn].hand >= 10 and not ROUND.accumulated then
				BOT.Charlotte.sleep = false
				BOT.Charlotte.img = BOT.Charlotte.imgAwake
				drawChair(ROUND.turn)
				power(ROUND.turn)
				local pool = {"QUOTE_40", "QUOTE_41", "QUOTE_42"}
				quote("Charlotte", pool[math.random(#pool)])
			elseif ROUND.time - GLOBAL_TIME > 5000 then
				ROUND.chair[ROUND.turn].afk = false
				ROUND.time = GLOBAL_TIME + 5000
				updateTurnTimer()
				if math.random() > 0.7 then
					local pool = {"QUOTE_38", "QUOTE_39"}
					quote("Charlotte", pool[math.random(#pool)])
				end
			end
		else
			local action = botMakeAction()
			if action == "DRAW" then
				BOT.Charlotte.eventPenalty()
			elseif action == "BLOCK" then
				BOT.Charlotte.eventBlock()
			end
		end
	end
}