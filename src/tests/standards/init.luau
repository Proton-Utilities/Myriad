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
		-- crypt
		["crypt"] = require("checks/crypt/crypt.luau"),
		["crypt.encrypt"] = require("checks/crypt/encrypt.luau"),
		["crypt.decrypt"] = require("checks/crypt/decrypt.luau"),
		["crypt.generatekey"] = require("checks/crypt/generatekey.luau"),
		["crypt.generatebytes"] = require("checks/crypt/generatebytes.luau"),
		["crypt.base64encode"] = require("checks/crypt/base64encode.luau"),
		["crypt.base64decode"] = require("checks/crypt/base64decode.luau"),
		["crypt.lz4compress"] = require("checks/crypt/lz4compress.luau"),
		["crypt.lz4decompress"] = require("checks/crypt/lz4decompress.luau"),
		["crypt.hash"] = require("checks/crypt/hash.luau"),
		["crypt.random"] = require("checks/crypt/random.luau"),
		["crypt.hmac"] = require("checks/crypt/hmac.luau"),

		-- Drawing
		["Drawing"] = require("checks/Drawing/Drawing.luau"),
		["Drawing.new"] = require("checks/Drawing/new.luau"),
		["Drawing.Fonts"] = require("checks/Drawing/Fonts.luau"),

		["getrenderproperty"] = require("checks/Drawing/getrenderproperty.luau"),
		["setrenderproperty"] = require("checks/Drawing/setrenderproperty.luau"),
		["cleardrawcache"] = require("checks/Drawing/cleardrawcache.luau"),
		["isrenderobj"] = require("checks/Drawing/isrenderobj.luau"),

		-- Instances
		["gethui"] = require("checks/Instances/gethui.luau"),

		-- Closures
		["islclosure"] = require("checks/Closures/islclosure.luau"),
		["iscclosure"] = require("checks/Closures/iscclosure.luau"),
		["clonefunction"] = require("checks/Closures/clonefunction.luau"),
		["getfunctionhash"] = require("checks/Closures/getfunctionhash.luau"),
		["hookfunction"] = require("checks/Closures/hookfunction.luau"),
		["newcclosure"] = require("checks/Closures/newcclosure.luau"),
		
		-- Miscellaneous
		["identifyexecutor"] = require("checks/Miscellaneous/identifyexecutor.luau"),

		-- Scripts
		["getscripts"] = require("checks/Scripts/getscripts.luau"),
	}

	for name in next, checks do
        numStandards += 1
		lastEntree = name
	end

	print(`{name}\n`)

	for name, test in next, checks do
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
	print(`{uni.bullet} Pass Rate: {math.round(passed / numStandards * 100)}%`)

	return {
		passed = passed,
		failed = failed,
	}
end
