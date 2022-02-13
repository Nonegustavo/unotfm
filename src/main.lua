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
			return
		end
	end
	if not (tfm.get.room.isTribeHouse or tfm.get.room.name:sub(1,1) == "@") then
		CONFIG.ranked = true
	end
end, 500)
if not temp then
	tfm.exec.setRoomMaxPlayers(15)
else
	CONFIG.ranked = false
end
if tfm.get.room.isTribeHouse or tfm.get.room.name:sub(1,1) == "@" then
	CONFIG.ranked = false
	CONFIG.tribeHouse = true
end
if tfm.get.room.name:find("#event$") then
	CONFIG.eventRoom = true
	CONFIG.ranked = true
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