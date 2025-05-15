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
			message = "Didn't give correct index for Workspace",
		}
	elseif not mt.__index(game, "ReplicatedStorage") == game:GetService("ReplicatedStorage") then
		return {
			status = 500,
			message = "Didn't give correct index for ReplicatedStorage",
		}
	elseif not mt.__index(game, "Stats") == game:GetService("Stats") then
		return {
			status = 500,
			message = "Didn't give correct index for Stats",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

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
