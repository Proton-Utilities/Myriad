--!nocheck
--!nolint

return function()
	if not loadstring then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local funcOrNil, errorMessage = loadstring("MYRIAD", "=MYRIAD")

	local func = loadstring([[
		globalVar = {"Hello", "World"}
	]], "=MYRIAD")
	
	func()

	if not globalVar or not (globalVar[1] == "Hello" and globalVar[2] == "World") then
		return {
			status = 500,
			message = "Global variable insert from loadstring not found",
		}
	elseif funcOrNil ~= nil then
		return {
			status = 500,
			message = "Didn't error on incomplete expression",
		}
	else
		local funcSource = debug.info(func, "s")
		if funcSource ~= "MYRIAD" then
			return {
				status = 500,
				message = `The source is "{funcSource}" instead of "MYRIAD".`,
			}
		end
	end

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
