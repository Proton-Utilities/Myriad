--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
