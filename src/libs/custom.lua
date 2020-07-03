function customAddAction(p, name)
	local blank = {
		DRAW = {action=name, who="NEXT", amount="2"},
		DISCARD = {action=name, who="ALL", amount="#3", condition="ANY"},
		SHOW = {action=name, who="ALL", condition="ANY"},
		SKIP = {action=name, who="NEXT"},
		DONATE = {action=name, who="YOURSELF", who2="CHOOSE", amount="1", condition="ANY"},
		SWAP = {action=name, who="YOURSELF", who2="CHOOSE"},
		TRADE = {action=name, who="YOURSELF", who2="CHOOSE"},
		ELIMINATE = {action=name, who="CHOOSE"},
	}
	if p == OWNER and blank[name] and #CONFIG.custom.action < 5 then
		table.insert(CONFIG.custom.action, blank[name])
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customEditAction(p, action, atribute, value)
	-- EDIÇÕES PERMITIDAS
	local can = {
		DRAW = {who=1, amount=1},
		DISCARD = {who=1, condition=1, amount=1},
		SHOW = {who=1, condition=1},
		SKIP = {who=1},
		DONATE = {who=1, who2=1, condition=1, amount=1},
		SWAP = {who=1, who2=1},
		TRADE = {who=1, who2=1},
		ELIMINATE = {who=1},
	}
	--
	local edit = CONFIG.custom.action[action]
	if p==OWNER and edit and can[edit.action][atribute] then
		if atribute == "who" then
			if value ~= CONFIG.custom.action[action].who2 then
				edit[atribute] = value
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		elseif atribute == "who2" then
			if value ~= CONFIG.custom.action[action].who then
				edit[atribute] = value
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		else
			edit[atribute] = value
		end
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customRemoveAction(p, action)
	local can = true
	for i, v in pairs(CONFIG.custom.action) do
		if v.amount == "&"..action then
			can = false
			break
		end
	end
	if p==OWNER and CONFIG.custom.action[action] and can then
		for i, v in pairs(CONFIG.custom.action) do
			if v.amount and v.amount:sub(1,1) == "&" then
				local num = tonumber(v.amount:sub(2))
				if num > action then
					v.amount = "&"..num-1
				end
			end
		end
		table.remove(CONFIG.custom.action, action)
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customValidAmount(action, str)
	local unt = str:match("^#(%d)$")
	local ret = str:match("^%&(%d)$")
	local x, y = str:match("^(%d)%-(%d)$")
	if unt and tonumber(unt) then
		local n = tonumber(unt)
		return n >= 0 and n <= 10
	elseif ret and tonumber(ret) then
		local n = tonumber(ret)
		return n >= 1 and n < action
	elseif x and y and tonumber(x) and tonumber(y) then
		local x = tonumber(x)
		local y = tonumber(y)
		return y > x and x >= 0 and x <= 10 and y >= 0 and y <= 10
	elseif tonumber(str) then
		local n = tonumber(str)
		return n >= 0 and n <= 10
	end
end

function customEditCopies(color)
	CONFIG.custom.color[color] = (CONFIG.custom.color[color]+1)%5
end

function printAction(p, action)
	local order = {"who", "who2", "amount", "condition"}
	local txt = ""
	local l = {
		YOURSELF = "WHO_YOURSELF",
		NEXT = "WHO_NEXT",
		PREVIOUS = "WHO_PREVIOUS",
		ALL = "WHO_ALL",
		OTHERS = "WHO_OTHERS",
		CHOOSE = "WHO_CHOOSE",
		RANDOM = "WHO_RANDOM",
		RANDOM2 = "WHO_RANDOM2",
		RANDOM3 = "WHO_RANDOM3",
		ANY = "CONDITION_ANY",
		NUMBER = "CONDITION_NUMBER",
		ACTION = "CONDITION_ACTION",
		RED = "CONDITION_RED",
		BLUE = "CONDITION_BLUE",
		YELLOW = "CONDITION_YELLOW",
		GREEN = "CONDITION_GREEN",
		WILD = "CONDITION_WILD",
		SAME = "CONDITION_SAME"
	}
	for i, v in pairs(order) do
		if CONFIG.custom.action[action][v] then
			if v == "amount" then
				local unt = CONFIG.custom.action[action][v]:match("^#(%d)$")
				local ret = CONFIG.custom.action[action][v]:match("^%&(%d)$")
				local x, y = CONFIG.custom.action[action][v]:match("^(%d)%-(%d)$")
				if unt then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_UNTIL"), unt))
				elseif ret then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_RETURN"), ret))
				elseif x and y then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_RANGE"), x, y))
				else
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_X"), CONFIG.custom.action[action][v]))
				end
			else
				txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a><n> ", action, v, translate(p, l[CONFIG.custom.action[action][v]] or "OPA"))
			end
		end
	end
	return string.format("<v>%d)<n> %s <r><a href='event:remove %s'>[x]</a>\n\t%s", action, translate(p, "ACTION_"..CONFIG.custom.action[action].action), action, txt)
end

function printAdd(p)
	local pool = {"DRAW", "DONATE", "DISCARD", "SHOW", "SKIP", "SWAP", "TRADE", "ELIMINATE"}
	local txt = "<p align='center'>"
	for i, v in pairs(pool) do
		txt = txt .. string.format("<a href='event:add %s'>%s\n", v, translate(p, "ACTION_"..v))
	end
	return txt .. string.format("<a href='event:exit'><r>[%s]", translate(p, "CLOSE"))
end

function printOptions(p, action, atribute)
	local can = {
		DRAW = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
		DISCARD = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SHOW = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SKIP = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
		DONATE = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SWAP = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}},
		TRADE = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}},
		ELIMINATE = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
	}
	local l = {
		YOURSELF = "WHO_YOURSELF",
		NEXT = "WHO_NEXT",
		PREVIOUS = "WHO_PREVIOUS",
		ALL = "WHO_ALL",
		OTHERS = "WHO_OTHERS",
		CHOOSE = "WHO_CHOOSE",
		RANDOM = "WHO_RANDOM",
		RANDOM2 = "WHO_RANDOM2",
		RANDOM3 = "WHO_RANDOM3",
		ANY = "CONDITION_ANY",
		NUMBER = "CONDITION_NUMBER",
		ACTION = "CONDITION_ACTION",
		RED = "CONDITION_RED",
		BLUE = "CONDITION_BLUE",
		YELLOW = "CONDITION_YELLOW",
		GREEN = "CONDITION_GREEN",
		WILD = "CONDITION_WILD",
		SAME = "CONDITION_SAME"
	}
	local txt = "<p align='center'>"
	for i, v in pairs(can[CONFIG.custom.action[action].action][atribute]) do
		txt = txt .. string.format(string.format("<a href='event:edit2 %s %s %s'>%s\n", action, atribute, v, translate(p, l[v] or "OPA")))
	end
	return txt .. string.format("<a href='event:exit'><r>[%s]", translate(p, "CLOSE"))
end