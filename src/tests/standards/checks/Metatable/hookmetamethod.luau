--!nocheck
--!nolint

return function()
	if not getfenv(0).hookmetamethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local hooked = false
	local originalCall

	originalCall = hookmetamethod(game, "__namecall", function( ...)
		hooked = true

		return originalCall(...)
	end)

	game:GetService("RunService").Heartbeat:Wait()

	if not hooked then
		return {
			status = 500,
			message = "Failed to hook __namecall metamethod",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
