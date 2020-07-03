function red(n)
	local find = false
	for i, v in pairs(ROUND.chair[n].hand) do
		if isNumeric(v) then
			find = i
			break
		end
	end
	if find then
		local target = false
		local min = math.huge
		for i, v in pairs(ROUND.chair) do
			if i ~= n and v.mode ~= "DELETED" then
				if #v.hand == 10 then
					target = i
					break
				elseif #v.hand < min then
					min = #v.hand
					target = i
				end
			end
		end
		missCard(target, ROUND.chair[n].hand[find], 2000)
		explosion(5, ROUND.chair[target].x, 100, 5, 10)
		donateByIndex(n, target, find)
		sortHand(ROUND.chair[target].hand)
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		end
		showCardsGainned(n, -1)
		showCardsGainned(target, 1)
		updateScore(n)
		updateScore(target)
		drawTopCard()
		updateHand(n)
		updateHand(target)
		if mustBeEliminated(target) then
			eliminate(target)
		end
	end
	if #ROUND.chair[n].hand == 0 then
		endGame(ROUND.chair[n].owner)
	else
		passTurn()
		batataTimer(n)
	end
end

function blue(n)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and n ~= i then
			v.peace = 2
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function yellow(n)
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	local r = table.remove(pool, math.random(#pool))
	if r then
		local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
		TIMER.img[img] = os.time()+500
		explosion(0, ROUND.chair[r].x, 115, 10, 30)
		tryDraw(r, math.random(3))
	end
	passTurn()
	batataTimer(n)
end

function green(n)
	local target = false
	local min = math.huge
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if #v.hand < min then
				min = #v.hand
				target = i
			end
		end
	end
	if target and #ROUND.chair[n].hand > min then
		discardCard(n, #ROUND.chair[n].hand-min)
		explosion(9, ROUND.chair[n].x, 135, 5, 10)
		explosion(35, ROUND.chair[n].x, 135, 3, 5)
		explosion(9, ROUND.chair[target].x, 135, 5, 10)
		explosion(35, ROUND.chair[target].x, 135, 3, 5)
	end
	passTurn()
	batataTimer(n)
end

function power(n)
  table.insert(ROUND.pile, table.remove(ROUND.chair[n].hand, math.random(#ROUND.chair[n].hand)))
  ROUND.topCard.card2 = ROUND.topCard.card
  ROUND.topCard.card[2] = "ruleBoss"
  local y = drawTopCard()
  if #ROUND.chair[n].hand == 1 then
    ROUND.chair[n].uno = "uno"
  end
  updateHand(n)
  updateScore(n)
  local fx = {red=13, blue=1, yellow=11, green=9}
  y = 210 - (#ROUND.pile/108 * 10)
  for i=1, 10 do
    local vel = i/10*75
    tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 430, y+vel, -math.random(7,15)/5, (vel-37)/20, 0, 0)
  end
  for i=1, 10 do
    local vel = i/10*75
    tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 480, y+vel, math.random(7,15)/5, (vel-37)/20, 0, 0)
  end
  ROUND.chair[n].action = {name="PLAY"}
  ROUND.time = GLOBAL_TIME + 10000
  addFunctionTimer(function()
    ROUND.chair[n].action = nil
    _G[ROUND.topCard.card[2]](n)
  end, 1000)
end