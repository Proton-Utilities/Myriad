--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.decrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local data = referenceCrypt.base64decode("G3H9Fk0PSWKs46qqlbA3VKnzfz7wRRTh")
	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local iv = "1234567890abcdef"

	local decryptSuccess, cryptDecrypted = pcall(function()
		return crypt.decrypt(data, key, iv)
	end)

	if not decryptSuccess then
		return {
			status = 500,
			message = "Decrypt failed: " .. tostring(cryptDecrypted),
		}
	elseif not cryptDecrypted then
		return {
			status = 500,
			message = "Decrypt returned nothing",
		}
	elseif cryptDecrypted ~= "1234567890abcdef" then
		return {
			status = 500,
			message = "Decrypted data doesn't match reference data",
		}
    end

	return {
		status = 200,
		message = "Passed",
	}
end
