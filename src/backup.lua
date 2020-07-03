window.create("CHAIRS", function(player, id, page)
	local x = 150
	local y = 40
	local width = 500
	local height = 350
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close chairs'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "CHAIRS"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {txt={100,101,102,103,104,105,106,107,108,109,119,120},img=imageId}
end,
function(p, id, page)
	page = page or 1
	local x = 150
	local y = 40
	local width = 500
	local height = 350
	local key = {{
		{"default","red","blue","yellow","green"},
		{"white","fire","water","earth","air"}
	},{
		{"rainbow","wood","stone","gold","diamond"},
		{"king","luck","angel","junky","shaman"}
	},{
		{"beach","cine","hell","cards","candy"},
		{"cheese","fraise","illuminati","gift","bog"}
	},{
		{"got","hamburguer","skull","school","time"},
		{"pencil","chess","show"}
	}}
	local txt={110,111,112,113,114,115,116,117,121,122}
	local img={}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:chairs %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < #key then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:chairs %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	for i, v in pairs(key[page]) do
		for j, w in pairs(v) do
			ui.addTextArea(200+i*12+j, string.format("<p align='center'><a href='event:infochair %s %s'>", w, page)..translate(p, SKIN[w].name), p, 100*j+60, (i-1)*120+100, 80, 100, PLAYER[p].skin[w] and 0x6a7495 or -1, 1, 0.2, true)
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(SKIN[w].imgMini, "&2", 100*j+60, i*120, p))
			if not PLAYER[p].skin[w] then
				text = text .. "<bl>" .. string.format("<bl><a href='event:infochair %s %s'>", w, page) .. translate(p, "LOCKED")
				--color = 0x102224
				table.insert(img, tfm.exec.addImage(IMG.misc.locked, "&10", 100*j+60, i*120, p))
			elseif PLAYER[p].skinEquiped == w then
				text = text .. "<j>" .. translate(p, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. string.format("<a href='event:equip %s %s'>", w, page) .. translate(p, "EQUIP")
			end
			ui.addTextArea(300+i*12+j, text, p, 100*j+60, (i-1)*120+180, 80, 20, -1, color, 1, true)
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
		end
	end
	return {['txt']=txt, ['img']=img}
end)

window.create("INFOCHAIR", function(player, id, name, page)
	local x = 200
	local y = 150
	local width = 400
	local height = 150
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close infochair %s'>", page)..translate(player, "BACK"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	ui.addTextArea(519, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s\n\n<i>'%s'</i>\n\n<b>%s</b>\n<bl>%s", translate(player, SKIN[name].name), translate(player, "CREATED_BY"), SKIN[name].author, translate(player, SKIN[name].desc), translate(player, SKIN[name].mission), progress(player, name)), player, 310, y+5, 280, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	table.insert(imageId, tfm.exec.addImage(SKIN[name].img, "&1", 210, 140, player))
	return {txt={500,501,502,503,504,505,506,507,508,509,519},img=imageId}
end)

