--!nocheck
--!nolint

return function()
	if not crypt or not crypt.random then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local maxLimSuccess, maxLimMessage = pcall(function()
		return crypt.random(512)
	end)
	local minLimSuccess, minLimMessage = pcall(function()
		return crypt.random(-1)
	end)
	local baseSuccess, baseMessage = pcall(function()
		return crypt.random(64)
	end)

	if not baseSuccess then
		return {
			status = 0,
			message = "Failed: " .. tostring(baseMessage),
		}
	elseif minLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed -1, should have failed.",
		}
	elseif not maxLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed 512, should have passed.",
		}
	elseif #baseMessage ~= 64 then
		return {
			status = 500,
			message = "Len mismatch. Expected 64, got: " .. tostring(#baseMessage),
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
