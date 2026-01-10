--!nocheck
--!nolint

return function()
	local referenceCrypt = require("@dependencies/crypt/crypt.luau")

	if not crypt or not crypt.generatekey then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local key1 = referenceCrypt.base64decode(crypt.generatekey())
	local key2 = referenceCrypt.base64decode(crypt.generatekey())

	if type(key1) ~= "string" then
		return {
			status = 500,
			message = "Generated key doesn't form a string",
		}
	elseif #key1 ~= 32 then
		return {
			status = 500,
			message = "Key dosen't match the expected length",
		}
	elseif key1 == key2 then
		return {
			status = 500,
			message = "Keys aren't unique",
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
