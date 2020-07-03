onEvent("PlayerLeft", function(p)
	kickPlayer(p)
	PLAYER[p] = nil
end)