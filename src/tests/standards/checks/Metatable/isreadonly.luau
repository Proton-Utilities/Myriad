--!nocheck
--!nolint

return function()
	if not getfenv(0).isreadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).setreadonly then
		return {
			status = 401,
			message = "Dependency 'setreadonly' not found",
		}
	end

	--// Functionality test
	local originalTable = {}

	if isreadonly(originalTable) then
		return {
			status = 500,
			message = "Writable table is assumed read-only"
		}
	end

	setreadonly(originalTable, true)

	if not isreadonly(originalTable) then
		return {
			status = 500,
			message = "Table assumed writable after being set as read-only"
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
		message = `Passed`,
	}
end
