--!nocheck
--!nolint

return function()
	if not getcustomasset then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not isfile then
		return {
			status = 401,
			message = "Dependency 'isfile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	local imageData = require("@self/image.luau")
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local filename = guid .. ".png"

	local writeSuccess, writeError = pcall(function()
		writefile(filename, imageData)
	end)

	if not writeSuccess then
		return {
			status = 0,
			message = "Failed to write setup file for getcustomasset: " .. tostring(writeError),
		}
	end

	if not isfile(filename) then
		return {
			status = 0,
			message = "Writefile failed silently (file does not exist)"
		}
	end

	task.wait(0.1)

	local success, asset = pcall(function()
		return getcustomasset(filename)
	end)

	if not success then
		pcall(function() delfile(filename) end)
		return {
			status = 500,
			message = "getcustomasset threw an error: " .. tostring(asset),
		}
	elseif type(asset) ~= "string" then
		pcall(function() delfile(filename) end)
		return {
			status = 500,
			message = "Asset is not of the expected type (string), got " .. type(asset),
		}
	elseif #asset < 5 then
		pcall(function() delfile(filename) end)
		return {
			status = 500,
			message = "Asset string is unrealistically short"
		}
	end

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Image = asset

	local preloadSuccess, preloadErr = pcall(function()
		game:GetService("ContentProvider"):PreloadAsync({imageLabel})
	end)

	pcall(function() delfile(filename) end)

	if not preloadSuccess then
		return {
			status = 500,
			message = "ContentProvider failed to preload asset: " .. tostring(preloadErr),
		}
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
