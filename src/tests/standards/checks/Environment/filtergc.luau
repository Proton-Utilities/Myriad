--!nocheck
--!nolint

return function()
	if not getfenv(0).filtergc then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local upvalue = "MYRIAD"
	local function originalFunction()
		print("MYRIAD", upvalue)
	end

	local originalTable = setmetatable({
		MYRIAD = "MYRI",
	}, {
		__index = function() end
	})

	task.wait(0.1)

	local foundFunc = filtergc("function", {
		Constants = { "MYRIAD" },
		Upvalues = { "MYRIAD" },
		IgnoreExecutor = false,
	}, true)

	local foundTable = filtergc("table", {
		KeyValuePairs = { MYRIAD = "MYRI" },
		Metatable = getmetatable(originalTable),
	}, true)

	if foundFunc ~= originalFunction then
		return {
			status = 500,
			message = "filtergc failed to retrieve the original function",
		}
	elseif foundTable ~= originalTable then
		return {
			status = 500,
			message = "filtergc failed to retrieve the original table",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

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
