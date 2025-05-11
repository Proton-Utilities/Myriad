--!nocheck
--!nolint

return function()
	local Base64 = require("dependencies/HashLib/Base64.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.base64decode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local reference = Base64.Encode(plaintext)
	local decoded = crypt.base64decode(reference)

	if not reference or typeof(reference) ~= "string" then
		return {
			status = 500,
			message = "Reference crypt failed ):",
		}
	elseif not decoded or typeof(decoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif decoded ~= plaintext then
		return {
			status = 500,
			message = "Decoded data mismatch",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
