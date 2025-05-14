--!nocheck
--!nolint

return function()
	if not getfenv(0).restorefunction then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).hookfunction then
		return {
			status = 401,
			message = "'hookfunction' needed to test this",
		}
	end

	local function originalFunc1()
		return 1
	end

	local function1 = originalFunc1

	local function function2()
		return 2
	end

	if function1() ~= 1 then
		return {
			status = 500,
			message = "This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
		}
	end
	
	local original = hookfunction(function1, function2)

	if function1() ~= 2 then
		return {
			status = 500,
			message = "Hooked function did not return the expected value",
		}
	elseif original() ~= 1 then
		return {
			status = 500,
			message = "Old function did not return the expected value",
		}
	end

	restorefunction(function1)

	if function1() ~= 1 then
		hookfunction(function1, original)
		return {
			status = 500,
			message = "Restored function did not return the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"restorefunc",
	})

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
