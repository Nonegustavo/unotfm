window.create("CUSTOM", function(player, var)
	local x = 50
	local y = 60
	local width = 700
	local height = 300
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
	ui.addTextArea(120, "<p align='right'><a href='event:close custom'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "CUSTOM"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(p, var)
	local x = 50
	local y = 60
	local width = 700
	local height = 300
	for i, v in pairs(CONFIG.custom.action) do
		ui.addTextArea(109+i, printAction(p, i), p, x+10, 80+i*30, width-20, nil, 0, 0, 0, true)
	end
	if #CONFIG.custom.action < 5 then
		ui.addTextArea(115, string.format("<vp><a href='event:addrule'>[%s]</a>", translate(p, "ADD_ACTION")), p, x+10, 110+(#CONFIG.custom.action*30), width-20, nil, 0, 0, 0, true)
	end
	ui.addTextArea(116, string.format("%s: <r><a href='event:copy red'>[%s]</a> <bv><a href='event:copy blue'>[%s]</a> <a:active><a href='event:copy yellow'>[%s]</a> <vp><a href='event:copy green'>[%s]</a>", translate(p, "CUSTOM_COPIES"), CONFIG.custom.color.red, CONFIG.custom.color.blue, CONFIG.custom.color.yellow, CONFIG.custom.color.green), p, x+10, y+210, width-20, nil, 0, 0, 0, true)
	ui.addTextArea(117, string.format("%s: <bl><i>'%s'</i> <j><a href='event:desc'>[%s]", translate(p, "CUSTOM_DESC"), CONFIG.custom.desc or translate(p, "CUSTOM_DESC_INFO"), translate(p, "CUSTOM_EDIT")), p, x+10, y+230, width-20, nil, 0, 0, 0, true)
	return {110,111,112,113,114,115,116,117,99999,99998}
end)