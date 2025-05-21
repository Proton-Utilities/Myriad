--!nocheck
--!nolint UnknownGlobal

--// Imports
local interface = require("dependencies/ReGui/ReGui.luau")

--// Services
local players: Players = game:GetService("Players")
local replicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local teleportService: TeleportService = game:GetService("TeleportService")

--// References
local localPlayer: Player = players.LocalPlayer

--// Variables
local gameId = 80776325854596
local tests = {
	["Standards"] = require("tests/standards/init.luau"),
	["Vulnerability"] = require("tests/vulnerabilities/init.luau"),
}

--// Initialize
if game.PlaceId ~= gameId then
	local gameModal = interface:PopupModal({
		Title = "Teleporting you to the test game...",
	})

	gameModal:Label({
		Text = "If teleporting dosen't work, press 'Copy' to copy the game link",
		TextWrapped = true
	})

	gameModal:Separator()

	local Row = gameModal:Row({
		Expanded = true
	})

	Row:Button({
		Text = "Copy",
		Callback = function()
			if setclipboard or toclipboard then
				(setclipboard or toclipboard)("https://www.roblox.com/games/80776325854596")
			else
				print("Failed to copy link: " .. "https://www.roblox.com/games/80776325854596")
			end
			gameModal:ClosePopup()
		end,
	})
	Row:Button({
		Text = "Cancel",
		Callback = function()
			gameModal:ClosePopup()
		end,
	})

	teleportService:Teleport(gameId, localPlayer)
else
	replicatedStorage:FindFirstChild("connected"):FireServer()

	--// UI Begin
	local window = interface:TabsWindow({
		Title = "Myriad General Validity Test",
		Size = UDim2.fromOffset(400, 500),
		Theme = "ImGui"
	})

	local discModal = window:PopupModal({
		Title = "Would you like to copy our discord link?",
	})

	discModal:Label({
		Text = "Get commit logs when we push changes, interact with the community, and get support for problems",
		TextWrapped = true
	})

	discModal:Separator()

	local Row = discModal:Row({
		Expanded = true
	})

	Row:Button({
		Text = "Yes",
		Callback = function()
			if setclipboard or toclipboard then
				(setclipboard or toclipboard)("https://discord.gg/nn4NxHU3Pu")
			else
				print("Failed to copy link: " .. "https://discord.gg/nn4NxHU3Pu")
			end
			discModal:ClosePopup()
		end,
	})
	Row:Button({
		Text = "No",
		Callback = function()
			discModal:ClosePopup()
		end,
	})

	-- Home
	do
		local home = window:CreateTab({
			Name = "Home",
		})

		home:Label({
			RichText = true,
			Text = "<b>Myriad General Validity Test (2025)</b>",
		})
		home:Label({
			RichText = true,
			Text = `Build: <b>{_P.cfg}</b>`,
		})
		home:Label({
			RichText = true,
			Text = `Build Version: <b>{_P.vers}</b>`,
		})
		home:Label({
			RichText = true,
			Text = `Executor: <b>{(identifyexecutor and identifyexecutor() or "Unknown")}</b>`,
		})

		home:Label({
			RichText = true,
			Text = "\nContributors:",
		})
		home:BulletText({
			RichText = true,
			Rows = {
				"biggaboy212",
			},
		})
	end

	for name, test in tests do
		local tab = window:CreateTab({ Name = name })

		coroutine.wrap(function()
			tests[name](name, tab)
		end)()
	end
end
