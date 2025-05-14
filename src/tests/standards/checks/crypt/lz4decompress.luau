--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.lz4decompress then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local referenceCompressed = referenceCrypt.base64decode("YE1ZUklBRA==")
	local decompressed = crypt.lz4decompress(referenceCompressed, #plaintext)

	if typeof(decompressed) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif decompressed ~= plaintext then
		return {
			status = 500,
			message = "Compressed data doesn't match reference data",
		}
	end

	--// Alias test
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
