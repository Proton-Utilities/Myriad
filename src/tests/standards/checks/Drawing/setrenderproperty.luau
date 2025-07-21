--!nocheck
--!nolint

return function()
	if not setrenderproperty then
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
	setrenderproperty(drawing, "Thickness", 2)
	setrenderproperty(drawing, "Visible", false)

	if drawing.Thickness ~= 2 or drawing.Visible ~= false then
		return {
			status = 500,
			message = "Incorrect property value",
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
