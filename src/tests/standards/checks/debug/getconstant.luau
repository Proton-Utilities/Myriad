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

	local constOrder = {
		[1] = "print",

		[3] = "A",
		[4] = "tostring",

		[6] = "Date",
		[7] = "now"
	}

	for i, v in ipairs(constOrder) do
		local const = debug.getconstant(originalFunction, i)
		if const ~= v then
			return {
				status = 500,
				message = `Constant at {i} should be: {v}. Got: {const}`,
			}
		end
	end

	local invalidIndexSuccess, returnedMsg = pcall(debug.getconstant, originalFunction, 9)

	if not invalidIndexSuccess then
		return {
			status = 500,
			message = "Should pass nil instead of errroing for invalid indexes",
		}
	elseif returnedMsg then
		return {
			status = 500,
			message = "Constant 9 shouldn't exist",
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
