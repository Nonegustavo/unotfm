function getChairs(xml)
	local str = string.match(xml, 'Chair="(.-)"')
	if not str then
		return false
	else
		--arg = split((not CONFIG.ranked or CONFIG.eventRoom) and "40,120,200,280,360,440,520,600,680,760" or str or "50,150,250,350,450,550,650,750", ",")
		local arg = split("40,120,200,280,360,440,520,600,680,760", ",")
		
		local chair = {}
		for i, v in pairs(arg) do
			local x = tonumber(v)
			table.insert(chair, {
				mode = "EMPTY",
				['x'] = x,
				owner = "",
				plays = 0,
				maxHand = 0,
				maxDraw = 0,
				underTime = true,
				afk = false,
				draw = false,
				phase = false,
				batata = 1,
				batata2 = 1,
				flag = "default",
				skin = {id = "empty", img = {}},
				imgHand = {},
				imgShadow = {},
				hand = {},
				clickDelay = os.time(),
			})
		end
		return chair
	end
end

function getColor(xml)
	local color = string.match(xml, 'Color="(.-)"')
	return split(color or "000000,000000", ",")
end

function getBot(xml)
	local bot = string.match(xml, 'Bot="(.-)"')
	return bot and split(bot, ",")
end

function getRule(xml)
	local rule = string.match(xml, 'Rule="(.-)"')
	return rule and split(rule, ",")
end

function getCardSkin(xml)
	local color = string.match(xml, 'Card="(.-)"')
	if color and IMG.skin[color] then
		return color
	else
		return "classic"
	end
end