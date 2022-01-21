function loadImages(p)
	local pool = {"thunder", "skipped", "challenge", "sucess", "fail", "illuminatiEye", "left", "right", "tip", "web", "ribbon", "burn"}
	local tt = os.time() + 5
	for i, v in pairs(pool) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(IMG.misc[v], "?10000", 5000, 5000, p)
		end
	end
	for i, v in pairs(IMG.emote) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(v, "?10000", 5000, 5000, p)
		end
	end
	for i, v in pairs(IMG.skin.classic.symbol) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(v.big, "?10000", 5000, 5000, p)
		end
	end
end

function rip(n)
	checkVars("eraseChair", { n }, { "number" })
	for i, v in pairs(ROUND.chair[n].skin.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].skin.img = {}
	local chair = ROUND.chair[n]
	table.insert(chair.skin.img, tfm.exec.addImage("17975c79412.png", "_1000", chair.x - 23, 70,nil,.7,.7,0,1))
end

function updateScore(n, p, color)
	local nickname = nickMinifier(nickHashtag(ROUND.chair[n].owner))
	if ROUND.chair[n].mode ~= "DELETED" then
		local colors = {"4CFF00", "BABD2F", "E68D43", "CB546B", "F7868B", "78B1D9", "97CF9D", "E1A6EB", "F3C783", "FFFFFF"}
		local teamColors = {}
		local qtd = #ROUND.chair[n].hand
		local f = 1
		local uno = ROUND.chair[n].uno == "uno"
		local x = ROUND.chair[n].x
		if qtd <= 3 then
			f = 1
		elseif qtd < 8 then
			f = 2
		elseif qtd < 15 then
			f = 3
		else
			f = 4
		end
		local show = qtd
		if qtd > 1 and ROUND.gameMode.camouflage then
			show = "?"
			f = 2
		elseif uno and #ROUND.chair[n].hand == 1 then
			show = CONFIG.UNO
		end
		-- teste pra ver se a sombra elimina a necessidade das cores
		--if ROUND.chair[n].team then
		--  f = ROUND.chair[n].team + 4
		--end
		resetBatata(n)
		local numberColor = colors[f]
		if ROUND.gameMode.shiny then
			local have = {}
			for i, v in pairs(ROUND.chair[n].hand) do
				have[v[1]] = true
			end
			if have.black or have.red and have.blue and have.yellow and have.green then
				numberColor = "FFFFFF"
			end
		end
		if p then
			local b = ROUND.chair[n].luck and "<vp>" or (BOT[ROUND.chair[n].owner] or ROUND.chair[n].owner == "") and "<j>" or p == ROUND.chair[n].owner and "<font color='#ffffff'>" or ""
			local name = ROUND.chair[n].owner == "" and ("["..translate(p, "SPACE").."]") or ("<a href='event:profile "..ROUND.chair[n].owner.."'>"..nickname.."</a>")
			ui.addTextArea(1010+n, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>%s", nickname, show), p, x-69, 116, 140, 60, 0, 0, 0, false)
			ui.addTextArea(1000+n, string.format(b.."<b><p align='center'>%s<b>\n<font size='18px' color='#%s'>%s", name, numberColor, show), p, x-70, 115, 140, 60, 0, 0, 0, false)
		else
			for i, v in pairs(tfm.get.room.playerList) do
				local b = ROUND.chair[n].luck and "<vp>" or (BOT[ROUND.chair[n].owner] or ROUND.chair[n].owner == "") and "<j>" or i == ROUND.chair[n].owner and "<font color='#ffffff'>" or ""
				local name = ROUND.chair[n].owner == "" and ("["..translate(i, "SPACE").."]") or ("<a href='event:profile "..ROUND.chair[n].owner.."'>"..nickname.."</a>")
				local limit = ROUND.chair[n].owner ~= "Charlotte" and show ~= CONFIG.UNO and ROUND.limit and ROUND.limit < 30 and ("/"..ROUND.limit) or ""
				ui.addTextArea(1010+n, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>%s<font size='8px'>%s", nickname, show, limit), i, x-69, 116, 140, 60, 0, 0, 0, false)
				ui.addTextArea(1000+n, string.format(b.."<b><p align='center'>%s<b>\n<font size='18px' color='#%s'>%s<font size='8px'>%s", name, numberColor, show, limit), i, x-70, 115, 140, 60, 0, 0, 0, false)
			end
		end
		if uno and #ROUND.chair[n].hand == 1 and not color then
			particle = {shaman=9, cheese=11, fraise=13}
			for i=1, 30 do
				local vx = (math.random()-0.5) * 5
				local vy = (math.random()-1) * 10
				tfm.exec.displayParticle(particle[ROUND.chair[n].skin.id] or math.random(21, 24), x, 140, vx, vy, 0, 0.1, p)
			end
		end
	elseif ROUND.chair[n].owner ~= "" then
		rip(n)
		ui.addTextArea(1000+n, string.format("<b><font color='#000000'><p align='center'>%s<b>\n<font size='18px'>X", nickname), i, ROUND.chair[n].x-70, 115, 140, 60, 0, 0, 0, false)
		ui.removeTextArea(1010+n, p)
	else
		ui.removeTextArea(1000+n, p)
		ui.removeTextArea(1010+n, p)
	end
end

function blinkColor()
	local colors = {"FFB2B2", "FFFFFF", "B2BDFF", "FFFFFF", "B2FFBB", "FFFFFF", "FFEBB2", "FFFFFF"}
	_blink = _blink or 0
	_blink = (_blink+1)%#colors
	for i, v in pairs(ROUND.chair) do
		local have = {}
		for i, v in pairs(v.hand) do
			have[v[1]] = true
		end
		if have.black or have.red and have.blue and have.yellow and have.green then
			updateScore(i, nil, colors[_blink+1])
		end
	end
end

function blinkAllert()
	ROUND.blink = not ROUND.blink
	if ROUND.blink then
		ui.addTextArea(28, "", nil, 0, 0, 800, 400, 0xff0000, 0, 0.1, false)
	else
		ui.removeTextArea(28)
	end
end

function blinkAllert()
		ui.addTextArea(28, "", nil, 0, 0, 800, 400, 0xff0000, 0, 0.1, false)
end

function showDeck(p)
	if not p then
		for i, v in pairs(ROUND.imgDeck) do
			tfm.exec.removeImage(v)

		end
		ROUND.imgDeck = {}
	end
	if ROUND.subitDeath then
		table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.death, "_1000", 320, 210, p))
	else
		local img = false
		if ROUND.curse == "ice" then
			img = IMG.skin[ROUND.cardSkin].misc.backIce
		elseif ROUND.curse == "thorn" then
			img = IMG.skin[ROUND.cardSkin].misc.backThorn
		elseif ROUND.curse == "anvil" then
			img = IMG.skin[ROUND.cardSkin].misc.backAnvil
		end
		local y = 210 - (#ROUND.deck/108 * 10)
		table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.shadow, "_1000", 320, 210, p))
		if #ROUND.deck == 0 then
			table.insert(ROUND.imgDeck, tfm.exec.addImage(img or IMG.skin[ROUND.cardSkin].misc.nocard, "_1000", 320, y, p))
		elseif ROUND.gameMode.revelation and not img then
			local c = showCard(ROUND.deck[#ROUND.deck], 320, y, p, "_1000")
			for i, v in pairs(c) do
				table.insert(ROUND.imgDeck, v)
			end
			--table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.misc.cardLayer, "_1000", 320, y, p))
		else
			table.insert(ROUND.imgDeck, tfm.exec.addImage(img or IMG.skin[ROUND.cardSkin].misc.back, "_1000", 320, y, p))
		end
	end
