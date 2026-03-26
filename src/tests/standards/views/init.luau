--!nocheck

--// Registry of manual view groups exposed to the Manual sub-tab.
--// Each value must be a function(name, tab, titledRow).

return {
	Manual = require("@self/Manual"),
}
