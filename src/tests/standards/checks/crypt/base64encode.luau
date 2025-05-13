--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.base64encode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local encoded = crypt.base64encode(plaintext)

	if not encoded or typeof(encoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif encoded ~= referenceCrypt.base64encode(plaintext) then
		return {
			status = 500,
			message = "Encoded data doesn't match reference data",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"base64_encode",
		"crypt.base64.encode",
		"base64.encode",
		"crypt.base64_encode",
	})

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
