--!nocheck
--!nolint

return function()
	if not getfenv(0).crypt or not getfenv(0).crypt.hash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local input = "MYRIAD"

	local algoMap = {
		md5 = "4f4c0116fe2faa1318448c548b35db329d04b95d6a564c9952674be7470292a8",

		sha1 = "fc7f43037330bdab9a8a3b19a7cbcde1ca35f0f3413e8109f2378d448e09d746",

		sha224 = "c289f37be9147ea83aea5178831674ac35512679c9ac728b0af58d1354aa9586",
		sha256 = "c9d5cae0702443d77159a3da3993a31e21fe71347946e8088e29c329b2fad67d",
		sha384 = "75805da0851cdb609be9cce35c7cf9b8c560fe1d015370d9ffdc7dc974cec3d2",
		sha512 = "9e5a7723b2776d0a26cfc7a1ee141ee7e23ab9be07a7bbe9a83ad9a44d6c932c",

		["sha3-256"] = "508c76d7f914e8f434b11c84fa5c55a086f86b8b0b38ce0dffa861fdfbdc77b3",
		["sha3-384"] = "1fb780f81b5a6013af2bfe6677a34439970c63b8447a00e0c23c0e5ff1a4bbd2",
		["sha3-512"] = "bc49e307d6fd0fc8f9ab5c9236ea93194dfa99dd89fea20e75aed6530bd6820b",
	}

	for algo, expected in pairs(algoMap) do
		local success, cryptOutput = pcall(crypt.hash, input, algo)

		if not success then
			return {
				status = 500,
				message = `Hashing failed with {algo}: {cryptOutput}`,
			}

		elseif not cryptOutput then
			return {
				status = 500,
				message = `Hashing failed, expected a hash. Algorithm: {algo}`,
			}

		elseif cryptOutput ~= expected then
			return {
				status = 500,
				message = `Hash mismatch. Algorithm: {algo}`,
			}
		end
	end

	return {
		status = 200,
		message = "Passed",
	}
end