--!nocheck
--!nolint

return function()
	if not isscriptable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")

	if not isscriptable(originalPart, "Name") then
		return {
			status = 500,
			message = "Accessible property 'Name' assumed inaccessible",
		}
	elseif isscriptable(originalPart, "MaterialVariantSerialized") then
		return {
			status = 500,
			message = "Inaccessible property 'MaterialVariantSerialized' assumed accessible",
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
