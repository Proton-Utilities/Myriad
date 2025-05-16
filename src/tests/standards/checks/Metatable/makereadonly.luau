--!nocheck
--!nolint

return function()
	if not getfenv(0).makereadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalTable = table.freeze{
		MYRIAD = "MYRI"
	}

	local freezeSuccess, message = pcall(function()
		originalTable.MYRIAD = "MYRIAD"
	end)
	local writeSuccess, message = pcall(function()
		makereadonly(originalTable)
		originalTable.MYRIAD = "MYRIAD"
	end)

	if freezeSuccess then
		return {
			status = 500,
			message = "Frozen table writable (???): " .. message
		}
	elseif writeSuccess then
		return {
			status = 500,
			message = "Table unwritable after readonly was disabled: " .. message
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
