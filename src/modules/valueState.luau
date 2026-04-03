--// Imports
local signal = require("@packages/signal")

--// Types
export type ValueState<T> = {
	Value: T,
	Changed: typeof(signal()) & { Connect: (self: any, fn: (newValue: T, oldValue: T) -> ()) -> any },
}

--// Module
local valueState = {}

function valueState.new<T>(initial: T): ValueState<T>
	local changed = signal()

	local state = {
		Changed = changed,
	}

	local _value = initial

	local proxy = setmetatable(state, {
		__index = function(_, key)
			if key == "Value" then
				return _value
			end
			return state[key]
		end,
		__newindex = function(_, key, newVal)
			if key == "Value" then
				local old = _value
				if old ~= newVal then
					_value = newVal
					changed:Fire(newVal, old)
				end
			else
				state[key] = newVal
			end
		end,
	})

	return proxy :: ValueState<T>
end

return valueState