window.create("SETTINGS", function(player, id, name, page)
	local x = 170
	local y = 30
	local width = 590
	local height = 365
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close settings'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	ui.addTextArea(519, "<p align='center'><font size='25px'><j><b>"..translate(player, "HOUSE_RULES"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	-- modos de jogo
	local text = {500,501,502,503,504,505,506,507,508,509,519}
	local pool = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","perfection","tracking","mulligan","overload","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","fastdraw","hard","web","thunder","clone"}
	for i=1, 14 do
		for j=1, 3 do
			local name = table.remove(pool,1)
			if name then
				local t = string.format("<b><a href='event:rule %s'>%s</a></b>", name, translate(player, RULE[name].name))
				if PLAYER[player].rules[name] then
					t = "<font color='#ffffff'>" .. t
					table.insert(imageId, tfm.exec.addImage(RULE[name].img, "&10", 200*j-30, i*17+108, player))
					if CONFIG.random then
						t = t .. string.format(" %s<font size='9px'><a href='event:setrule %s'>[%s]", CONFIG.rule[name] and "<vp>" or "<r>", name, CONFIG.rule[name] and translate(player, "YES") or translate(player, "NO"))
					end
				end
				ui.addTextArea(200+i*12+j, t, player, 200*j-10, i*17+110, 180, nil, 0, 0, 0, true)
				table.insert(text, 200+i*12+j)
			end
		end
	end
	--
	
	return {txt=text,img=imageId}
end,
function(player, id, mode)
	local pool = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","perfection","tracking","mulligan","overload","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","fastdraw","hard","web","thunder","clone"}
	local text = {}
	local imageId = {}
	-- configurações
	local t1 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedrules'>[%s]", translate(player, "HOUSE_FIXED"), CONFIG.random and "<vp>" or "<r>", CONFIG.random and translate(player, "YES") or translate(player, "NO"))
	local t2 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedchair'>[%s]", translate(player, "HOUSE_FIXED_CHAIRS"), CONFIG.fixedChair and "<vp>" or "<r>", CONFIG.fixedChair and translate(player, "YES") or translate(player, "NO"))
	local t3 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:newplayers'>[%s]", translate(player, "HOUSE_NEW_PLAYER"), CONFIG.newPlayers and "<vp>" or "<r>", CONFIG.newPlayers and translate(player, "YES") or translate(player, "NO"))
	local t4 = string.format("<font color='#ffffff'>%s: <j><font size='9px'><a href='event:scoreby'>[%s]", translate(player, "SCORE_BY"), translate(player, CONFIG.scoreBy))
	local t5 = string.format("<a href='event:resetscore'><r>[%s]", translate(player, "RESET_SCORE"))
	local t6 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:autostart'>[%s]", translate(player, "HOUSE_AUTOSTART"), CONFIG.autoStart and "<vp>" or "<r>", CONFIG.autoStart and translate(player, "YES") or translate(player, "NO"))
	local t7 = (player == OWNER or isAdm(player)) and string.format("<a href='event:commands'><bv>[%s]", translate(player, "COMMANDS")) or string.format("<a href='event:party'><bv>[%s]", translate(player, "PARTY_ROOM"))
	ui.addTextArea(20000, t1, player, 200*1-30, 0*20+100, 200, nil, 0, 0, 0, true)
	ui.addTextArea(20001, t2, player, 200*2-30, 0*20+100, 200, nil, 0, 0, 0, true)
	ui.addTextArea(20002, t3, player, 200*3-30, 0*20+100, 200, nil, 0, 0, 0, true)
	ui.addTextArea(20004, t6, player, 200*1-30, -1*20+100, 200, nil, 0, 0, 0, true)
	ui.addTextArea(20003, t4, player, 200*2-30, -1*20+100, 400, nil, 0, 0, 0, true)
	ui.addTextArea(20005, t7, player, 200*3+20, -1*20+100, 400, nil, 0, 0, 0, true)
	table.insert(text, 20000)
	table.insert(text, 20001)
	table.insert(text, 20002)
	table.insert(text, 20003)
	table.insert(text, 20004)
	table.insert(text, 20005)
	-- regras da casa
	for i=1, 14 do
		for j=1, 3 do
			local name = table.remove(pool,1)
			if (name and mode and mode[name]) or mode == "all" then
				local t = string.format("<b><a href='event:rule %s'>%s</a></b>", name, translate(player, RULE[name].name))
				if PLAYER[player].rules[name] then
					t = "<font color='#ffffff'>" .. t
					if CONFIG.random then
						t = t .. string.format(" %s<font size='9px'><a href='event:setrule %s'>[%s]", CONFIG.rule[name] and "<vp>" or "<r>", name, CONFIG.rule[name] and translate(player, "YES") or translate(player, "NO"))
					end
				end
				ui.addTextArea(200+i*12+j, t, player, 200*j-10, i*17+110, 180, nil, 0, 0, 0, true)
			end
		end
	end
	return {txt=text}
end)

