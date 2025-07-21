--!nocheck
--!nolint

return function()
	if not checkcaller then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not hookmetamethod then
		return {
			status = 401,
			message = "Dependency 'hookmetamethod' missing",
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

	tostring(game)

	task.wait(0.1)

	hookmetamethod(game, "__namecall", original)

	if callerFromThread ~= true then
		return {
			status = 500,
			message = "Returned false in executor thread",
		}
	elseif fromHook ~= false then
		return {
			status = 500,
			message = "Did not return false in a hook",
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
		message = "Passed",
	}
end