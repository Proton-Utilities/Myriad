--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.base64decode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local reference = referenceCrypt.base64encode(plaintext)
	local decoded = crypt.base64decode(reference)

	if not reference or typeof(reference) ~= "string" then
		return {
			status = 500,
			message = "Reference crypt failed",
		}
	elseif not decoded or typeof(decoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif decoded ~= plaintext then
		return {
			status = 500,
			message = "Decoded data doesn't match reference data",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"base64_decode",
		"crypt.base64.decode",
		"base64.decode",
		"crypt.base64_decode",
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
