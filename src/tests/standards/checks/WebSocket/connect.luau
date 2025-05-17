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
		-- prop name, type(s)[subtype(s), tableProp]
		["OnClose"] = {"RBXScriptSignal", {["table"] = {"Connect", "Once", "Wait"}}},
		["OnMessage"] = {"RBXScriptSignal", {["table"] = {"Connect", "Once", "Wait"}}},
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
	
		local expectedType = typeof(expected) == "table" and expected[1] or expected
		if typeof(value) ~= expectedType then
			return {
				status = 500,
				message = `WebSocketObject.{property} is not a {expectedType} (got {typeof(value)})`,
			}
		end
	
		if typeof(expected) == "table" and expected[2] and typeof(expected[2]) == "table" then
			for containerType, subProps in pairs(expected[2]) do
				if containerType == "table" and typeof(value) == "table" then
					for _, subProp in ipairs(subProps) do
						if typeof(value[subProp]) ~= "function" then
							return {
								status = 500,
								message = `WebSocketObject.{property}.{subProp} is not a function`,
							}
						end
					end
				end
			end
		end
	end
	
	if result then
		return result
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"websocket.connect",
		"WebSocket.Connect",
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
