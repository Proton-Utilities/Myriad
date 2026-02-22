--!nocheck
--!nolint

return function()
	if not isfunctionhooked then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif require("@checks/Closures/hookfunction.luau")().status ~= 200 then
		return {
			status = 401,
			message = "Dependency 'hookfunction' not found, or doesn't work properly.",
		}
	end

	local function originalFunc1()
		return 1
	end

	local function1 = originalFunc1	

	if isfunctionhooked(function1) then
		return {
			status = 500,
			message = "Non-hooked function is hooked",
		}
	end
	
	local function function2()
		return 2
	end

	local original = hookfunction(function1, function2)

	if not isfunctionhooked(function1) then
		return {
			status = 500,
			message = "Hooked function is not hooked",
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
