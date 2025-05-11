--!nocheck
--!nolint

return function()
	local Base64 = require("dependencies/HashLib/Base64.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.base64encode then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local encoded = crypt.base64encode(plaintext)

	if not encoded or typeof(encoded) ~= "string" then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif encoded ~= Base64.Encode(plaintext) then
		return {
			status = 500,
			message = "Encoded data mismatch",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
