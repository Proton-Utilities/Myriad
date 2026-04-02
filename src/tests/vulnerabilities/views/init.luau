--!nocheck

--// Imports
local cascade = require("@packages/cascade")

--// Publish
return {
	Settings = {
		Icon = cascade.Symbols.gearshape,
		Init = require("@self/Settings"),
	},
}
