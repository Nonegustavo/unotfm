onEvent("Mouse", function(p, x, y, autoplay)
	-- cliques em cartas e em outras coisas do jogo
	if not PLAYER[p] then
		return false
	end
	PLAYER[p].antiDoubleClick = PLAYER[p].antiDoubleClick or (os.time() - 5)
	if PLAYER[p].antiDoubleClick < os.time() or autoplay then
		PLAYER[p].antiDoubleClick = os.time() + 200
	else
		return false
	end
	if ROUND and (ROUND.state == "PLAY" or ROUND.state == "MULLIGAN") then
		local chair = PLAYER[p] and PLAYER[p].chair or ROUND.turn
		local top = ROUND.topCard.card
		if ROUND.state == "MULLIGAN" and not ROUND.chair[chair].change then
			if x > 350 and x < 450 and y > 293 and y < 313 then
				changeHand(chair)
			end
		elseif ROUND.state == "PLAY" and ROUND.chair[chair] and (not ROUND.chair[chair].confuse and not isCursed(chair, "poison") or autoplay) then
			local player = tfm.get.room.playerList[p]
			if BOT[p] or (player and player.x > ROUND.chair[chair].x - 30 and player.x < ROUND.chair[chair].x + 30) or autoplay then
				if ROUND.chair[chair].action then
					if ROUND.chair[chair].action.func and y > 50 and y < 110 then
						local target = whichPlayer(chair, x)
						if target and ROUND.chair[chair].action.op[target] then
							tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
							ROUND.chair[chair].action.func(chair, target)
							return false
						end
					elseif ROUND.chair[chair].action.name == "WILD" then
						if y > 200 and y < 350 then
							if x > 170 and x < 270 then
								clearImagesAction(chair)
								paintCard("red", chair)
								return false
							elseif x > 290 and x < 390 then
								clearImagesAction(chair)
								paintCard("blue", chair)
								return false
							elseif x > 410 and x < 510 then
								clearImagesAction(chair)
								paintCard("yellow", chair)
								return false
							elseif x > 530 and x < 630 then
								clearImagesAction(chair)
								paintCard("green", chair)
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "TRACKING" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "WISH" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "BAN" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "RULE" then
						if y > 190 and y < 350 then
							if x > 235 and x < 395 then
								clearImagesAction(chair)
								selectRule(chair, 1)
								return false
							elseif x > 405 and x < 565 then
								clearImagesAction(chair)
								selectRule(chair, 2)
								return false
							end
						end
					end
				elseif y > 320 and y < 395 then
					local id, card = whichCard(chair, x)
					if id and card then
						if PLAYER[p].ctrl then
							if RULE[card[2]] or CARD[card[2]] then
								if window.isOpened(p, "CARD") then
									window.update(p, "CARD", card)
								else
									closeAll(p, "CARD")
									window.open(p, "CARD", card)
								end
							end
						else
							local play = false
							if chair == ROUND.turn then
								if canPlay(chair, id) then
									playCard(chair, id)
								elseif ROUND.chair[chair].clickDelay < os.time() then
									missCard(chair, card, 1000, true)
									if ROUND.gameMode.hard then
										ROUND.chair[chair].afk = autoplay
										autoPlay()
									end
								end
							else
								if canPlay(chair, id) then
									jumpIn(ROUND.turn, chair)
									missCard(chair, card, 1000)
									playCard(chair, id, false, true)
								elseif ROUND.chair[chair].clickDelay < os.time() then
									missCard(chair, card, 1000, true)
								end
							end
						end
					end
				elseif chair == ROUND.turn then
					if not ROUND.chair[chair].draw and not ROUND.chair[chair].played and x > 320 and x < 370 and y > 200 and y < 285 then
						ROUND.chair[chair].afk = autoplay
						if ROUND.accumulated then
							if not ROUND.accumulated.click then
								if not isCursed(chair, "ice") or ROUND.subitDeath then
									if (ROUND.subitDeath or isCursed(chair, "thorn")) and ROUND.chair[chair].owner ~= "Charlotte" then
										mimicDraw(chair, ROUND.accumulated.cards)
										ROUND.accumulated = nil
										ui.removeTextArea(2)
										eliminate(chair, true) 
									else
										--drawCard(chair, ROUND.accumulated.cards, "PENALTY")
										tryDraw(chair, ROUND.accumulated.cards)
										--mimicDraw(chair, ROUND.accumulated.cards)
										ROUND.accumulated = nil
										ui.removeTextArea(2)
										if mustBeEliminated(chair) then
											eliminate(chair, true) 
										elseif ROUND.turn == chair then
											passTurn()
											ROUND.chair[chair].confuse = false
											updateShadow(chair)
											batataTimer(chair)
										end
									end
								else
									local y = 210 - (#ROUND.deck/108 * 10)
									for i=1, 10 do
										tfm.exec.displayParticle(4, 345, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
									end
									ROUND.accumulated = nil
									ui.removeTextArea(2)
									ui.removeTextArea(18)
									passTurn()
									ROUND.chair[chair].confuse = false
									updateShadow(chair)
									batataTimer(chair)
								end
							end
						else
							if (ROUND.subitDeath or isCursed(chair, "thorn")) and ROUND.chair[chair].owner ~= "Charlotte" then
								eliminate(chair, true) 
							elseif not isCursed(chair, "ice") then
								if not ROUND.chair[chair].notTrash then
									ROUND.chair[chair].notTrash = canPlayHand(chair, top)
									if ROUND.chair[chair].notTrash and PLAYER[p].faustao then
										tfm.exec.chatMessage("[intentional draw detected]", p)
										tfm.exec.chatMessage("<v>[Faustão] <n>puxa vida meu", p)
									end
								end
								local boss = {Drekkemaus=1, Jingle=1, Charlotte=1}
								if ROUND.gameMode.tracking or ROUND.chair[chair].luck or boss[ROUND.chair[chair].owner] then
									ROUND.chair[chair].luck = nil
									tracking(chair)
								elseif ROUND.gameMode.fastdraw or ROUND.chair[chair].owner == "Papaille" then
									fastDraw(chair)
								else
									resetTimer()
									updateTurnTimer()
									--local new = drawCard(chair, isCursed(chair, "anvil") and 2 or 1, "PASS")
									tryDraw(chair, 1)
									if mustBeEliminated(chair) then
										eliminate(chair, true)
									elseif ROUND.gameMode.insatisfaction and ROUND.turn == chair then
										ROUND.chair[chair].confuse = false
										passTurn()
										updateShadow(chair)
										batataTimer(chair)
									elseif ROUND.gameMode.satisfaction and not canPlayHand(chair) then
										ROUND.chair[chair].draw = false
										showNeedDraw(chair)
									else
										showPass(chair)
									end
									--mimicDraw(chair, isCursed(chair, "anvil") and 2 or 1)
								end
							else
								local y = 210 - (#ROUND.deck/108 * 10)
								for i=1, 10 do
									tfm.exec.displayParticle(4, 345, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
								end
								ui.removeTextArea(18)
								ROUND.chair[chair].draw = true
								showPass(chair)
							end
						end
					elseif (ROUND.chair[chair].draw or ROUND.chair[chair].played) and x > 675 and x < 775 and y > 275 and y < 295 then
						passTurn()
						ROUND.chair[chair].confuse = false
						updateShadow(chair)
						batataTimer(chair)
					end
				end
				if ROUND.chair[chair].clickDelay < os.time() and x > 430 and x < 480 and y > 200 and y < 285 and ROUND.topCard.card2 then
					if PLAYER[p].ctrl then
						local card = ROUND.topCard.card
						if RULE[card[2]] or CARD[card[2]] then
							if window.isOpened(p, "CARD") then
								window.update(p, "CARD", card)
							else
								closeAll(p, "CARD")
								window.open(p, "CARD", card)
							end
						end
					else
						showPreviousCard(p)
						ROUND.chair[chair].clickDelay = os.time() + 2000
					end
				elseif ROUND.chair[chair].clickDelay < os.time() and x > 675 and x < 775 and y > 240 and y < 260 and not ROUND.chair[ROUND.turn].action then
						ROUND.chair[chair].clickDelay = os.time() + 2000
						clickChallenge(chair)
				elseif (ROUND.chair[chair].uno == "one card" or #ROUND.chair[chair].hand == 1) and ROUND.chair[chair].uno ~= "uno" and x > 675 and x < 775 and y > 205 and y < 225 then
					sayUno(chair)
				end
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CHAIR_ALLERT"), p)
			end
		end
	end
end)