--!nocheck
--!nolint

return function()
	if not debug or not debug.getconstant then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local pFlag, pI, pV = false

	local function originalFunction()
		local _1 = 2
		local _2 = "A"

		print(_1)
		tostring(_2)

		Date.now()
	end

	local constOrder = { -- Optimization levels make this essentially useless. So we instead pass with inconsistency warnings
		[1] = "print",

		[3] = "A",
		[4] = "tostring",

		[6] = "Date",
		[7] = "now",
	}

	for i, v in ipairs(constOrder) do
		local const = debug.getconstant(originalFunction, i)
		if const ~= v then
			pFlag = true
			pV = v
			pI = i
		end

		constOrder[i] = const
	end

	local invalidIndexSuccess, returnedMsg = pcall(debug.getconstant, originalFunction, 20)

	if not invalidIndexSuccess then
		return {
			status = 500,
			message = "Should not error when retrieving Out-of-bounds indexes. Pass nil or return nothing instead.",
		}
	elseif returnedMsg then
		return {
			status = 500,
			message = "Something was somehow returned when attempting to retrieve an out-of-bounds index (20).",
		}
	elseif pcall(debug.getconstant, print, 1) then
		return {
			status = 500,
			message = "Should error with C closures",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"getconstant",
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
			message = `Passed with inconsistency:  Constant at {pI} should be: {pV}. Got: {constOrder[pI]} (Check your optimization level)`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
