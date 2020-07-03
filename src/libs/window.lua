window = {}
do
	local w = {}
	window.open = function(p, id, ...)
		if p and id and w[id] and not window.isOpened(p, id) then
			w[id].player[p] = w[id].player[p] or {fixed={}, dynamic={}, var={}}
			local fixed = w[id].player[p].fixed
			fixed.txt, fixed.img = w[id].open(p, w[id].player[p].var, ...)
			if w[id].update then
				local dynamic = w[id].player[p].dynamic
				dynamic.txt, dynamic.img = w[id].update(p, w[id].player[p].var, ...)
			end
			w[id].player[p].opened = true
		end
	end
	window.close = function(p, id)
		if p and id and w[id] and window.isOpened(p, id) then
			if w[id].player[p].fixed then
				for i, v in pairs(w[id].player[p].fixed.img or {}) do
					tfm.exec.removeImage(v)
				end
				for i, v in pairs(w[id].player[p].fixed.txt or {}) do
					ui.removeTextArea(v, p)
				end
			end
			if w[id].player[p].dynamic then
				for i, v in pairs(w[id].player[p].dynamic.img or {}) do
					tfm.exec.removeImage(v)
				end
				for i, v in pairs(w[id].player[p].dynamic.txt or {}) do
					ui.removeTextArea(v, p)
				end
			end
			w[id].player[p].dynamic = {}
			w[id].player[p].fixed = {}
			w[id].player[p].opened = false
		end
	end
	window.update = function(p, id, ...)
		if p and id and w[id] and window.isOpened(p, id) then
			if w[id].update then
				if w[id].player[p].dynamic then
					for i, v in pairs(w[id].player[p].dynamic.img or {}) do
						tfm.exec.removeImage(v)
					end
					for i, v in pairs(w[id].player[p].dynamic.txt or {}) do
						ui.removeTextArea(v, p)
					end
				end
				w[id].player[p].dynamic = {}
				local dynamic = w[id].player[p].dynamic
				dynamic.txt, dynamic.img = w[id].update(p, w[id].player[p].var, ...)
			else
				window.close(p, id)
				window.open(p, id, ...)
			end
		end 
	end
	window.isOpened = function(p, id)
		return w[id] and w[id].player[p] and w[id].player[p].opened
	end
	window.create = function(id, func, func2)
		if w[id] then
			for i, v in pairs(w[id].player) do
				window.close(i, id)
			end
		end
		if id and func then
			w[id] = {
				open = func,
				update = func2,
				player = {}
			}
		end
	end
	window.getVars = function(p, id)
		return w[id] and w[id].player[p] and w[id].player[p].var
	end
	closeAll = function(p, exception)
		for i, v in pairs(w) do
			if i~= exception then
				window.close(p, i)
			end
		end
	end
end