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

	local constOrder = {
		[1] = "print",

		[3] = "A",
		[4] = "tostring",

		[6] = "Date",
		[7] = "now"
	}

	for i, v in pairs(debug.getconstants(originalFunction)) do
		if not constOrder[i] then
			return {
				status = 500,
				message = `{i} dosen't exist in expected constant order`
			}
		elseif constOrder[i] ~= v then
			return {
				status = 500,
				message = `Constant at {i} should be: {constOrder[i]}. Got: {v}`
			}
		end
	end

	if pcall(debug.getconstants, print) then
		return {
			status = 500,
			message = "Should error with C closures"
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getconstants"
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
