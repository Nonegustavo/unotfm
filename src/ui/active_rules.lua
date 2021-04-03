window.create("HOUSE", function(player, var, name, page)

	local pool = {}
	local order = {"dos","neighbor","custom","red","blue","green","bluegreen","yellow","ninguem","nou","flash","jumpin","stack","sequence","hard","limbo","overload","perfection","satisfaction","insatisfaction","tracking","fastdraw","clean","nocombo","supercombo","hell","black","nochallenge","simon","imitate","shiny","batata","bomb","draw99","compass","curse","confuse","justice","magnet","peace","steal","theft","death","portal","ink","dice","paradox","half","oddeven","mimic","ban","mix","gift","trade","web","tornado","carousel","luck","chair","spy","thunder","rain","equality","meep","wish","box","random","clone","key","share","rule","chess","team","camouflage","limit","noaction","mess","revelation","mini","maxi","mulligan","drekkemaus","jingle","papaille","charlotte","elisah","buffy","snowy","icemice","elise"}
	for i, v in pairs(order) do
		if ROUND.gameMode[v] then
			table.insert(pool, v)
		end
		--if #pool >= 18*3 then
		--  break
		--end
	end

	local x = 170
	local width = 530
	local height = 30+math.ceil(#pool/3)*16
	local y = 250-height/2
	y = y+height > 400 and 400 - height or y
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
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close house'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
	}
	
	local text = {500,501,502,503,504,505,506,507,508,509,519}
	for i=1, 22 do
		for j=1, 3 do
			local name = table.remove(pool, 1)
			if name then
				local t = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</b>", color[RULE[name].type], name, translate(player, RULE[name].name))
				ui.addTextArea(200+i*12+j, t, player, 170*j+20, i*16+y-15, 150, nil, 0, 0, 0, true)
				table.insert(text, 200+i*12+j)
				if RULE[name].img then
					table.insert(imageId, tfm.exec.addImage(RULE[name].img, "&10", 170*j, i*16+y-17, player))
				end
			end
		end
	end
	return text, imageId
end)