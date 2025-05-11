--!nocheck
--!nolint

return function()
	local Base64 = require("dependencies/HashLib/Base64.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.generatekey then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local decoded = Base64.Decode(crypt.generatekey())
	if type(decoded) ~= "string" then
		return {
			status = 500,
			message = "Generated key is not a string",
		}
	elseif #decoded ~= 32 then
		return {
			status = 500,
			message = "Key dosen't match the expected length",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
