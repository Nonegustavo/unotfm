function compass(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].compass = ROUND.chair[n].compass or 0
	ROUND.chair[n].compass = ROUND.chair[n].compass + 1
	if ROUND.chair[n].compass < 3 then
		showProgress(n)
		passTurn()
		batataTimer(n)
	elseif ROUND.chair[n].compass == 3 then
		showProgress(n)
		ROUND.chair[n].action = {name="PLAY"}
		ROUND.time = os.time() + 10000
		addFunctionTimer(function()
			ROUND.chair[n].action = nil
			giveCard(n, {ROUND.topCard.card[1],"chest",true,true}, true)
			missCard(n, {ROUND.topCard.card[1],"chest",true,true}, 2000)
			passTurn()
			batataTimer(n)
		end, 2000)
	else
		passTurn()
		batataTimer(n)
	end
	ROUND.chair[n].confuse = false
end

function showProgress(n)
	local text = ROUND.chair[n].compass.."/3"
	ui.addTextArea(7000+n, "<p align='center'><font size='30px' color='#000000'><b>"..text, nil, ROUND.chair[n].x-50, 50, 100, 60, 0, 0, 0, false)
	ui.addTextArea(7010+n, "<p align='center'><font size='30px' color='#FFD800'><b>"..text, nil, ROUND.chair[n].x-52, 48, 100, 60, 0, 0, 0, false)
	table.insert(TIMER.txt, {time=os.time()+2000, id=7000+n})
	table.insert(TIMER.txt, {time=os.time()+2000, id=7010+n})
	explosion(11, ROUND.chair[n].x, 70, 7*ROUND.chair[n].compass, 20)
end

function chest(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	endGame(ROUND.chair[n].owner, ROUND.topCard.card)
	unlockChair(ROUND.chair[n].owner, "falls")
end