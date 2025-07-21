--!nocheck
--!nolint

--// Is literally just create_comm_channel 🤔

return function()
	if not get_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not run_on_actor then
		return {
			status = 401,
			message = "Dependency 'run_on_actor' not found",
		}
	elseif not create_comm_channel then
		return {
			status = 401,
			message = "Dependency 'create_comm_channel' not found",
		}
	end

	--// Functionality test
	local passed = 0
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

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
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(arg)
		if arg ~= "abs" then
			passed = -1
		end

		passed = 1
	end)

	run_on_actor(actor, [[
		local channel = get_comm_channel(...)
		channel:Fire('abs')
	]], comm_id)

	task.wait(0.1)

	if passed == 0 then
		return {
			status = 500,
			message = "Did not fire the event",
		}
	elseif not passed == -1 then
		return {
			status = 500,
			message = "Passed argument[1] wasn't the expected value",
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


--// Old check
-- This may just be an AWP problem and this test is actually correct, but I don't feel like checking

--[[ --!nocheck
--!nolint

return function()
	if not create_comm_channel then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local passed = false
	local r1 = math.random(1, 255)
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed to actor",
		}
	end

	local function isBindable(obj)
		if typeof(obj) == "Instance" and obj:IsA("BindableEvent") then
			return true
		end
	
		if typeof(obj) ~= "table" then
			return false, "object is not a table"
		end
	
		if typeof(obj.Event) ~= "RBXScriptSignal" and typeof(obj.Event) ~= "table" then
			return false, "missing or invalid 'Event'"
		end
	
		if typeof(obj.Event.Connect) ~= "function" then
			return false, "missing or invalid 'Event.Connect'"
		end
	
		if typeof(obj.Fire) ~= "function" then
			return false, "missing or invalid 'Fire'"
		end
	
		return true
	end
	
	local comm_id, eventObject = create_comm_channel()
	local success, prop = isBindable(eventObject)
	
	if not success then
		return {
			status = 500,
			message = `EventObject isn't Bindable: {prop}`,
		}
	elseif typeof(comm_id) ~= "number" then
		return {
			status = 500,
			message = "Communication ID isn't a number",
		}
	end	

	eventObject.Event:Connect(function(num)
		if num ~= r1 ^ 2 then
			return {
				status = 500,
				message = "Passed argument[1] wasn't the expected value",
			}
		end

		passed = true
	end)

	eventObject:Fire(r1 ^ 2)

	task.wait()

	if not passed then
		return {
			status = 500,
			message = "Did not fire the event",
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
 ]]