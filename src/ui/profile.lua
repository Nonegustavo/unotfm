window.create("PROFILE", function(player, var, name)
	local imageId = {}
	do
		local x = 210
		local y = 150
		local width = 380
		local height = 185
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
		ui.addTextArea(120, "<p align='right'><a href='event:close profile'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
		-- bordas
		table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	do
		local x = 210
		local y = 90
		local width = 390
		local height = 60
		ui.addTextArea(121, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
		ui.addTextArea(122, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
		ui.addTextArea(123, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
		ui.addTextArea(124, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
		ui.addTextArea(125, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
		ui.addTextArea(126, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
		-- bordas
		--table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	do
		local x = 200
		local y = 80
		local width = 80
		local height = 80
		ui.addTextArea(127, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
		ui.addTextArea(128, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
		ui.addTextArea(129, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
		ui.addTextArea(130, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
		ui.addTextArea(131, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
		ui.addTextArea(132, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
		-- bordas
		table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	return {100,101,102,103,104,105,106,107,108,109,120,121,122,123,124,125,126,127,128,129,130,131,132}, imageId
end,
function(player, var, name)
	local nickname, hash = nickHashtag(name)
	imageId = {}
	do
		local x = 210
		local y = 90
		local width = 390
		local height = 80
		ui.addTextArea(119, string.format("<v><font size='25px'><b>%s<n><font size='18px'><bl>#%s", nickname, hash), player, x+85, y+12, nil, nil, 0, 0, 0, true)
	end
	do
		local x = 200
		local y = 80
		local width = 390
		local height = 80
		if player == name then
			ui.addTextArea(133, "<p align='center'><font size='10px'><a href='event:trophy 1'>"..translate(player, "CHANGE"), player, x, y+65, 80, nil, 0, 0, 0, true)
		end
		if TROPHY[PLAYER[name].trophyEquiped] then
			table.insert(imageId, tfm.exec.addImage(TROPHY[PLAYER[name].trophyEquiped].img, "&1", x+10, y+10, player))
		end
		--ui.addTextArea(134, "<p align='center'><font size='10px'><a href='event:trophy'>"..translate(player, "CHANGE"), player, x, y+65, 80, nil, 0, 0, 0, true)
	end
	do
		local x = 210
		local y = 150
		local width = 390
		local height = 80
		--local week = PLAYER[name].stats.ranking.week and "<v>("..PLAYER[name].stats.ranking.week..")" or ""
		--local global = PLAYER[name].stats.ranking.global and "<v>("..PLAYER[name].stats.ranking.global..")" or ""
		--ui.addTextArea(134, string.format("<textformat tabstops='180px'><bl>%s : <j>%s\t<bl>%s : <j>%s\n\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s\n<bl>%s : <j>%s\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s %s\n<bl>%s : <j>%s %s", translate(player, "VICTORY"), PLAYER[name].stats.victory.all, translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team, translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name), translate(player, "CHEESE_GOLD"), PLAYER[name].stats.ranking.gold, translate(player, "CHEESE_SILVER"), PLAYER[name].stats.ranking.silver, translate(player, "CHEESE_BRONZE"), PLAYER[name].stats.ranking.bronze, translate(player, "POS_LEADERBOARD_WEEK"), PLAYER[name].stats.ranking.scoreWeek, week, translate(player, "POS_LEADERBOARD_GLOBAL"), PLAYER[name].stats.ranking.scoreGlobal, global), player, x+10, y+20, nil, nil, 0, 0, 0, true)
		
		local chairs = 0
		for i, v in pairs(PLAYER[name].skin) do
			chairs = chairs + 1
		end
		
		local tabstops = "<textformat tabstops='175px'>"
		
		local victories = string.format("<bl>%s : <j>%s\t", translate(player, "VICTORY"), PLAYER[name].stats.victory.all)
		local teamVictories = string.format("<bl>%s : <j>%s\n\n", translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team)
		local roundsPlayed = string.format("<bl>%s : <j>%s\t", translate(player, "ROUND_PLAYED"), PLAYER[name].stats.round)
		local roundsWatched = string.format("<bl>%s : <j>%s\n\n", translate(player, "ROUND_WATCHED"), PLAYER[name].stats.spectator)
		local chairsUnlocked = string.format("<bl>%s : <j>%s\n", translate(player, "CHAIRS_UNLOCKED"), chairs)
		local favoriteChair = string.format("<bl>%s : <j>%s", translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name))
		
		--ui.addTextArea(134, string.format("<bl>%s : <j>%s\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s", translate(player, "VICTORY"), PLAYER[name].stats.victory.all, translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team, translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name)), player, x+10, y+20, nil, nil, 0, 0, 0, true)
		ui.addTextArea(134, tabstops..victories..teamVictories..roundsPlayed..roundsWatched..chairsUnlocked..favoriteChair, player, x+10, y+20, nil, nil, 0, 0, 0, true)
		if PLAYER[name].flagEquipped ~= "default" then
			local flag = "picnic"
			table.insert(imageId, tfm.exec.addImage(FLAG[PLAYER[name].flagEquipped].img.big, "&1", x+10, y+110, player))
			ui.addTextArea(135, string.format("<p align='center'>%s", translate(player, FLAG[PLAYER[name].flagEquipped].desc)), player, x+110, y+115, 260, nil, 0, 0, 0, true)
		end
		
	end
	return {119,133,134, 135}, imageId
end)