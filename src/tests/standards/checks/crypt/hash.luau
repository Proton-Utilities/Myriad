--!nocheck
--!nolint

return function()
	local hashLib = require("dependencies/HashLib/HashLib.luau")

	if not crypt or not crypt.hash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local input = "MYRIAD"
	local algoMap = {
		md5 = "md5",
		sha1 = "sha1",
		sha256 = "sha256",
		sha384 = "sha384",
		sha512 = "sha512",
		["sha3-224"] = "sha3_224",
		["sha3-256"] = "sha3_256",
		["sha3-512"] = "sha3_512",
	}

	for cryptAlgo, mappedFunc in pairs(algoMap) do
		local success, cryptOutput = pcall(crypt.hash, input, cryptAlgo)
		local libFunc = hashLib[mappedFunc]

		if not success then
			return {
				status = 500,
				message = `Hashing failed. Algorithm: {cryptAlgo}`,
			}
		end

		local libOutput = libFunc(input)
		if cryptOutput ~= libOutput then
			return {
				status = 500,
				message = `Hash mismatch. Algorithm: {cryptAlgo}`,
			}
		end
	end

	return {
		status = 200,
		message = "Passed",
	}
end
