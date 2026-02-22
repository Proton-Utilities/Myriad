--!nocheck
--!nolint

return function()
	if type(firesignal) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local Event = Instance.new("BindableEvent")
	local fired = false
	local args = nil
	local conn = Event.Event:Connect(function(...)
		fired = true
		args = {...}
	end)

	local s, e = pcall(function()
		firesignal(Event.Event, "Hello", 123)
	end)

	task.wait()

	if not s then
		conn:Disconnect()
		return {
			status = 0,
			message = `Ambiguous error: {e}`,
		}
	end

	conn:Disconnect()

	if not fired then
		return {
			status = 500,
			message = "Signal handler did not run when fired",
		}
	end

	if type(args) ~= "table" or args[1] ~= "Hello" or args[2] ~= 123 then
		return {
			status = 500,
			message = "Arguments passed to firesignal were not received by the handler",
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
