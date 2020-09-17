window.create("CREDITS", function(player, var)
	local x = 125 -- 145 = +55
	local y = 40 -- 100 = +40
	local width = 550
	local height = 340
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
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close credits'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	ui.addTextArea(510, "<p align='center'><font size='25px'><j><b>"..translate(player, "CREDITS"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,510,519,520}
	
	local thanks = {
		{reason="THANKS_TRANSLATE", extra="EN", names={"Barberserk#0000"}},
		{reason="THANKS_TRANSLATE", extra="PL", names={"Rkubi#0000"}},
		{reason="THANKS_TRANSLATE", extra="RU", names={"Fran_bow#1314"}},
		{reason="THANKS_TRANSLATE", extra="ES", names={"Niopigaa#0000"}},
		{reason="THANKS_TRANSLATE", extra="FR", names={"Urook#1131"}},
		{reason="THANKS_TRANSLATE", extra="CN", names={"Wrfg#0000"}},
		{reason="THANKS_TRANSLATE", extra="HU", names={"Weth#9837","Martinkat#0000"}},
		{reason="THANKS_TRANSLATE", extra="TR", names={"Eralpciko#0000","Star#6725","Cileklidonut#8059"}},
		{reason="THANKS_CARDS", names={"Billysmille#0000"}},
		{reason="THANKS_POPUPS", names={"Esh#0095"}},
	}
	
	local t = translate(player, "CREDIT_TXT") .. "\n\n" .. translate(player, "CREDIT_TXT2") .."\n\n" .. translate(player, "THANKS") .. ":\n"
	
	for i, v in pairs(thanks) do
		t = t .. string.format("<v>%s <j>(%s) <n>| ", table.concat(v.names, ", "), translate(player, v.reason))
		if v.extra then
			t = string.format(t, v.extra)
		end
	end
	
	ui.addTextArea(520, t, player, x+5, y+50, width-10, nil, 0, 0, 0, true)
	return text, imageId
end)