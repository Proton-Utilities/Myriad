--// Rewrite soon

local __G = getgenv()

local __watchStack = {}

if __G._REDIRECTRESET then
	__G._REDIRECTRESET()
	__G._REDIRECTRESET = nil
end

local __originalPrint = print
local __originalWarn = warn
local __originalError = error

__G.debugger = {}
__G._DEBUG_PAUSED = false
__G._HALTED_THREAD = nil

__G.print = function(...)
	local args = { ... }
	local msg = ""
	for i, v in ipairs(args) do
		msg = msg .. tostring(v) .. (i < #args and " " or "")
	end

	if __G.WS_SEND then
		__G.WS_SEND({ type = "LOG", msg = msg, level = "info" })
	end

	return __originalPrint(...)
end

__G.warn = function(...)
	local msg = table.concat({ ... }, " ")

	if __G.WS_SEND then
		__G.WS_SEND({ type = "LOG", msg = msg, level = "warn" })
	end

	return __originalWarn(...)
end

__G.error = function(...)
	local msg = table.concat({ ... }, " ")

	if __G.WS_SEND then
		__G.WS_SEND({ type = "LOG", msg = msg, level = "error" })
	end

	return __originalError(...)
end

__G._REDIRECTRESET = function()
	getgenv().print = __originalPrint
	getgenv().warn = __originalWarn
	getgenv().error = __originalError
	getgenv().WS_SEND = nil
end

local function __serialize(v)
	local s, result = pcall(function()
		if typeof(v) == "table" then
			return game.HttpService:JSONEncode(v)
		end
		return tostring(v)
	end)
	if s then
		return result
	else
		return "<Unserializable: " .. tostring(v) .. ">"
	end
end

local function __msgRecv(messageJSON)
	local success, data = pcall(game.HttpService.JSONDecode, game.HttpService, messageJSON)
	if not success then
		return
	end

	if data.type == "EVAL" then
		local func, compileError = loadstring(data.code)
		if not func then
			if __G.WS_SEND then
				__G.WS_SEND({ type = "ERROR", msg = "Syntax Error: " .. tostring(compileError) })
			end
			return
		end

		local newenv = {}

		setmetatable(newenv, {
			__index = function(self, key)
				if __watchStack[key] then
					return __watchStack[key]()
				end

				return getgenv()[key]
			end,

			__newindex = function(self, key, value)
				if __watchStack[key] then
					__watchStack[key](value)
					return
				end

				getgenv()[key] = value
			end,
		})

		setfenv(func, newenv)
		local runSuccess, runResult = pcall(func)

		if __G.WS_SEND then
			if runSuccess then
				__G.WS_SEND({ type = "EVAL_RESULT", id = data.id, result = __serialize(runResult) })
			else
				__G.WS_SEND({ type = "ERROR", msg = "Runtime Error: " .. tostring(runResult) })
			end
		end
	elseif data.type == "RESUME" then
		if __G._HALTED_THREAD and coroutine.status(__G._HALTED_THREAD) == "suspended" then
			__G._DEBUG_PAUSED = false
			local threadToResume = __G._HALTED_THREAD
			__G._HALTED_THREAD = nil
			coroutine.resume(threadToResume)
		end
	end
end

function debugger.halt(conditional: boolean?)
	if conditional == false or not __G.WS_SEND or __G._DEBUG_PAUSED then
		return
	end

	local thread = coroutine.running()
	if not thread then
		warn("debugger.halt failed: thread not found")
		return
	end

	__G._HALTED_THREAD = thread
	__G._DEBUG_PAUSED = true

	local flattenedWatchStack = {}
	for var, get in pairs(__watchStack) do
		flattenedWatchStack[var] = get()
	end

	__G.WS_SEND({ type = "HALT", watchStack = __serialize(flattenedWatchStack) })

	while __G._DEBUG_PAUSED do
		coroutine.yield()
	end
end

function debugger.watch(name: string, handler: (set: any?) -> ())
	__watchStack[name] = handler
end

function debugger.watchBatch(vars: { [string]: (set: any?) -> () })
	for var, set in pairs(vars) do
		__watchStack[var] = set
	end
end

function debugger.check(current, newValue)
	if newValue ~= nil then
		return newValue
	end
	return current
end

debugger.watchStack = __watchStack

if WebSocket then
	local s, ws = pcall(function()
		return WebSocket.connect("ws://localhost:3000")
	end)

	if s and ws then
		__G.WS_SEND = function(payload)
			ws:Send(game:GetService("HttpService"):JSONEncode(payload))
		end
		ws.OnMessage:Connect(__msgRecv)
		print("Connected to Debugger")
	else
		warn("Handler failed to connect to debugger.")
	end
end
