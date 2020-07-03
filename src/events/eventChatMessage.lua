onEvent("ChatMessage", function(p, msg)
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	end
	if ROUND.state == "PLAY" then
		for i, v in pairs(ROUND.chair) do
			if BOT[v.owner] and BOT[v.owner].eventChat then
				BOT[v.owner].eventChat(p, msg)
			end
		end
	end
end)