--!nocheck
--!nolint

return function()
	if not getrunningscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
	local runningScript = game.Players.LocalPlayer.Character:FindFirstChild("whysoud")
	local disabledScript = game.Players.LocalPlayer.Character:FindFirstChild("whysodtc")
	local nonrunningScript = game.Players.LocalPlayer.Character:FindFirstChild("maybeisdtc")
	-- Having all of these are not neccessary, but might as well keep them (This was cloned from ./getscripts.luau)
	local localScript = Instance.new("LocalScript")
	local moduleScript = Instance.new("ModuleScript")
	local serverScript = Instance.new("Script")
	local clientRunContextScript = Instance.new("Script")
	clientRunContextScript.RunContext = Enum.RunContext.Client
	local runningScripts = getrunningscripts()

	if table.find(runningScripts, localScript) then
		return {
			status = 500,
			message = "LocalScript found in returned table",
		}
	elseif table.find(runningScripts, moduleScript) then
		return {
			status = 500,
			message = "ModuleScript found in returned table",
		}
	elseif table.find(runningScripts, clientRunContextScript) then
		return {
			status = 500,
			message = "ServerScript w/ client runcontext found in returned table",
		}
	elseif table.find(runningScripts, serverScript) then
		return {
			status = 500,
			message = "ServerScript found in returned table",
		}
	elseif table.find(runningScripts, disabledScript) then
		return {
			status = 500,
			message = "Disabled script found in returned table",
		}
	elseif table.find(runningScripts, nonrunningScript) then
		return {
			status = 500,
			message = "Non-running script found in returned table",
		}
	elseif not table.find(runningScripts, animate) or not table.find(runningScripts, runningScript) then
		return {
			status = 500,
			message = "Didn't find a running script in the returned table"
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
