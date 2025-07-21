--!nocheck
--!nolint

return function()
	if not clonefunction then
		return {
			status = 400,
			message = "Global not found",
		}
	end


	local function originalFunction()
		return 1
	end
	local clonedFunction = clonefunction(originalFunction)

	if clonedFunction == originalFunction then
		return {
			status = 500,
			message = "Cloned function is the same as the original",
		}
	elseif clonedFunction() ~= 1 then
		return {
			status = 500,
			message = "Cloned function behavior mismatch",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
