--!nocheck
--!nolint

return function()
	if not setrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getrawmetatable then
		return {
			status = 401,
			message = "Dependency 'getrawmetatable' not found",
		}
	end

	local sillyString = "Netflix CE on top!"
	local randomString = ""
	
	for _ = 1, 32 do
		randomString ..= string.char(math.random(1, 255))
	end
	
	local originalStringMETA = getrawmetatable(randomString)
	local toSetMETA = table.clone(originalStringMETA)
	
	toSetMETA.__type = "MYRIAD"
	toSetMETA.__call = function(self)
		if self == randomString then
			return sillyString
		end
	end
	
	local success, returnedObject = pcall(setrawmetatable, randomString, toSetMETA)
	
	if not success then
		return {
			status = 500,
			message = `Unable to change the metatable of a string: {returnedObject}`,
		}
		
	elseif getrawmetatable(randomString) ~= toSetMETA then
		return {
			status = 500,
			message = "The meta table did not change to the new one",
		}
		
	elseif typeof(randomString) ~= "MYRIAD" then
		-- It is important to change this because it is impossible for setmetatable
		pcall(setrawmetatable, randomString, originalStringMETA)
		return {
			status = 500,
			message = "The __type parameter could not be set in the string",
		}
		
	else
		local success, result = pcall(randomString)
		pcall(setrawmetatable, randomString, originalStringMETA)
		
		if not success then
			return {
				status = 500,
				message = "failed to set __call",
			}
		elseif result ~= sillyString then
			return {
				status = 500,
				message = `failed to set __call: {result} ~= {sillyString}`,
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