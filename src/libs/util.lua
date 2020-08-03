function emptyFunc()
end

function nickFormat(p)
	if p:sub(1,1) == "*" then
		return p
	else
		return string.gsub(p:lower(), '%a', function(k) return string.upper(k) end, 1)
	end
end

function nickHashtag(data, doNotNormalize)
	local nickname = data:gmatch('(.-)#[0-9]+$')() or data
	local tag = data:gmatch('#([0-9]+)$')() or '0000'
	nickname = doNotNormalize and nickname or nickname:lower():gsub('%a', string.upper, 1)
	return nickname, tag
end

function nickLength(p)
	local cont = 0
	local tier = {["_"]=3, M=3, m=3, W=3, w=3, i=1, l=1}
	for i=1, #p do
		cont = cont + (tier[p:sub(i,i)] or 2)
	end
	return cont
end

function nickMinifier(p)
	local l = 21
	if nickLength(p) > l then
		local tier = {["_"]=3, M=3, m=3, W=3, w=3, i=1, l=1}
		local cont = 0
		for i=1, #p do
			cont = cont + (tier[p:sub(i,i)] or 2)
			if cont >= l-1 then
				return p:sub(1,i).."."
			end
		end
		return p:sub(1,9).."."
	else
		return p
	end
end

function whichNick(p)
	if tfm.get.room.playerList[nickFormat(p)] then
		return nickFormat(p)
	else
		p = nickHashtag(p)
		local found = {}
		for i, v in pairs(tfm.get.room.playerList) do
			if nickHashtag(i) == p then
				table.insert(found, i)
			end
		end
		if #found == 1 then
			return found[1]
		end
	end
end

function isAdm(p)
	return ADM[p]
end

function roomOwner()
	local n = tfm.get.room.name:match("#unotfm%d+(.*)")
	if n and #n > 3 then
		local arg = split(n, " ")
		arg = split(arg[1], "-")
		arg = split(arg[1], "#")
		return #arg[1] >= 3 and nickFormat(arg[1])
	end
end

function split(t,s)
	-- retorna uma table com a string dividida
	-- -- String t = texto a ser dividido
	-- -- String s = símbolo de separação (opcional)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end

function explosion(id, x, y, vezes, vel)
	-- faz uma mini explosão de partículas
	-- -- Number id = id das partículas
	-- -- Number x = coordenada x do centro
	-- -- Number y = coordenada y do centro
	-- -- Number vezes = número de partículas
	-- -- Number vel = velocidade máxima
	for i=1, vezes do
		tfm.exec.displayParticle(id, x, y, math.random(-vel,vel)/10, math.random(-vel,vel)/10, 0, 0)
	end
end
--[[
function translate(p, k, a, b, c, d, e)
	-- Retorna o texto correspondente à comunidade do jogador fornecido, requer tabela LANG
	-- -- String p = nome de um jogador
	-- -- String k = chave de tradução
	-- -- Return = String
	local cmm = "en"
	cmm = PLAYER[p] and PLAYER[p].community or "auto"
	cmm = cmm == "auto" and tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community or cmm
	--if tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community then
	--  cmm = tfm.get.room.playerList[p].community
	--end
	return a and string.format(LANG[cmm] and LANG[cmm][k] or LANG.en[k] or ("$" .. k), a, b, c, d, e) or (LANG[cmm] and LANG[cmm][k] or LANG.en[k] or ("$" .. k))
end
]]--

LANGT = {en=1, br=2, fr=3, es=4, ru=5, cn=6, pl=7, hu=8, tr=9}
function translate(p, k, a, b, c, d, e)
	if not k then
		return "#ERROR"
	end
	if not LANG[k] then 
		return "$"..k
	end
	local cmm = PLAYER[p] and PLAYER[p].community or "auto"
	cmm = cmm == "auto" and tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community or cmm
	cmm = LANGT[cmm] or 1
	cmm = (not LANG[k][cmm] or LANG[k][cmm] == "") and 1 or cmm
	return a and string.format(LANG[k][cmm], a, b, c, d, e) or LANG[k][cmm]
end

function translatedChatMessage(k, p, a, b, c, d, e)
	-- Mostra o texto traduzido no chat, requer função translate()
	-- -- String k = chave de tradução
	-- -- String p = nome de um jogador, se nil será exibido para todos
	if p then
		tfm.exec.chatMessage(translate(p, k, a, b, c, d, e), p)
	else
		for i in pairs(tfm.get.room.playerList) do
			tfm.exec.chatMessage(translate(i, k), i)
		end
	end
end



function newMap()
	local map = CONFIG.music and MUSIC[math.random(#MUSIC)] or MAP[math.random(#MAP)]
	if tfm.get.room.uniquePlayers >= 6 and CONFIG.ranked and not CONFIG.noRules then
		if CONFIG.mapEvent and (math.random() < CONFIG.eventRate or CONFIG.actualTimer >= CONFIG.pityTimer) then
			CONFIG.actualTimer = 0
			map = CONFIG.mapEvent
		else
			CONFIG.actualTimer = CONFIG.actualTimer + 1
		end
	end
	if type(map) == "table" then
		map = map[math.random(#map)]
	end
	tfm.exec.newGame(map)
end

function validMap()
	if tfm.get.room.currentMap:sub(1,1)=="@" and tfm.get.room.xmlMapInfo then
		local str = string.match(tfm.get.room.xmlMapInfo.xml, 'Chair="(.-)"')
		if str then
			return split(str)
		end
	end
end

function quote(p, key, add)
	local find = false
	for i, v in pairs(ROUND.chair) do
		if v.owner == p and v.mode ~= "DELETED" then
			find = true
			break
		end
	end
	if CONFIG.ranked and find then
		for i, v in pairs(tfm.get.room.playerList) do
			tfm.exec.chatMessage(string.format("<v>[%s] <n>%s", p, string.format(translate(i, key), add)), i)
		end
	end
end

function quoteFake(p, msg)
	for i, v in pairs(tfm.get.room.playerList) do
		tfm.exec.chatMessage(string.format("<v>[%s] <n>%s", p, msg), i)
	end
end

function allChairs()
	if ROUND and ROUND.chair then
		local p = 0
		local cont = 0
		for i, v in pairs(ROUND.gameMode) do
			if BOT[nickFormat(i)] then
				p = p + 1
			end
		end
		for i, v in pairs(tfm.get.room.playerList) do
			if i:sub(1,1) ~= "*" then
				p = p + 1
			end
		end
		for i, v in pairs(ROUND.chair) do
			if v.mode == "BUSY" then
				cont = cont + 1
			end
		end
		if cont > 1 and cont == #ROUND.chair or p == cont then
			return true
		end
	end
end

function colorNick(p)
	local color = 0
	if p == OWNER then
		color = 0xFFB677
	elseif isAdm(p) then
		color = 0x77C6FF
	elseif BANNED[p] then
		color = 0xFF7777
	end
	tfm.exec.setNameColor(p, color)
end

function countRules(rules)
	local cont = 0
	for i, v in pairs(rules) do
		if not RULE[i].notCount then
			cont = cont + 1
		end
	end
	return cont
end

function validRoom()
	if ROUND.chair then
		local cont = 0
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				cont = cont + 1
			end
		end
		if cont >= 4 and tfm.get.room.uniquePlayers >= cont and CONFIG.ranked or RANKED then
			return true
		end
	end
end