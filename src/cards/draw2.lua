function draw2(n)
	if ROUND.gameMode.nocombo then
		ROUND.turn = nextChair(ROUND.turn)
		local target = ROUND.turn
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
		tryDraw(target, 2)
		local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[target].x-50, 30)
		TIMER.img[img] = os.time()+1000
		explosion(35, ROUND.chair[target].x, 80, 50, 10)
	else
		if ROUND.accumulated then
			ROUND.accumulated.cards = ROUND.accumulated.cards + 2
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			addBlockPoint(ROUND.chair[n].owner)
		else
			ROUND.accumulated = {allowed = {draw2=true}, player = {}, cards = 2}
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			if ROUND.gameMode.supercombo then
				ROUND.accumulated.allowed = {draw2=true, draw4=true, draw99=true, shield=true}
			end
		end
		showAccumulated()
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end