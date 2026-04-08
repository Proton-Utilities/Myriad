local _, _types = require("@packages/cascade"), require("@packages/cascade/types")

return function(_, app: _types.App, window: _types.Window, root: _types.Tab)
	--// Imports
	local changelog = require("@packages/CHANGELOG.json")

	for _, release in changelog do -- Log
		local form = root:PageSection({ Title = release.version, Subtitle = table.concat(release.tags, ", ") }):Form()

		for _, log in release.changes do
            form:Row({SearchIndex = log}):Left():Label({
                Text = `- {log}`
            })
		end
	end
end