end

function showCard(card, x, y, p, target, size, scaleX, scaleY, angle, alpha, anchorX, anchorY)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	angle = angle or 0
	angle = math.rad(angle)
	alpa = alpha or 1
	anchorX = anchorX or 0
	anchorY = anchorY or 0
	if not (p and BOT[p]) then
		if type(card) == "table" then
			local img = {}
			if not size then
				--table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].noLag[card[2]][card[1]], target or "_1000", x, y, p))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].color[card[1]][size or "mini"], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].symbol[card[2]][size or "mini"], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
			else
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].color[card[1]][size or "mini"], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].symbol[card[2]][size or "mini"], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
			end
			if (not size or size=="mini") and card[4] then
				table.insert(img, tfm.exec.addImage(IMG.misc.ribbon, target or "_1000", x, y-10, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
			end
			if (not size or size=="mini") and card.lock then
				table.insert(img, tfm.exec.addImage(IMG.misc.lock[ROUND.portal.side], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
			end
			if card[1] ~= "black" then
				if p then
					if tfm.get.room.playerList[p] and PLAYER[p] and PLAYER[p].colorBlind then
						table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].colorBlind[card[1]][size or "mini"], target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY))
					end
				else
					for i, v in pairs(PLAYER) do
						if v.colorBlind then
							table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].colorBlind[card[1]][size or "mini"], target or "_1000", x, y, i, scaleX, scaleY, angle, alpha, anchorX, anchorY))
						end
					end
				end
			end
			return img
		else
			return {tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.back, target or "_1000", x, y, p, scaleX, scaleY, angle, alpha, anchorX, anchorY)}
		end
	else
		return {}
	end
