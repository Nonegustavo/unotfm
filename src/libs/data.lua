PACK = {
	chairs = {"default","red","blue","yellow","green","white","fire","water","earth","air","rainbow","wood","stone","gold","diamond","king","luck","angel","junky","shaman","beach","cine","hell","cards","candy","cheese","fraise","illuminati","gift","bog","got","hamburguer","skull","school","time","pencil","chess","show","anvil","garden","falls","unicorn","psycho","television","radio","newspaper","cat","potato","rip","apple","heart","breakfast","bones","chocolate","marine","loot","random","astral","computer","elemental","guitar","popcorn","trash","wonderland","friend","football","cuphead","bootcamp","gaga","gothic","mecatopus","pumpkin","ufo","aquarium","help","font","chimney","circus","cisne","coffee","croissant","space","mermaid","phone","quartz","snowman","totoro","vangogh","chest","coca","flamingo","honey","old","pineapple","sack","smartphone","vampire","moon","max","bill","horn","toast","pizza","samson","fashion","undertale","forest","kiss","mountain","pikachu","simpsons","truelove","cyan","orange","pink","purple","black","toxic","thunder","crystal","dark","light","eclipse","toothless","lightfury","kratos","shenlong","spider"},

	rules = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","perfection","tracking","mulligan","overload","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","fastdraw","hard","web","thunder","clone","sequence","luck","box","wish","ink","confuse","shiny","neighbor","team","batata","limbo","curse","magnet","portal","compass","mess","custom","tornado","theft","ban","simon","half","paradox","oddeven","mimic","mix","justice","bluegreen","elise","charlotte","elisah", "drekkemaus","buffy","jingle","papaille","snowy","icemice","key","share"},

	medals = {"none", "beta", "drekkemaus", "noel", "charlotte", "elisah", "buffy", "snowy"},

	panels = {"default", "picnic", "metal", "paper", "carpet", "disco", "cloud", "circuit"},
}

