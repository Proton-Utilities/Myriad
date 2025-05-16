--!nocheck
--!nolint

return function()
	if not getfenv(0).isfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not getfenv(0).delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfile(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end
	
	writefile(guid, "")

	task.wait(0.2)

	if not isfile(guid) then
		return {
			status = 500,
			message = `Existing file returned false`,
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
