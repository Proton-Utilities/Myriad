--!nocheck
--!nolint

return function()
	if not getfenv(0).debug or not getfenv(0).debug.getconstants then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		local _1 = 2
		local _2 = "A"

		print(_1)
		tostring(_2)

		Date.now()
	end

	if debug.getconstants(originalFunction)[1] ~= "A" then
		return {
			status = 500,
			message = "Constant 1 missing or unexpected value"
		}
	elseif debug.getconstants(originalFunction)[2] ~= "print" then
		return {
			status = 500,
			message = "Constant 2 missing or unexpected value"
		}
	elseif debug.getconstants(originalFunction)[3] ~= nil then
		return {
			status = 500,
			message = "Constant 3 should be nil"
		}
	elseif debug.getconstants(originalFunction)[4] ~= "tostring" then
		return {
			status = 500,
			message = "Constant 4 missing or unexpected value"
		}
	elseif debug.getconstants(originalFunction)[5] ~= nil then
		return {
			status = 500,
			message = "Constant 5 should be nil"
		}
	elseif debug.getconstants(originalFunction)[6] ~= "Date" then
		return {
			status = 500,
			message = "Constant 6 missing or unexpected value"
		}
	elseif debug.getconstants(originalFunction)[7] ~= "now" then
		return {
			status = 500,
			message = "Constant 7 missing or unexpected value"
		}
	elseif pcall(debug.getconstants, print) then
		return {
			status = 500,
			message = "Should error with C closures"
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
