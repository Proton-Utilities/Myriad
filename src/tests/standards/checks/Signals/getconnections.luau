--!nocheck
--!nolint

return function()
	if type(getconnections) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local Event = Instance.new("BindableEvent")

	local called = false
	local conn = Event.Event:Connect(function() 
		called = true
	end)

	local s, connections = pcall(function()
		return getconnections(Event.Event)
	end)

	if not s then
		conn:Disconnect()
		return {
			status = 0,
			message = `Ambiguous error: {connections}`,
		}
	end

	if type(connections) ~= "table" then
		conn:Disconnect()
		return {
			status = 500,
			message = "Return type is not a table",
		}
	end

	if #connections ~= 1 then
		conn:Disconnect()
		return {
			status = 500,
			message = `Expected 1 connection but found {#connections}`,
		}
	end

	local connObj = connections[1]

	-- Properties
	local checks = {"Enabled", "ForeignState", "LuaConnection", "Function", "Thread", "Fire", "Defer", "Disconnect", "Disable", "Enable"}
	for _, prop in ipairs(checks) do
		local ps, val = pcall(function()
			return connObj[prop]
		end)
		if not ps or val == nil then
			conn:Disconnect()
			return {
				status = 500,
				message = `ConnectionProxy missing property: {prop}`,
			}
		end
	end

	-- ConnectionProxy
	local fs, fe = pcall(function()
		connObj:Fire()
	end)
	
	task.wait()

	if not fs then
		conn:Disconnect()
		return {
			status = 500,
			message = `Errored calling ConnectionProxy:Fire() - {fe}`,
		}
	end

	if not called then
		conn:Disconnect()
		return {
			status = 500,
			message = "Handler was not called when invoking ConnectionProxy:Fire()",
		}
	end

	called = false

	-- Disable
	local ds, de = pcall(function()
		connObj:Disable()
	end)

	if not ds then
		conn:Disconnect()
		return {
			status = 500,
			message = `Errored calling ConnectionProxy:Disable() - {de}`,
		}
	end

	if connObj.Enabled ~= false then
		conn:Disconnect()
		return {
			status = 500,
			message = "Enabled property not set to false after calling Disable()",
		}
	end

	Event:Fire()
	task.wait()
	if called then
		conn:Disconnect()
		return {
			status = 500,
			message = "Handler was called after being disabled",
		}
	end

	-- Enable
	local es, ee = pcall(function()
		connObj:Enable()
	end)

	if not es then
		conn:Disconnect()
		return {
			status = 500,
			message = `Errored calling ConnectionProxy:Enable() - {ee}`,
		}
	end

	if connObj.Enabled ~= true then
		conn:Disconnect()
		return {
			status = 500,
			message = "Enabled property not set to true after calling Enable()",
		}
	end

	Event:Fire()
	task.wait()
	if not called then
		conn:Disconnect()
		return {
			status = 500,
			message = "Handler was not called after being re-enabled",
		}
	end

	-- Disconnect
	local discs, disce = pcall(function()
		connObj:Disconnect()
	end)

	if not discs then
		return {
			status = 500,
			message = `Errored calling ConnectionProxy:Disconnect() - {disce}`,
		}
	end
	
	if connObj.Enabled ~= false and conn.Connected ~= false then
		return {
			status = 500,
			message = "Connection did not successfully disconnect when invoking ConnectionProxy:Disconnect()",
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