end

function missCard(n, card, time, click)
	if type(card) == "number" then
		card = ROUND.chair[n].hand[card]
	end
	local c = {}
	if card then
		card2 = {card[1], card[2]}
		if ROUND.gameMode.team and ROUND.chair[n].team and click then
			c = showCard(nil, ROUND.chair[n].x-25, 20, nil, "!1000")
			for i, v in pairs(ROUND.team[ROUND.chair[n].team]) do
				local n = showCard(card2, ROUND.chair[n].x-25, 20, ROUND.chair[i].owner, "!1000")
				for j, w in pairs(n) do
					table.insert(c, w)
				end
			end
		else
			c = showCard(card2, ROUND.chair[n].x-25, 20, nil, "!1000")
		end
	else
		c = showCard(card, ROUND.chair[n].x-25, 20, nil, "!1000")
	end
	for i, v in pairs(c) do
		TIMER.img[v] = os.time()+time
	end
	ROUND.chair[n].clickDelay = os.time()+2000
end

function updateHand(n, new)
	local tt = os.time() + 10
	local replay = false
	local a = n == ROUND.turn and 1 or 0.7
	local y = n == ROUND.turn and 320 or 340
	new = new or {}
	for i, v in pairs(ROUND.chair[n].imgHand) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].imgHand = {}
	if ROUND.state ~= "FINISH" and not BOT[ROUND.chair[n].owner] then
		if #ROUND.chair[n].hand > 16 then
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local targetImage = "_".. 1000*i
					local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
					local c = showCard(v, x, y, ROUND.chair[n].owner, targetImage, "mini", 1, 1, 0, a)
					if v[2] == "batata" then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.batata[ROUND.chair[n].batata], "_1000", x, y-20, ROUND.chair[n].owner))
					end
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
					local card = FLAG[ROUND.chair[n].flag].card
					if card and card[1] == v[1] and card[2] == v[2] then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.wish, targetImage, x-25, y-25, ROUND.chair[n].owner, 1, 1, 0, a))
					end
					if isCursed(n, "shoe") and not isNumeric(v) then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.shoe[ROUND.portal.side], targetImage, x, y, ROUND.chair[n].owner, 1, 1, 0, a))
					end
					for j, w in pairs(new) do
						if v == w then
							local l = tfm.exec.addImage(IMG.misc.glowCard, targetImage, x-5, y-5, ROUND.chair[n].owner, 1, 1, 0, a)
							table.insert(ROUND.chair[n].imgHand, l)
							TIMER.img[l] = os.time()+2000
							break
						end
					end
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local targetImage = "_".. 1000*i
					local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
					local c = showCard(v, x, y, ROUND.chair[n].owner, targetImage, "mini", 1, 1, 0, a)
					if v[2] == "batata" then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.batata[ROUND.chair[n].batata], targetImage, x, y-20, ROUND.chair[n].owner))
					end
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
					local card = FLAG[ROUND.chair[n].flag].card
					if card and card[1] == v[1] and card[2] == v[2] then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.wish, "!0", x-25, y-25, ROUND.chair[n].owner, 1, 1, 0, a))
					end
					if isCursed(n, "shoe") and not isNumeric(v) then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.shoe[ROUND.portal.side], targetImage, x, y, ROUND.chair[n].owner, 1, 1, 0, a))
					end
					for j, w in pairs(new) do
						if v == w then
							local l = tfm.exec.addImage(IMG.misc.glowCard, targetImage, x-5, y-5, ROUND.chair[n].owner, 1, 1, 0, a)
							table.insert(ROUND.chair[n].imgHand, l)
							TIMER.img[l] = os.time()+500
							break
						end
					end
				end
			end
		end
	end
	if ROUND.spectator or ROUND.state == "FINISH" then
		local p = ROUND.state ~= "FINISH" and OWNER or nil
		if #ROUND.chair[n].hand > 18 then
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local par = math.ceil((i/2))
					local x = ROUND.chair[n].x-(#ROUND.chair[n].hand==i and i%2==1 and 25 or i%2==0 and 15 or 35)
					local y = 235+((par-1)/(math.ceil(#ROUND.chair[n].hand/2)-1))*120
					local c = showCard(v, x, y, p, "!1000")
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local par = math.ceil((i/2))
					local x = ROUND.chair[n].x-(#ROUND.chair[n].hand==i and i%2==1 and 25 or i%2==0 and 15 or 35)
					local y = 235+15*(par-1)+(9-(math.ceil(#ROUND.chair[n].hand/2)))*15
					local c = showCard(v, x, y, p, "!1000")
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
				end
			end
		end
	end
	if os.time() < tt and ROUND.state ~= "FINISH" then
		updateShadow(n, tt)
	end
	if replay then
		addFunctionTimer(function()
			updateHand(n, new)
		end, 100)
	end
end

function updateShadow(n, t)
	if true then return false end
	if not BOT[ROUND.chair[n].owner] then
		local tt = t or os.time()+20
		for i, v in pairs(ROUND.chair[n].imgShadow) do
			tfm.exec.removeImage(v)
		end
		ROUND.chair[n].imgShadow = {}
		if PLAYER[ROUND.chair[n].owner] and not BOT[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].shadow then
			if #ROUND.chair[n].hand <= 16 then
				if ROUND.turn ~= n or isCursed(n, "poison") or ROUND.chair[n].confuse then
					for i, v in pairs(ROUND.chair[n].hand) do
						local targetImage = "_".. 1000*i
						if os.time() > tt then
							break
						else
							local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
							local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
							table.insert(ROUND.chair[n].imgShadow, l)
						end
					end
				elseif ROUND.turn == n and ROUND.accumulated then
					for i, v in pairs(ROUND.chair[n].hand) do
						local targetImage = "_".. 1000*i
						if os.time() > tt then
							break
						else
							if not ROUND.accumulated.allowed[v[2]] then
								local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
								local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
								table.insert(ROUND.chair[n].imgShadow, l)
							end
						end
					end
				end
--      else
--        if ROUND.turn ~= n or isCursed(n, "poison") or ROUND.chair[n].confuse then
--          for i, v in pairs(ROUND.chair[n].hand) do
--            local targetImage = "_".. 1000*i
--            if os.time() > tt then
--              break
--            else
--              local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
--              local l = tfm.exec.addImage(IMG.misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
--              table.insert(ROUND.chair[n].imgShadow, l)
--            end
--          end
--        elseif ROUND.turn == n and ROUND.accumulated then
--          for i, v in pairs(ROUND.chair[n].hand) do
--            local targetImage = "_".. 1000*i
--            if os.time() > tt then
--              break
--            else
--              if not ROUND.accumulated.allowed[v[2]] then
--                local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
--                local l = tfm.exec.addImage(IMG.misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
--                table.insert(ROUND.chair[n].imgShadow, l)
--              end
--            end
--          end
 --       end
			end
		end
	end
end

function updateFlow(p, n)
	str = {
		RIGHT = "&gt;",
		LEFT = "&lt;"
	}
	local txt = string.format("<b><p align='center'><font size='20px'color='#%s'>", ROUND.color[1])
	local normal = string.format("%s ", str[ROUND.flow])
	local light = string.format("<font face='Verdana' color='#%s'>%s</font> ", ROUND.color[2], str[ROUND.flow])
	for i=1, 64 do
		txt = txt .. normal
	end
	ui.addTextArea(14, txt, p, -800, 160, 2400, nil, 0, 0, 0, false)
end

function updateArrow(p)
	if not p then
		for i, v in pairs(ROUND.arrowImg) do
			tfm.exec.removeImage(v)
		end
		ROUND.arrowImg = {}
	end
	ui.addTextArea(29, "", p, ROUND.chair[ROUND.turn].x-40, 120, 80, 30, -1, 0xffffff, ROUND.gameMode.team and 1 or 0.3, false)
	table.insert(ROUND.arrowImg, tfm.exec.addImage(LIGHT[ROUND.chair[ROUND.turn].light or "yellow"].img, "_1000", ROUND.chair[ROUND.turn].x-50, 20, p))
	table.insert(ROUND.arrowImg, tfm.exec.addImage(LIGHT[ROUND.chair[ROUND.turn].light or "yellow"].img, "!1000", ROUND.chair[ROUND.turn].x-50, 20, p))
	updateScore(ROUND.turn)
end

function teleportCloud()
	if ROUND and ROUND.subitDeath and ROUND.cloud and ROUND.cloud.obj and ROUND.cloud.delay < os.time() and tfm.get.room.objectList[ROUND.cloud.obj] then
		local obj = tfm.get.room.objectList[ROUND.cloud.obj]
		if obj.x < 0 then
			tfm.exec.moveObject(ROUND.cloud.obj, 800, 0.01, true, 0, 2, false)
			ROUND.cloud.delay = os.time() + 5000
		elseif obj.x > 800 then
			tfm.exec.moveObject(ROUND.cloud.obj, -800, 0.01, true, 0, 2, false)
			ROUND.cloud.delay = os.time() + 5000
		end
	end
end

function showAccumulated(p)
	if ROUND.accumulated then
		ui.addTextArea(2, string.format("<font size='25px' color='#%s'><b>= +%i", "ffffff", ROUND.accumulated.cards), p, 490, 230, nil, nil, 0, 0, 0, false)
	else
		ui.removeTextArea(2)
	end
end

function showUno(n)
	ui.addTextArea(6, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", "ffffff", CONFIG.UNO), ROUND.chair[n].owner, 675, 205, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
	ROUND.chair[n].uno = "one card"
end

function showChallenge(n)
	ui.addTextArea(7, string.format("<p align='center'><font size='14px' color='#%s'>%s", "ffffff", translate(ROUND.chair[n].owner, "CHALLENGE")), ROUND.chair[n].owner, 675, 240, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
end

function showPass(n)
	ROUND.chair[n].draw = true
	ui.addTextArea(5, string.format("<p align='center'><font size='14px' color='#%s'>%s", "ffffff", translate(ROUND.chair[n].owner, "PASS")), ROUND.chair[n].owner, 675, 275, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
end

function updateTurnTimer()
	local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
	if time <= 5 and time >= 0 then
		ui.addTextArea(17, string.format("<p align='center'><font size='18px'><r><b>%i", time), nil, ROUND.chair[ROUND.turn].x-20, 20, 40, nil, 1, 0xff0000, 0.8, false)
		ROUND.chair[ROUND.turn].underTime = false
	else
		ui.removeTextArea(17)
	end
end

function showNeedDraw(n)
	local y = 195 - (#ROUND.deck/108 * 10)
	if ROUND.subitDeath then
		y = 195
	end
	ui.addTextArea(18, string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[n].owner, "DRAW")), ROUND.chair[n].owner, 300, y, 90, nil, 0, 0, 0, false)
end

function unlockChair(p, name, ever)
	if p and PLAYER[p] then
		local cont = 0
		for i, v in pairs(ROUND.chair or {}) do
			if v.owner and v.owner ~= "" then
				cont = cont + 1
			end
		end
		if not PLAYER[p].skin[name] and ((CONFIG.ranked and cont >= 4 and tfm.get.room.uniquePlayers >= 4) or RANKED or ever) then
			tfm.exec.chatMessage("<j>"..string.format(translate(p, "CHAIR_UNLOCKED"), translate(p, SKIN[name].name)), p)
			PLAYER[p].skin[name] = 3
			if name == "vampire" then
				PLAYER[p].skinEquiped = "vampire"
			end
			saveData(p)
			local cont = 0
			for i, v in pairs(PLAYER[p].skin) do
				cont = cont + 1
			end
			if cont >= 120 then
				system.giveEventGift(p, TITLE.king_of_thrones)
			end
		elseif PLAYER[p].faustao then
			tfm.exec.chatMessage("["..string.format(translate(p, "CHAIR_UNLOCKED"), translate(p, SKIN[name].name)).."]", p)
		end
	end
end

function unlockRule(p, name, ever)
	if not PLAYER[p].rules[name] and (not RULE[name].lock or ever) then
		tfm.exec.chatMessage("<j>"..string.format(translate(p, "RULE_UNLOCKED"), translate(p, RULE[name].name)), p)
		PLAYER[p].rules[name] = 3
		saveData(p)
	end
end

function unlockTrophy(p, name)
	if CONFIG.ranked and TROPHY[name] and not PLAYER[p].trophy[name] and not TROPHY[name].lock then
		tfm.exec.chatMessage("<j>"..translate(p, "MEDAL_UNLOCKED"), p)
		PLAYER[p].trophy[name] = 3
		saveData(p)
	elseif PLAYER[p].faustao then
		tfm.exec.chatMessage(string.format("[%s (%s)]", translate(p, "MEDAL_UNLOCKED"), name), p)
	end
end

function unlockFlag(p, name)
	if FLAG[name] and not PLAYER[p].flags[name] then
		PLAYER[p].flags[name] = 3
		saveData(p)
	end
end

function showRules(p)
	local order = {"dos","neighbor","custom","red","blue","green","bluegreen","yellow","ninguem","nou","flash","jumpin","stack","sequence","hard","limbo","overload","perfection","satisfaction","insatisfaction","tracking","fastdraw","clean","nocombo","supercombo","hell","black","nochallenge","simon","imitate","shiny","batata","bomb","draw99","compass","curse","confuse","justice","magnet","peace","steal","theft","death","portal","ink","dice","paradox","half","oddeven","mimic","ban","mix","gift","trade","web","tornado","carousel","luck","chair","spy","thunder","rain","equality","meep","wish","box","random","clone","key","share","rule","chess","team","camouflage","limit","noaction","mess","revelation","mini","maxi","mulligan","drekkemaus","jingle","papaille","charlotte","elisah","buffy","snowy","icemice","elise"}
	local modes = {}
	for i, v in pairs(order) do
		if ROUND.gameMode[v] then
			table.insert(modes, v)
		end
	end
	ui.removeTextArea(27, p)
	for i=10001, 10005 do
		ui.removeTextArea(i, p)
	end
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
		PUZZLE = "DCEDC8"
	}
	if #modes > 0 then
		ui.addTextArea(27, "<b><font size='12px' color='#ffffff'><u><a href='event:house'>"..translate(p, "HOUSE_RULES"), p, 20, 190, 150, nil, 0, 0, 0, false)
		if not (p == OWNER and ROUND.spectator) then
			if #modes == 1 then
				local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>\n<font size='9px'>%s", color[RULE[modes[1]].type], modes[1], translate(p, RULE[modes[1]].name), modes[1] == "custom" and RULE.custom.customDesc or translate(p, RULE[modes[1]].desc))
				ui.addTextArea(10000+1, txt, p, 20, 180+1*30, 150, nil, 0, 0, 0, false)
				if RULE[modes[1]].img then
					table.insert(ROUND.imgRule, tfm.exec.addImage(RULE[modes[1]].img, "!1000", 0, 178+1*30, p))
				end
			else
				local cont = 0
				for i, v in pairs(modes) do
					local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>", color[RULE[v].type], v, translate(p, RULE[v].name))
					ui.addTextArea(10000+i, txt, p, 20, 190+i*20, 150, nil, 0, 0, 0, false)
					if RULE[modes[i]].img then
						table.insert(ROUND.imgRule, tfm.exec.addImage(RULE[modes[i]].img, "!1000", 0, 188+i*20, p))
					end
					cont = cont + 1
					if #modes > 5 and cont >= 4 then
						break
					end
				end
				if #modes > 5 then
					local txt = string.format("<font color='#%s'><b><a href='event:house'>+%s</a></b></font>", ROUND.color[2], #modes-4)
					ui.addTextArea(10000+5, txt, p, 20, 190+5*20, 150, nil, 0, 0, 0, false)
				end
				--tfm.exec.chatMessage("<bv>"..translate(p, "TIP_RULES"), p)
			end
		end
	end
end

function eraseChair(n)
	checkVars("eraseChair", {n}, {"number"})
	for i, v in pairs(ROUND.chair[n].skin.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].skin.img = {}
end

function drawChair(n, p)
	checkVars("drawChair", {n}, {"number"})
	if not p then
		eraseChair(n)
	end
	local chair = ROUND.chair[n]
	if chair.mode == "BUSY" then
		table.insert(chair.skin.img, tfm.exec.addImage(SKIN[chair.skin.id].img, "_1000", chair.x-50, 20, p))
		if BOT[chair.owner] then
			table.insert(chair.skin.img, tfm.exec.addImage(BOT[chair.owner].img, "!0", chair.x-50, 20, p))
		end
		if chair.team then
			table.insert(chair.skin.img, tfm.exec.addImage(IMG.team[chair.team][(#ROUND.chair > 8) and 2 or 1], "!1000", chair.x-50, 115, p))
		elseif chair.flag and chair.flag ~= "default" then
			table.insert(chair.skin.img, tfm.exec.addImage(FLAG[chair.flag].img[(#ROUND.chair > 8) and "mini" or "big"], "!1000", chair.x-50, 115, p))
		end
	elseif chair.mode == "EMPTY" or chair.mode == "FREE" then
		table.insert(chair.skin.img, tfm.exec.addImage(IMG.misc.emptyChair, "_1000", chair.x-50, 20, p))
	end
	updateScore(n, p)
end

function giveTip(p)
	if ROUND.color and ROUND.color[2] then
		local pool = {"TIP_1", "TIP_2", "TIP_3", "TIP_4", "TIP_5", "TIP_6", "TIP_7", "TIP_8", "TIP_9", "TIP_10", "TIP_11", "TIP_12", "TIP_13", "TIP_14", "TIP_15", "TIP_16", "TIP_17", "TIP_18", "TIP_19", "TIP_20", "TIP_21", "TIP_23", "TIP_24", "TIP_25", "TIP_27"}
		local tip = translate(p, pool[math.random(#pool)])
		ui.addTextArea(33, string.format("<b><p align='center'><font color='#000000' size='12px'>\"%s\"\n[%s]", tip, translate(p, "NEXT")), p, 121, 296, 560, nil, 0, 0, 0, false)
		ui.addTextArea(32, string.format("<b><p align='center'><font color='#%s' size='12px'>\"%s\"\n<j><a href='event:tip'>[%s]</a>", ROUND.color[2], tip, translate(p, "NEXT")), p, 120, 295, 560, nil, 0, 0, 0, false)
	end
end

function startTip(p)
	if ROUND.state == "START" and ROUND.color then
		ui.addTextArea(31, string.format("<p align='center'><font color='#%s' size='15px'>%s", "ffffff" or ROUND.color[1], translate(p, "START_TIP")), p, 100, 170, 600, nil, 0, 0, 0, false)
	end
end

function discardEffectRaw(x, y, particle, p)
	local vy = -1.5
	local vx = 0
	local pool = {}
	local tt = os.time()+5
	for i=1, 3 do
		table.insert(pool, {
			['x']=x+5+(i/3)*40,
			['y']=y,
			['vx'] = vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i=1, 3 do
		table.insert(pool, {
			['x']=x+5+(i/3)*40,
			['y']=y+75,
			['vx'] = vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i=1, 6 do
		table.insert(pool, {
			['x']=x+5,
			['y']=y+(i/6)*75,
			['vx'] = math.random(-2,1)*0.05+vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		})
	end
	for i=1, 6 do
		table.insert(pool, {
			['x']=x+45,
			['y']=y+(i/6)*75,
			['vx'] = math.random(-2,1)*0.05+vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i, v in pairs(pool) do
		if os.time() > tt then
			break
		else
			tfm.exec.displayParticle(particle, v.x, v.y, v.vx, v.vy, 0, 0, p)
		end
	end
end

function discardEffect(n, card)
	local x = 0
	local y = 320
	local particle = 4
	if #ROUND.chair[n].hand > 16 then
		x = ((card-1)/(#ROUND.chair[n].hand-1))*750
	else
		x = 400-#ROUND.chair[n].hand*25+50*(card-1)
	end
	discardEffectRaw(x, y, particle, ROUND.chair[n].owner)
	
end

function showCardsGainned(n, qtd)
	if qtd and qtd ~= 0 then
		local symbol = qtd < 0 and "-" or "+"
		qtd = math.abs(qtd)
		ui.addTextArea(2010+n, string.format("<p align='center'><font size='20px' color='#000000'><b>%s%s", symbol, qtd), nil, ROUND.chair[n].x-49, 146, 100, 60, 0, 0, 0, false)
		ui.addTextArea(2000+n, string.format("<p align='center'><font size='20px' color='#%s'><b>%s%s", ROUND.color[2], symbol, qtd), nil, ROUND.chair[n].x-50, 145, 100, 60, 0, 0, 0, false)
		table.insert(TIMER.txt, {time=os.time()+2000, id=2000+n})
		table.insert(TIMER.txt, {time=os.time()+2000, id=2010+n})
	end
end

function confusionEffect()
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if (v.confuse or isCursed(i, "poison")) then
				for i=1, 3 do
					tfm.exec.displayParticle(14, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
					tfm.exec.displayParticle(9, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
				local qtd = #v.hand > 16 and 16 or #v.hand
				local maxx = math.floor(qtd*1.5)
				for i=1, maxx do
					tfm.exec.displayParticle(14, math.random(-25*qtd,25*qtd)+400, math.random(350,390), 0, -math.random(), 0, 0, v.owner)
					tfm.exec.displayParticle(9, math.random(-25*qtd,25*qtd)+400, math.random(350,390), 0, -math.random(), 0, 0, v.owner)
				end
			elseif v.batata > 1 and v.mode ~= "DELETED" then
				 -- efeito da batata
				local fx = {11, 11, 2, 2, 13}
				for i=1, 6 do
					tfm.exec.displayParticle(fx[v.batata], v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
			elseif v.mimic then
				local qtd = ROUND.turn and 6 or 2
				for i=1, qtd do
					tfm.exec.displayParticle(1, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
			end
		end
	end
end

function drawTopCard(p)
	if not p then
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		ROUND.topCard.img = {}
	end
	local y = 210 - (#ROUND.pile/108 * 10)
	table.insert(ROUND.topCard.img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.shadow, "_1000", 430, 210, p))
	local c = showCard(ROUND.topCard.card, 430, y, p)
	for i, v in pairs(c) do
		table.insert(ROUND.topCard.img, v)
	end
	if ROUND.gameMode.neighbor and isNumeric(ROUND.topCard.card) then
		table.insert(ROUND.topCard.img, tfm.exec.addImage(IMG.neighbor[ROUND.topCard.card[2]][ROUND.portal.side], "_1000", 430, y, p))
	end
	return y
end

function addTopCard(card, p, update)
	ROUND.topCard.img2 = ROUND.topCard.img2 or {}
	if #ROUND.topCard.img2 >= 20 then
		for i, v in pairs(ROUND.topCard.img2[1]) do
			tfm.exec.removeImage(v)
		end
		table.remove(ROUND.topCard.img2, 1)
	end
	local x = update and ROUND.topCard.x or 455 + math.random(-8, 8)
	local y = update and ROUND.topCard.y or 245 + math.random(-5, 5)
	local a = update and ROUND.topCard.a or math.random(-20, 20)
	local c = showCard(card, x, y, p, nil, "big", 0.55, 0.55, a, 1, 0.5, 0.5)
	if ROUND.gameMode.neighbor and isNumeric(ROUND.topCard.card) then
		table.insert(c, tfm.exec.addImage(IMG.neighbor[ROUND.topCard.card[2]][ROUND.portal.side], "_1000", x, y, p, 1, 1, math.rad(a), 1, 0.5, 0.5))
	end
	table.insert(ROUND.topCard.img2, c)
	ROUND.topCard.x = x
	ROUND.topCard.y = y
	ROUND.topCard.a = a
	return y
end

function removeTopCard()
	local card = ROUND.topCard.img2[#ROUND.topCard.img2]
	for i, v in pairs(card) do
		tfm.exec.removeImage(v)
	end
	table.remove(ROUND.topCard.img2)
end

function clearTopCard()
	for i, v in pairs(ROUND.topCard.img2) do
		for j, w in pairs(v) do
			tfm.exec.removeImage(w)
		end
	end
	ROUND.topCard.img2 = {}
end

function showPreviousCard(p)
	local y = 210 - (#ROUND.pile/108 * 10)
	local c = showCard(ROUND.topCard.card2, 430, y, p)
	local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, "_1000", 430, y, p)
	local c2 = showCard(ROUND.topCard.card, 450, y, p)
	for i, v in pairs(c) do
		TIMER.img[v] = os.time()+1000
	end
	for i, v in pairs(c2) do
		TIMER.img[v] = os.time()+1000
	end
	TIMER.img[l] = os.time()+1000
end

function clearImagesAction(n)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
end