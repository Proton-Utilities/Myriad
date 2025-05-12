--!nocheck
--!nolint

return function()
	if not getfenv(0).Drawing or not getfenv(0).Drawing.Fonts then
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
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
