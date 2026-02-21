--!nocheck
--!nolint

return function()
	if not getnamecallmethod then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local method1, method2
	local simpleTable = Color3.new()

	pcall(function()
		simpleTable:MYRIAD1()
	end)

	task.spawn(function()
		method2 = getnamecallmethod()

		pcall(function()
			simpleTable.MYRIAD1(simpleTable)
		end)

		method2 = method2 or getnamecallmethod()
	end)
	
	task.wait()

	method1 = getnamecallmethod()
	
	if method1 ~= "MYRIAD1" then
		return {
			status = 500,
			message = "Didn't return the correct method",
		}
	elseif method2 ~= nil then
		return {
			status = 500,
			message = "Namecall method leaked into a new thread",
		}
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
		message = "Passed",
	}
end
