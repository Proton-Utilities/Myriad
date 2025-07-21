--!nocheck
--!nolint

return function()
	if not islclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end
	local cClosure = print

	if not islclosure(luaClosure) then
		return {
			status = 500,
			message = "Failed to identify lua closure",
		}
	elseif islclosure(cClosure) then
		return {
			status = 500,
			message = "Identified C closure as lua closure",
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
		message = `Passed`,
	}
end
