--!nocheck
--!nolint

return function()
	if not getfenv(0).getrenderproperty then
		return {
			status = 400,
			message = "Global not found",
		}
		elseif not getfenv(0).Drawing or not getfenv(0).Drawing.new then
		return {
			status = 400,
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

	return {
		status = 200,
		message = `Passed`,
	}
end
