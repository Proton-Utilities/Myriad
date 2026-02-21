--!nocheck
--!nolint

return function()
	if not clonefunction then
		return {
			status = 400,
			message = "Global not found",
		}
	end
	
	local dInfo, tWait = debug.info, task.wait
	local randomEnv, validYield = {}, false
	
	local function originalFunction(...)
		local Stacks = 0
		for i = 1, 20 do
			if dInfo(i, "f") then
				Stacks += 1
			end
		end
		
		tWait()
		validYield = true

		return 1, Stacks, ...
	end
	
	setfenv(originalFunction, randomEnv)
	
	local clonedFunction = clonefunction(originalFunction)

	if clonedFunction == originalFunction then
		return {
			status = 500,
			message = "Cloned function is the same as the original",
		}
	else
		local _, orgStacks = originalFunction()
		validYield = false
		
		local result = table.pack(clonedFunction(nil))
		
		if not validYield then
			return {
				status = 500,
				message = "Cloned function is not yielding",
			}
		elseif result[1] ~= 1 then
			return {
				status = 500,
				message = "Cloned function is changing the first argument",
			}
		elseif result[3] ~= nil then
			return {
				status = 500,
				message = "Cloned function is changing the second argument",
			}
		elseif result.n < 3 then
			return {
				status = 500,
				message = "Cloned function is trimming the second argument",
			}
		elseif result.n > 3 then
			return {
				status = 500,
				message = "Cloned function is adding extra arguments",
			}
		elseif result[2] ~= orgStacks then
			return {
				status = 500,
				message = "Cloned function is changing the stack count",
			}
		end
		
		local orgSource, orgName, orgLine, orgNArgs, orgIsVararg = debug.info(originalFunction, "snla")
		local copSource, copName, copLine, copNArgs, copIsVararg = debug.info(clonedFunction, "snla")
		
		if orgSource ~= copSource or
			orgName ~= copName or 
			orgLine ~= copLine or 
			orgNArgs ~= copNArgs or 
			orgIsVararg ~= copIsVararg then
			
			return {
				status = 500,
				message = "Cloned function is changing info",
			}
		elseif getfenv(clonedFunction) ~= randomEnv then
			return {
				status = 500,
				message = "Cloned function is changing the environment",
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
		message = "Passed",
	}
end
