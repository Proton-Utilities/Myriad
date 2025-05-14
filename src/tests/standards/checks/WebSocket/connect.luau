--!nocheck
--!nolint

return function()
	if not getfenv(0).WebSocket or not getfenv(0).WebSocket.connect then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local socket = WebSocket.connect("ws://echo.websocket.events")
	if not (type(socket) == "table" or type(socket) == "userdata") then
		return {
			status = 500,
			message = "Didn't give a table | userdata",
		}
	end

	for property, expected in pairs({
		["OnClose"] = "RBXScriptSignal",
		["OnMessage"] = "RBXScriptSignal",
		["Send"] = "function",
		["Close"] = "function",
		["send"] = "function",
		["close"] = "function",
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

		if typeof(value) ~= expected then
			return {
				status = 500,
				message = `WebSocketObject.{property} is not a {expected} (got {typeof(value)})`,
			}
		end
	end

	if result then
		return result
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"WebSocket.Connect",
		"WebSocket.new",
		"WebSocket.New",
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
