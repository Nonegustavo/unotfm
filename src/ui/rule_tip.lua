window.create("TIP", function(p, var, name)
	local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s\n", translate(p, RULE[name].name), name == "custom" and RULE.custom.customDesc or translate(p, RULE[name].desc))
	ui.addTextArea(5000, text, p, 10, 190, 150, 150, 1, 0x30BA76, 0.9, true)
	if name == "custom" and p == OWNER and PLAYER[p].rules[name] then
		ui.addTextArea(5001, string.format("<p align='center'><vp><a href='event:custom'>%s</a> <n>| <r><a href='event:close tip'>%s",translate(p, "CUSTOM_EDIT"), translate(p, "CLOSE")), p, 10, 320, 150, nil, 0, 0, 0, true)
	else
		ui.addTextArea(5001, "<p align='center'><a href='event:close tip'><r>"..translate(p, "CLOSE"), p, 10, 320, 150, nil, 0, 0, 0, true)
	end
	local image = {}
	if RULE[name].imgDesc then
		table.insert(image, tfm.exec.addImage(RULE[name].imgDesc, "&0", 10, 270, p))
	end
	if PLAYER[p] and not PLAYER[p].rules[name] and RULE[name].lock ~= true then
		local mission = RULE[name].lock or "WIN"
		local accept = {WIN=0xffff00, TEAM=0x00ffff}
		if accept[mission] then
			local text = string.format("<p align='center'><font color='#%x'>%s", accept[mission], translate(p, RULE[name].mission))
			ui.addTextArea(5002, text, p, 10, 135, 150, 45, 1, accept[mission], 0.9, true)
		end
	end
	return {5000,5001,5002}, image
end)