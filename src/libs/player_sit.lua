function playerSit(p, chair, n)
	if p:sub(1,1) ~= "*" and PLAYER[p] and (ROUND.state ~=  "PLAY" or #chair.hand > 0) and not (p == OWNER and ROUND.spectator) and ROUND.state ~= "FINISH" then
		for i, v in pairs(chair.skin.img) do
			tfm.exec.removeImage(v)
		end
		PLAYER[p].chair = n
		if PLAYER[p].chairDelay < 6000 then
			PLAYER[p].chairDelay = PLAYER[p].chairDelay + 1000
		end
		chair.owner = p
		chair.mode = "BUSY"
		if PLAYER[p].skinEquiped == "random" then
			if math.random() > 0.99 then
				chair.skin.id = "cheeseclassic"
			else
				local pool = {}
				for i, v in pairs(PLAYER[p].skin) do
					if i ~= "random" then
						table.insert(pool, i)
					end
				end
				chair.skin.id = pool[math.random(#pool)]
			end
		else
			chair.skin.id = PLAYER[p].skinEquiped
			chair.light = PLAYER[p].lightEquiped
		end
		chair.skin.img = {}
		drawChair(n)
		if not BOT[p] then
			tfm.exec.movePlayer(p, chair.x, 110)
		end
		system.bindMouse(p, true)
		updateScore(n)
		if ROUND.state == "PLAY" then
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			local color = tonumber(ROUND.color[1], 16)
			local v = chair
			ui.addTextArea(10, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], CONFIG.UNO), p, 675, 205, 100, 20, -1, color, 1, false)
			ui.addTextArea(11, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(p, "CHALLENGE")), p, 675, 240, 100, 20, -1, color, 1, false)
			ui.addTextArea(12, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(p, "PASS")), p, 675, 275, 100, 20, -1, color, 1, false)
			updateHand(n)
			if n == ROUND.turn then
				if #v.hand == 2 and canPlayHand(n) then
					showUno(n)
				end
				if ROUND.accumulated and ROUND.accumulated.allowed.draw4 then
					showChallenge(n)
				end
				if not canPlayHand(n) or ROUND.accumulated then
					showNeedDraw(n)
				end
				if ROUND.accumulated then
					local txt = ""
					if ROUND.accumulated.allowed.draw2 then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "DRAW_TWO"))
					elseif ROUND.accumulated.allowed.draw4 then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "DRAW_FOUR"))
					end
					ui.addTextArea(19, string.format(txt, ROUND.accumulated.cards), v.owner, 100, 305, 600, nil, 0, 0, 0, false)
				end
			end
		elseif ROUND.state == "MULLIGAN" and not chair.change then
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			local txt = "<p align='center'><font size='14px' color='#ffffff'>"..translate(p, "CHANGE_HAND")
			ui.addTextArea(28, txt, p, 350, 293, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
		elseif ROUND.state == "START" and CONFIG.ranked and tfm.get.room.uniquePlayers >= 4 then
			if PLAYER[p].lastChair == n then
				PLAYER[p].school = PLAYER[p].school + 1
				if PLAYER[p].school >= 3 then
					unlockChair(p, "school", true)
				end
			else
				PLAYER[p].lastChair = n
				PLAYER[p].school = 1
			end
		end
	end
end