function packChair(t)
	local str = ""
	for i, v in pairs(PACK.chairs) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packRules(t)
	local str = ""
	for i, v in pairs(PACK.rules) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packTrophy(t)
	local str = ""
	for i, v in pairs(PACK.medals) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packFlag(t)
	local str = ""
	for i, v in pairs(PACK.panels) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function unpackChair(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.chairs[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackRules(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.rules[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackTrophy(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.medals[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackFlag(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.panels[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function saveData(p)
	if p:sub(1,1) ~= "*" and PLAYER[p] and PLAYER[p].loaded and not BOT[p] then
		--PLAYER[p].rules.nochallenge = true
		PLAYER[p].trophy.none = PLAYER[p].trophy.none or 1
		PLAYER[p].skin.default = PLAYER[p].skin.default or 1
		PLAYER[p].skinEquiped = PLAYER[p].skinEquiped or "default"
		PLAYER[p].trophyEquiped = PLAYER[p].trophyEquiped or "none"
		PLAYER[p].flagEquipped = PLAYER[p].flagEquipped or "default"
		local stats = playerData.load(p, "uno")
		if stats then
			stats.spectator = PLAYER[p].stats.spectator
			stats.round = PLAYER[p].stats.round
			stats.win = PLAYER[p].stats.victory.all
			stats.team = PLAYER[p].stats.victory.team
			stats.red = PLAYER[p].stats.victory.red
			stats.blue = PLAYER[p].stats.victory.blue
			stats.green = PLAYER[p].stats.victory.green
			stats.yellow = PLAYER[p].stats.victory.yellow
			stats.wild = PLAYER[p].stats.victory.wild
			stats.cian = PLAYER[p].stats.victory.cian
			stats.orange = PLAYER[p].stats.victory.orange
			stats.pink = PLAYER[p].stats.victory.pink
			stats.purple = PLAYER[p].stats.victory.purple
			stats.white = PLAYER[p].stats.victory.white
			stats.lightWin = PLAYER[p].stats.victory.lightWin
			stats.darkWin = PLAYER[p].stats.victory.darkWin
			stats.mess = PLAYER[p].stats.victory.mess
			stats.skin = packChair(PLAYER[p].skin)
			stats.rules = packRules(PLAYER[p].rules)
			stats.trophy = packTrophy(PLAYER[p].trophy)
			stats.flags = packFlag(PLAYER[p].flags)
			stats.skinEquiped = PLAYER[p].skinEquiped
			stats.trophyEquiped = PLAYER[p].trophyEquiped
			stats.flagEquipped = PLAYER[p].flagEquipped
			stats.shadow = PLAYER[p].shadow and "1" or "0"
			stats.challengePopup = PLAYER[p].challengePopup and "1" or "0"
			stats.colorblind = PLAYER[p].colorBlind and "1" or "0"
			stats.bell = PLAYER[p].bell and "1" or "0"
			stats.community = PLAYER[p].community
			stats.match = PLAYER[p].match
			stats.challenge = PLAYER[p].challenge
			stats.team = PLAYER[p].stats.victory.team
			stats.pencil = PLAYER[p].pencil
			stats.chess = PLAYER[p].chess
			stats.portal1= PLAYER[p].portal1
			stats.portal2 = PLAYER[p].portal2
			stats.block = PLAYER[p].block
			stats.action = PLAYER[p].action
			stats.dayStreak = PLAYER[p].dayStreak
			stats.lastDayPlayed = PLAYER[p].lastDayPlayed
			system.savePlayerData(p, playerData.pack(p))
		end
	end
end

function instanceData()
	return {
		skin = {default=1},
		rules = {},
		trophy = {none=1},
		flags = {default=1},
		lights = {yellow=true},
		--maps = {none=true},
		skinEquiped = "default",
		trophyEquiped = "none",
		flagEquipped = "default",
		lightEquiped = "yellow",
		--mapEquiped = "none",
		shadow = true,
		challengePopup = true,
		colorBlind = false,
		bell = false,
		community = "auto",
		challenge = 0, -- GOT throne
		pencil = 0, -- pencil throne
		chess = 0, -- chess throne
		portal1 = 0, -- lightfury throne
		portal2 = 0, -- toothless throne
		block = 0, -- soccer throne
		action = 0, -- rosequartz throne
		dayStreak = 0, -- asgore throne
		lastDayPlayed = 0,
		--powerup = {
		--	shiny = 0,
		--	uno = 0,
		--	bot = 0,
		--	mallet = 0,
		--	lamp = 0,
		--	rematch = 0
		--},
		--coin = {
		--	red = 0,
		--	blue = 0,
		--	yellow = 0,
		--	green = 0,
		--},
		--bank = {},
		--missions = {},
		--lastDayEntered = 0,
		--buyed = {},
		--converted = false,

		-- not save
		spaceDelay = os.time(),
		chairDelay = 0,
		sequence = 0, -- school throne
		chair = false,
		coffee = os.time(), -- coffee throne

		--
		stats = {
			spectator = 0, -- rounds watched
			round = 0,
			victory = {
				all = 0,
				team = 0,
				red = 0,
				blue = 0,
				green = 0,
				yellow = 0,
				wild = 0,
				cian = 0,
				orange = 0,
				pink = 0,
				purple = 0,
				white = 0,
				lightWin = 0,
				darkWin = 0,
				mess = 0
			}
		}
	}
end

DATATYPE = {
	spectator = {type="number"},
	round = {type="number"},
	win = {type="number", name="all"},
	team = {type="number"},
	red = {type="number"},
	blue = {type="number"},
	green = {type="number"},
	yellow = {type="number"},
	wild = {type="number"},
	cian = {type="number"},
	orange = {type="number"},
	pink = {type="number"},
	purple = {type="number"},
	white = {type="number"},
	mess = {type="number"},
	lightWin = {type="number"},
	darkWin = {type="number"},
	skin = {type="table", default="1", func=unpackChair},
	rules = {type="table", default="0", func=unpackRules},
	trophy = {type="number", default="1", func=unpackTrophy},
	flags = {type="number", default="1", func=unpackFlag},
	skinEquiped = {type="string", default="default"},
	trophyEquiped = {type="number", default="none"},
	flagEquipped = {type="number", default="default"},
	shadow = {type="boolean", default="1"},
	challengePopup = {type="boolean", default="1"},
	colorBlind = {type="boolean", default="0"},
	bell = {type="boolean", default="0"},
	community = {type="string", default="auto"},
	challenge = {type="number"},
	pencil = {type="number"},
	chess = {type="number"},
	portal1 = {type="number"},
	portal2 = {type="number"},
	block = {type="number"},
	action = {type="number"},
	dayStreak = {type="number"},
	lastDayPlayed = {type="number"},
}

function newData()
	local data = {}
	for i, v in pairs(DATATYPE) do
		data[i] = v.default or "0"
	end
	return data
end