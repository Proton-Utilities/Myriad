--!nocheck
--!nolint

return function()
	if not getfenv(0).hookfunction then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function function1()
		return 1
	end

	local function function2()
		return 2
	end

	if function1() ~= 1 then
		return {
			status = 500,
			message = "This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
		}
	end

	local hookedFunction = hookfunction(function1, function2)

	if function1() ~= 2 then
		return {
			status = 500,
			message = "Hooked function did not return the expected value",
		}
	elseif hookedFunction() ~= 1 then
		return {
			status = 500,
			message = "Old function did not return the expected value",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"hookfunc",
		"replaceclosure",
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
