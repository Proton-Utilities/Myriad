--!nocheck
--!nolint

return function()
	if not getfenv(0).saveinstance then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).listfiles then
		return {
			status = 501,
			message = "Dependant global 'listfiles' not found",
		}
	elseif not getfenv(0).delfile then
		return {
			status = 501,
			message = "Dependant global 'delfile' not found",
		}
	end

	--// Functionality test
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	local part = Instance.new("Part")

	saveinstance(part, {
		FileName = guid
	})

	task.wait(0.5)

	local found = false

	for _, file in pairs(listfiles("")) do
		if file:find(guid) then
			found = true
			delfile(file)
		end
	end
	
	if not found then
		return {
			status = 500,
			message = "Couldn't find saved part. Args passed: (Instance, { FileName = string })"
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
