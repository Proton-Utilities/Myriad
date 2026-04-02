local ui = require("@self/ui")
local cascade = require("@packages/cascade")
local binder = cascade.Binder

return function(self, properties: any)
	properties = properties or {}

	local structures, _theme = ui(self, properties)

	local object = binder.Wrap(properties, {
		Passed = function(val: number)
			structures.PassedLabel.Text = `Passed: {val}`
		end,
		Failed = function(val: number)
			structures.FailedLabel.Text = `Failed: {val}`
		end,
		CurrentTest = function(val: string)
			structures.CurrentTestLabel.Text = `Testing: {val}`
		end,
		NextTest = function(val: string)
			structures.NextTestLabel.Text = `Next: {val}`
		end,
		TotalElapsed = function(val: number)
			structures.TotalElapsedLabel.Text = `Total: {string.format("%.2f", val)}s`
		end,
		CheckElapsed = function(val: number)
			structures.CheckElapsedLabel.Text = `Check: {string.format("%.2f", val)}s`
		end,
	}, structures.Body)

	object.Type = "TestingState"
	object.Theme = self.Theme
	object.Structures = structures
	object.__container = structures.Body

	binder.Apply(properties, object)

	return object
end
