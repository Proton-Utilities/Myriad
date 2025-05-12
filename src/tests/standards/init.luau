--!nocheck

return function(name, output)
	output:Clear()

	local lastEntreePerGroup = {}
	local numStandards = 0
	local passed = 0
	local failed = 0
	local warn = function(message)
		output:AppendText(`<font color="#FFA500">{tostring(message)}</font>`)
	end

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
		crypt = {
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
		},

		Drawing = {
			["Drawing"] = require("checks/Drawing/Drawing.luau"),
			["Drawing.new"] = require("checks/Drawing/new.luau"),
			["Drawing.Fonts"] = require("checks/Drawing/Fonts.luau"),
			["getrenderproperty"] = require("checks/Drawing/getrenderproperty.luau"),
			["setrenderproperty"] = require("checks/Drawing/setrenderproperty.luau"),
			["cleardrawcache"] = require("checks/Drawing/cleardrawcache.luau"),
			["isrenderobj"] = require("checks/Drawing/isrenderobj.luau"),
		},

		Environment = {
			["getgenv"] = require("checks/Environment/getgenv.luau"),
			["getrenv"] = require("checks/Environment/getrenv.luau"),
			["getgc"] = require("checks/Environment/getgc.luau"),
		},

		Instances = {
			["gethui"] = require("checks/Instances/gethui.luau"),
		},

		Closures = {
			["islclosure"] = require("checks/Closures/islclosure.luau"),
			["iscclosure"] = require("checks/Closures/iscclosure.luau"),
			["clonefunction"] = require("checks/Closures/clonefunction.luau"),
			["getfunctionhash"] = require("checks/Closures/getfunctionhash.luau"),
			["hookfunction"] = require("checks/Closures/hookfunction.luau"),
			["newcclosure"] = require("checks/Closures/newcclosure.luau"),
		},

		Miscellaneous = {
			["identifyexecutor"] = require("checks/Miscellaneous/identifyexecutor.luau"),
		},

		Scripts = {
			["getscripts"] = require("checks/Scripts/getscripts.luau"),
			["getloadedmodules"] = require("checks/Scripts/getloadedmodules.luau"),
			["getsenv"] = require("checks/Scripts/getsenv.luau"),
		},
	}

	for groupName, group in checks do
		lastEntreePerGroup[groupName] = nil
		for name in group do
			numStandards += 1
			lastEntreePerGroup[groupName] = name
		end
	end

	for groupName, group in checks do
		output:AppendText(groupName .. ":")
		for name, test in group do
			local success, result = pcall(test)
			if not success then
				warn(`{uni.bullet} {statusCodes[400]} {name}: {result} {lastEntreePerGroup[groupName] == name and "\n" or ""}`)
				failed += 1
				continue
			elseif result.status == 200 then
				output:AppendText(
					`{uni.bullet} {statusCodes[result.status]} {name}: {result.message} {lastEntreePerGroup[groupName] == name and "\n" or ""}`
				)
				passed += 1
			else
				warn(
					`{uni.bullet} {statusCodes[result.status]} {name}: {result.message} {lastEntreePerGroup[groupName] == name and "\n" or ""}`
				)
				failed += 1
			end
		end
	end

	output:AppendText(`Summary:`)
	output:AppendText(`{uni.bullet} Executor: {identifyexecutor and identifyexecutor() or "Unknown"}`)
	output:AppendText(`{uni.bullet} Tested: {numStandards}`)
	output:AppendText(`{uni.bullet} Passed: {passed}`)
	output:AppendText(`{uni.bullet} Failed: {failed}`)
	output:AppendText(`{uni.bullet} Pass Rate: {math.round(passed / numStandards * 100)}%`)

	return {
		passed = passed,
		failed = failed,
	}
end
