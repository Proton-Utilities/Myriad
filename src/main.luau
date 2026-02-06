--!nocheck

--// Imports
local cascade = require("@packages/cascade")
local tests = require("@tests")

--// Services
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Variables
local app = cascade.New({
	Theme = cascade.Themes.Dark,
})
local gameId = 80776325854596

--// Private Methods
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

--// Initialize
if game.PlaceId == gameId then
	local connected = replicatedStorage:FindFirstChild("connected")

	if not connected then
		warn("Can't find dependency `connected`")
		return
	end

	connected:FireServer()

	--// UI Begin
	local section = app:Window({
		Title = "Myriad",
		Subtitle = `{_P.cfg} {_P.vers}`,
	}):Section({
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
			test.path(name, tab, titledRow)
		end)()
	end
else
	local game = "https://www.roblox.com/games/80776325854596"

	warn(`Please join the testing game to use myriad: {game}`)

	if setclipboard or toclipboard then
		(setclipboard or toclipboard)(game)
	else
		print("Failed to copy link: " .. game)
	end
end
