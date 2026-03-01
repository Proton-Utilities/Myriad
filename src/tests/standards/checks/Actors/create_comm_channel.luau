--!nocheck
--!nolint

return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not run_on_actor then
		return {
			status = 401,
			message = "Dependency 'run_on_actor' not found",
		}
	elseif not get_comm_channel then
		return {
			status = 401,
			message = "Dependency 'get_comm_channel' not found",
		}
	end

	--// Functionality test
	local passed = 0
	local actor = game.Players.LocalPlayer.PlayerScripts:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to find actor",
		}
	end

	local comm_id, eventObject = create_comm_channel()

	if not eventObject then
		return {
			status = 500,
			message = `EventObject dosen't exist`,
		}
	elseif type(comm_id) ~= "number" or math.floor(comm_id) ~= comm_id then
		return {
			status = 500,
			message = "Communication ID isn't a int number",
		}
	elseif not eventObject.Event then
		return {
			status = 500,
			message = "EventObject has no .Event property",
		}
	elseif type(eventObject.Fire) ~= "function" then
		return {
			status = 500,
			message = "EventObject has no .Fire Function",
		}
	elseif get_comm_channel(comm_id) ~= eventObject then
		return {
			status = 500,
			message = "It was possible to create it, but get_comm_channel does not return the same EventObject",
		}
	end
	
	local signalMethods = {"Connect", "Once", "Wait"}
	
	for _, method in signalMethods do
		if not eventObject.Event[method] then
			return {
				status = 500,
				message = `.Event does not contain the {method} method`,
			}
		end
	end
	
	local randomString = ""
	for _ = 1, 8 do
		randomString ..= string.char(math.random(48, 90))
	end
	
	local onceReceivedArgs, waitReceivedArgs
	task.spawn(function()
		waitReceivedArgs = table.pack(eventObject.Event:Wait())
	end)

	eventObject.Event:Once(function(...)
		onceReceivedArgs = table.pack(...)
	end)

	run_on_actor(actor, [[
		local channel = get_comm_channel(]] .. comm_id .. [[)
		channel:Fire("]] .. randomString .. [[", game, nil)
	]])

	task.wait(0.1)
	
	if type(onceReceivedArgs) ~= "table" then
		return {
			status = 500,
			message = "EventObject did not run an :Once",
		}
	elseif type(waitReceivedArgs) ~= "table" then
		return {
			status = 500,
			message = "EventObject did not run an :Wait",
		}
	end

	if onceReceivedArgs[1] ~= randomString or not onceReceivedArgs[2] then
		return {
			status = 500,
			message = "The :Once was executed but returned unexpected values",
		}
	elseif onceReceivedArgs[2] ~= game then
		return {
			status = 500,
			message = "The :Once was executed, but the xrefs wasn't transformed to their value in the Original State",
		}
	elseif onceReceivedArgs[3] ~= nil or onceReceivedArgs.n ~= 3 then
		return {
			status = 500,
			message = `Does not provide all args in an :Once`,
		}
	end

	if waitReceivedArgs[1] ~= randomString or not waitReceivedArgs[2] then
		return {
			status = 500,
			message = "The :Wait was executed but returned unexpected values",
		}
	elseif waitReceivedArgs[2] ~= game then
		return {
			status = 500,
			message = "The :Wait was executed, but the xrefs wasn't transformed to their value in the Original State",
		}
	elseif waitReceivedArgs[3] ~= nil or waitReceivedArgs.n ~= 3 then
		return {
			status = 500,
			message = `Does not provide all args in an :Wait`,
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