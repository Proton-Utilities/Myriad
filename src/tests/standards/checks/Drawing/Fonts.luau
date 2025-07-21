--!nocheck
--!nolint

return function()
	if not Drawing or not Drawing.Fonts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	if not Drawing.Fonts["UI"] then
		return {
			status = 500,
			message = "UI font not found",
		}
	elseif not Drawing.Fonts["System"] then
		return {
			status = 500,
			message = "System font not found",
		}
	elseif not Drawing.Fonts["Plex"] then
		return {
			status = 500,
			message = "Plex font not found",
		}
	elseif not Drawing.Fonts["Monospace"] then
		return {
			status = 500,
			message = "Monospace font not found",
		}
	elseif Drawing.Fonts["UI"] ~= 0 then
		return {
			status = 500,
			message = "UI font isn't ID 0",
		}
	elseif Drawing.Fonts["System"] ~= 1 then
		return {
			status = 500,
			message = "System font isn't ID 1",
		}
	elseif Drawing.Fonts["Plex"] ~= 2 then
		return {
			status = 500,
			message = "Plex font isn't ID 2",
		}
	elseif Drawing.Fonts["Monospace"] ~= 3 then
		return {
			status = 500,
			message = "Monospace font isn't ID 3",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
