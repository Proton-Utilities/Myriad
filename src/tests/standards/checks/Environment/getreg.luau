--!nocheck
--!nolint

return function()
	if not getreg then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local registry = getreg()

	if type(registry) ~= "table" then
		return {
			status = 500,
			message = "Did not return a table",
		}
	end

	local foundItems = false
	for k, v in pairs(registry) do
		foundItems = true
		break
	end

	if not foundItems then
		return {
			status = 500,
			message = "Registry is empty",
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
