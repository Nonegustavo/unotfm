TIMER = {
	txt = {},
	img = {},
	obj = {},
	func = {}
}

function addImageTimer(u, a, x, y, t, p)
	-- função pronta pra criar imagem e definir seu timer, requer TIMER.img
	-- -- String u: URL da imagem em atelier801.com
	-- -- String a: Alvo da imagem, como em tfm.exec.addImage()
	-- -- Number x: Coordenada x da imagem
	-- -- Number y: Coordenada y da imagem
	-- -- Number t: Tempo de duração da imagem em milissegundos
	-- -- String p: Para quem será exibida a imagem, se NIL será para todos
	-- -- Return: Number (id da imagem para poder ser removida antes do timer)
	local i = tfm.exec.addImage(u, a, x, y, p)
	if i then
		TIMER.img[i] = os.time()+t
	end
	return i
end

function delImagesTimer(tt)
	-- procura imagens pra apagar, requer TIMER.img
	local apagar = {}
	for i, v in pairs(TIMER.img) do
		if tt and tt+10 < os.time() then
			break
		elseif v < os.time() then
			tfm.exec.removeImage(i)
			table.insert(apagar, i)
		end
	end
	for i=1, #apagar do
		TIMER.img[apagar[i]] = nil
	end
end

function addObjectTimer(o, x, y, a, t, vx, vy, g)
	-- função pronta pra criar um objeto e definir seu tempo
	-- -- Number o: id de tipo de objeto
	-- -- Number x: coordenada x de criação
	-- -- Number y: coordenada y de criação
	-- -- Number a: ângulo do objeto
	-- -- Number t: tempo de duração do objeto em milissegundos
	-- -- Number vx: velocidade x do objeto
	-- -- Number vy: velocidade y do objeto
	-- -- Boolean g: true se o objeto é fantasma
	-- -- Return: Number (id do objeto criado para remover manualmente)
	local i = tfm.exec.addShamanObject(o, x, y, a or 0, vx or 0, vy or 0, g)
	TIMER.obj[i] = os.time() + t
	return i
end

function delObjectTimer(tt)
	-- procura objetos pra apagar, requer TIMER.objeto
	local apagar={}
	for i, v in pairs(TIMER.obj) do
		if tt and tt+10 < os.time() then
			break
		elseif v < os.time() then
			tfm.exec.removeObject(i)
			table.insert(apagar, i)
		end
	end
	for i=1, #apagar do
		TIMER.obj[apagar[i]] = nil
	end
end

function addFunctionTimer(f, t, ...)
	-- define uma função e especifica quando deve ser executada
	-- -- Function f: função a ser executada
	-- -- Number t: tempo até ser executado
	-- -- Os próximo valores são parâmetros da função enviada
	table.insert(TIMER.func, {exec=f, time=GLOBAL_TIME+t, arg=table.pack(...)})
end

function execFunctionTimer(tt)
	-- procura por funções para executar
	local apagar={}
	for i, v in pairs(TIMER.func) do
		if tt and tt+10 < os.time() then
			break
		elseif v.time < GLOBAL_TIME then
			v.exec(table.unpack(v.arg or {}))
			table.insert(apagar, i)
		end
		--if v.time < os.time() then
		--  v.exec(table.unpack(v.arg or {}))
		--  table.insert(apagar, i)
		--end
	end
	for i=1, #apagar do
		table.remove(TIMER.func, apagar[i])
	end
end

function delTxtTimer(tt)
	-- procura textos pra apagar, requer TIMER.txt
	local apagar = {}
	for i, v in pairs(TIMER.txt) do
		if tt and tt+20 < os.time() then
			break
		elseif v.time < os.time() then
			table.insert(apagar,i)
			ui.removeTextArea(v.id, v.player)
		end
	end
	for i=1, #apagar do
		TIMER.txt[apagar[i]] = nil
	end
end