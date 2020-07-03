onEvent("Keyboard", function(p, key, down, x, y)
	-- fazer jogador sentar em uma cadeira
	if not PLAYER[p] then
		return
	end
	PLAYER[p].antiDoubleClick = PLAYER[p].antiDoubleClick or (os.time() - 5)
	if PLAYER[p].antiDoubleClick < os.time() or not down then
		PLAYER[p].antiDoubleClick = os.time() + 200
	else
		return false
	end
	PLAYER[p].notAfk = true
	if (key == 32 or key == 3) and not BANNED[p] and PLAYER[p].spaceDelay < os.time() and ROUND.chair then
		if p:sub(1,1) == "*" then
			tfm.exec.chatMessage("<r>"..translate(p, "WARNING_SOURIS"), p)
		elseif not PLAYER[p].loaded then
			tfm.exec.chatMessage("<r>"..translate(p, "WARNING_DATA"), p)
		elseif CONFIG.newPlayers and not PLAYER[p].chair and not yetPlaying(p) then
			for i, v in pairs(ROUND.chair) do
				if x > v.x-30 and x < v.x+30 and (v.mode == "EMPTY" or v.mode == "FREE") then
					playerSit(p, v, i)
					break
				end
			end
		end
		PLAYER[p].spaceDelay = os.time() + 500
	elseif key == 72 then
		if not window.isOpened(p, "RULES") then
			closeAll(p, "RULES")
			window.open(p, "RULES", 1)
		else
			window.close(p, "RULES")
		end
	elseif key == 85 then
		if not window.isOpened(p, "SETTINGS2") then
			closeAll(p, "SETTINGS2")
			window.open(p, "SETTINGS2")
		else
			window.close(p, "SETTINGS2")
			window.close(p, "SETTINGS3")
		end
	elseif key == 79 then
		if not window.isOpened(p, "OPTIONS") then
			closeAll(p, "OPTIONS")
			window.open(p, "OPTIONS")
		else
			window.close(p, "OPTIONS")
		end
	elseif key == 80 then
		if not window.isOpened(p, "PROFILE") then
			closeAll(p, "PROFILE")
			window.open(p, "PROFILE", p)
		else
			window.close(p, "PROFILE")
			window.close(p, "TROPHY")
		end
	elseif key == 17 then
		PLAYER[p].ctrl = down and (os.time() + 30000) or false
	end
end)