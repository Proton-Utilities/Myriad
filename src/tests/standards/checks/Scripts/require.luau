--!nocheck
--!nolint

return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local testModule = ReplicatedStorage:FindFirstChild("req")

	if not testModule then
		return {
			status = 401,
			message = "Test ModuleScript not found in ReplicatedStorage",
		}
	end

	local success, result = pcall(function()
		return require(testModule)
	end)

	if not success then
		return {
			status = 500,
			message = `Failed to require the ModuleScript: {result}`,
		}
	end

	if type(result) ~= "table" then
		return {
			status = 500,
			message = `Expected table from ModuleScript, got {type(result)}`,
		}
	end

	if result.Original == true then
		return {
			status = 500,
			message = "ModuleScript state was not shared with the game (returned original unmutated state)",
		}
	end

	if result.Data ~= "ChangedByGame" then
		return {
			status = 500,
			message = `ModuleScript returned unexpected data: {result.Data}`,
		}
	end

	local success2, result2 = pcall(function()
		return require(testModule)
	end)

	if result ~= result2 then
		return {
			status = 500,
			message = "require returned a different table instance on subsequent calls",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
