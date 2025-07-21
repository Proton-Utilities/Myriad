--!nocheck
--!nolint

return function()
	if not run_on_actor then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed find to actor"
		}
	end

	run_on_actor(actor, [[local originalPart = Instance.new("Part")
		originalPart.Name = os.date("%H")
		originalPart.Parent = game.ReplicatedStorage
	]])

task.wait(0.1)

	if not game.ReplicatedStorage:FindFirstChild(os.date("%H")) then
		return {
			status = 500,
			message = "Failed to find a part created by the actor"
		}
	end

	game.ReplicatedStorage:FindFirstChild(os.date("%H")):Destroy()

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
