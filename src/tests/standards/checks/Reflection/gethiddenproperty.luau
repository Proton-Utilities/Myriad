--!nocheck
--!nolint

return function()
	if not gethiddenproperty then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart = Instance.new("Part")

	local prop1Value, prop1Hidden = gethiddenproperty(originalPart, "Name")
	local prop2Value, prop2Hidden = gethiddenproperty(originalPart, "PropertyStatusStudio")
	local prop3Value, prop3Hidden = gethiddenproperty(workspace, "DataModelPlaceVersion")
	local invalidPropSuccess, invalidPropMessage = pcall(gethiddenproperty, originalPart, "siz")

	-- Name
	if prop1Hidden then
		return {
			status = 500,
			message = "Non-hidden property assumed hidden",
		}
	elseif prop1Value ~= "Part" then
		return {
			status = 500,
			message = "Non-hidden property value incorrect, ensure you still return values for non-hidden properties.",
		}

		-- PropertyStatusStudio
	elseif not prop2Hidden then
		return {
			status = 500,
			message = "Hidden property assumed non-hidden",
		}
	elseif prop2Value ~= Enum.PropertyStatus.Ok then
		return {
			status = 500,
			message = "Hidden property value incorrect",
		}
	elseif not prop3Hidden then
		return {
			status = 500,
			message = "Hidden property assumed non-hidden in workspace",
		}
	elseif prop3Value ~= game.PlaceVersion then
		-- Some exploits just wait for the values to be the defaults
		return {
			status = 500,
			message = "Hidden property value incorrect in workspace",
		}
	elseif not invalidPropSuccess then
		return {
			status = 500,
			message = "Should not have errored accessing a writeonly hidden property.",
		}
	elseif invalidPropMessage then
		return {
			status = 500,
			message = "Should have passed nil while attempting to access a writeonly hidden property.",
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