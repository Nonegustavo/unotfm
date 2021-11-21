function mix1(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	updateHand(n)
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function mix2(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	local target = nextChair(ROUND.turn)
	tryDraw(target, 2)
	ROUND.turn = target
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	updateHand(n)
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function mix3(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	local target = nextChair(ROUND.turn)
	tryDraw(target, 2)
	ROUND.turn = target
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	updateHand(n)
	batataTimer(n)
	ROUND.chair[n].confuse = false
end