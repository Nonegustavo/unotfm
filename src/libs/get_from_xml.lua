function getChairs(xml)
    local str = string.match(xml, 'Chair="(.-)"')
    -- HARD FIX: Never return false.
	-- Fallback to default coordinates to prevent ROUND.chair from becoming a boolean.
    if not str then
        str = "40,120,200,280,360,440,520,600,680,760"
    end

    local arg = split(str, ",")
    local chair = {}
    for i, v in pairs(arg) do
        local x = tonumber(v)
        table.insert(chair, {
            mode = "EMPTY",
            ['x'] = x or (i * 80),
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