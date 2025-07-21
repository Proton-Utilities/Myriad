--!nocheck
--!nolint

return function()
	if not getrenderproperty then
		return {
			status = 400,
			message = "Global not found",
		}
		elseif not Drawing or not Drawing.new then
		return {
			status = 401,
			message = "Drawing library needed to test this",
		}
	end

	local drawing = Drawing.new("Line")
	drawing.Thickness = 2
	drawing.Visible = false

	local thickness = getrenderproperty(drawing, "Thickness")
	local visible = getrenderproperty(drawing, "Visible")

	if thickness ~= 2 or visible ~= false then
		return {
			status = 500,
			message = "Property not found or mismatch",
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
