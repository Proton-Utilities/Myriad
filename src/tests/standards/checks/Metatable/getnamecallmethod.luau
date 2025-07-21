--!nocheck
--!nolint

return function()
	if not getnamecallmethod then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not hookmetamethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")
	local method = false
	local originalCall

	originalCall = hookmetamethod(originalPart, "__namecall", function(...)
		if not method then
			method = getnamecallmethod()
		end

		return originalCall(...)
	end)

	originalPart:Destroy()
	task.wait()

	if method ~= "Destroy" then
		return {
			status = 500,
			message = "Didn't return the correct method",
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
		message = "Passed",
	}
end
