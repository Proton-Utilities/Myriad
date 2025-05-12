--!nocheck
--!nolint

return function()
	if not getfenv(0).getrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local mt = getrawmetatable(game)

	if not typeof(mt) == "table" then
		return {
			status = 500,
			message = "Didn't return a table",
		}
	elseif not mt.__index(game, "Workspace") == game:GetService("Workspace") then
		return {
			status = 500,
			message = "Didn't give correct index",
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
