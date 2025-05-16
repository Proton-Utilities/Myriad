--!nocheck
--!nolint

return function()
	if not getfenv(0).firetouchinterest then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local touchPart = game.Players.LocalPlayer.Character.Head
	local touched = false
	local touchEnded = false
	local originalPart = Instance.new("Part")

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)
	originalPart.Parent = workspace

	originalPart.Touched:Connect(function(part: BasePart)
		if part ~= touchPart then
			originalPart:Destroy()

			return {
				status = 500,
				message = "Touch part given wasn't the passed touch part",
			}
		end

		touched = true
	end)

	originalPart.TouchEnded:Connect(function(part: BasePart)
		if part ~= touchPart then
			originalPart:Destroy()

			return {
				status = 500,
				message = "Touch part given wasn't the passed touch part",
			}
		end

		touchEnded = true
	end)

	firetouchinterest(touchPart, originalPart, true)
	game:GetService("RunService").PostSimulation:Wait()

	firetouchinterest(touchPart, originalPart, false)
	game:GetService("RunService").PostSimulation:Wait()

	originalPart:Destroy()

	if not touched then
		return {
			status = 500,
			message = "Touched event wasn't fired",
		}
	elseif not touchEnded then
		return {
			status = 500,
			message = "TouchEnded event wasn't fired",
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
