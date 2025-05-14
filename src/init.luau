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
	interface:PopupModal({
		Title = "Teleporting to test game...",
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
