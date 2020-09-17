for i, v in pairs(tfm.get.room.playerList) do
	eventNewPlayer(i)
end
for i, v in pairs(BOT) do
	PLAYER[i] = instanceData()
	PLAYER[i].skinEquiped = v.chair
end

local temp = roomOwner()
addFunctionTimer(function()
	for i, v in pairs(tfm.get.room.playerList) do
		if nickHashtag(i) == temp then
			OWNER = i
			colorNick(i)
			break
		end
	end
end, 500)
if not temp then
	tfm.exec.setRoomMaxPlayers(15)
else
	CONFIG.ranked = false
end
if CONFIG.tribeHouse then
	CONFIG.ranked = false
end
if not (string.match(tfm.get.room.name,"^%w%w%-#unotfm[1-9]+$") or string.match(tfm.get.room.name,"^*#unotfm[1-9]+$")) then
	CONFIG.ranked = false
end
if string.match(tfm.get.room.name,"music") then
	CONFIG.music = true
end
system.disableChatCommandDisplay(nil, true)
tfm.exec.disableAutoShaman()
--tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoScore()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableMinimalistMode()
tfm.exec.disableMortCommand()
newMap()