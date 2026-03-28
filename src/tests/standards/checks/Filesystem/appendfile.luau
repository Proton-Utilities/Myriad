--!nocheck
--!nolint

return function()
	if not appendfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not require("@checks/Filesystem/writefile")() then
		return {
			status = 401,
			message = "Dependency 'writefile' dosen't work properly.",
		}
	elseif not require("@checks/Filesystem/readfile")() then
		return {
			status = 401,
			message = "Dependency 'readfile' dosen't work properly.",
		}
	elseif not require("@checks/Filesystem/delfile")() then
		return {
			status = 401,
			message = "Dependency 'delfile' dosen't work properly.",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "Hello, ")

	task.wait(0.2)

	appendfile(guid, "World!")

	task.wait(0.2)

	if readfile(guid) ~= "Hello, World!" then
		return {
			status = 500,
			message = "File did not read the expected value",
		}
	end

	delfile(guid)
	
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
