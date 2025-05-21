--!nocheck
--!nolint

return function()
	if not getfenv(0).setfpscap then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	local renderStepped = game:GetService("RunService").RenderStepped

	local function step()
		renderStepped:Wait()
		local average = 0
		for _ = 1, 10 do
			average += 1 / renderStepped:Wait()
		end
		return math.round(average / 10)
	end

	setfpscap(60)
	local step60 = step()
	setfpscap(0)
	local step0 = step()

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
		message = `Passed (60: {step60}, 0: {step0})`,
	}
end
