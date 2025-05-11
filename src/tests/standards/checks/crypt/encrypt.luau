--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not crypt or not crypt.encrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "1234567890abcdef"
	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local iv = "1234567890abcdef"

	local cryptSuccess, cryptEncrypted = pcall(function()
		return crypt.encrypt(plaintext, key, iv)
	end)

	if not cryptSuccess then
		return {
			status = 500,
			message = "Encrypt failed",
		}
    end

	local reference = "G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh"
	local assumed = referenceCrypt.base64encode(cryptEncrypted)
	
	if assumed ~= reference then
		print(assumed)
		print(reference)
		return {
			status = 500,
			message = "Encrypted data mismatch",
		}
    end

	return {
		status = 200,
		message = "Passed",
	}
end
