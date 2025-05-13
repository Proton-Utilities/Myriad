--!nocheck
--!nolint

return function()
	if not getfenv(0).checkcaller then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local callerFromThread = checkcaller()

	local fromHook
	local original
	original = hookmetamethod(game, "__namecall", function(...)
		if fromHook == nil then
			fromHook = checkcaller()
		end
		return original(...)
	end)

	task.defer(function()
		local _ = game.Name
	end)

	task.wait()

	hookmetamethod(game, "__namecall", original)

	if callerFromThread ~= true then
		return {
			status = 500,
			message = "checkcaller() returned false in executor thread",
		}
	elseif fromHook ~= false then
		return {
			status = 500,
			message = "checkcaller() did not return false in a hook",
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