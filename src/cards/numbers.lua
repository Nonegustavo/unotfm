function n0(n, start)
	ROUND.chair[n].zero = ROUND.chair[n].zero or {}
	if ROUND.topCard.card[2] == "n0" then
		ROUND.chair[n].zero[ROUND.topCard.card[1]] = true
		if ROUND.chair[n].zero.red and ROUND.chair[n].zero.blue and ROUND.chair[n].zero.yellow and ROUND.chair[n].zero.green then
			unlockChair(ROUND.chair[n].owner, "elemental")
		end
	end
	if ROUND.chair[n].owner == "Charlotte" and ROUND.gameMode[ROUND.topCard.card[1]] then
		actionCardEffect()
		actionCard(n, _G[ROUND.topCard.card[1]])
	elseif ROUND.topCard.card[2] == "n0" and FLAG[ROUND.chair[n].flag].color == ROUND.topCard.card[1] and not ROUND.chair[n].peace2 then
		actionCardEffect()
		actionCard(n, _G[FLAG[ROUND.chair[n].flag].func])
	elseif ROUND.gameMode.stack and not start then
		local can = {}
		local stack = false
		for i, v in pairs(ROUND.chair[n].hand) do
			if v[2] == ROUND.topCard.card[2] then
				can[i] = true
				stack = true
			end
		end
		if stack then
			if #ROUND.chair[n].hand == 2 then
				showUno(n)
			end
			ROUND.chair[n].played = true
			ROUND.chair[n].whiteList = can
			showPass(n)
			ui.addTextArea(19, string.format("<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_STACKING"), ROUND.topCard.card[2]:sub(2,2)), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	elseif ROUND.gameMode.sequence and not start then
		local can = {
			n0 = {"x","n1"},
			n1 = {"n0","n2"},
			n2 = {"n1","n3"},
			n3 = {"n2","n4"},
			n4 = {"n3","n5"},
			n5 = {"n4","n6"},
			n6 = {"n5","n7"},
			n7 = {"n6","n8"},
			n8 = {"n7","n9"},
			n9 = {"n8","x"},
		}
		local sequence = false
		local pool = {}
		if ROUND.chair[n].played then
			if can[ROUND.topCard.card2[2]][1] == ROUND.topCard.card[2] then
				ROUND.chair[n].played = "DOWN"
			elseif can[ROUND.topCard.card2[2]][2] == ROUND.topCard.card[2] then
				ROUND.chair[n].played = "UP"
			end
		end
		if ROUND.chair[n].played == "DOWN" then
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and can[ROUND.topCard.card[2]][1] == v[2] then
					pool[i] = true
					sequence = true
				end
			end
		elseif ROUND.chair[n].played == "UP" then
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and can[ROUND.topCard.card[2]][2] == v[2] then
					pool[i] = true
					sequence = true
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and (can[ROUND.topCard.card[2]][1] == v[2] or can[ROUND.topCard.card[2]][2] == v[2]) then
					pool[i] = true
					sequence = true
				end
			end
		end
		if sequence then
			if #ROUND.chair[n].hand == 2 then
				showUno(n)
			end
			ROUND.chair[n].whiteList = pool
			if ROUND.chair[n].played then
				if ROUND.chair[n].played == true then
					if ROUND.chair[n].played == "DOWN" then
						ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_DOWN"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
					elseif ROUND.chair[n].played == "UP" then
						ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_UP"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
					end
				else
					local text = {DOWN="WARN_DOWN", UP="WARN_UP"}
					ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, text[ROUND.chair[n].played]), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
				end
			else
				ROUND.chair[n].played = true
				ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_UP_DOWN"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
			end
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	elseif ROUND.gameMode.perfection and not start and isNumeric(ROUND.topCard.card) == #ROUND.chair[n].hand+1 then
		ROUND.turn = previousChair(ROUND.turn)
		explosion(37, ROUND.chair[n].x, 80, 10, 10)
		ui.addTextArea(19, string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[n].owner, "WARN_PERFECTION")), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
		passTurn()
		batataTimer(n, true)
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end
n1, n2, n3, n4, n5, n6, n7, n8, n9 = n0, n0, n0, n0, n0, n0, n0, n0, n0