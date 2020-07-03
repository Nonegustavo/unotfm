window.create("SETTINGS3", function(player, var)
	local x = 200
	local y = 100
	local width = 400
	local height = 200
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
	ui.addTextArea(109, "<p align='center'>"..translate(player, "BACK"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:settings'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
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
function(player, var, page)
	page = page or 1
	local x = 200
	local y = 100
	local width = 400
	local height = 200
	local t2 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedchair'>[%s]", translate(player, "HOUSE_FIXED_CHAIRS"), CONFIG.fixedChair and "<vp>" or "<r>", CONFIG.fixedChair and translate(player, "YES") or translate(player, "NO"))
	local t3 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:newplayers'>[%s]", translate(player, "HOUSE_NEW_PLAYER"), CONFIG.newPlayers and "<vp>" or "<r>", CONFIG.newPlayers and translate(player, "YES") or translate(player, "NO"))
	local t4 = string.format("<font color='#ffffff'>%s: <j><font size='9px'><a href='event:scoreby'>[%s]", translate(player, "SCORE_BY"), translate(player, CONFIG.scoreBy))
	local t5 = string.format("<a href='event:resetscore'><r>[%s]", translate(player, "RESET_SCORE"))
	local t1 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:autostart'>[%s]", translate(player, "HOUSE_AUTOSTART"), CONFIG.autoStart and "<vp>" or "<r>", CONFIG.autoStart and translate(player, "YES") or translate(player, "NO"))
	ui.addTextArea(110, t1, player, x+5, y+60, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(111, t2, player, x+5, y+80, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(112, t3, player, x+5, y+100, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(113, t4, player, x+5, y+120, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(114, t5, player, x+5, y+140, width-10, nil, 0, 0, 0, true)
	return {110,111,112,113,114,115,116,117,118,121,122}
end)