window.create("SHOW_RULES", function(p, var, page)
	local order = {"dos","neighbor","custom","red","blue","green","bluegreen","yellow","ninguem","nou","flash","jumpin","stack","sequence","hard","limbo","overload","perfection","satisfaction","insatisfaction","tracking","fastdraw","clean","nocombo","supercombo","hell","black","nochallenge","simon","imitate","shiny","batata","bomb","draw99","compass","curse","confuse","justice","magnet","peace","steal","theft","death","portal","ink","dice","paradox","half","oddeven","mimic","ban","mix","gift","trade","web","tornado","carousel","luck","chair","spy","thunder","rain","equality","meep","wish","box","random","clone","key","share","rule","chess","team","camouflage","limit","noaction","mess","revelation","mini","maxi","mulligan","drekkemaus","jingle","papaille","charlotte","elisah","buffy","snowy","icemice","elise"}
	local modes, imageId, txtId = {}, {}, {}
    page = page or 1
	for i, v in pairs(order) do
		if ROUND.gameMode[v] then
			table.insert(modes, v)
		end
	end
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
		PUZZLE = "DCEDC8"
	}
	if #modes > 0 then
        local txt = string.format("<b><font size='12px'><u>%s (%i)", translate(p, "HOUSE_RULES"), #modes)
		ui.addTextArea(11000, "<font color='#000000'>"..txt, p, 21, 191, 150, nil, 0, 0, 0, false)
		ui.addTextArea(11001, "<font color='#FFFFFF'>"..txt, p, 20, 190, 150, nil, 0, 0, 0, false)
        txtId = {11000, 11001}
		if not (p == OWNER and ROUND.spectator) then
			if #modes == 1 then
				local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>\n<font size='9px' color='#ffffff'>%s", color[RULE[modes[1]].type], modes[1], translate(p, RULE[modes[1]].name), modes[1] == "custom" and RULE.custom.customDesc or translate(p, RULE[modes[1]].desc))
				ui.addTextArea(11002, string.format("<font color='#000000'><b>%s</b>\n<font size='9px'>%s", translate(p, RULE[modes[1]].name), modes[1] == "custom" and RULE.custom.customDesc or translate(p, RULE[modes[1]].desc)), p, 21, 181+1*30, 150, nil, 0, 0, 0, false)
				ui.addTextArea(11003, txt, p, 20, 180+1*30, 150, nil, 0, 0, 0, false)
                table.insert(txtId, 11002)
                table.insert(txtId, 11003)
				if RULE[modes[1]].img then
					table.insert(imageId, tfm.exec.addImage(RULE[modes[1]].img, "!1000", 0, 178+1*30, p))
				end
			else
				for i=1, 5 do
                    local v = modes[i+(page-1)*5]
                    if not v then
                        break
                    end
					local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>", color[RULE[v].type], v, translate(p, RULE[v].name))
					ui.addTextArea(11000+i*2, "<font color='#000000'><b>"..translate(p, RULE[v].name), p, 21, 191+i*20, 150, nil, 0, 0, 0, false)
					ui.addTextArea(11001+i*2, txt, p, 20, 190+i*20, 150, nil, 0, 0, 0, false)
                    table.insert(txtId, 11000+i*2)
                    table.insert(txtId, 11001+i*2)
					if RULE[v].img then
						table.insert(imageId, tfm.exec.addImage(RULE[v].img, "!1000", 0, 188+i*20, p))
					end
				end
				if #modes > 5 then
                    local pageMax = math.ceil(#modes/5)
                    local pages = {}
                    if page == 1 then
                        table.insert(pages, "~")
                    else
                        table.insert(pages, string.format("<a href='event:house %s'><b>«</b></a>", page-1))
                    end
                    table.insert(pages, string.format("%s/%s", page, pageMax))
                    if page == pageMax then
                        table.insert(pages, "~")
                    else
                        table.insert(pages, string.format("<a href='event:house %s'><b>»</b></a>", page+1))
                    end
                    local txt = table.concat(pages, " ")
                    ui.addTextArea(11012, "<font color='#000000'>"..txt, p, 21, 191+6*20, 150, nil, 0, 0, 0, false)
					ui.addTextArea(11013, "<font color='#FFFFFF'>"..txt, p, 20, 190+6*20, 150, nil, 0, 0, 0, false)
                    table.insert(txtId, 11012)
                    table.insert(txtId, 11013)
				end
			end
		end
	end
    return txtId, imageId
end, nil, true)