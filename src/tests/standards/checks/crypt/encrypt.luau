--!nocheck
--!nolint

return function()
	local referenceCrypt = require("@dependencies/crypt/crypt.luau")

	if not crypt or not crypt.encrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "1234567890abcdef"
	local key = referenceCrypt.base64encode("GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY")
	local iv = referenceCrypt.base64encode("1234567890abcdef")
	local mode = "CBC"

	local cryptSuccess, cryptEncrypted = pcall(function()
		return crypt.encrypt(plaintext, key, iv, mode)
	end)

	if not cryptSuccess then
		return {
			status = 0,
			message = "Encrypt failed: " .. tostring(cryptEncrypted),
		}
    end

	local reference = "jxF03fu7V3WKm7b2oRMo9HYz+KVDymqKU29qmsiTP4E="
	local assumed = cryptEncrypted
	
	if assumed ~= reference then
		return {
			status = 500,
			message = "Encrypted data doesn't match reference data",
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
