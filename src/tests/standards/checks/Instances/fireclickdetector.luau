--!nocheck
--!nolint

return function()
	if not getfenv(0).fireclickdetector then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part", workspace)
	local originalClickDetector = Instance.new("ClickDetector", originalPart)

	originalPart.Anchored = true
	originalPart.Transparency = 1
	originalPart.CanCollide = false
	originalPart.Position = Vector3.new(0,-100,0)

	local function testEvent(event)
		originalClickDetector[event]:Connect(function(player)
			if player ~= game:GetService("Players").LocalPlayer then
				return {
					status = 500,
					message = "Player passed wasn't the LocalPlayer"
				}
			end
		end)

		local success, returned = fireclickdetector(originalClickDetector, 0, event)

		if not success then
			return {
				status = 0,
				message = `Failed w/ error: {returned}`
			}
		end

		return true
	end

	local mouseClick = testEvent("MouseClick")
	local rightMouseClick = testEvent("RightMouseClick")
	local mouseHoverEnter = testEvent("MouseHoverEnter")
	local mouseHoverLeave = testEvent("MouseHoverLeave")

	game:GetService("RunService").PostSimulation:Wait()
	
	if not mouseClick then
		return {
			status = 500,
			message = "MouseClick event was not fired."
		}
	end
	if not rightMouseClick then
		return {
			status = 500,
			message = "RightMouseClick event was not fired."
		}
	end
	if not mouseHoverEnter then
		return {
			status = 500,
			message = "MouseHoverEnter event was not fired."
		}
	end
	if not mouseHoverLeave then
		return {
			status = 500,
			message = "MouseHoverLeave event was not fired."
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
