--!nocheck
--!nolint

return function()
	if not getfenv(0).debug or not getfenv(0).debug.getprotos then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local function originalFunction()
		return function()
			return "MYRI1"
		end, function()
			return "MYRI2"
		end
	end

	local count = 0
	for index, prototype in ipairs(debug.getprotos(originalFunction)) do
		count += prototype() == (index == 1 and "MYRI1" or "MYRI2") and 1 or 0
	end

	if count ~= 2 then
		return {
			status = 500,
			message = "Didn't recieve correct prototypes, or prototypes didn't return expected values.",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getprotos",
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
