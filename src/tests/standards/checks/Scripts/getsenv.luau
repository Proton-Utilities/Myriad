--!nocheck
--!nolint

return function()
	local indexedAnimate, Animate = pcall(function()
		return game.Players.LocalPlayer.Character.Animate
	end)
	if not getsenv then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedAnimate then
		return {
			status = 401,
			message = "Testing dependency 'Animate' not found.",
		}
	end
	
	local nonRunningScript = game.Players.LocalPlayer.Character:FindFirstChild("whysodtc")
	local customENVScript = game.Players.LocalPlayer.Character:FindFirstChild("Miku!")
	
	if not nonRunningScript then
		return {
			status = 500,
			message = "Disabled script not found",
		}
	elseif not customENVScript then
		return {
			status = 500,
			message = "Custom environment script not found",
		}
	end
	
	local success, errorMessage = pcall(getsenv, nonRunningScript)
	if success or errorMessage ~= nil then
		return {
			status = 500,
			message = "Should not be able to obtain the ENV from a script that is not running",
		}
	end
	
	local success, result = pcall(getsenv, customENVScript)
	if not success or type(result) ~= "table" then
		return {
			status = 500,
			message = "The custom ENV could not be found",
		}
	else
		local KeysCount = 0
		for _ in result do
			KeysCount += 1
		end
		
		if KeysCount ~= 2 then
			return {
				status = 500,
				message = "The returned ENV has extra keys",
			}
		elseif result.Loaded ~= "MyriadLoaded" or tostring(result) ~= result.inString then
			return {
				status = 500,
				message = "The returned ENV is not the same as the one in the custom environment script",
			}
		end
	end

	--// Functionality test
	local enironment = getsenv(Animate)
	if type(enironment.onSwimming) ~= "function" then
		return {
			status = 500,
			message = "Global in test script wasn't found, or didn't return the right type",
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
