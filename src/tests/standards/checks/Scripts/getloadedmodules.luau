--!nocheck
--!nolint

return function()
	local indexedModule, module = pcall(function() return game.Players.LocalPlayer.Character.Animate end)
	if not getfenv(0).getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedModule then
		return {
			status = 401,
			message = "Testing dependency 'PlayerModule' not found. Try testing on 'a literal baseplate'",
		}
	end

	local loadedModule = require(module)
	local unloadedModule = Instance.new("ModuleScript")

	local loadedModules = getloadedmodules()
	if not table.find(loadedModules, module) then
		return {
			status = 500,
			message = "Loaded module not found in returned table",
		}
	elseif table.find(loadedModules, unloadedModule) then
		return {
			status = 500,
			message = "Unloaded module found in returned table",
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
		message = `Passed`,
	}
end
