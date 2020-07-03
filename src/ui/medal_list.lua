window.create("TROPHY", function(player, var, page)
	local x = 5
	local y = 180
	local width = 190
	local height = 180
	-- janela
	ui.addTextArea(300, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(301, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(302, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(303, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(304, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(305, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {300,301,302,303,304,305}, imageId
end,
function(p, id, page)
	page = page or 1
	local x = 5
	local y = 180
	local width = 190
	local height = 180
	local key = {"none", "beta", "buffy", "drekkemaus", "noel", "snowy", "charlotte", "elisah"}
	local txt={310,311,312,313,314,315,316,317,321,322}
	local img={}
	local pool = {}
	for i, v in pairs(key) do
		if PLAYER[p].trophy[v] then
			table.insert(pool, v)
		end
	end
	key = {{}}
	do
		local i = 1
		repeat
			local temp = table.remove(pool, 1)
			if temp then
				if #key[i] >= 6 then
					i = i + 1
					key[i] = {}
				end
				table.insert(key[i], temp)
			end
		until #pool == 0
	end
	if page > 1 then
		-- botão de voltar
		ui.addTextArea(310, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(311, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(312, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(313, "<p align='center'>&lt;&lt;", p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(321, string.format("<p align='right'><a href='event:trophy %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < #key then
		-- botão de avançar
		ui.addTextArea(314, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(315, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(316, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(317, "<p align='center'>&gt;&gt;", p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(322, string.format("<p align='right'><a href='event:trophy %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	for i=1, 2 do
		for j=1, 3 do
			local name = table.remove(key[page],1)
			if name then
				table.insert(img, tfm.exec.addImage(TROPHY[name].img, "&10", j*60-50, i*70+120, p))
				ui.addTextArea(200+i*12+j, string.format("<p align='center'><font size='10px'><a href='event:equipt %s'>%s", name, translate(p, "EQUIP")), p, j*60-50, i*70+175, 60, nil, 0, 0, 0, true)
				table.insert(txt, 200+i*12+j)
			end
		end
	end
	return txt, img
end)