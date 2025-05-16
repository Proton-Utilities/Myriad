--!nocheck
--!nolint

return function()
	if not getfenv(0).getscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local localScript = Instance.new("LocalScript")
	local moduleScript = Instance.new("ModuleScript")
	local serverScript = Instance.new("Script")
	local clientRunContextScript = Instance.new("Script")
	clientRunContextScript.RunContext = Enum.RunContext.Client
	local scripts = getscripts()

	if not table.find(scripts, localScript) then
		return {
			status = 500,
			message = "LocalScript not found in returned table",
		}
	elseif not table.find(scripts, moduleScript) then
		return {
			status = 500,
			message = "ModuleScript not found in returned table",
		}
	elseif not table.find(scripts, clientRunContextScript) then
		return {
			status = 500,
			message = "ServerScript w/ client runcontext not found in returned table",
		}
	elseif table.find(scripts, serverScript) then
		return {
			status = 500,
			message = "ServerScript found in returned table",
		}
	end

	--// Alias test
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
