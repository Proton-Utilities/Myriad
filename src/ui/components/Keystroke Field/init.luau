--// Imports
local cascade, _types = require("@packages/cascade"), require("@packages/cascade/types")
local keybind = require("@modules/keybind")

--// References
local binder = cascade.Binder

--// Types
type Keys = { [number]: EnumItem | string }
type KeystrokeField = {
	Keys: Keys,
	ValueChanged: ((self: any, newKeys: Keys) -> ())?,
}

--// Private Methods
local function resolveKeys(keys: Keys): string
	local resolved = {}
	for _, key in keys do
		if typeof(key) == "EnumItem" then
			table.insert(resolved, key.Name)
		else
			table.insert(resolved, tostring(key))
		end
	end
	return table.concat(resolved, " + ")
end

--// Publish
return function(self, properties: any)
	properties = properties or {}
	properties.Keys = properties.Keys or {}

	local cancelCapture = nil :: (() -> ())?
	local stack = self:HStack({ Padding = UDim.new(0, 3) }) :: _types.Stack
	local symbol = stack:Symbol({ Image = cascade.Symbols.command, Style = "Secondary" }) :: _types.Symbol

	local textBox = cascade.Creator.Create("TextBox")({
		BackgroundTransparency = 1,
		FontFace = Font.new("rbxassetid://12187365364"),
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextEditable = false,
		Selectable = false,
		ClearTextOnFocus = false,
		Text = resolveKeys(properties.Keys),
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromOffset(0, 0),
		PlaceholderText = "Press a key...",
		TextColor3 = self.Theme.Text.Secondary[1].Value,
		TextTransparency = self.Theme.Text.Secondary[2].Value,
		Parent = stack.__instance,

		__dynamicKeys = {
			TextColor3 = self.Theme.Text.Secondary[1],
			TextTransparency = self.Theme.Text.Secondary[2],
		},
	})

	local object: any = nil

	textBox.Focused:Connect(function()
		if cancelCapture then
			cancelCapture()
			cancelCapture = nil
		end

		textBox.Text = "..."

		cancelCapture = keybind.captureStroke(function(newKeys: { string })
			cancelCapture = nil

			textBox.Text = resolveKeys(newKeys)
			textBox:ReleaseFocus()

			if properties.ValueChanged then
				properties.ValueChanged(object, newKeys)
			end
		end)
	end)

	textBox.FocusLost:Connect(function(enterPressed)
		if cancelCapture then
			cancelCapture()
			cancelCapture = nil
		end
		textBox.Text = resolveKeys(properties.Keys)
	end)

	object = binder.Wrap(properties, {
		Keys = function(val: Keys)
			properties.Keys = val
			if not textBox:IsFocused() then
				textBox.Text = resolveKeys(val)
			end
		end,
	}, stack)

	object.Type = "KeystrokeField"
	object.Structures = { Stack = stack, Symbol = symbol, TextBox = textBox }
	binder.Apply(properties, object, {})

	--// Publish
	return object :: KeystrokeField
end
