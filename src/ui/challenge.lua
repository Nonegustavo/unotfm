window.create("CHALLENGE", function(player, var, card)
	local x = 240 -- 145 = +55
	local y = 200 -- 100 = +40
	local width = 300
	local height = 110
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	
	-- botão sim
	ui.addTextArea(506, "", player, x+8, y+height-22, width/2-16, 13, 0xFFE45E, 0xFFE45E, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width/2-16, 13, 0x635200, 0x635200, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width/2-17, 12, 0xC6A500, 0xC6A500, alpha, true)
	ui.addTextArea(509, string.format("<font color='#3D3100'><p align='center'>%s", translate(player, "YES")), player, x+9, y+height-24, width/2-17, nil, 0x314e57, 0xffff00, 0, true)
	ui.addTextArea(510, "<p align='right'><a href='event:challenge'> ", player, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	
	-- botão não
	ui.addTextArea(511, "", player, x+width/2+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(512, "", player, x+width/2+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(513, "", player, x+width/2+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(514, string.format("<p align='center'>%s", translate(player, "NO")), player, x+width/2+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(515, "<p align='right'><a href='event:close challenge'> ", player, x+width/2+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516}
	local c = showCard(card, x+10, y+5, player, "&1000")
	table.insert(imageId, c[1])
	table.insert(imageId, c[2])
	local previous = previousChair(ROUND.turn)
	previous = nickMinifier(nickHashtag(ROUND.chair[previous].owner))
	ui.addTextArea(516, string.format("<p align='center'><font size='14px'>"..translate(player, "CHALLENGE_COLOR"), previous), player, x+65, y+20, width-65, nil, 0, 0, 0, true)
	return text, imageId
end)