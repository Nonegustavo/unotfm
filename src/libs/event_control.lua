function checkVars(nameFunc, values, types, recursion)
	if not recursion then
		--checkVars("checkVars", {nameFunc, values, types}, {"string", "table", "table"}, true)
	elseif #values ~= #types then
		error("checkVars() : the tables must have the same size", 2)
	end
	for i=1, #types do
		if type(types[i]) == "table" then
			local ok = false
			for j, v in pairs(types[i]) do
				if type(values[i]) == v then
					ok = true
					break
				end
			end
			if not ok then
				error(string.format("%s() : %s expected as argument %s, got %s", nameFunc, table.concat(types[i], "|"), i, type(values[i])), 3)
			end
		elseif type(values[i]) ~= types[i] then
			error(string.format("%s() : %s expected as argument %s, got %s", nameFunc, types[i], i, type(values[i])), 3)
		end
	end
end

function stopScript(err, func, ...)
	local args = table.pack(...)
	local valuesStr = {}
	for i=1, args.n do
		local v = args[i]
		table.insert(valuesStr, v == nil and "nil" or v == true and "true" or v == false and "false" or type(v) == "table" and table.tostring(v) or type(v) == "function" and "function" or type(v) == "string" and ('"'..v..'"') or v)
	end
	err = string.format("%s\n%s(%s)- %s\n<j>Please, send this error to Ninguem#0095", err, func, table.concat(valuesStr, ", "), VERSION)
	tfm.exec.chatMessage("<r>[ERROR] "..err)
	ui.addTextArea(9999999999999, "", nil, 0, 0, 800, 400, nil, nil, 0.9, true)
	ui.addTextArea(9999999999998, "<p align='center'><font color='#ffffff'><font size='14px'>Oh no! We broke this room! :(</font>\n\n"..err.."\n\n<n>If you want to play more #unotfm, go to another room. This room is broken.", nil, 0, 170, 800, nil, 0, 0, 0, true)
	ERROR = true
	tfm.exec.setRoomMaxPlayers(1)
end

--[[



-- ## Eventos ## --

function eventMouse(p, x, y)
	if not ERROR then
		local ok, err = pcall(EventMouse, p, x, y)
		if not ok then
			stopScript(err, "eventMouse", p, x, y)
		end
	end
end

function eventChatCommand(p, cmd)
	if not ERROR then
		local ok, err = pcall(EventChatCommand, p, cmd)
		if not ok then
			stopScript(err, "eventChatCommand", p, cmd)
		end
	end
end

function eventKeyboard(p, key, down, x, y)
	if not ERROR then
		local ok, err = pcall(EventKeyboard, p, key, down, x, y)
		if not ok then
			stopScript(err, "eventKeyboard", p, key, down, x, y)
		end
	end
end

function eventTextAreaCallback(id, player, cmd)
	if not ERROR then
		local ok, err = pcall(EventTextAreaCallback, id, player, cmd)
		if not ok then
			stopScript(err, "eventTextAreaCallback", id, player, cmd)
		end
	end
end

function eventPopupAnswer(id, player, msg)
	if not ERROR then
		local ok, err = pcall(EventPopupAnswer, id, player, msg)
		if not ok then
			stopScript(err, "eventPopupAnswer", id, player, msg)
		end
	end
end

function eventPlayerRespawn(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerRespawn, p)
		if not ok then
			stopScript(err, "EventPlayerRespawn", p)
		end
	end
end

function eventPlayerDied(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerDied, p)
		if not ok then
			stopScript(err, "eventPlayerDied", p)
		end
	end
end

function eventChatMessage(p, msg)
	if not ERROR then
		local ok, err = pcall(EventChatMessage, p, msg)
		if not ok then
			stopScript(err, "eventChatMessage", p, msg)
		end
	end
end

function eventEmotePlayed(p, id, arg)
	if not ERROR then
		local ok, err = pcall(EventEmotePlayed, p, id, arg)
		if not ok then
			stopScript(err, "eventEmotePlayed", p, id, arg)
		end
	end
end

function eventLoop(current, remaining)
	if not ERROR then
		local ok, err = pcall(EventLoop, current, remaining)
		if not ok then
			stopScript(err, "eventLoop", current, remaining)
		end
	end
end

function eventNewPlayer(p)
	if not ERROR then
		local ok, err = pcall(EventNewPlayer, p)
		if not ok then
			stopScript(err, "eventNewPlayer", p)
		end
	end
end

function eventPlayerLeft(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerLeft, p)
		if not ok then
			stopScript(err, "eventPlayerLeft", p)
		end
	end
end

function eventNewGame()
	if not ERROR then
		local ok, err = pcall(EventNewGame)
		if not ok then
			stopScript(err, "eventNewGame")
		end
	end
end

function eventPlayerDataLoaded(p, data)
	if not ERROR then
		local ok, err = pcall(EventPlayerDataLoaded, p, data)
		if not ok then
			stopScript(err, "eventPlayerDataLoaded", p, data)
		end
	end
end]]--