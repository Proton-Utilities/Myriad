--!nocheck
--!nolint

return function()
	if not getfenv(0).getthreadidentity then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	if not typeof(getthreadidentity()) == "number" then
		return {
			status = 500,
			message = "Did not return a number",
		}
	end

	return {
		status = 200,
		message = `Passed ({executor}, {vers})`,
	}
end
