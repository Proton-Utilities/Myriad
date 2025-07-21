--!nocheck
--!nolint

return function()
	if not isfolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not makefolder then
		return {
			status = 401,
			message = "Dependency 'makefolder' not found",
		}
	elseif not delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfolder(guid) --[[ isfolder("lebron james") -- always true ]] then
		return {
			status = 500,
			message = `Nonexistent folder returned true`,
		}
	end
	
	makefolder(guid)

	task.wait(0.2)

	if not isfolder(guid) then
		return {
			status = 500,
			message = `Existing folder returned false`,
		}
	end

	delfolder(guid)
	
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
