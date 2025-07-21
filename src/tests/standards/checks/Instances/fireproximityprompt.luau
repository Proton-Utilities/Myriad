--!nocheck
--!nolint

return function()
	if not fireproximityprompt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local fired = false
	
	local localPlayer = game:GetService("Players").LocalPlayer
	local proximityPromptService = game:GetService("ProximityPromptService")
	local originalPart = Instance.new("Part", workspace)
	local originalProximityPrompt = Instance.new("ProximityPrompt", originalPart)

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)
	originalProximityPrompt.HoldDuration = 1

	proximityPromptService.PromptButtonHoldBegan:Connect(function(prompt) 
		return {
			status = 500,
			message = "Proximity prompt was manually fired"
		}
	end)

	proximityPromptService.PromptButtonHoldEnded:Connect(function(prompt) 
		return {
			status = 500,
			message = "Proximity prompt was manually fired"
		}
	end)

	originalProximityPrompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
		return {
			status = 500,
			message = "Modified HoldDuration"
		}
	end)

	originalProximityPrompt.Triggered:Connect(function(player)
		if player ~= localPlayer then
			return {
				status = 500,
				message = "Player passed wasn't the LocalPlayer"
			}
		end

		fired = true
	end)

	local success, returned = pcall(fireproximityprompt, originalProximityPrompt)

	game:GetService("RunService").PostSimulation:Wait()

	if not success then
		return {
			status = 0,
			message = `Failed w/ error: {returned}`
		}
	elseif not fired then
		return {
			status = 500,
			message = `Prompt was not triggered`
		}
	end

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
