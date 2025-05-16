--!nocheck
--!nolint

return function()
	if not getfenv(0).readfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	elseif not getfenv(0).writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	end

	--// Functionality test
	local writeSuc, writeMsg = pcall(writefile, "test1.txt", "Content")

	if not writeSuc then
		return {
			status = 0,
			message = "Failed to write @ test1.txt: " .. writeMsg
		}
	elseif readfile("test1.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't return the expected content"
		}
	end

	delfile("test1.txt")

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
