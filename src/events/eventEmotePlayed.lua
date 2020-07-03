onEvent("EmotePlayed", function(p, id, arg)
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	else
		return false
	end
	if PLAYER[p].chair and ROUND.state == "PLAY" and ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "IMITATE" and ROUND.chair[ROUND.turn].action.action == id then
		if not ROUND.chair[ROUND.turn].action.player[PLAYER[p].chair] then
			ROUND.chair[ROUND.turn].action.player[PLAYER[p].chair] = true
			local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[PLAYER[p].chair].x-50, 30)
			table.insert(ROUND.chair[ROUND.turn].action.img, img)
			emoteVerify()
		end
	end
end)