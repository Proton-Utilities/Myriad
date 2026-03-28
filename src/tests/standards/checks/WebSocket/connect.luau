--!nocheck
--!nolint

return function()
	if not WebSocket or not WebSocket.connect then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local socket = WebSocket.connect("wss://echo.websocket.org/")
	if not (type(socket) == "table" or type(socket) == "userdata") then
		return {
			status = 500,
			message = "Didn't give a table | userdata",
		}
	end

	for property, expected in pairs({
		-- prop name, type(s)[subtype(s), tableProp]
		["OnClose"] = { methods = { "Connect", "Once", "Wait" } },
		["OnMessage"] = { methods = { "Connect", "Once", "Wait" } },
		["Send"] = "function",
		["Close"] = "function",
	}) do
		local success, value = pcall(function()
			return socket[property]
		end)

		if not success or value == nil then
			return {
				status = 500,
				message = `WebSocketObject is missing: {property}`,
			}
		end

		if type(expected) == "table" and expected.methods then
			for _, methodName in ipairs(expected.methods) do
				local ok, method = pcall(function()
					return value[methodName]
				end)

				if not ok or type(method) ~= "function" then
					return {
						status = 500,
						message = `WebSocketObject.{property}.{methodName} is not callable`,
					}
				end
			end
		else
			local expectedType = typeof(expected) == "table" and expected[1] or expected
			if typeof(value) ~= expectedType then
				return {
					status = 500,
					message = `WebSocketObject.{property} is not a {expectedType} (got {typeof(value)})`,
				}
			end
		end
	end

	local receivedTextEcho = false
	local receivedBinaryEcho = false
	local closedFired = false
	
	socket.OnMessage:Connect(function(msg)
		if msg == "myriad_text_test" then
			receivedTextEcho = true
		elseif msg == "\xFF\xFF" then
			receivedBinaryEcho = true
		end
	end)

	socket.OnClose:Connect(function()
		closedFired = true
	end)

	local sendTextSuccess, sendTextErr = pcall(function()
		socket:Send("myriad_text_test")
	end)

	if not sendTextSuccess then
		pcall(function() socket:Close() end)
		return {
			status = 500,
			message = `WebSocket:Send failed with plaintext: {sendTextErr}`,
		}
	end

	local sendBinSuccess, sendBinErr = pcall(function()
		socket:Send("\xFF\xFF", true)
	end)

	if not sendBinSuccess then
		pcall(function() socket:Close() end)
		return {
			status = 500,
			message = `WebSocket:Send failed with is_binary enabled: {sendBinErr}`,
		}
	end

	local timeout = os.clock() + 3
	while (not receivedTextEcho or not receivedBinaryEcho) and os.clock() < timeout do
		task.wait(0.1)
	end

	pcall(function() socket:Close() end)

	if not receivedTextEcho then
		return {
			status = 500,
			message = "Did not receive standard text echo. Plaintext support might be broken.",
		}
	end

	if not receivedBinaryEcho then
		return {
			status = 500,
			message = "Did not receive binary echo. Executor likely sent data as plaintext, which fails UTF-8 validation and drops.",
		}
	end

	timeout = os.clock() + 2
	while not closedFired and os.clock() < timeout do
		task.wait(0.1)
	end

	if not closedFired then
		return {
			status = 500,
			message = "OnClose event did not fire after calling socket:Close().",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"websocket.connect",
	})

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
