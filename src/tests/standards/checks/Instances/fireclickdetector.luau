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
	local originalClickDetector = Instance.new("ClickDetector")

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
	end

	testEvent("MouseClick")
	testEvent("RightMouseClick")
	testEvent("MouseHoverEnter")
	testEvent("MouseHoverLeave")

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
