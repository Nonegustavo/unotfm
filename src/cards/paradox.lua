function paradox(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local rand = math.random(#ROUND.chair[n].hand)
	local temp = table.remove(ROUND.chair[n].hand, rand)
	temp.lock = false
	discardEffect(n, rand)
	if not PARADOX[ROUND.chair[n].owner] then
		PARADOX[ROUND.chair[n].owner] = {}
	end
	table.insert(PARADOX[ROUND.chair[n].owner], {temp[1],temp[2],temp[2] ~= "batata",true})
	local img = tfm.exec.addImage(IMG.misc.portal, "!1000", ROUND.chair[ROUND.turn].x-50, 5)
	TIMER.img[img] = os.time()+2000
	missCard(n, temp, 2000)
	explosion(1, ROUND.chair[n].x, 80, 40, 40)
	ROUND.chair[n].uno = nil
	updateHand(n)
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].uno = "uno"
	end
	updateScore(n)
	showCardsGainned(n, -1)
	if #ROUND.chair[n].hand == 0 then
		endGame(ROUND.chair[n].owner)
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end