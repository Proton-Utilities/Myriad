--!nocheck
--!nolint

return function()
	if type(getsignalwhitelist) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local s, whitelist = pcall(function()
		return getsignalwhitelist()
	end)

	if not s then
		return {
			status = 0,
			message = `Ambiguous error: {whitelist}`,
		}
	end

	if type(whitelist) ~= "table" then
		return {
			status = 500,
			message = "Return type is not a table",
		}
	end

	if #whitelist == 0 then
		return {
			status = 500,
			message = "Returned filter whitelist array should be populated.",
		}
	end

	if type(whitelist[1]) ~= "table" then
		return {
			status = 500,
			message = "Members of the returned array are not tables.",
		}
	end

	if type(whitelist[1].Event) ~= "string" or type(whitelist[1].Parent) ~= "string" then
		return {
			status = 500,
			message = "Members of the returned table do not contain appropriate fields 'Event' and 'Parent'.",
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
