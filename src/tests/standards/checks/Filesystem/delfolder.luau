--!nocheck
--!nolint

return function()
	if not getfenv(0).delfolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).makefolder then
		return {
			status = 401,
			message = "Dependency 'makefolder' not found",
		}
	elseif not getfenv(0).isfolder then
		return {
			status = 401,
			message = "Dependency 'isfolder' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")

	if isfolder(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end
	
	makefolder(guid)

	task.wait(0.2)

	if not isfolder(guid) then
		return {
			status = 500,
			message = `Existing file returned false`,
		}
	end

	delfolder(guid)

	task.wait(0.2)

	if isfolder(guid) then
		return {
			status = 500,
			message = `Nonexistent file returned true`,
		}
	end

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
