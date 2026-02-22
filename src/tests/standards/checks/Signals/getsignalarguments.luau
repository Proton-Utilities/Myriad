--!nocheck
--!nolint

return function()
	if type(getsignalarguments) ~= "function" then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local Event = Instance.new("Part").Touched
	local s, args = pcall(function()
		return getsignalarguments(Event)
	end)

	if not s then
		return {
			status = 0,
			message = `Ambiguous error: {args}`,
		}
	end

	if type(args) ~= "table" then
		return {
			status = 500,
			message = "Return type is not a table",
		}
	end

	if #args == 0 then
		return {
			status = 500,
			message = "Returned array should be populated.",
		}
	end

	if type(args[1]) ~= "string" then
		return {
			status = 500,
			message = "Members of the returned array are not strings.",
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
