function useFraise(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ",")
		local mouth = split(look[4], "_")
		return mouth[1] == "19"
	end
end

function useFish(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ",")
		local ear = split(look[3], "_")
		return ear[1] == "7"
	end
end

function useTree(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ";")
		return look[1] == "35"
	end
end

function useTotoro(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ";")
		local fur = look[1]
		local moreLook = split(look[2], ",")
		local head = split(moreLook[1], "_")
		local neck = split(moreLook[5], "_")
		return (fur == "81" or head[1] == "229") and (head[1] == "171" or neck[1] == "23")
	end
end

function isNaked(p)
	return tfm.get.room.playerList[p] and tfm.get.room.playerList[p].look == "1;0,0,0,0,0,0,0,0,0"
end