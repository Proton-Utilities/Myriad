--!nocheck
--!nolint

return function()
	if not isrenderobj then
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
	drawing.Visible = false

	if not isrenderobj(drawing) then
		return {
			status = 500,
			message = "Didn't return true for a render object",
		}
	elseif isrenderobj({}) or isrenderobj(game:GetService("Workspace")) then
		return {
			status = 500,
			message = "Returned true for a non-render object",
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
