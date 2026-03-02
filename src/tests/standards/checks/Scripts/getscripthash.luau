--!nocheck
--!nolint

return function()
	local indexed1, script1 = pcall(function() return game.Players.LocalPlayer.Character.Animate end)
	local indexed2, script2 = pcall(function() return game.Players.LocalPlayer.Character.Character.whysodtc end)
	
	if not getscripthash then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexed1 then
		return {
			status = 401,
			message = "Testing dependency 'Character.Animate' not found.",
		}
	elseif not indexed2 then
		return {
			status = 401,
			message = "Testing dependency 'Character.whysodtc' not found.",
		}
	end

	local noBytecodeScript = Instance.new("LocalScript")
	local script1Success, script1Returned = pcall(function()
		return getscripthash(script1)
	end)
	local noBytecodeSuccess, noBytecodeReturned = pcall(function()
		return getscripthash(noBytecodeScript)
	end)

	local script2Success, script2Returned = pcall(function()
		return getscripthash(script2)
	end)

	if not script1Success then
		return {
			status = 500,
			message = "Failed to get bytecode of 'Character.Animate': " .. tostring(script1Returned),
		}
	elseif not noBytecodeSuccess then
		return {
			status = 500,
			message = "Failed to get script w/ no bytecode. Errored instead of returning nothing/nil.",
		}
	elseif not script2Success then
		return {
			status = 500,
			message = "Failed to get bytecode of 'Character.whysodtc': " .. tostring(script2Returned),
		}
	elseif typeof(script1Returned) ~= "string" then
		return {
			status = 500,
			message = "Did not return a hash string",
		}
	elseif noBytecodeReturned ~= nil then
		return {
			status = 500,
			message = "A script with no bytecode returned non-nil data",
		}
	elseif script1Returned == script2Returned then
		return {
			status = 500,
			message = "Different scripts returned the same hash string",
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
		message = `Passed`,
	}
end
