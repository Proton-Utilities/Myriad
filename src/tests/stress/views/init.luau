local cascade = require("@packages/cascade")

return {
	Settings = {
		Icon = cascade.Symbols.gearshape,
		Init = require("@self/Settings"),
	},
}
