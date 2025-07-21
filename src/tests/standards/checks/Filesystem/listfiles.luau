--!nocheck
--!nolint

return function()
	if not isfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local guid2 = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local found1 = false
	local found2 = false
	
	writefile(guid, "")
	writefile(guid2, "")

	task.wait(0.2)

	for _, file in listfiles("") do
		if file == guid then
			found1 = true
		end
		if file == guid2 then
			found2 = true
		end
	end

	if not found1 and found2 then
		return {
			status = 500,
			message = "Didn't find the expected files"
		}
	end

	delfile(guid)
	delfile(guid2)
	
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
