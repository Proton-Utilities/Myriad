--!nocheck
--!nolint

return function()
	if not setscriptable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")

	if pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "Unaccessible property accessible",
		}
	end

	setscriptable(originalPart, "MaterialVariantSerialized", true)
	if not pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "MaterialVariantSerialized inaccessible after being set as scriptable",
		}
	end

	setscriptable(originalPart, "MaterialVariantSerialized", false)
	if pcall(function() local _ = originalPart.MaterialVariantSerialized end) then
		return {
			status = 500,
			message = "MaterialVariantSerialized accessible after being set as unscriptable",
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
