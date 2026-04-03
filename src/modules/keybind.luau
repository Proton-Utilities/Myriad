--!native

--// Imports
local signal = require("@packages/signal")
local valueStateModule = require("@modules/valueState")

--// Types
type Signal<T...> = signal.Signal<T...>
type ValueState<T> = valueStateModule.ValueState<T>
type Options = { sink: boolean?, assert: (boolean | () -> boolean | { boolean | () -> boolean })? }
type Keys = { string | Enum.KeyCode }

--// References
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")

--// Constants
local ALIASES: { [string]: { Enum.KeyCode } } = {
	Control = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl },
	Shift = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift },
	Alt = { Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt },
}

local REVERSE_ALIASES: { [Enum.KeyCode]: string } = {}
for alias, codes in ALIASES do
	for _, code in codes do
		REVERSE_ALIASES[code] = alias
	end
end

local MODIFIER_KEYS: { [Enum.KeyCode]: boolean } = {
	[Enum.KeyCode.LeftControl] = true,
	[Enum.KeyCode.RightControl] = true,
	[Enum.KeyCode.LeftShift] = true,
	[Enum.KeyCode.RightShift] = true,
	[Enum.KeyCode.LeftAlt] = true,
	[Enum.KeyCode.RightAlt] = true,
}

local SINK_PRIORITY = Enum.ContextActionPriority.High.Value

--// State
local pressOrder: { Enum.KeyCode } = {}
local registry: { any } = {}
local _bindCount = 0

--// Private Functions
local function keyResolve(keys: { string | Enum.KeyCode }): { { Enum.KeyCode } }
	local sets: { { Enum.KeyCode } } = {}

	for _, key in ipairs(keys) do
		if type(key) == "string" then
			table.insert(sets, ALIASES[key] or { (Enum.KeyCode :: any)[key] :: Enum.KeyCode })
		else
			table.insert(sets, { key })
		end
	end

	return sets
end

local function keyExist(key: Enum.KeyCode, set: { Enum.KeyCode }): boolean
	for _, k in ipairs(set) do
		if k == key then
			return true
		end
	end

	return false
end

local function matchesBind(resolvedSets: { { Enum.KeyCode } }, triggerKey: Enum.KeyCode): boolean
	if not keyExist(triggerKey, resolvedSets[#resolvedSets]) then
		return false
	end

	local from = 1

	for _, keySet in ipairs(resolvedSets) do
		local found = false

		for i = from, #pressOrder do
			if keyExist(pressOrder[i], keySet) then
				from = i + 1
				found = true

				break
			end
		end

		if not found then
			return false
		end
	end

	return true
end

local function registerEntry(entry: any, keys: Keys, sink: boolean)
	local resolvedSets = keyResolve(keys)
	entry._resolvedSets = resolvedSets

	if sink then
		local actionName = HttpService:GenerateGUID(false):gsub("-", "")
		local triggerSet: { Enum.KeyCode } = resolvedSets[#resolvedSets]

		if entry._actionName then
			ContextActionService:UnbindAction(entry._actionName)
		end
		entry._actionName = actionName

		ContextActionService:BindActionAtPriority(
			actionName,
			function(_: string, state: Enum.UserInputState, input: InputObject): Enum.ContextActionResult
				if state ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				end

				local key = input.KeyCode
				table.insert(pressOrder, key)

				if matchesBind(resolvedSets, key) then
					entry._activated = true
					entry.signal:Fire(false, false)
					return Enum.ContextActionResult.Sink
				end

				for i = #pressOrder, 1, -1 do
					if pressOrder[i] == key then
						table.remove(pressOrder, i)
						break
					end
				end

				return Enum.ContextActionResult.Pass
			end,
			false,
			SINK_PRIORITY,
			table.unpack(triggerSet :: { any })
		)
	end
end

--// Public Methods
local Keybind = {}

function Keybind.captureStroke(callback: (keys: { string }) -> ()): () -> ()
	local conn: RBXScriptConnection
	local cancelled = false

	conn = UserInputService.InputEnded:Connect(function(input: InputObject)
		if input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		if input.KeyCode == Enum.KeyCode.Unknown then
			return
		end

		if MODIFIER_KEYS[input.KeyCode] then
			return
		end

		conn:Disconnect()

		if not cancelled then
			local keys = {}
			local addedAliases = {}

			for _, heldInput in UserInputService:GetKeysPressed() do
				local alias = REVERSE_ALIASES[heldInput.KeyCode]
				if alias and not addedAliases[alias] then
					addedAliases[alias] = true
					table.insert(keys, alias)
				end
			end

			table.insert(keys, input.KeyCode.Name)

			task.spawn(callback, keys)
		end
	end)

	return function()
		cancelled = true
		conn:Disconnect()
	end
end

function Keybind.new(keys: any, options: Options?): Signal<boolean, boolean>
	local sig = signal() :: Signal<boolean, boolean>
	local sink = options ~= nil and options.sink == true
	local entry = { signal = sig, _resolvedSets = {}, _sink = sink, _activated = false, _actionName = nil :: string? }

	table.insert(registry, entry)

	if type(keys) == "table" and keys.Changed ~= nil then
		registerEntry(entry, keys.Value, sink)

		keys.Changed:Connect(function(newKeys: Keys)
			registerEntry(entry, newKeys, sink)
		end)
	else
		registerEntry(entry, keys :: Keys, sink)
	end

	return sig
end

--// Connections
UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
	local key = input.KeyCode

	if key == Enum.KeyCode.Unknown then
		return
	end

	if gameProcessed and not MODIFIER_KEYS[key] then
		return
	end

	local tracked = false
	for _, k: Enum.KeyCode in ipairs(pressOrder) do
		if k == key then
			tracked = true

			break
		end
	end

	if not tracked then
		table.insert(pressOrder, key)
	end

	for _, bind in ipairs(registry) do
		if bind._sink then
			continue
		end

		if matchesBind(bind._resolvedSets :: { { Enum.KeyCode } }, key) then
			bind._activated = true
			bind.signal:Fire(false, gameProcessed)
		end
	end
end)

UserInputService.InputEnded:Connect(function(input: InputObject)
	local key = input.KeyCode

	for i, k in ipairs(pressOrder) do
		if k == key then
			table.remove(pressOrder, i)

			break
		end
	end

	for _, bind in ipairs(registry) do
		local triggerSet = bind._resolvedSets[#bind._resolvedSets] :: { Enum.KeyCode }
		if keyExist(key, triggerSet) and bind._activated then
			bind._activated = false
			bind.signal:Fire(true, false)
		end
	end
end)

return Keybind
