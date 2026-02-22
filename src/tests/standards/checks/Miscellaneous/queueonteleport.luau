--!nocheck
--!nolint

return function()
	if not queueonteleport then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"queue_on_teleport"
	})

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
