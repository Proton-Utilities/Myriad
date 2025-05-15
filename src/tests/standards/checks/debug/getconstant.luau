--!nocheck
--!nolint

return function()
	if not getfenv(0).debug or not getfenv(0).debug.getconstant then
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

	local invalidIndexSuccess, returnedMsg = pcall(debug.getconstant, originalFunction, 8)

	if debug.getconstant(originalFunction, 1) ~= "A" then
		return {
			status = 500,
			message = "Constant 1 missing or unexpected value",
		}
	elseif debug.getconstant(originalFunction, 2) ~= "print" then
		return {
			status = 500,
			message = "Constant 2 missing or unexpected value",
		}
	elseif debug.getconstant(originalFunction, 3) ~= nil then
		return {
			status = 500,
			message = "Constant 3 should be nil",
		}
	elseif debug.getconstant(originalFunction, 4) ~= "tostring" then
		return {
			status = 500,
			message = "Constant 4 missing or unexpected value",
		}
	elseif debug.getconstant(originalFunction, 5) ~= nil then
		return {
			status = 500,
			message = "Constant 5 should be nil",
		}
	elseif debug.getconstant(originalFunction, 6) ~= "Date" then
		return {
			status = 500,
			message = "Constant 6 missing or unexpected value",
		}
	elseif debug.getconstant(originalFunction, 7) ~= "now" then
		return {
			status = 500,
			message = "Constant 7 missing or unexpected value",
		}
	elseif not invalidIndexSuccess then
		return {
			status = 500,
			message = "Should pass nil instead of errroing for invalid indexes",
		}
	elseif returnedMsg then
		return {
			status = 500,
			message = "Constant 8 shouldn't exist",
		}
	elseif pcall(debug.getconstant, print, 1) then
		return {
			status = 500,
			message = "Should error with C closures",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getconstant",
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
