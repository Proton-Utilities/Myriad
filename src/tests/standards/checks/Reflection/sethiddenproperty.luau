--!nocheck
--!nolint

return function()
	if not sethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not gethiddenproperty then
		return {
			status = 401,
			message = "Dependant global 'gethiddenproperty' not found",
		}
	end

	local originalPart = Instance.new("Part")

	local prop2Value, prop2Hidden = gethiddenproperty(originalPart, "shape")

	sethiddenproperty(originalPart, "shape", Enum.PartType.CornerWedge)

	if not gethiddenproperty(originalPart, "shape") == Enum.PartType.CornerWedge then
		return {
			status = 500,
			message = "Hidden property's value was incorrectly set",
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
