local runtime = 0
local onEvent
do
	local os_time = os.time
	local math_floor = math.floor
	local runtime_check = 0
	local events = {}
	local scheduled = {_count = 0, _pointer = 1}
	local paused = false
	local runtime_threshold = 20
	local _paused = false

	local function runScheduledEvents()
		local count, pointer = scheduled._count, scheduled._pointer

		local data
		while pointer <= count do
			data = scheduled[pointer]
			-- An event can have up to 5 arguments. In this case, this is faster than table.unpack.
			data[1](data[2], data[3], data[4], data[5], data[6])
			pointer = pointer + 1

			if runtime >= runtime_threshold then
				scheduled._count = count
				scheduled._pointer = pointer
				return false
			end
		end
		scheduled._pointer = pointer
		return true
	end

	--[[
	local function emergencyShutdown(limit_players, err)
		if limit_players then
			message = 'Game crashed :/ Please go to another room'
			tfm.exec.setRoomMaxPlayers(1)
		end
		room.requiredPlayers = 1000
		--genLobby()

		for _, event in next, events do
			event._count = 0
		end
	end]]--

	function onEvent(name, callback)
		local evt
		if events[name] then
			evt = events[name]
		else
			evt = {_count = 0}
			events[name] = evt

			-- An event can have up to 5 arguments. In this case, this is faster than `...`
			local function caller(when, a, b, c, d, e)
				for index = 1, evt._count do
					evt[index](a, b, c, d, e)

					if os_time() >= when then
						break
					end
				end
			end

			local schedule = name ~= "Loop"
			local done, result
			local event_fnc
			event_fnc = function(a, b, c, d, e)
				if ERROR then return false end
				local start = os_time()
				local this_check = math_floor(start / 4000)
				if runtime_check < this_check then
					runtime_check = this_check
					runtime = 0
					paused = false

					if not runScheduledEvents() then
						runtime_check = this_check + 1
						paused = true
						return
					end

					if _paused then
						--message = 'Resuming game...'
						--tfm.exec.chatMessage('Resuming game...')
						ui.removeTextArea(9999999999999)
						ui.removeTextArea(9999999999998)
						_paused = false
					end
				elseif paused then
					if schedule then
						scheduled._count = scheduled._count + 1
						scheduled[scheduled._count] = {event_fnc, a, b, c, d, e}
					end
					return
				end

				done, result = pcall(caller, start + runtime_threshold - runtime, a, b, c, d, e)
				if not done then
					--TFM.chatMessage(result)

					return stopScript(result, name, a, b, c, d, e)
				end

				runtime = runtime + (os_time() - start)

				if runtime >= runtime_threshold then
					if not _paused then
						--message = 'Pausing game...'
						--tfm.exec.chatMessage('Pausing game...')
						ui.addTextArea(9999999999999, "", nil, 0, 0, 800, 400, nil, nil, 0.4, true)
						for i, v in pairs(PLAYER) do
							ui.addTextArea(9999999999998, "<p align='center'><font size='20px'>\n<j>"..translate(i, "PROCESSING"), i, 0, 0, 800, nil, nil, nil, 0.7, true)
						end
					end

					runtime_check = this_check + 1
					paused = true
					_paused = true
					scheduled._count = 0
					scheduled._pointer = 1
				end
			end

			_G["event" .. name] = event_fnc
		end

		evt._count = evt._count + 1
		evt[evt._count] = callback
	end
end