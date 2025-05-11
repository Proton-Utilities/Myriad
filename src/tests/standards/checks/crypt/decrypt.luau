--!nocheck
--!nolint

return function()
	local Aes = require("dependencies/AES/AES.luau")

	if not crypt or not crypt.decrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local plaintext = "MYRIAD"

	local cipher = Aes.new(key, Aes.modes.CTR, Aes.pads.Pkcs7)
	local aesSuccess, aesEncrypted = pcall(function()
		return cipher:Encrypt(plaintext)
	end)

	local aesDecryptedSuccess, aesDecrypted = pcall(function()
		return cipher:Decrypt(aesEncrypted)
	end)

	local cryptDecryptedSuccess, cryptDecrypted = pcall(function()
		return crypt.decrypt(aesEncrypted, key, nil, "CTR")
	end)

	if not aesSuccess then
		return {
			status = 500,
			message = "Reference encrypt failed",
		}
	elseif not aesDecryptedSuccess then
		return {
			status = 500,
			message = "Decrypt failed (reference)",
		}
	elseif not cryptDecryptedSuccess then
		return {
			status = 500,
			message = "Decrypt failed (crypt)",
		}
	end

	local aesDecryptedString = buffer.tostring(aesDecrypted)
	local cryptDecryptedString = buffer.tostring(cryptDecrypted)

	if aesDecryptedString ~= cryptDecryptedString then
		return {
			status = 500,
			message = "Mismatch between crypt and reference",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
