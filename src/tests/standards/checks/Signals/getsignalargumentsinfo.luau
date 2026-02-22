--!nocheck
--!nolint

return function()
	if type(getsignalargumentsinfo) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local Event = Instance.new("Part").Touched
	local s, info = pcall(function()
		return getsignalargumentsinfo(Event)
	end)

	if not s then
		return {
			status = 0,
			message = `Ambiguous error: {info}`,
		}
	end

	if type(info) ~= "table" then
		return {
			status = 500,
			message = "Return type is not a table",
		}
	end

	if #info == 0 then
		return {
			status = 500,
			message = "Returned array should be populated.",
		}
	end

	if type(info[1]) ~= "table" then
		return {
			status = 500,
			message = "Members of the returned array are not tables.",
		}
	end

	if type(info[1].Type) ~= "string" or type(info[1].Name) ~= "string" then
		return {
			status = 500,
			message = "Members of the returned table do not contain appropriate fields 'Name' and 'Type'.",
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
