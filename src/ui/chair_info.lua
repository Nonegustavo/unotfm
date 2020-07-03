window.create("INFOCHAIR2", function(player, var, name, page)
	local x = 200
	local y = 100
	local width = 200
	local height = 220
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- título da janela
	ui.addTextArea(519, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s", translate(player, SKIN[name].name) or "", translate(player, "CREATED_BY") or "", SKIN[name].author) or "", player, 200, y+5, 200, nil, 0, 0, 0, true)
	
	local desc = translate(player, SKIN[name].desc)
	local mission = translate(player, SKIN[name].mission)
	local strprogress = progress(player, name)
	local formated = string.format("<p align='center'><font size='10px'><i>'%s'</i>\n\n<b>%s</b>\n<bl>%s", desc or "", mission or "", strprogress or "")
	
	ui.addTextArea(520, formated, player, 200, y+110, 200, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	table.insert(imageId, tfm.exec.addImage(SKIN[name].img, "&1", 250, y+10, player))
	return {500,501,502,503,504,505,506,507,508,509,519,520}, imageId
end)