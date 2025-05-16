--!nocheck
--!nolint

return function()
	if not getfenv(0).getcustomasset then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "31kr6ji222uvn7zvz6ue5yfyn7ky")

	task.wait(0.2)

	local asset = getcustomasset(guid)

	if not typeof(asset) == "string" then
		return {
			status = 500,
			message = "Asset is not of the expected type (string)"
		}
	elseif not asset:match("rbxasset://") then
		return {
			status = 500,
			message = "Asset string dosen't include a rbxasset prefix"
		}
	end

	delfile(guid)
	
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
