window.create("INFO_INVENTORY", function(player, var, tab, name)
	local txt, img = {}, {}
	local x, y, width, height = 65, 47, 206, 300
	table.insert(img, tfm.exec.addImage("17286e18739.png", ":1", x, y, player))
	return txt, img
end,
function(player, var, tab, name)
	local txt, img = {150, 151, 152, 153, 154, 155}, {}
	local x, y, width, height = 65, 47, 206, 300
	local list = {chairs = CHAIRLIST, panels = PANELLIST, lights = LIGHTLIST}
	list = list[tab]
	local inventory = {chairs = "skin", panels = "flags", lights = "lights"}
	inventory = inventory[tab]
	local tableref = {chairs = SKIN, panels = FLAG, lights = LIGHT}
	tableref = tableref[tab]
	local equipref = {chairs = "skinEquiped", panels = "flagEquipped", lights = "lightEquiped"}
	equipref = equipref[tab]
	local imgref = {chairs = "imgMini", panels = "imgDesc", lights = "imgMini"}
	imgref = imgref[tab]
	ui.addTextArea(150, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s", translate(player, tableref[name].name) or "", translate(player, "CREATED_BY") or "", tableref[name].author) or "", player, x+8, y+10, width-6, nil, 0, 0, 0, true)
	local yy = 25
	if tab == "chairs" or tab == "panels" or tab == "lights" then
		local chair = tab == "chairs" and name or PLAYER[player].skinEquiped
		local panel = tab == "panels" and name or PLAYER[player].flagEquipped
		local nickname = nickMinifier(nickHashtag(player))
		table.insert(img, tfm.exec.addImage(SKIN[chair].img, ":3", x+58, yy+y+20, player))
		table.insert(img, tfm.exec.addImage("172876442e7.png", ":3", x+8, yy+y+115, player))
		if tab == "lights" then
			table.insert(img, tfm.exec.addImage(LIGHT[name].img, ":3", x+58, yy+y+20, player))
		end
		if FLAG[panel].img.big then
			table.insert(img, tfm.exec.addImage(FLAG[panel].img.big, ":3", x+58, yy+y+115, player))
		end
		ui.addTextArea(151, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>UNO!", nickname), player, x+9, yy+y+116, 200, 60, 0, 0, 0, true)
		ui.addTextArea(152, string.format("<b><p align='center'><font color='#ffffff'>%s</font><b>\n<font size='18px' color='#4CFF00'>UNO!", nickname), player, x+8, yy+y+115, 200, 60, 0, 0, 0, true)
	end
	--ui.addTextArea(520, string.format("<p align='center'><font size='10px'>%s\n\n<b>%s</b>\n<bl>%s", translate(player, FLAG[name].desc), translate(player, FLAG[name].mission), progressFlag(player, name)), player, 200, y+110, 200, nil, 0, 0, 0, true)
	local mission = translate(player, tableref[name].mission, tableref[name].progress)
	local desc = tableref[name].desc and "<bl><font size='10px'><i>"..translate(player, tableref[name].desc).."</i></font>\n\n" or ""
	ui.addTextArea(153, "<p align='center'>"..desc.."<n><b>"..mission, player, x+8, yy+y+160, width-6, nil, 0, 0, 0, true)
	if PLAYER[player][inventory][name] then
		if PLAYER[player][inventory][name] == 3 then
			PLAYER[player][inventory][name] = 1
			window.update(player, "INVENTORY")
			saveData(player)
		end
		table.insert(img, tfm.exec.addImage(PLAYER[player][inventory][name]==2 and "1726d406322.png" or "1726d4041dc.png", ":3", x+20, y+270, player))
		ui.addTextArea(154, "<vp>"..translate(player, "FAVORITES_ADD"), player, x+40, y+269, nil, nil, 0, 0, 0, true)
		addLink(155, "addfavorite "..tab.." "..name, player, x+15, y+270, 180, 20, true)
	else
		local actual, max = progress(player, tab, name)
		if actual then
			if actual > 0 then
				local w = 176 * (actual/max)
				ui.addTextArea(154, "", player, x+18, y+269, w, 18, 0x253942, 0x253942, 1, true)
			end
			ui.addTextArea(155, "<p align='center'><j>"..actual.." / "..max, player, x+16, y+269, 180, 18, -1, 0x102224, 1, true)
		end
	end
	return txt, img
end)