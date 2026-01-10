--!nocheck
--!nolint

return function()
	if not crypt or not crypt.hash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local input = "MYRIAD"

	local algoMap = {
		md5 = "aa39362cc72b25918aaf443d3c7e86ef",

		sha1 = "8a0e38abbd784796e0ceb2455098bfbd31d1551f",

		sha224 = "6217b88a947fcf19f3266a1e68645db03892f301fc78d1b594678e72",
		sha256 = "0597955faf24cde12e5f91f77794a0a938108bca686df0cad269489140889068",
		sha384 = "368c5054df9ffab72c8c1bb8b46f8376cd8dc9aafb62e0970453a01dd203b384c4806b24e4f025832353467e2cfe8bff",
		sha512 = "6454bf8242f5184e3c770afdf098f8f11ec1d4f6bc09f68923efdb27b97c45583e2211df38d42c282ca64429b4af3b54e42003c15d9df5c182f85605c5dd749d",

		["sha3-256"] = "406ea26a267c8eda63ae494c35e86e26d5b83b67af1074de8c3b65dcf74fab16",
		["sha3-384"] = "57a8309bb9f263d50b481f176e1463d70e6fa50e4bcac9e7f5e0c20aae3dc8661dffd17649b22a29ae19e815bdb51e13",
		["sha3-512"] = "4776a57dc3c5611a09d868a9adfba256484a95c7923a408d3274330f3d1e46a1dcd26a77fb9690c90111e182e303710f0d40fbd6957c2f5da0d4f7828b16dde9",
	}

	for algo, expected in pairs(algoMap) do
		local success, cryptOutput = pcall(crypt.hash, input, algo)

		if
			not success
			and (
				cryptOutput:lower():find("unknown")
				or cryptOutput:lower():find("not found")
				or cryptOutput:lower():find("exist")
			)
		then
			return {
				status = 0,
				message = `Hashing failed, executor dosen't seem to have algo: {algo}`,
			}
		elseif not success then
			return {
				status = 0,
				message = `Hashing failed with {algo}: {cryptOutput}`,
			}
		elseif not cryptOutput then
			return {
				status = 500,
				message = `Hashing failed, expected a hash. Algorithm: {algo}`,
			}
		elseif cryptOutput:lower() ~= expected:lower() then
			return {
				status = 500,
				message = `Hash mismatch. Algorithm: {algo}`,
			}
		end
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
