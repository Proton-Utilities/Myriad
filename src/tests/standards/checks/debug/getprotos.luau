--!nocheck
--!nolint

return function()
	if not debug or not debug.getprotos then
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

	local protos = debug.getprotos(originalFunction)

	if #protos ~= 2 then
		return { status = 500, message = "Incorrect proto count" }
	end

	if protos[1] == protos[2] then
		return { status = 500, message = "Protos aren't unique." }
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
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
