--!nocheck
--!nolint

return function()
	if type(Signal) ~= "table" then
		return {
			status = 400,
			message = "Global not found",
		}
	end
	
	if type(Signal.new) ~= "function" then
		return {
			status = 400,
			message = "Signal.new is not a function",
		}
	end

	-- Signal.new
	local success, sig = pcall(function()
		return Signal.new()
	end)

	if not success or (type(sig) ~= "table" and type(sig) ~= "userdata") then
		return {
			status = 500,
			message = "No valid Signal object was created by Signal.new()",
		}
	end

	-- Signal properties
	for _, method in ipairs({"Connect", "Once", "Wait", "Fire"}) do
		local ok, val = pcall(function()
			return sig[method]
		end)
		if not ok or type(val) ~= "function" then
			return {
				status = 500,
				message = `Signal object is missing method: {method}`,
			}
		end
	end

	-- Connect and Fire
	local fired = false
	local firedArgs = nil
	local conn
	local ok, err = pcall(function()
		conn = sig:Connect(function(...)
			fired = true
			firedArgs = {...}
		end)
		sig:Fire("test1", 123)
	end)

	if not ok then
		return {
			status = 500,
			message = `Error while testing Connect/Fire: {err}`,
		}
	end

	if not fired then
		return {
			status = 500,
			message = "Signal:Connect handler was not called when Signal:Fire was executed",
		}
	end

	if not firedArgs or type(firedArgs) ~= "table" or firedArgs[1] ~= "test1" or firedArgs[2] ~= 123 then
		return {
			status = 500,
			message = "Signal:Fire did not pass correct arguments to Signal:Connect handler",
		}
	end

	-- Connection
	if type(conn) ~= "table" and type(conn) ~= "userdata" then
		return {
			status = 500,
			message = "Signal:Connect did not return a Connection object",
		}
	end

	local okDisc, valDisc = pcall(function()
		return conn.Disconnect
	end)

	if not okDisc or type(valDisc) ~= "function" then
		return {
			status = 500,
			message = "Connection object is missing method: Disconnect",
		}
	end

	-- Disconnect
	local disconnectOk, disconnectErr = pcall(function()
		conn:Disconnect()
	end)

	if not disconnectOk then
		return {
			status = 500,
			message = `Error while calling Connection:Disconnect - {disconnectErr}`,
		}
	end

	fired = false
	sig:Fire("test2")
	if fired then
		return {
			status = 500,
			message = "Signal handler was called after Connection:Disconnect",
		}
	end

	-- Once
	local onceFiredCount = 0
	local onceConn
	local okOnce, errOnce = pcall(function()
		onceConn = sig:Once(function()
			onceFiredCount += 1
		end)
		sig:Fire()
		sig:Fire()
	end)

	if not okOnce then
		return {
			status = 500,
			message = `Error while testing Signal:Once - {errOnce}`,
		}
	end

	if onceFiredCount ~= 1 then
		return {
			status = 500,
			message = `Signal:Once handler fired {onceFiredCount} times, expected 1`,
		}
	end
	
	if type(onceConn) ~= "table" and type(onceConn) ~= "userdata" then
		return {
			status = 500,
			message = "Signal:Once did not return a Connection object",
		}
	end
	
	local waitWorked = false
	local waitArgs = nil
	local waitErr
	
	task.spawn(function()
		task.wait(0.05)
		sig:Fire("wait1", "wait2")
	end)

	local successWait, a, b = pcall(function()
		return sig:Wait()
	end)
	
	if successWait then
		waitWorked = true
		waitArgs = {a, b}
	else
		waitErr = a
	end
	
	if waitErr then
		return {
			status = 500,
			message = `Error calling Signal:Wait - {waitErr}`,
		}
	end
	
	if not waitWorked then
		return {
			status = 500,
			message = "Signal:Wait did not resume after Signal:Fire",
		}
	end
	
	if not waitArgs or waitArgs[1] ~= "wait1" or waitArgs[2] ~= "wait2" then
		return {
			status = 500,
			message = "Signal:Wait did not return the correct arguments from Signal:Fire",
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
