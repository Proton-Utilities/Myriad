--!nocheck
--!nolint

return function()
	if not appendfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not readfile then
		return {
			status = 401,
			message = "Dependency 'readfile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
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
