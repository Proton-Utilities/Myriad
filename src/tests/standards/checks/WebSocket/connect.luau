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

	if result then
		return result
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
