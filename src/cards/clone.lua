function clone(n)
	local wild = {wild="black", draw4="black", king="black", queen="black", half="black", simon="black"}
	ROUND.topCard.card[2] = ROUND.topCard.card2[2]
	ROUND.topCard.card[1] = wild[ROUND.topCard.card2[2]] or ROUND.topCard.card2[1]
	local y = drawTopCard()
	tfm.exec.displayParticle(12, 455, y+37, 0, 0, 0, 0)
	ROUND.chair[n].action = nil
	_G[ROUND.topCard.card[2]](n)
end