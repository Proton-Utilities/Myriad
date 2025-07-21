--!nocheck
--!nolint

return function()
	local indexedDcmpScript, dcmp = pcall(function()
		return game.ReplicatedFirst.decompmeplssss
	end)

	if not decompile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedDcmpScript then
		return {
			status = 401,
			message = "Testing dependency 'ReplicatedFirst.decompmeplssss' not found.",
		}
	end

	--// Functionality test
	local function checkPatterns(source, patterns)
		local missing = {}
		for _, pattern in ipairs(patterns) do
			if not source:find(pattern, 1, true) then
				table.insert(missing, pattern)
			end
		end

		if #missing > 0 then
			return false, missing
		end

		return true
	end

	local dcmpDecompiled = decompile(dcmp)

	if typeof(dcmpDecompiled) ~= "string" then
		return {
			status = 500,
			message = "Decompiled script isn't a string",
		}
	elseif #dcmpDecompiled <= 0 then
		return {
			status = 500,
			message = "Decompiled script didn't return anything",
		}
	end

	local passed, missing = checkPatterns(dcmpDecompiled, {
		"truthy",
		"falsey",
		"123",
		"456",
		"TableWeirdness",
		"func",
		"inline-fn",
		"loopFn",
		"nil-check",
		"true-check",
		"fallback",
		"setmetatable",
		"__index",
		"secret",
		"found",
		"MethodStyle",
	})

	if not passed then
		return {
			status = 500,
			message = "Decompiled script missing expected strings: " .. table.concat(missing, ", "),
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
