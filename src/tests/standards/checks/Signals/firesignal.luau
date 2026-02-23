--!nocheck
--!nolint

return function()
	if type(firesignal) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end
	
	local NoChildsService = game:GetService("SocialService")
	local BindableEv = Instance.new("BindableEvent")
	BindableEv.Name = "MYRIAD_FIRESIGNAL"

	local detectedOnceStacks = false

	local randomObject = Instance.new("TrussPart", BindableEv)
	local randomString = ""

	for _ = 1, 8 do
		randomString ..= string.char(math.random(1, 255))
	end

	randomObject.Name = randomString

	local onceRecibedArgs, waitRecibedArgs
	
	task.spawn(function()
		waitRecibedArgs = table.pack(BindableEv.Event:Wait())
	end)

	BindableEv.Event:Once(function(...)
		for StackLevel = 2, 20 do
			if debug.info(StackLevel, "f") then
				detectedOnceStacks = true
			end
		end

		local entersCount = debug.traceback():split("\n")
		if not entersCount or #entersCount > 2 then
			detectedOnceStacks = true
		end

		onceRecibedArgs = table.pack(...)
	end)

	BindableEv.Parent = NoChildsService
	
	task.wait(0.1)

	local s, e = pcall(function()
		firesignal(BindableEv.Event, randomString, randomObject, nil)
	end)
	
	local destroyEvent = function()
		if BindableEv.Parent then
			BindableEv:Destroy()
		end
	end
	
	task.delay(1, destroyEvent)

	task.wait()

	if not s then
		return {
			status = 0,
			message = `Ambiguous error: {e}`,
		}
	elseif type(onceRecibedArgs) ~= "table" then
		return {
			status = 500,
			message = "Signal handler did not run an :Once",
		}
	elseif type(waitRecibedArgs) ~= "table" then
		return {
			status = 500,
			message = "Signal handler did not run an :Wait",
		}
	end

	if onceRecibedArgs[1] ~= randomString or
		onceRecibedArgs[2] ~= randomObject or
		onceRecibedArgs[3] ~= nil or
		onceRecibedArgs.n ~= 3 then

		return {
			status = 500,
			message = "Arguments passed to firesignal with Once were not received by the handler",
		}

	elseif waitRecibedArgs[1] ~= randomString or
		waitRecibedArgs[2] ~= randomObject or
		waitRecibedArgs[3] ~= nil or
		waitRecibedArgs.n ~= 3 then

		return {
			status = 500,
			message = "Arguments passed to firesignal with Wait were not received by the handler",
		}
	elseif detectedOnceStacks then -- firesignal should obtain the function and execute it in a NEW Thread
		return {
			status = 500,
			message = "The function is being executed instead of creating a separate thread",
		}
	end

	local actorResponseTimeStart = tick()
	local actorResponse

	while not actorResponse and tick() - actorResponseTimeStart < 0.5 do
		actorResponse = randomObject:FindFirstChildWhichIsA("StringValue")
		if actorResponse then
			actorResponse = actorResponse.Value
			break
		end

		task.wait()
	end
	
	task.spawn(destroyEvent)

	--[[ ERROR_O3 EXPLANATION:
		
		> Unlike run_on_actor, this is not directed towards an exploit function, so 
		it is mandatory that all tables are cloned and that the instances 
		provide their usable xrefs in the different state.
		
		> Only in this case should you use SendMessage and BindToMessage (Or create 
		something that does the same thing).
	]]

	if not actorResponse then
		return {
			status = 500,
			message = "Our actor took too long to respond",
		}
	end

	local conditionsInfo = {
		{Prefix = "O", Function = ":Once"},
		{Prefix = "W", Function = ":Wait"}
	}

	for _, Condition in conditionsInfo do
		local Prefix = Condition.Prefix
		local Function = Condition.Function

		if actorResponse == `ERROR_{Prefix}1` then
			return {
				status = 500,
				message = `Signal handler did not run a {Function} in an actor`,
			}
		elseif actorResponse == `ERROR_{Prefix}2` then
			return {
				status = 500,
				message = `Signal handler does not provide correct args in an {Function} of an Actor`,
			}
		elseif actorResponse == `ERROR_{Prefix}3` then
			return {
				status = 500,
				message = `Signal handler does convert the {Function} xrefs in the arguments of and Actor`,
			}
		elseif actorResponse == `ERROR_{Prefix}4` then
			return {
				status = 500,
				message = `Signal handler does not provide all args in an {Function} of an Actor`,
			}
		elseif actorResponse == "ERROR_O5" then -- Exclusive to :Once because its a function
			return {
				status = 500,
				message = `The function of an Actor is being executed instead of creating a separate thread`,
			}
		end
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
