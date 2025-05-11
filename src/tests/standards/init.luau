--!nocheck

return function(name)
    local lastEntree = nil
    local numStandards = 0
	local passed = 0
	local failed = 0

	local uni = {
		success = "✅",
		fail = "❌",
		warn = "⚠️",

		bullet = "•",
	}
	local statusCodes = {
		[200] = uni.success,
		[400] = uni.fail,
		[500] = uni.warn,
	}
	local checks = {
		["crypt.encrypt"] = require("checks/crypt/encrypt.luau"),
		["crypt.decrypt"] = require("checks/crypt/decrypt.luau"),
		["crypt.generatekey"] = require("checks/crypt/generatekey.luau"),
		["crypt.generatebytes"] = require("checks/crypt/generatebytes.luau"),
		["crypt.hash"] = require("checks/crypt/hash.luau"),
	}

	for name in pairs(checks) do
        numStandards += 1
		lastEntree = name
	end

	print(`{name}\n`)

	for name, test in pairs(checks) do
		local success, result = pcall(test)
		if not success then
			warn(`{uni.bullet} {statusCodes[400]} {name}: {result} {lastEntree == name and "\n" or ""}`)
			failed += 1
			continue
		elseif result.status == 200 then
			print(`{uni.bullet} {statusCodes[result.status]} {name}: {result.message} {lastEntree == name and "\n" or ""}`)
			passed += 1
		else
			warn(`{uni.bullet} {statusCodes[result.status]} {name}: {result.message} {lastEntree == name and "\n" or ""}`)
			failed += 1
		end
	end

	print(`Summary:`)
	print(`{uni.bullet} Tested: {numStandards}`)
	print(`{uni.bullet} Passed: {passed}`)
	print(`{uni.bullet} Failed: {failed}`)
	print(`{uni.bullet} Pass Rate: {passed / numStandards * 100}%`)

	return {
		passed = passed,
		failed = failed,
	}
end
