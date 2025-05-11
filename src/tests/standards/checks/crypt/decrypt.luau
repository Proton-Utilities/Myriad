--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not crypt or not crypt.decrypt then
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
