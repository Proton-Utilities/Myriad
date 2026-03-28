--!nocheck
--!nolint

return function()
	if not getcustomasset then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif require("@checks/Filesystem/writefile")().status ~= 200 then
		return {
			status = 401,
			message = "Dependency 'writefile' didn't pass",
		}
	elseif require("@checks/Filesystem/isfile")().status ~= 200 then
		return {
			status = 401,
			message = "Dependency 'isfile' didn't pass",
		}
	elseif require("@checks/Filesystem/delfile")().status ~= 200 then
		return {
			status = 401,
			message = "Dependency 'delfile' didn't pass",
		}
	end

	local assets = require("@self/assets.luau")
	local HttpService = game:GetService("HttpService")
	local ContentProvider = game:GetService("ContentProvider")

	for _, assetObj in ipairs(assets) do
		local guid = HttpService:GenerateGUID(false):gsub("-", "")
		local filename = guid .. "." .. assetObj.ext

		local writeSuccess, writeError = pcall(function()
			writefile(filename, assetObj.data)
		end)

		if not writeSuccess then
			return {
				status = 0,
				message = `Failed to write setup file for getcustomasset ({assetObj.ext}): {writeError}`,
			}
		end

		if not isfile(filename) then
			return {
				status = 0,
				message = `Writefile failed silently for {assetObj.ext} (file does not exist)`
			}
		end

		task.wait(0.05)

		local success, assetUrl = pcall(function()
			return getcustomasset(filename)
		end)

		if not success then
			pcall(function() delfile(filename) end)
			return {
				status = 500,
				message = `getcustomasset threw an error for {assetObj.ext}: {assetUrl}`,
			}
		elseif type(assetUrl) ~= "string" then
			pcall(function() delfile(filename) end)
			return {
				status = 500,
				message = `Asset URL for {assetObj.ext} is not of type string, got {type(assetUrl)}`,
			}
		elseif #assetUrl < 5 then
			pcall(function() delfile(filename) end)
			return {
				status = 500,
				message = `Asset string for {assetObj.ext} is unrealistically short`
			}
		end

		local instance
		if assetObj.type == "Font" then
			instance = Instance.new("TextLabel")
			local fontSuccess = pcall(function()
				instance.FontFace = Font.new(assetUrl)
			end)
			if not fontSuccess then
				pcall(function() delfile(filename) end)
				return {
					status = 500,
					message = `Failed to create Font object for {assetObj.ext} with URL: {assetUrl}`,
				}
			end
		else
			instance = Instance.new(assetObj.type)
			instance[assetObj.prop] = assetUrl
		end

		local preloadSuccess, preloadErr = pcall(function()
			ContentProvider:PreloadAsync({instance})
		end)

		pcall(function() delfile(filename) end)

		if not preloadSuccess then
			return {
				status = 500,
				message = `ContentProvider failed to preload {assetObj.ext}: {preloadErr}`,
			}
		end
	end

	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})
	
	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