window.create("LEADERBOARD", function(player, id, page, tab)
	local x = 200
	local y = 40
	local width = 400
	local height = 350
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close leaderboard'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "LEADERBOARD"), player, x+10, y, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	-- divisorias
	for i=1, 10 do
		ui.addTextArea(300+i, "", player, 210, 120+i*20, 380, 10, 0x092326, 0x092326, i%2, true)
	end
	--
	return {txt={100,101,102,103,104,105,106,107,108,109,119,120,301,302,303,304,305,306,307,308,309,310,600,601,602},img=imageId}
end,
function(p, id, page, tab)
	page = page or 1
	local x = 200
	local y = 40
	local width = 400
	local height = 350
	local txt={110,111,112,113,114,115,116,117,121,122}
	local img={}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:leaderboard %s %s'> ", page-1, tab), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < 20 then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:leaderboard %s %s'> ", page+1, tab), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- abas
	if tab == "weekly" then
		local s, remaining = 1, 1
		local days = math.floor(remaining / 86400000)
		local hours = math.ceil((remaining % 86400000) / 3600000)
		ui.addTextArea(600, "<p align='center'><j>"..translate(p, "WEEKLY"), p, 210, 80, 180, 15, 0x092326, 0x092326, 1, true)
		ui.addTextArea(601, "<p align='center'><a href='event:leaderboard 1 global'>"..translate(p, "GLOBAL"), p, 410, 80, 180, 15, -1, 0x092326, 1, true)
		ui.addTextArea(602, "<p align='center'>"..translate(p, "WEEKLY_DESC").."\n"..string.format(translate(p, "WEEKLY_TIME"), days, hours), p, 210, 102, 380, nil, 0, 0, 0, true)
	else
		ui.addTextArea(600, "<p align='center'><a href='event:leaderboard 1 weekly'>"..translate(p, "WEEKLY"), p, 210, 80, 180, 15, -1, 0x092326, 1, true)
		ui.addTextArea(601, "<p align='center'><j>"..translate(p, "GLOBAL"), p, 410, 80, 180, 15, 0x092326, 0x092326, 1, true)
		ui.addTextArea(602, "<p align='center'>"..translate(p, "GLOBAL_DESC"), p, 210, 102, 380, nil, 0, 0, 0, true)
	end
	-- nomes
	for i=1, 10 do
		local n = i + (page-1)*10
		local color = "BABD2F"
		if tab == "weekly" then
			color = n <= 10 and "BABD2F" or n <= 50 and "C2C2DA" or "E68D43"
		end
		ui.addTextArea(400+i, string.format("<font color='#%s'>#%s", color, n), p, 210, 116+i*20, nil, nil, 0, 0, 0, true)
		table.insert(txt, 400+i)
		--[[
		if tab == "weekly" then
			table.insert(img, tfm.exec.addImage(IMG.flag[RANKING.weekly[n].cmm], "&10", 245, 118+i*20, p))
			ui.addTextArea(500+i, string.format("<textformat tabstops='200px'>%s%s\t<j>%s", (RANKING.weekly[n].name == p) and "vp" or "<v>", RANKING.weekly[n].name, RANKING.weekly[n].score), p, 270, 116+i*20, nil, nil, 0, 0, 0, true)
			table.insert(txt, 500+i)
		else
			table.insert(img, tfm.exec.addImage(IMG.flag[RANKING.global[n].cmm], "&10", 245, 118+i*20, p))
			ui.addTextArea(500+i, string.format("<textformat tabstops='150px'>%s%s\t<n><font color='#BABD2F'>%s</font>|%s|<font color='#E68D43'>%s</font> = <vp>%s <n>| <v>%s", (RANKING.global[n].name == p) and "vp" or "<v>", RANKING.global[n].name, RANKING.global[n].gold, RANKING.global[n].silver, RANKING.global[n].bronze, RANKING.global[n].score, RANKING.global[n].win), p, 270, 116+i*20, nil, nil, 0, 0, 0, true)
			table.insert(txt, 500+i)
		end
		--]]
	end
	return {['txt']=txt, ['img']=img}
end)

window.create("LOG", function(player, id, page)
	local x = 5
	local y = 30
	local width = 790
	local height = 360
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>Close", player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close log'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {txt={100,101,102,103,104,105,106,107,108,109,119,120},img=imageId}
end,
function(p, id, page)
	page = page or 1
	local x = 5
	local y = 30
	local width = 790
	local height = 360
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", "previous"), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:log %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	local maxPages = math.ceil(#LOG/10)
	if page < maxPages then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", "next"), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:log %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	local ini = (page-1)*10+1
	local text={110,111,112,113,114,115,116,117,118,121,122}
	for i=1, 10 do
		local obj = LOG[ini]
		if ini <= #LOG then
			ui.addTextArea(i*10000, "<vp>#"..#LOG-ini+1, p, 10, i*30+11, 780, 18, -1, 1, 0.2, true)
			table.insert(text, i*10000)
			for j, w in pairs(obj or {}) do
				local txt = string.format("<font size='10px'><v>%s\n<j>%s - %ss", w.name, w.score, w.time)
				ui.addTextArea(i*10000+j, txt, p, 95*(j-1)+40, i*30+5, 100, nil, 0, 0, 0, true)
				table.insert(text, i*10000+j)
			end
		end
		ini = ini + 1
	end
	return {txt=text}
end)