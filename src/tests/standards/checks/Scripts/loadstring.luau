--!nocheck
--!nolint

return function()
	if not getfenv(0).loadstring then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local func = loadstring("MYRIAD", "MYRIAD")

	loadstring([[
		globalVar = {"Hello", "World"}
	]])()
	
	if not globalVar or not (globalVar[1] == "Hello" and globalVar[2] == "World") then
		return {
			status = 500,
			message = "Global variable insert from loadstring not found",
		}
	elseif func ~= nil then
		return {
			status = 500,
			message = "Didn't error on incomplete expression",
		}
	end

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
