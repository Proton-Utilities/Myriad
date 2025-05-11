--!nocheck
--!nolint

return function()
	local referenceCrypt = require("dependencies/crypt/crypt.luau")

	if not getfenv(0).crypt or not getfenv(0).crypt.hmac then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local plaintext = "MYRIAD"
	local key = "secret_key"
	local algorithm = "sha256"

	local reference = "FaDPiTSLlbxRP5rKvomt0dzwl7zhszc46/QFPsZRGWY="
	local assumed = crypt.hmac(key, plaintext, algorithm)

	if not assumed then
		return {
			status = 500,
			message = "Did not return the expected type",
		}
	elseif assumed ~= reference then
		return {
			status = 500,
			message = "Data doesn't match reference data",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
