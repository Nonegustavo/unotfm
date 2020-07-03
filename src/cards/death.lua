function death(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if not ROUND.subitDeath then
		tfm.exec.addPhysicObject(0, 400, 530, {height=10, width=3000})
		ROUND.cloud.obj = tfm.exec.addShamanObject(63, 400, 500, 0, 2, 0, false)
		ROUND.cloud.delay = os.time()+5000
		ROUND.subitDeath = true
		tfm.exec.addImage(IMG.misc.cloud, "#"..ROUND.cloud.obj, -1200, -500)
		showDeck()
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 210, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end