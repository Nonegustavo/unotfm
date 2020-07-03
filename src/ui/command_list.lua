window.create("COMMAND", function(player, var)
	local x = 125 -- 145 = +55
	local y = 100 -- 100 = +40
	local width = 550
	local height = 180
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
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close command'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,519,520}
	
	local desc = "<j><b>!start</b><n> : "..translate(player, "COMMAND_START")
	desc = desc .. "\n<j><b>!new</b><n> : "..translate(player, "COMMAND_NEW")
	desc = desc .. "\n<j><b>!map code</b><n> : "..translate(player, "COMMAND_MAP")
	desc = desc .. "\n<j><b>!reset</b><n> : "..translate(player, "COMMAND_RESET")
	desc = desc .. "\n<j><b>!chair num name</b><n> : "..translate(player, "COMMAND_CHAIR")
	desc = desc .. "\n<j><b>!kick name</b><n> : "..translate(player, "COMMAND_KICK")
	desc = desc .. "\n<j><b>!ban name</b><n> : "..translate(player, "COMMAND_BAN")
	desc = desc .. "\n<j><b>!unban name</b><n> : "..translate(player, "COMMAND_UNBAN")
	desc = desc .. "\n<j><b>!adm name</b><n> : "..translate(player, "COMMAND_ADM")
	desc = desc .. "\n<j><b>!pw</b><n> : "..translate(player, "COMMAND_PW")
	desc = desc .. "\n<j><b>!spectator</b><n> : "..translate(player, "COMMAND_SPECTATOR")
	ui.addTextArea(520, desc, player, x+5, y+5, width-10, nil, 0, 0, 0, true)
	return text, imageId
end)