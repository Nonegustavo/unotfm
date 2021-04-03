function bomb(n)
	local card = table.remove(ROUND.pile)
	table.insert(ROUND.deck, math.random(#ROUND.deck+1), card)
	showDeck()
	ROUND.topCard.card = ROUND.topCard.card2
	--drawTopCard()
	removeTopCard()
	addTopCard(ROUND.topCard.card, nil, true)
	local y = 195 - (#ROUND.deck/108 * 10)
	local img = showCard({"black","bomb"}, 320, y, nil, "!1000")
	for i, v in pairs(img) do
		TIMER.img[v] = os.time()+2000
	end
	ui.addTextArea(90000, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "000000")..#DECK[name], nil, 320, y+76, 51, 60, 0, 0, 0, false)
	ui.addTextArea(90001, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "FFFFFF")..#DECK[name], nil, 320, y+75, 50, 60, 0, 0, 0, false)
	table.insert(TIMER.txt, {time=os.time()+2000, id=90000})
	table.insert(TIMER.txt, {time=os.time()+2000, id=90001})
	passTurn()
	ROUND.chair[n].confuse = false
	batataTimer(n)
	updateShadow(n)
end

function bombInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "bomb" then
			local c = showCard({"black","bomb"}, ROUND.chair[n].x-25, 20, nil, "!1000")
			for i, v in pairs(c) do
				TIMER.img[v] = os.time()+2000
			end
			return true
		end
	end
end