function addLink(id, command, player, x, y, width, height, fixed)
	ui.addTextArea(id, string.format("<a href='event:%s'><p align='right'>%s", command, string.rep("\n", math.floor(height/12))), player, x, y, width, height, 0, 0, 0, fixed)
end

CHAIRLIST = {"random", "default", "red", "blue", "yellow", "green", "white", "cyan", "orange", 
	"pink", "purple", "black", "fire", "water", "earth", "air", "rainbow", "toxic", "thunder", 
	"crystal", "dark", "light", "wood", "stone", "cat", "garden", "friend", "anvil", "gold", 
	"diamond", "unicorn", "cheese", "football", "king", "luck", "chocolate", "angel", "hell", 
	"cards", "junky", "trash", "shaman", "beach", "cine", "newspaper", "radio", "television", 
	"computer", "candy", "fraise", "illuminati", "loot", "elemental", "gift", "heart", "bog", 
	"got", "breakfast", "hamburguer", "skull", "bones", "school", "time", "pencil", "chess", 
	"show", "falls", "psycho", "potato", "rip", "apple", "marine", "guitar", "popcorn", 
	"wonderland", "cuphead", "astral", "bootcamp", "gaga", "gothic", "mecatopus", "pumpkin", 
	"ufo", "aquarium", "help", "font", "chimney", "circus", "cisne", "coffee", "croissant", 
	"space", "mermaid", "phone", "quartz", "snowman", "totoro", "vangogh", "chest", "coca", 
	"flamingo", "honey", "old", "pineapple", "sack", "smartphone", "vampire", "moon", "max", 
	"bill", "horn", "toast", "pizza", "samson", "fashion", "undertale", "forest", "kiss", 
	"mountain", "pikachu", "simpsons", "truelove", "eclipse", "toothless", "lightfury", 
	"kratos", "shenlong", "spider", }
PANELLIST = {"default", "picnic", "metal", "paper", "carpet", "disco", "cloud", "circuit"}

window.create("INVENTORY", function(player, var, tab, page)
	local txt, img = {119, 120, 121, 122, 123, 124, 125, 126, 127}, {}
	local x, y, width, height = 270, 20, 530, 340
	-- fundo
	table.insert(img, tfm.exec.addImage("17272d7f862.png", ":1", x, y, player))
	-- titulo
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "INVENTORY"), player, x+10, y+8, width-20, nil, 0, 0, 0, true)
	-- abas
	ui.addTextArea(120, translate(player, "CHAIRS"), player, x+39+15, y+52, 80, 18, 0, 0, 0, true)
	addLink(121, "tab chairs", player, x+34, y+52, 90, 18, true)
	ui.addTextArea(122, translate(player, "PANELS"), player, x+39+93+15, y+52, 80, 18, 0, 0, 0, true)
	addLink(123, "tab panels", player, x+34+93, y+52, 90, 18, true)
	ui.addTextArea(124, translate(player, "FAVORITES"), player, x+39+93+93+15, y+52, nil, nil, 0, 0, 0, true)
	addLink(125, "favorites", player, x+34+93+93, y+52, 90, 18, true)
	-- botão fechar
	ui.addTextArea(126, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-17, width-17, nil, 0, 0, 0, true)
	addLink(127, "close inventory", player, x+9, y+height-17, width-17, 20, true)
	return txt, img
