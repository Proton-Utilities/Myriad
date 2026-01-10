--!nocheck
--!nolint

return function()
	if not debug or not debug.getproto then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		return function()
			return "MYRI"
		end
	end

	local result = debug.getproto(originalFunction, 1, true)

	if type(result) ~= "table" or not result[1] then
		return { status = 500, message = "getproto did not return proto" }
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"getproto",
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
