local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts")
local Client = PlayerScripts:WaitForChild("Client")
local Network = ReplicatedStorage:WaitForChild("Network")

return {
	connected = ReplicatedStorage:WaitForChild("connected"),
	res = ReplicatedStorage:WaitForChild("res"),
	mutable = Network:WaitForChild("mutable"),

	Baseplate = Workspace:WaitForChild("Baseplate"),

	decompTarget = ReplicatedFirst:WaitForChild("decompTarget"),

	PMOVON = Client:WaitForChild("PMOVON"),
}
