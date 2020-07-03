function moonPhase()
		-- http://jivebay.com/calculating-the-moon-phase/
		local day, month, year = tonumber(os.date("%d")), tonumber(os.date("%m")), tonumber(os.date("%Y"))

		if month < 3 then
				year = year - 1
				month = month + 12
		end
		month = month + 1

		local Y = 365.25 * year
		local M = 30.6 * month
		local daysElapsed = (Y + M + day - 694039.09) / 29.5305882
		daysElapsed = math.floor(((daysElapsed % 1) * 8) + .5)

		return bit32.band(daysElapsed, 7) + 1
		-- 4 = lua cheia
end