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
	elseif not isfolder then
		return {
			status = 401,
			message = "Dependency 'isfolder' not found",
		}
	elseif not delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "Hello, ")

	task.wait(0.2)

	appendfile(guid, "World!")
	local nestedSuc, nestedMsg = pcall(appendfile, "bub/lik.txt", "World!")

	task.wait(0.2)

	if readfile(guid) ~= "Hello, World!" then
		return {
			status = 500,
			message = "File did not read the expected value",
		} 
	elseif not nestedSuc then
		return {
			status = 0,
			message = "Failed to append @ bub/lik.txt: " .. nestedMsg
		}
	elseif not isfolder("bub") then
		return {
			status = 500,
			message = "Nested folder was not created"
		}
	end

	delfile(guid)
	delfolder("bub")
	
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
