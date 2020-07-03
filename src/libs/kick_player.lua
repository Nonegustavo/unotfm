function kickPlayer(p, normal)
	-- remover jogador de uma partida em andamento
	for i, v in pairs(ROUND.chair or {}) do
		if v.owner == p and v.mode ~= "DELETED" then
			if ROUND.turn == i and normal then
				autoPlay()
			end
			window.close(p, "CHALLENGE")
			if ROUND.turn == i and v.action then
				if v.action.name == "WILD" then
					local color = {"red", "blue", "yellow", "green"}
					paintCard(color[math.random(#color)], ROUND.turn)
				elseif v.action.name == "RULE" then
					selectRule(ROUND.turn, math.random(1,2))
				elseif v.action.name == "TRACKING" then
					if ROUND.gameMode.tracking then
						v.draw = false
						showNeedDraw(ROUND.turn)
						v.afk = false
					end
					drawCardTracking(ROUND.turn, v.action.card[math.random(3)])
				elseif v.action.name == "WISH" then
					makeWish(ROUND.turn, v.action.card[math.random(3)])
				elseif v.action.name == "TRADE" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and i~=ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeTrade(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "GIFT" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and i~=ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeGift(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "WEB" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and not v.action or i==ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeWeb(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "IMITATE" then
					emoteVerify(true)
				end
			end
			if ROUND.mode ~= "DELETED" and (ROUND.state == "PLAY" or ROUND.state == "MULLIGAN") then
				if v.outChair then
					tfm.exec.removeImage(v.outChair)
					ui.removeTextArea(15, p)
					ui.removeTextArea(16, p)
					v.outChair = nil
				end
				v.mode = "FREE"
				v.owner = ""
				updateScore(i)
				local x = v.x
				for i, w in pairs(v.imgHand) do
					tfm.exec.removeImage(w)
				end
				for i, w in pairs(v.imgShadow) do
					tfm.exec.removeImage(w)
				end
				for i, w in pairs(v.skin.img) do
					tfm.exec.removeImage(w)
				end
				ui.removeTextArea(5, p)
				ui.removeTextArea(6, p)
				ui.removeTextArea(7, p)
				ui.removeTextArea(10, p)
				ui.removeTextArea(11, p)
				ui.removeTextArea(12, p)
				ui.removeTextArea(15, p)
				ui.removeTextArea(16, p)
				ui.removeTextArea(18, p)
				ui.removeTextArea(19, p)
				system.bindMouse(p, false)
				v.skin.id = "empty"
				v.flag = "default"
				drawChair(i)
				local cont = 0
				local name = ""
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						cont = cont + 1
						name = v.owner
					end
				end
				if cont == 1 then
					endGame(name)
				end
			elseif ROUND.state == "START" and v.mode ~= "DELETED" then
				v.mode = "EMPTY"
				v.owner = ""
				v.skin.id = "empty"
				drawChair(i)
				local cont = 0
				local name = ""
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						cont = cont + 1
						name = v.owner
					end
				end
					
				if cont == 1 then
					endGame(name)
				end
			end
			PLAYER[p].chair = nil
		end
	end
end