playerData = {
	p = {},
	unpack = function(p, str)
		-- lê uma string no formato e salva na tabela
		if str == "#" or str == "" or not str then
			playerData.p[p] = {}
			playerData.p[p].uno = {
				spectator = 0,
				round = 0,
				win = 0,
				red = 0,
				blue = 0,
				green = 0,
				yellow = 0,
				wild = 0,
				mess = 0,
				scoreWeek = 0,
				scoreGlobal = 0,
				season = 0,
				gold = 0,
				silver = 0,
				bronze = 0,
				skin = packChair({default=1}),
				rules = packRules({nochallenge=1}),
				trophy = packTrophy({none=1}),
				flags = packFlag({default=1}),
				skinEquiped = "default",
				trophyEquiped = "none",
				flagEquipped = "default"
			}
			return playerData.p[p]
		else
			playerData.p[p] = {}
			local arg = split(str, ",")
			if arg[1] == "C" then
				arg = split(playerData.updateFormatCD(str), ",")
			end
			local minigameData = split(arg[3] or "", "|") -- minigame1|minigame2|...
			for i, v in pairs(minigameData) do
				local gameData = split(v, "@") -- name@values
				playerData.p[p][gameData[1]] = {}
				local vars = split(gameData[2], ";") -- var1;var2;var3;...
				for j, w in pairs(vars) do
					local s = split(w, "=") -- index=value
					playerData.p[p][gameData[1]][s[1]] = s[2]
				end
			end
			playerData.p[p].time = tonumber(arg[2], 16)
			return playerData.p[p]
		end
	end,
	pack = function(p)
		-- retorna uma string com os dados prontos para salvar
		local str = {}
		for i, v in pairs(playerData.p[p]) do
			if i ~= "time" and i ~= "p" then
				local values = {}
				for j, w in pairs(v) do
					table.insert(values, string.format("%s=%s", j, w))
				end
				table.insert(str, string.format("%s@%s", i,table.concat(values, ";")))
			end
		end
		return string.format("D,%x,%s", os.time(), table.concat(str, "|"))
	end,
	load = function(p, minigame)
		-- retorna a tabela com os dados coletados do minigame
		return playerData.p[p] and playerData.p[p][minigame]
	end,
	save = function(p, minigame, data)
		-- salva uma tabela com os dados
		if playerData.p[p] then
			playerData.p[p][minigame] = data
			return true
		end
		return false
	end,
	free = function(p)
		-- desaloca os dados da tabela
		playerData.p[p] = nil
	end,
	updateFormatCD = function(str)
		local arg = split(str, ",")
		local t = {}
		local str = {}
		t.score = arg[3]
		t.rank = arg[4]
		t.first = arg[5]
		t.podio = arg[6]
		t.completed = arg[7]
		t.round= arg[8]
		t.kill= arg[9]
		for i, v in pairs(t) do
			table.insert(str, string.format("%s=%s", i, v))
		end
		return string.format("D,%x,circuit@%s", os.time(), table.concat(str, ";"))
	end
}