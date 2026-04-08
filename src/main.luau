--!nocheck

--// Imports
local cascade = require("@packages/cascade")
local types = require("@packages/cascade/types")

local views = require("@views")
local tests = require("@tests")
local ui = require("@ui")

--// Variables
local app = cascade.New({
	Theme = cascade.Themes.Dark,
}) :: types.App
local gameId = 79035306837882

--// Private Methods
local function titledRow(parent: types.BaseComponent?, title: string, subtitle: string?): types.Row
	local row = parent:Row({
		SearchIndex = title,
	})

	row:Left():TitleStack({
		Title = title,
		Subtitle = subtitle,
	})

	return row
end

--// Initialize
if game.PlaceId == gameId then
	local gameRefs = require("@gameRefs")

	if not gameRefs.connected then
		warn("Can't find dependency `connected`")
		return
	end

	local cleanup
	if getgenv then
		local env = getgenv()

		if typeof(env.__myriadCleanup) == "function" then
			pcall(env.__myriadCleanup)
		end

		local cleaned = false
		cleanup = function()
			if cleaned then
				return
			end
			cleaned = true

			if env.__myriadCleanup == cleanup then
				env.__myriadCleanup = nil
			end
			app:Destroy()
		end

		env.__myriadCleanup = cleanup
	end

	gameRefs.connected:FireServer()
	ui.Components()

	--// UI
	local window = app:Window({
		Title = "Myriad",
		Subtitle = `The General Validity Test | {_P.cfg} {_P.vers}`,
	})

	window.Destroying:Connect(function()
		if cleanup then
			cleanup()
		else
			app:Destroy()
		end
	end)

	do -- Home
		local section = window:Section({
			Disclosure = false,
			Title = "Home",
		})

		do -- Window
			local tab = section:Tab({
				Title = "Changelog",
				Icon = cascade.Symbols.sparkles,
				Selected = true,
			})

			views.changelog(cascade, app, window, tab)
		end
	end

	do -- Tests
		local section = window:Section({
			Disclosure = false,
			Title = "Tests",
		})

		for name, test in tests do
			local tab = section:Tab({
				Title = name,
				Icon = cascade.Symbols[test.icon],
				Selected = test.selected,
			})

			coroutine.wrap(function()
				test.path(name, tab, titledRow, app)
			end)()
		end
	end

	do -- Settings
		local section = window:Section({
			Disclosure = false,
			Title = "Settings",
		})

		do -- Window
			local tab = section:Tab({
				Title = "Window",
				Icon = cascade.Symbols.sidebarLeft,
			})

			views.windowSettings(cascade, app, window, tab)
		end
	end
else
	local gameLink = "https://www.roblox.com/games/80776325854596"

	warn(`Please join the testing game to use myriad: {gameLink}`)

	if setclipboard or toclipboard then
		(setclipboard or toclipboard)(gameLink)

		app:Notification({
			App = "MYRIAD",
			Title = "Copied link",
			Subtitle = "We've copied the link to the testing game, join it to use myriad.",
			Icon = cascade.Symbols.link,
		})
	else
		app:Notification({
			App = "MYRIAD",
			Title = "Failed to copy link",
			Subtitle = "Please join the testing game to use myriad: " .. gameLink,
			Icon = cascade.Symbols.exclamationmarkTriangle,
		})
	end
end
