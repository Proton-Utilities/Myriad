--!nocheck
--!nolint

return function()
	if not getfenv(0).fireproximityprompt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local proximityPromptService = game:GetService("ProximityPromptService")
	local originalProximityPrompt = Instance.new("ProximityPrompt")
	originalProximityPrompt.HoldDuration = 2

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
		if player ~= LocalPlayer then
			return {
				status = 500,
				message = "Player passed wasn't the LocalPlayer"
			}
		end
	end)

	local success, returned = pcall(fireproximityprompt, originalProximityPrompt)

	if not success then
		return {
			status = 0,
			message = `Failed w/ error: {returned}`
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

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
