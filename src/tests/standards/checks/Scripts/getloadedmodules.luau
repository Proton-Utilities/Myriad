--!nocheck
--!nolint

return function()
	if not getfenv(0).getloadedmodules then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local module = game:GetService("CorePackages").InGameServices.MouseIconOverrideService
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

	return {
		status = 200,
		message = `Passed`,
	}
end
