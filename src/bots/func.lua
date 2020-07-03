function botMakeAction()
	local chair = ROUND.chair[ROUND.turn]
	sayUno(ROUND.turn)
	if chair.action then
		if chair.action.name == "WEB" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeWeb(ROUND.turn, target)
			else
				makeWeb(ROUND.turn, ROUND.turn)
			end
			return "WEB", target
		elseif chair.action.name == "GIFT" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.owner ~= "Papaille" and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeGift(ROUND.turn, target)
			else
				makeGift(ROUND.turn, ROUND.turn)
			end
			return "GIFT", target
		elseif chair.action.name == "TRADE" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeTrade(ROUND.turn, target)
			else
				makeTrade(ROUND.turn, ROUND.turn)
			end
			return "TRADE", target
		elseif chair.action.name == "BATATA" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeBatata(ROUND.turn, target)
			else
				makeBatata(ROUND.turn, ROUND.turn)
			end
			return "BATATA", target
		elseif chair.action.name == "MIMIC" then
			local target = nil
			local bigger = 0
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand > bigger then
					target = i
					bigger = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeMimic(ROUND.turn, target)
			else
				makeMimic(ROUND.turn, ROUND.turn)
			end
			return "MIMIC", target
		elseif chair.action.name == "THEFT" then
			local target = nil
			local bigger = 0
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand > bigger then
					target = i
					bigger = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeTheft(ROUND.turn, target)
			else
				makeTheft(ROUND.turn, ROUND.turn)
			end
			return "THEFT", target
		elseif chair.action.name == "WILD" then
			local color = "red"
			if ROUND.topCard.card[2] == "simon" and chair.action.simon ~= "FINAL" then
				if math.random() > 0.7 then
					local pool = {"red", "blue", "yellow", "green"}
					color = pool[math.random(#pool)]
				else
					color = ROUND.simon[chair.action.simon]
				end
			else
				local pool = {"red", "blue", "yellow", "green"}
				for i, v in pairs(chair.hand) do
					if v[1] ~= "black" then
						for i=1, 5 do
							table.insert(pool, v[1])
						end
					end
				end
				color = pool[math.random(#pool)]
			end
			paintCard(color, ROUND.turn)
			return "WILD"
		elseif chair.action.name == "TRACKING" then
			local wild = false
			for i, v in pairs(chair.action.card) do
				if ROUND.deck[v][1] == "black" then
					wild = v
					break
				end
			end
			if wild then
				drawCardTracking(ROUND.turn, wild)
			else
				local discard = false
				for i, v in pairs(chair.action.card) do
					if ROUND.deck[v][1] == ROUND.topCard.card[1] or ROUND.deck[v][2] == ROUND.topCard.card[2] then
						discard = v
						break
					end
				end
				if discard then
					drawCardTracking(ROUND.turn, discard)
				else
					drawCardTracking(ROUND.turn, chair.action.card[math.random(3)])
				end
			end
			return "TRACKING"
		elseif chair.action.name == "WISH" then
			local wild = false
			for i, v in pairs(chair.action.card) do
				if ROUND.pile[v][1] == "black" then
					wild = v
					break
				end
			end
			if wild then
				makeWish(ROUND.turn, wild)
			else
				local discard = false
				for i, v in pairs(chair.action.card) do
					if ROUND.pile[v][1] == ROUND.topCard.card[1] or ROUND.pile[v][2] == ROUND.topCard.card[2] then
						discard = v
						break
					end
				end
				if discard then
					makeWish(ROUND.turn, discard)
				else
					makeWish(ROUND.turn, chair.action.card[math.random(3)])
				end
			end
			return "WISH"
		elseif chair.action.name == "BAN" then
			makeBan(ROUND.turn, chair.action.card[math.random(3)])
			return "BAN"
		elseif ROUND.chair[ROUND.turn].action.name == "RULE" then
			selectRule(ROUND.turn, math.random(1,2))
			return "RULE"
		end
	else
		if ROUND.accumulated and not ROUND.gameMode.hell then
			if ROUND.topCard.card[2] == "draw4" then
				local play = false
				for i, v in pairs(chair.hand) do
					if canPlay(ROUND.turn, i) then
						play = i
						break
					end
				end
				if play then
					playCard(ROUND.turn, play)
					return "BLOCK"
				else
					local previous = previousChair(ROUND.turn)
					local challenge = false
					for i, v in pairs(ROUND.chair[previous].hand) do
						if v[1] == ROUND.topCard.card2[1] then
							challenge = true
							break
						end
					end
					if challenge then
						challengeDrawFour(ROUND.turn)
						return "CHALLENGE"
					else
						eventMouse(chair.owner, 350, 220)
						return "DRAW"
					end
				end
			else
				local play = false
				for i, v in pairs(chair.hand) do
					if canPlay(ROUND.turn, i) then
						play = i
						break
					end
				end
				if play then
					playCard(ROUND.turn, play)
					return "BLOCK"
				else
					eventMouse(chair.owner, 350, 220)
					return "DRAW"
				end
			end
		elseif canPlayHand(ROUND.turn) and not chair.played then
			for i, v in pairs(chair.hand) do
				if v[2] == "batata" and canPlay(ROUND.turn, i) then
					playCard(ROUND.turn, i)
					return "PLAY"
				end
			end
			local score = {}
			local tier = {red=100, blue=100, yellow=100, green=100, black=1000, draw2=20, web=4, skip=6, reverse=6, clone=10, wild=60, draw4=80, half=200, thunder=2, rain=2, box=2, n0=4, n1=6, n2=6, n3=6, n4=6, n5=6, n6=6, n7=6, n8=6, n9=6}
			for i, v in pairs(chair.hand) do
				if canPlay(ROUND.turn, i) then
					score[i] = 0
					local have = {}
					for j, v in pairs(chair.hand) do
						if j ~= i then
							have[v[1]] = have[v[1]] and (have[v[1]] * 0.5) or 1
							have[v[2]] = have[v[2]] and (have[v[2]] * 0.5) or 1
						end
					end
					for j, v in pairs(have) do
						if tier[j] then
							score[i] = score[i] + tier[j]*v
						else
							score[i] = score[i] + 20*v
						end
					end
				end
			end
			local card = false
			local best = -1
			for i, v in pairs(score) do
				if v > best then
					card = i
					best = v
				end
			end
			if card then
				playCard(ROUND.turn, card)
				return "PLAY"
			end
		else
			if chair.draw then
				eventMouse(chair.owner, 680, 280)
				return "COMMON_DRAW"
			else
				eventMouse(chair.owner, 350, 220)
				return "PASS"
			end
		end
	end
end