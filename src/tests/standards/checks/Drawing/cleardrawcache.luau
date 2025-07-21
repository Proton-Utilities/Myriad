--!nocheck
--!nolint

return function()
	if not cleardrawcache then
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
	drawing.Thickness = 2

	task.defer(cleardrawcache)
	task.wait(0.1)
	if drawing.__OBJECT_EXISTS then
		return {
			status = 500,
			message = "Drawing exists after draw clear",
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
