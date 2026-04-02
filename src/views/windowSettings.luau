return function(cascade, app, window, root)
	--// Imports
	local config = require("@config")
	local keybind = require("@modules/keybind")

	--// Privates
	local function titledRow(parent: any, title: string, subtitle: string?)
		local row = parent:Row({
			SearchIndex = title,
		})

		row:Left():TitleStack({
			Title = title,
			Subtitle = subtitle,
		})

		return row
	end

	--// UI
	keybind.new(config.keybinds.toggleMenu, { sink = true }):Connect(function(inputComplete: boolean)
		if not inputComplete then
			return
		end

		window.Minimized = not window.Minimized
	end)

	do -- Appearance
		local form = root:PageSection({ Title = "Appearance" }):Form()

		do -- Dark mode
			local row = titledRow(
				form,
				"Dark mode",
				"An application appearance setting that uses a dark color palette to provide a comfortable viewing experience tailored for low-light environments."
			)

			row:Right():Toggle({
				Value = app.Theme._id == "Dark",
				ValueChanged = function(self, value: boolean)
					app.Theme = value and cascade.Themes.Dark or cascade.Themes.Light
				end,
			})
		end

		do -- Application accent
			local row = titledRow(
				form,
				"Application accent",
				"An application appearance setting that allows you to change the overall accent of the application."
			)

			local flattenedAccents = {}
			for accent, _ in pairs(cascade.Accents) do
				table.insert(flattenedAccents, accent)
			end

			row:Right():PopUpButton({
				Value = table.find(flattenedAccents, (app.Accent and app.Accent._id) or "Blue"),
				Options = flattenedAccents,
				ValueChanged = function(self, value: number)
					app.Accent = cascade.Accents[self.Options[value]]
				end,
			})
		end
	end

	do -- Input
		local form = root:PageSection({ Title = "Input" }):Form()

		do -- Minimize shortcut
			local row = titledRow(form, "Minimize shortcut")

			row:Right():KeybindLabel({
				Keys = config.keybinds.toggleMenu,
			})
		end

		do -- Searching
			local row = titledRow(
				form,
				"Searchable",
				"Allows users to search for content in a page with a search-field in the titlebar."
			)

			row:Right():Toggle({
				Value = window.Searching,
				ValueChanged = function(self, value: boolean)
					window.Searching = value
				end,
			})
		end

		do -- Draggable
			local row = titledRow(form, "Draggable", "Allows users to move the window with a mouse or touch device.")

			row:Right():Toggle({
				Value = window.Draggable,
				ValueChanged = function(self, value: boolean)
					window.Draggable = value
				end,
			})
		end

		do -- Resizable
			local row = titledRow(form, "Resizable", "Allows users to resize the window with a mouse or touch device.")

			row:Right():Toggle({
				Value = window.Resizable,
				ValueChanged = function(self, value: boolean)
					window.Resizable = value
				end,
			})
		end
	end

	do -- Effects
		local form = root:PageSection({
			Title = "Effects",
			Subtitle = "These effects may be resource intensive across different systems.",
		}):Form()

		do -- Dropshadow
			local row = titledRow(form, "Dropshadow", "Enables a dropshadow effect on the window.")

			row:Right():Toggle({
				Value = window.Dropshadow,
				ValueChanged = function(self, value: boolean)
					window.Dropshadow = value
				end,
			})
		end

		do -- UI Blur
			local row = titledRow(
				form,
				"Background blur",
				"Enables a UI background blur effect on the window."
			)

			row:Right():Toggle({
				Value = window.UIBlur,
				ValueChanged = function(self, value: boolean)
					window.UIBlur = value
				end,
			})
		end
	end
end
