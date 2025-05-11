--!nocheck
--!nolint

return function()
	local base64 = require("dependencies/base64.luau")
	
	if not crypt or not crypt.generatekey then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local decoded = base64.decode(crypt.generatekey())
	if type(decoded) ~= "string" then
		return {
			status = 500,
			message = "Generated key is not a string",
		}
	elseif #decoded ~= 32 then
		return {
			status = 500,
			message = "Generated key dosen't match the expected length",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
