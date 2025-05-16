--!nocheck
--!nolint

return function()
	if not getfenv(0).loadfile then
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
	local a, b = math.random(1, 100), math.random(1, 100)
	local guid = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
	
	writefile(guid, "return function(...) return select(1, ...) + select(2, ...) end")
	
	task.wait(0.2)
	
	local f = loadfile(guid)
	if not f then
		return {
			status = 500,
			message = "Failed to load file",
		}
	end
	
	if f()(a, b) ~= a + b then
		return {
			status = 500,
			message = "File did not return the expected value",
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
