--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.generatekey then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local decoded = referenceCrypt.base64decode(crypt.generatekey())
	if type(decoded) ~= "string" then
		return {
			status = 500,
			message = "Generated key doesn't form a string",
		}
	elseif #decoded ~= 32 then
		return {
			status = 500,
			message = "Key dosen't match the expected length",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

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
