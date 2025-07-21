--!nocheck
--!nolint

return function()
	local indexedModule, module = pcall(function() return game:GetService("StarterPlayer").StarterPlayerScripts.PlayerModule end)
	if not getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not indexedModule then
		return {
			status = 401,
			message = "Testing dependency 'PlayerModule' not found.",
		}
	end

	--// Functionality test
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
