--!nocheck
--!nolint

return function()
	local referenceCrypt = require("@dependencies/crypt/crypt.luau")

	if not crypt or not crypt.decrypt or not crypt.encrypt then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local key = "123456789abcdefg"
	local iv = referenceCrypt.base64encode("1234567890abcdef")
	local mode = "CBC"
	local data = crypt.encrypt("1234567890abcdef", key, iv, mode)

	local decryptSuccess, cryptDecrypted = pcall(function()
		return crypt.decrypt(data, key, iv, mode)
	end)

	if not decryptSuccess then
		return {
			status = 0,
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
