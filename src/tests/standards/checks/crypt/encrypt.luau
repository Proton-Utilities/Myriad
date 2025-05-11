--!nocheck
--!nolint

return function()
	local Aes = require("dependencies/AES/AES.luau")

	if not crypt or not crypt.custom or not crypt.custom.encrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local key = "GMVIsgHnxm0YDYwUGkBhtRWSrSsfRMjY"
	local plaintext = "MYRIAD"

	local cryptSuccess, cryptEncrypted = pcall(function()
		return crypt.encrypt(plaintext, key, nil, "CTR")
	end)

	local cipher = Aes.new(key, Aes.modes.CTR, Aes.pads.Pkcs7)
	local aesSuccess, aesEncrypted = pcall(function()
		return cipher:Encrypt(plaintext)
	end)

	if not cryptSuccess then
		return {
			status = 500,
			message = "Encrypt failed (crypt)",
		}
    elseif not aesSuccess then
        return {
            status = 500,
            message = "Encrypt failed (reference)",
        }
    end

	local aesBytes = buffer.tostring(aesEncrypted)

	if cryptEncrypted ~= aesBytes then
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
