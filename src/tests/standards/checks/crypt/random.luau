--!nocheck
--!nolint

return function()
	if not getfenv(0).crypt or not getfenv(0).crypt.random then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local maxLimSuccess, maxLimMessage = pcall(function()
		return crypt.random(513) -- TODO: Maximum could be 1024 (on synx at least), AWP uses 512 🤔
	end)
	local minLimSuccess, minLimMessage = pcall(function()
		return crypt.random(-1)
	end)
	local baseSuccess, baseMessage = pcall(function()
		return crypt.random(64)
	end)

	if not baseSuccess then
		return {
			status = 500,
			message = "Failed: " .. tostring(baseMessage),
		}
	elseif minLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed -1, should have failed.",
		}
	elseif maxLimSuccess then
		return {
			status = 500,
			message = "Arg[1] passed 513, should have failed.",
		}
	elseif #baseMessage ~= 64 then
		return {
			status = 500,
			message = "Len mismatch. Expected 64, got: " .. tostring(#baseMessage),
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
