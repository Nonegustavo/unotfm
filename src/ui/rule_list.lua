window.create("SETTINGS2", function(player, var, page)
	local x = 200
	local y = 30
	local width = 400
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
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close settings2'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "HOUSE_RULES"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(p, var, page)
	page = page and tonumber(page) or 1
	local x = 200
	local y = 30
	local width = 400
	local height = 360
	local pool = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","sequence","perfection","tracking","mulligan","overload","limbo","fastdraw","hard","shiny","neighbor","team","mess","bluegreen","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","web","thunder","clone","luck","box","wish","ink","confuse","batata","curse","magnet","portal","compass","tornado","theft","ban","simon","half","paradox","oddeven","mimic","mix","justice","key","share"}
	local hidden = {"custom", "elise", "charlotte", "elisah", "drekkemaus", "buffy", "jingle", "papaille", "snowy", "icemice"}
	for i, v in pairs(hidden) do
		if PLAYER[p].rules[v] or CONFIG.rule[v] then
			table.insert(pool, v)
		end
	end
	local maxPages = math.ceil(#pool/20)
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:settings2 %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < maxPages then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:settings2 %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	local text = {110,111,112,113,114,115,116,117,118,121,122}
	local imageId = {}
	
	local t3 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedrules'>[%s]", translate(p, "HOUSE_FIXED"), CONFIG.random and "<vp>" or "<r>", CONFIG.random and translate(p, "YES") or translate(p, "NO"))
	local t4 = string.format("<a href='event:clearrules'><r>[%s]", translate(p, "CLEAR_HOUSE"))
	local t2 = string.format("<a href='event:commands'><bv>[%s]", translate(p, "COMMANDS"))
	local t1 = (p == OWNER or isAdm(p)) and string.format("<a href='event:roomoptions'><bv>[%s]", translate(p, "ROOM_OPTIONS")) or string.format("<a href='event:party'><bv>[%s]", translate(p, "PARTY_ROOM"))
	ui.addTextArea(20000, t1, p, 200*1+18, -1*20+100, 200, nil, 0, 0, 0, true)
	if p == OWNER or isAdm(p) then
		ui.addTextArea(20003, t2, p, 200*2+18, -1*20+100, 200, nil, 0, 0, 0, true)
		ui.addTextArea(20002, t4, p, 200*2+18, 0*20+100, 200, nil, 0, 0, 0, true)
	end
	ui.addTextArea(20001, t3, p, 200*1+18, 0*20+100, 200, nil, 0, 0, 0, true)
	table.insert(text, 20000)
	table.insert(text, 20001)
	table.insert(text, 20002)
	table.insert(text, 20003)
	
	
	local ini = (page-1)*20+1
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
		PUZZLE = "DCEDC8"
	}
	for i=1, 10 do
		for j=1, 2 do
			local name = pool[ini]
			ini = ini + 1
			if name and (name ~= "custom" or PLAYER[p].rules[name]) then
				local t = string.format("<b><a href='event:rule %s'>%s</a></b>", name, translate(p, RULE[name].name))
				if PLAYER[p].rules[name] then
					t = string.format("<font color='#%s'>%s", color[RULE[name].type], t)
					table.insert(imageId, tfm.exec.addImage(RULE[name].img, "&10", 200*j, i*20+108, p))
					if CONFIG.random then
						t = t .. string.format(" %s<font size='9px'><a href='event:setrule %s %s'>[%s]", CONFIG.rule[name] and "<vp>" or "<r>", name, page, CONFIG.rule[name] and translate(p, "YES") or translate(p, "NO"))
					end
				end
				ui.addTextArea(200+i*12+j, t, p, 200*j+20, i*20+110, 180, nil, 0, 0, 0, true)
				table.insert(text, 200+i*12+j)
			end
		end
	end
	return text, imageId
end)