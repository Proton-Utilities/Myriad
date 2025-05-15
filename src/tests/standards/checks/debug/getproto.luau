--!nocheck
--!nolint

return function()
	if not getfenv(0).debug or not getfenv(0).debug.getproto then
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
	
	local assumedProto = debug.getproto(originalFunction, 1, true)[1]

	if originalFunction() ~= assumedProto then
		return {
			status = 500,
			message = "Actual prototype dosen't match assumed prototype"
		}
	elseif assumedProto() ~= "MYRI" then
		return {
			status = 500,
			message = "Unexpected value of assumed prototype"
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getproto"
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
