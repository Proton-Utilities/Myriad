--!nocheck
--!nolint

return function()
	if not getfenv(0).getscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local localScript = Instance.new("LocalScript")
	local moduleScript = Instance.new("ModuleScript")
	local serverScript = Instance.new("Script")
	local clientRunContextScript = Instance.new("Script")
	clientRunContextScript.RunContext = Enum.RunContext.Client

	if not table.find(getscripts(), localScript) then
		return {
			status = 500,
			message = "LocalScript not found in returned table",
		}
	elseif not table.find(getscripts(), moduleScript) then
		return {
			status = 500,
			message = "ModuleScript not found in returned table",
		}
	elseif not table.find(getscripts(), clientRunContextScript) then
		return {
			status = 500,
			message = "ServerScript w/ client runcontext not found in returned table",
		}
	elseif table.find(getscripts(), serverScript) then
		return {
			status = 500,
			message = "ServerScript found in returned table",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 500,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