end,
function(player, var, tab, page)
	local txt, img = {128, 129, 130}, {}
	local x, y, width, height = 270, 20, 530, 340
	var.tab = tab or var.tab or "chairs"
	var.page = var.page or {}
	var.page[var.tab] = page or var.page[var.tab] or 1
	var.fav = var.fav or false
	table.insert(img, tfm.exec.addImage(var.tab == "chairs" and "17272e2e9bd.png" or "17272e306ca.png", ":1", x+37, y+53, player))
	table.insert(img, tfm.exec.addImage(var.tab == "panels" and "17272e2e9bd.png" or "17272e306ca.png", ":1", x+37+93, y+53, player))
	table.insert(img, tfm.exec.addImage(var.fav and "1726d406322.png" or "1726d4041dc.png", ":1", x+37+93+93, y+53, player))
	local list = {chairs = CHAIRLIST, panels = PANELLIST}
	list = list[var.tab]
	local inventory = {chairs = "skin", panels = "flags"}
	inventory = inventory[var.tab]
	local tableref = {chairs = SKIN, panels = FLAG}
	tableref = tableref[var.tab]
	local equipref = {chairs = "skinEquiped", panels = "flagEquipped"}
	equipref = equipref[var.tab]
	local imgref = {chairs = "imgMini", panels = "imgDesc"}
	imgref = imgref[var.tab]
	-- filtrar itens
	local unlocked, locked, show = {}, {}, {}
	for i, v in pairs(list) do
		table.insert(PLAYER[player][inventory][v] and unlocked or locked, v)
	end
	if var.fav then
		for i, v in pairs(unlocked) do
			if PLAYER[player][inventory][v] == 2 then
				table.insert(show, v)
			end
		end
	else
		show = unlocked
		for i, v in pairs(locked) do
			table.insert(show, v)
		end
	end
	-- avançar e voltar paginas
	local pageMax = math.ceil(#show/10)
	if var.page[var.tab] > pageMax and pageMax > 0 then
		var.page[var.tab] = pageMax
	end
	if var.page[var.tab] > 1 then
		addLink(128, "inventory "..var.tab.." "..var.page[var.tab]-1, player, x+7, y+174, 26, 26, true)
	else
		ui.addTextArea(128, "", player, x+12, y+179, 16, 16, 0x142B2E, 0x142B2E, 1, true)
	end
	if var.page[var.tab] < pageMax then
		addLink(129, "inventory "..var.tab.." "..var.page[var.tab]+1, player, x+497, y+174, 26, 26, true)
	else
		ui.addTextArea(129, "", player, x+502, y+179, 16, 16, 0x142B2E, 0x142B2E, 1, true)
	end
	-- numeros das paginas
	local pages = {}
	for i=1, pageMax do
		if i == var.page[var.tab] then
			table.insert(pages, string.format("<j><u>%s</u>", i))
		else
			table.insert(pages, string.format("<n><a href='event:inventory %s %s'>%s</a>", var.tab, i, i))
		end
	end
	ui.addTextArea(130, string.format("<p align='center'>%s", table.concat(pages, " - ")), player, x+10, y+298, width-20, player, 0, 0, 0, true)
	-- mostrar itens
	for z=1, 10 do
		local ini = (var.page[var.tab]-1)*10+z
		local w = show[ini]
		local i = math.ceil(z/5)
		local j = (z-1)%5+1
		if w then
			local colorTag = ""
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(tableref[w][imgref], ":1", 93*(j-1)+x+39, 113*(i-1)+y+101, player))
			
			if not PLAYER[player][inventory][w] then
				text = text .. "<bl>" .. translate(player, "LOCKED")
				ui.addTextArea(600+i*12+j, "", player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 100, 0x142B2E, 0x142B2E, 0.6, true)
				table.insert(txt, 600+i*12+j)
				colorTag = "<bl>"
				--color = 0x102224
				--table.insert(img, tfm.exec.addImage(IMG.misc.locked, "&10", 95*j+325, i*115-20, p))
			elseif PLAYER[player][equipref] == w then
				text = text .. "<j>" .. translate(player, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. translate(player, "EQUIP")
				link = true
			end
			if PLAYER[player][inventory][w] == 2 then
				colorTag = "<vp>"
			elseif PLAYER[player][inventory][w] == 3 then
				table.insert(img, tfm.exec.addImage("15f0d921edd.png", ":1", 93*(j-1)+x+39+38, 113*(i-1)+y+75-6, player))
			end
			ui.addTextArea(200+i*12+j, "<p align='center'>"..colorTag..translate(player, tableref[w].name), player, 93*(j-1)+x+39, 113*(i-1)+y+75, 80, nil, 0, 0, 0, true)
			addLink(500+i*12+j, "info "..var.tab.." "..w, player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 100, true)
			ui.addTextArea(300+i*12+j, text, player, 93*(j-1)+x+39, (i-1)*113+y+161, 80, 20, -1, color, 1, true)
			if link then
				addLink(400+i*12+j, "equip "..var.tab.." "..w, player, 93*(j-1)+x+39, (i-1)*113+y+161, 80, 20, true)
				table.insert(txt, 400+i*12+j)
			end
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
			table.insert(txt, 500+i*12+j)
		else
			ui.addTextArea(600+i*12+j, "", player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 102, 0x142B2E, 0x142B2E, 1, true)
			table.insert(txt, 600+i*12+j)
		end
	end

	return txt, img
end)