--!nocheck
--!nolint

return function()
	if not getfenv(0).rconsoleclear then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
