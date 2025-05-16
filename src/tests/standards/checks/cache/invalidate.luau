--!nocheck
--!nolint

return function()
	if not getfenv(0).cache or not getfenv(0).cache.invalidate  then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
    local badgeService = game:GetService("BadgeService")

    if badgeService ~= game:GetService("BadgeService") then
        return {
            status = 500,
            message = "Did a cosmic ray just hit your computer? This should never evaluate"
        }
    end

    cache.invalidate(badgeService)

    if badgeService == game:GetService("BadgeService") then
        return {
            status = 500,
            message = "Reference to service object retained"
        }
    elseif typeof(badgeService) ~= "Instance" then
        return {
            status = 500,
            message = "Reference type wasn't retained"
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
