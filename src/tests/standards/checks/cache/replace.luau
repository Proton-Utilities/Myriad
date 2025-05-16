--!nocheck
--!nolint

return function()
	if not getfenv(0).cache or not getfenv(0).cache.replace then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local inst1 = game:GetService("BadgeService")
	local inst2 = game:GetService("Stats")

	if inst1 == inst2 then
		return {
			status = 500,
			message = "Did a cosmic ray just hit your computer? This should never evaluate"
		}
	end

	cache.replace(inst1, inst2)

	if inst1 == inst2 then
		return {
			status = 500,
			message = "Reference is old reference"
		}
	elseif inst1 == game:GetService("Stats") then
		return {
			status = 500,
			message = "Reference is old references object"
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
