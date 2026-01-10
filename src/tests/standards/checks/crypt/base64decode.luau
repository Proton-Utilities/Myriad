--!nocheck
--!nolint

return function()
	local referenceCrypt = require("@dependencies/crypt/crypt.luau")

	if not crypt or not crypt.base64decode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local reference = referenceCrypt.base64encode(plaintext)
	local decoded = crypt.base64decode(reference)
	local emptyDecoded = crypt.base64decode("")

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
	elseif not emptyDecoded or typeof(emptyDecoded) ~= "string" then
		return {
			status = 500,
			message = "Empty string decode failed to return string",
		}
	elseif emptyDecoded ~= "" then
		return {
			status = 500,
			message = "Empty string decode mismatch",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
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
