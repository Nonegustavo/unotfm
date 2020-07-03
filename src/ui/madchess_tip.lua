window.create("CHESS", function(player, var, name)
	local x = 200 -- 145 = +55
	local y = 140 -- 100 = +40
	local width = 500
	local height = 200
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
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close chess'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local card = {
		{{{"red","pawn"},"CHESS_PAWN"},{{"red","rook"},"CHESS_ROOK"},{{"red","knight"},"CHESS_KNIGHT"}},
		{{{"red","bishop"},"CHESS_BISHOP"},{{"black","queen"},"CHESS_QUEEN"},{{"black","king"},"CHESS_KING"}},
	}
	local text = {500,501,502,503,504,505,506,507,508,509,519}
	for i, v in pairs(card) do
		for j, w in pairs(v) do
			local c = showCard(w[1], 160*j+50, i*80+65, player, "&1000")
			--table.insert(imageId, tfm.exec.addImage(SKIN[w].imgMini, "&2", 100*j+60, i*120, p))
			table.insert(imageId, c[1])
			table.insert(imageId, c[2])
			ui.addTextArea(200+i*12+j, "<font size='10px'>"..translate(player, w[2]), player, 160*j+105, i*80+65, 100, 75, 0, 0, 0, true)
			table.insert(text, 200+i*12+j)
		end
	end
	return text, imageId
end)