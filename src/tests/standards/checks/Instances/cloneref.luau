--!nocheck
--!nolint

return function()
	if not cloneref then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalPart = Instance.new("Part")
	local originalService = game:GetService("CoreGui")
	
	if cloneref(originalService) == originalService then
		return {
			status = 500,
			message = "Cloned service cannot be equal to original reference",
		}
	end
	
	-- An "error" is only possible if setrawmetatable exists and was previously modified
	if setrawmetatable then
		setrawmetatable(originalPart, {
			__type = "Instance",
			__index = function()
				return {}
			end
		})
	end

	local originalPartNewRef = cloneref(originalPart)
	local collectGarbageDetecor = setmetatable({{}, originalPart}, {__mode = "v"})
	
	pcall(function()
		originalPartNewRef.Name = math.random()
	end)
	
	if originalPart == originalPartNewRef then
		return {
			status = 500,
			message = "Cloned part cannot be equal to original reference",
		}
	elseif originalPart.Name ~= originalPartNewRef.Name then
		return {
			status = 500,
			message = "The new xref does not contain the same metadata as the original",
		}
	end

	originalPart = nil
	
	local timeout = false
	local cancelThread = task.delay(5, function()
		timeout = true
		collectGarbageDetecor[1] = nil
	end)
	
	while collectGarbageDetecor[1] do
		task.wait()
	end
	
	if not timeout then
		task.cancel(cancelThread)
	else
		return {
			status = 500,
			message = "The garbage collector is not functioning properly",
		}
	end

	if collectGarbageDetecor[2] then
		return {
			status = 500,
			message = "Cloned part still holds the original xref",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"clonereference",
	})

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
