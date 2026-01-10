--!nocheck
--!nolint

return function()
	if not debug or not debug.getconstants then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local pFlag, pI, pV = false
	local p2Flag, p2I = false

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
		[7] = "now",
	}

	for i, v in ipairs(debug.getconstants(originalFunction)) do
		if not constOrder[i] then
			p2Flag = true
			p2I = i

			break
		elseif constOrder[i] ~= v then
			pFlag = true
			pI, pV = i, v

			break
		end
	end

	if pcall(debug.getconstants, print) then
		return {
			status = 500,
			message = "Should error with C closures",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"getconstants",
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	if pFlag then
		return {
			status = 200,
			message = `Passed with inconsistency: Constant at {pI} should be: {constOrder[pI]}. Got: {pV}`,
		}
	elseif p2Flag then
		return {
			status = 200,
			message = `Passed with inconsistency: {p2I} dosen't exist in expected constant order`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
