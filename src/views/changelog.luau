local _cascade, _types = require("@packages/cascade"), require("@packages/cascade/types")

return function(_, _app: _types.App, _window: _types.Window, root: _types.Tab)
	--// Imports
	local changelog = require("@packages/CHANGELOG.json")
	local releases = changelog.releases or {}

	--// State
	local currentIndex = 0
	local controlsForm = root:Form()
	controlsForm.__instance.LayoutOrder = 100

	local controlsRow = controlsForm:Row({ SearchIndex = "load more load next" })
	local controlsLeft = controlsRow:Left()
	local counterLabel = controlsLeft:Label({ Text = "" }) :: _types.Label

	local controlsRight = controlsRow:Right()
	local loadButton = controlsRight:Button({
		Label = "Load more",
		State = "Secondary",
	}) :: _types.Button

	local function loadNext()
		if currentIndex >= #releases then
			return
		end

		for _ = 1, 5 do
			if currentIndex >= #releases then
				break
			end

			currentIndex += 1
			local release = releases[currentIndex]

			local entry = root:ChangelogEntry({
				Version = release.version,
				Tags = release.tags,
				Changes = release.changes
			})
			entry.__instance.LayoutOrder = currentIndex
		end

		if currentIndex >= #releases then
			controlsRow.__instance.Parent.Visible = false
		end

		local shown = math.min(currentIndex, #releases)
		counterLabel.Text = `{shown} of {#releases}`
	end

	loadButton.Pushed = function()
		loadNext()
	end

	loadNext()
end
