--// Imports
local cascade, _types = require("@packages/cascade"), require("@packages/cascade/types")

--// References
local binder = cascade.Binder

--// Types
type Keys = { [number]: EnumItem | string }
type KeybindLabel = {
	Keys: Keys,
}

--// Private Methods
local function resolveKeys(keys: Keys): string
	local resolved = {}
	for _, key in keys do
		if typeof(key) == "EnumItem" then
			table.insert(resolved, key.Name)
		else
			table.insert(resolved, key)
		end
	end
	return table.concat(resolved, " + ")
end

--// Publish
return function(self, properties: any)
	properties = properties or {}
	properties.Keys = properties.Keys or {}

	--// Structures
	local stack = self:HStack({ Padding = UDim.new(0, 3) }) :: _types.Stack
	local symbol = stack:Symbol({ Image = cascade.Symbols.command, Style = "Secondary" }) :: _types.Symbol
	local label = stack:Label({ Text = "" }) :: _types.Label

	--// Bind
	local object = binder.Wrap(properties, {
		Keys = function(val: Keys)
			label.Text = resolveKeys(val)
		end,
	}, stack)

	object.Type = "KeybindLabel"
	object.Structures = { Stack = stack, Symbol = symbol, Label = label }
	binder.Apply(properties, object, {})

	--// Publish
	return object :: KeybindLabel
end
