--!nocheck
--!nolint

return function()
	if not getfenv(0).cloneref then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")
	local originalService = game:GetService("CoreGui")

	if cloneref(originalPart) == originalPart then
		return {
			status = 500,
			message = `Cloned part cannot be equal to original reference`,
		}
	elseif cloneref(originalService) == originalService then
		return {
			status = 500,
			message = `Cloned service cannot be equal to original reference`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"clonereference",
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
