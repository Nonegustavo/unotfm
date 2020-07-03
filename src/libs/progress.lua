function progress(p, tab, name)
	if tab == "chairs" then
		return progressChair(p, name)
	elseif tab == "panels" then
		return progressFlag(p, name)
	end
end

function progressChair(p, skin)
	if skin == "fire" then
		return PLAYER[p].stats.victory.red, 100
	elseif skin == "water" then
		return PLAYER[p].stats.victory.blue, 100
	elseif skin == "earth" then
		return PLAYER[p].stats.victory.yellow, 100
	elseif skin == "air" then
		return PLAYER[p].stats.victory.green, 100
	elseif skin == "rainbow" then
		return PLAYER[p].stats.victory.wild, 100
	elseif skin == "toxic" then
		return PLAYER[p].stats.victory.cian, 15
	elseif skin == "thunder" then
		return PLAYER[p].stats.victory.orange, 15
	elseif skin == "crystal" then
		return PLAYER[p].stats.victory.pink, 15
	elseif skin == "dark" then
		return PLAYER[p].stats.victory.purple, 15
	elseif skin == "light" then
		return PLAYER[p].stats.victory.white, 15
	elseif skin == "toothless" then
		return PLAYER[p].stats.victory.darkWin, 10
	elseif skin == "lightfury" then
		return PLAYER[p].stats.victory.lightWin, 10
	elseif skin == "wood" then
		return PLAYER[p].stats.round, 100
	elseif skin == "stone" then
		return PLAYER[p].stats.round, 1000
	elseif skin == "cat" then
		return PLAYER[p].stats.round, 2500
	elseif skin == "garden" then
		return PLAYER[p].stats.round, 5000
	elseif skin == "friend" then
		return PLAYER[p].stats.round, 7500
	elseif skin == "anvil" then
		return PLAYER[p].stats.round, 10000
	elseif skin == "gold" then
		return PLAYER[p].stats.victory.all, 100
	elseif skin == "diamond" then
		return PLAYER[p].stats.victory.all, 1000
	elseif skin == "unicorn" then
		return PLAYER[p].stats.victory.all, 2000
	elseif skin == "cheese" then
		return PLAYER[p].stats.victory.all, 3000
	elseif skin == "breakfast" then
		return PLAYER[p].stats.victory.team, 100
	elseif skin == "hamburguer" then
		return PLAYER[p].stats.victory.team, 250
	elseif skin == "croissant" then
		return PLAYER[p].stats.victory.team, 487.5
	elseif skin == "toast" then
		return PLAYER[p].stats.victory.team, 600
	elseif skin == "pizza" then
		return PLAYER[p].stats.victory.team, 1000
	elseif skin == "shaman" and validRoom() then
		return tfm.get.room.playerList[p].score, 3000
	elseif skin == "beach" then
		return PLAYER[p].stats.spectator, 100
	elseif skin == "cine" then
		return PLAYER[p].stats.spectator, 1000
	elseif skin == "newspaper" then
		return PLAYER[p].stats.spectator, 2500
	elseif skin == "radio" then
		return PLAYER[p].stats.spectator, 5000
	elseif skin == "television" then
		return PLAYER[p].stats.spectator, 7500
	elseif skin == "computer" then
		return PLAYER[p].stats.spectator, 10000
	elseif skin == "candy" then
		return countRules(PLAYER[p].rules), CONFIG.qtdRule
	elseif skin == "wonderland" then
		return PLAYER[p].portal1 + PLAYER[p].portal2, 2
	elseif skin == "got" then
		return PLAYER[p].challenge, 3
	elseif skin == "school" and validRoom() then
		return PLAYER[p].school or 0, 3
	elseif skin == "pencil" then
		return PLAYER[p].pencil, 100
	elseif skin == "chess" then
		return PLAYER[p].chess, 25
	elseif skin == "football" then
		return PLAYER[p].block, 100
	elseif skin == "quartz" then
		return PLAYER[p].action, 5000
	elseif skin == "coffee" then
		return math.floor((os.time() - PLAYER[p].coffee) / 3600000), 4
	elseif skin == "fashion" then
		return PLAYER[p].dayStreak, 7
	elseif skin == "undertale" then
		return PLAYER[p].dayStreak, 15
	end
end

function progressFlag(p, skin)
	if skin == "picnic" then
		return PLAYER[p].stats.victory.red, 300
	elseif skin == "metal" then
		return PLAYER[p].stats.victory.blue, 300
	elseif skin == "paper" then
		return PLAYER[p].stats.victory.yellow, 300
	elseif skin == "carpet" then
		return PLAYER[p].stats.victory.green, 300
	elseif skin == "disco" then
		return PLAYER[p].stats.victory.wild, 300
	elseif skin == "cloud" then
		return PLAYER[p].stats.victory.mess, 50
	end
end