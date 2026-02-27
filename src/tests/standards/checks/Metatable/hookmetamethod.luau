--!nocheck
--!nolint

return function()
	if not hookmetamethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end
	
	local RunService = game:GetService("RunService")
	
	local function getgame__index(Object)
		local __index

		xpcall(function()
			return game[{}]
		end, function()
			__index = debug.info(2, "f")
		end)
		
		return __index
	end
	
	local tempTable = {}
	local originalTable__index = function()
		return 1
	end
	
	local tableMETA = {
		__index = originalTable__index
	}
	
	setmetatable(tempTable, tableMETA)
	
	local tableHooked = false
	hookmetamethod(tempTable, "__index", function(...)
		tableHooked = true
		return 2
	end)
	
	if tempTable.MYRIAD ~= 2 then
		return {
			status = 500,
			message = "No changes have been made to the results in a table",
		}
	elseif tableMETA.__index ~= originalTable__index then
		return {
			status = 500,
			message = "__index has been replaced instead of making a hook in a table",
		}
	elseif getmetatable(tempTable) ~= tableMETA then
		return {
			status = 500,
			message = "The metatable was changed instead of doing the hook",
		}
	elseif originalTable__index() ~= 2 or tableHooked ~= true then
		return {
			status = 500,
			message = "A strange action was performed. Was the __index function not hooked?",
		}
	end

	local hooked = false
	
	local __index = getgame__index()
	if not __index then
		return {
			status = 500,
			message = "Failed to get __index",
		}
	end
	
	local originalCall
	originalCall = hookmetamethod(game, "__index", function(...)
		hooked = true

		return originalCall(...)
	end)

	local _ = RunService.Heartbeat
	
	-- Making a C->L hook and leaving it there worsens performance
	task.delay(0.1, pcall, hookmetamethod, game, "__index", originalCall)

	if getgame__index() ~= __index then
		return {
			status = 500,
			message = "__index has been replaced instead of making a hook",
		}
	end

	if not hooked then
		return {
			status = 500,
			message = "Failed to hook __index metamethod",
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