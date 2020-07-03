window.create("CHAIRS2", function(player, var, page)
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	
	-- botão powerups
	--ui.addTextArea(106, "", player, x+8, y+height-22, width/3-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	--ui.addTextArea(107, "", player, x+9, y+height-21, width/3-16, 13, 0xe1619, 0xe1619, alpha, true)
	--ui.addTextArea(108, "", player, x+9, y+height-21, width/3-17, 12, 0x314e57, 0x314e57, alpha, true)
	--ui.addTextArea(109,  string.format("<p align='center'>%s (K)", translate(player, "POWERUPS")), player, x+9, y+height-24, width/3-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(120, "<p align='right'><a href='event:powerups'> ", player, x+9, y+height-24, width/3-17, nil, 0, 0, 0, true)
	ui.addTextArea(120, "", player, x+3, y+height-22, width/3-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão cadeiras
	ui.addTextArea(206, "", player, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(207, "", player, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(208, "", player, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(209, string.format("<p align='center'>%s (C)", translate(player, "CHAIRS")), player, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(220, "<p align='right'><a href='event:chairs2'> ", player, x+width/3+3, y+height-24, width/2-17, nil, 0, 0, 0, true)
	ui.addTextArea(220, "", player, x+3, y+height-22, width/2-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão paineis
	ui.addTextArea(306, "", player, x+width/2+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(307, "", player, x+width/2+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(308, "", player, x+width/2+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(309, string.format("<p align='center'>%s (N)", translate(player, "PANELS")), player, x+width/2+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(320, "<p align='right'><a href='event:panels'> ", player, x+width/2+9, y+height-24, width/3-17, nil, 0, 0, 0, true)
	--ui.addTextArea(320, "", player, x+width/2+3, y+height-22, width/2-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "CHAIRS"), player, x+10, y, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120,206,207,208,209,219,220,306,307,308,309,319,320}, imageId
end,
function(p, var, page)
	page = page or PLAYER[p].chairPage or 1
	PLAYER[p].chairPage = page
	PLAYER[p].inventory = "chairs2"
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	local pool = {"default", "red", "blue", "yellow", "green", "white", "cyan", "orange", "pink", "purple", "black", "fire", "water", "earth", "air", "rainbow", "toxic", "thunder", "crystal", "dark", "light", "wood", "stone", "cat", "garden", "friend", "anvil", "gold", "diamond", "unicorn", "cheese", "football", "king", "luck", "chocolate", "angel", "hell", "cards", "junky", "trash", "shaman", "beach", "cine", "newspaper", "radio", "television", "computer", "candy", "fraise", "illuminati", "loot", "elemental", "gift", "heart", "bog", "got", "breakfast", "hamburguer", "skull", "bones", "school", "time", "pencil", "chess", "show", "falls", "psycho", "potato", "rip", "apple", "marine", "guitar", "popcorn", "wonderland", "cuphead", "astral", "bootcamp", "gaga", "gothic", "mecatopus", "pumpkin", "ufo", "aquarium", "help", "font", "chimney", "circus", "cisne", "coffee", "croissant", "space", "mermaid", "phone", "quartz", "snowman", "totoro", "vangogh", "chest", "coca", "flamingo", "honey", "old", "pineapple", "sack", "smartphone", "vampire", "moon", "max", "bill", "horn", "toast", "pizza", "samson", "fashion", "undertale", "forest", "kiss", "mountain", "pikachu", "simpsons", "truelove", "eclipse", "toothless", "lightfury", "kratos", "shenlong", "spider", "random"}
	local pageMax = math.ceil(#pool / 8)
	local txt={110,111,112,113,114,115,116,117,121,122,123}
	local img={}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:chairs2 %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < pageMax then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:chairs2 %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	local unlocked = {}
	local locked = {}
	for i, v in pairs(pool) do
		table.insert(PLAYER[p].skin[v] and unlocked or locked, v)
	end
	pool = unlocked
	for i, v in pairs(locked) do
		table.insert(pool, v)
	end
	for z=1, 8 do
		local ini = (page-1)*8+z
		local w = pool[ini]
		local i = math.ceil(z/4)
		local j = (z-1)%4+1
		if w then
			ui.addTextArea(200+i*12+j, string.format("<p align='center'><a href='event:infochair2 %s %s'>", w, page)..translate(p, SKIN[w].name), p, 95*j+325, (i-1)*115+75, 80, 100, PLAYER[p].skin[w] and 0x6a7495 or -1, 1, 0.2, true)
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(SKIN[w].imgMini, "&2", 95*j+325, i*115-20, p))
			if not PLAYER[p].skin[w] then
				text = text .. "<bl>" .. string.format("<bl><a href='event:infochair2 %s %s'>", w, page) .. translate(p, "LOCKED")
				--color = 0x102224
				table.insert(img, tfm.exec.addImage(IMG.misc.locked, "&10", 95*j+325, i*115-20, p))
			elseif PLAYER[p].skinEquiped == w then
				text = text .. "<j>" .. translate(p, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. string.format("<a href='event:equip %s %s'>", w, page) .. translate(p, "EQUIP")
			end
			ui.addTextArea(300+i*12+j, text, p, 95*j+325, (i-1)*115+155, 80, 20, -1, color, 1, true)
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
		end
	end
	local pages = {}
	for i=1, pageMax do
		if i == page then
			table.insert(pages, string.format("<j>%s", i))
		else
			table.insert(pages, string.format("<n><a href='event:chairs2 %s'>%s</a>", i, i))
		end
	end
	ui.addTextArea(123, string.format("<p align='center'>%s", table.concat(pages, " - ")), p, x+10, y+268, width-20, p, 0, 0, 0, true)
	return txt, img
end)