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
	
	local shapeOpcions = {"CornerWedge", "Wedge", "Ball", "Cylinder"}
	local shapeOpcion = shapeOpcions[math.random(1, #shapeOpcions)]
	
	sethiddenproperty(originalPart, "shape", Enum.PartType[shapeOpcion])

	if gethiddenproperty(originalPart, "shape") ~= Enum.PartType[shapeOpcion] then
		return {
			status = 500,
			message = "Hidden property's value was incorrectly set",
		}
	elseif originalPart.Shape ~= Enum.PartType[shapeOpcion] then
		return {
			status = 500,
			message = "It changed .shape but not .Shape, it should change accordingly, weird",
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