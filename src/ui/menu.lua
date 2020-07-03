window.create("MENU", function(player, var)
	local x = 5
	local y = 258
	local width = 140
	local height = 110
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,519,520}
	
	local menu = {
		{link="rules 1", text="RULES", hotkey="H"},
		{link="credits", text="CREDITS"},
		{link="settings", text="HOUSE_RULES", hotkey="U"},
		{link="options", text="SETTINGS", hotkey="O"},
		{link="profile", text="PROFILE", hotkey="P"},
	}
	
	for i, v in pairs(menu) do
		local t = string.format("<a href='event:%s'>%s", v.link, translate(player, v.text))
		if v.hotkey then
			t = t .. " (" .. v.hotkey .. ")"
		end
		ui.addTextArea(520+i, t, player, x+5, y+5+((i-1)*20), nil, nil, 0, 0, 0, true)
		table.insert(text, 520+i)
	end
	return text, imageId
end)