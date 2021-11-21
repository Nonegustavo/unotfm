function skip(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 20, 20)
	passTurn()
	updateHand(n)
	batataTimer(n)
	ROUND.chair[n].confuse = false
end