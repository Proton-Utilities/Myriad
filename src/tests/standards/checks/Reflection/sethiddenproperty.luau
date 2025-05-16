--!nocheck
--!nolint

return function()
	if not getfenv(0).sethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).gethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part")

	local prop1Value, prop1Hidden = gethiddenproperty(originalPart, "Name")
	local prop2Value, prop2Hidden = gethiddenproperty(originalPart, "siz")
	
	if prop1Hidden then
		return {
			status = 500,
			message = "Non-hidden property assumed hidden",
		}
	elseif prop1Value ~= "Part" then
		return {
			status = 500,
			message = "Non-hidden property value incorrect",
		}
	elseif not prop2Hidden then
		return {
			status = 500,
			message = "Hidden property assumed non-hidden",
		}
	elseif prop2Value ~= "can't get value" then
		return {
			status = 500,
			message = "Hidden property value incorrect",
		}
	end

	sethiddenproperty(originalPart, "siz", "can get value")

	if not gethiddenproperty(originalPart, "siz") == "can get value" then
		return {
			status = 500,
			message = "Hidden property's value was incorrectly set"
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
