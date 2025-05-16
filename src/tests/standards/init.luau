--!nocheck

return function(name, tab)
	--// Variables
	local currentTask = nil
	local output = nil
	local lastEntreePerGroup = {}
	local results = {}

	local testConfig = {
		checkpointDelay = 0,
		statusFilter = false,
		stripRichtext = false,
		formatDiff = false,
		includeMetadata = false,
	}

	local uni = {
		bullet = "•",
	}

	local statusCodes = {
		[0] = "❓", -- Call errored/failed
		[200] = "✅", -- Passed
		[400] = "🔎", -- Global not found
		[401] = "📦", -- Dependency not found
		[500] = "🛠️", -- Failed functionality test
		[501] = "🏷️", -- Missing alias
	}

	local checks = {
		cache = {
			["cache.invalidate"] = require("checks/cache/invalidate.luau"),
			["cache.iscached"] = require("checks/cache/iscached.luau"),
			["cache.replace"] = require("checks/cache/replace.luau"),
		},

		Closures = {
			["islclosure"] = require("checks/Closures/islclosure.luau"),
			["iscclosure"] = require("checks/Closures/iscclosure.luau"),
			["isexecutorclosure"] = require("checks/Closures/isexecutorclosure.luau"),
			["newcclosure"] = require("checks/Closures/newcclosure.luau"),
			["clonefunction"] = require("checks/Closures/clonefunction.luau"),
			["hookfunction"] = require("checks/Closures/hookfunction.luau"),
			["restorefunction"] = require("checks/Closures/restorefunction.luau"),
			["getfunctionhash"] = require("checks/Closures/getfunctionhash.luau"),
			["checkcaller"] = require("checks/Closures/checkcaller.luau"),
		},

		crypt = {
			["crypt.encrypt"] = require("checks/crypt/encrypt.luau"),
			["crypt.decrypt"] = require("checks/crypt/decrypt.luau"),
			["crypt.generatekey"] = require("checks/crypt/generatekey.luau"),
			["crypt.generatebytes"] = require("checks/crypt/generatebytes.luau"),
			["crypt.base64encode"] = require("checks/crypt/base64encode.luau"),
			["crypt.base64decode"] = require("checks/crypt/base64decode.luau"),
			["crypt.hash"] = require("checks/crypt/hash.luau"),
			["crypt.random"] = require("checks/crypt/random.luau"),
			["crypt.hmac"] = require("checks/crypt/hmac.luau"),
		},

		debug = {
			["debug.getconstant"] = require("checks/debug/getconstant.luau"),
			["debug.getconstants"] = require("checks/debug/getconstants.luau"),
			["debug.getproto"] = require("checks/debug/getproto.luau"),
			["debug.getprotos"] = require("checks/debug/getprotos.luau"),
			["debug.getupvalue"] = require("checks/debug/getupvalue.luau"),
			["debug.getupvalues"] = require("checks/debug/getupvalues.luau"),
			["debug.getstack"] = require("checks/debug/getstack.luau"),
			["debug.setconstant"] = require("checks/debug/setconstant.luau"),
			["debug.setupvalue"] = require("checks/debug/setupvalue.luau"),
		},

		Drawing = {
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
			["filtergc"] = require("checks/Environment/filtergc.luau"),
		},

		Filesystem = {
			["writefile"] = require("checks/Filesystem/writefile.luau"),
			["readfile"] = require("checks/Filesystem/readfile.luau"),
			["makefolder"] = require("checks/Filesystem/makefolder.luau"),
		},

		Input = {
			["setclipboard"] = require("checks/Input/setclipboard.luau"),
			["setrbxclipboard"] = require("checks/Input/setrbxclipboard.luau"),
		},

		Instances = {
			["gethui"] = require("checks/Instances/gethui.luau"),
			["cloneref"] = require("checks/Instances/cloneref.luau"),
			["compareinstances"] = require("checks/Instances/compareinstances.luau"),
			["fireclickdetector"] = require("checks/Instances/fireclickdetector.luau"),
			["fireproximityprompt"] = require("checks/Instances/fireproximityprompt.luau"),
			["saveinstance"] = require("checks/Instances/saveinstance.luau"),
		},

		Metatable = {
			["getrawmetatable"] = require("checks/Metatable/getrawmetatable.luau"),
			["setrawmetatable"] = require("checks/Metatable/setrawmetatable.luau"),
			["setreadonly"] = require("checks/Metatable/setreadonly.luau"),
			["isreadonly"] = require("checks/Metatable/isreadonly.luau"),
		},

		Miscellaneous = {
			["identifyexecutor"] = require("checks/Miscellaneous/identifyexecutor.luau"),
			["setfpscap"] = require("checks/Miscellaneous/setfpscap.luau"),
			["getfpscap"] = require("checks/Miscellaneous/getfpscap.luau"),
			["request"] = require("checks/Miscellaneous/request.luau"),
			["lz4compress"] = require("checks/Miscellaneous/lz4compress.luau"),
			["lz4decompress"] = require("checks/Miscellaneous/lz4decompress.luau"),
			["queue_on_teleport"] = require("checks/Miscellaneous/queue_on_teleport.luau"),
		},

		External = {
			["messagebox"] = require("checks/External/messagebox.luau"),
			["rconsoleprint"] = require("checks/External/rconsoleprint.luau"),
			["rconsoleinfo"] = require("checks/External/rconsoleinfo.luau"),
			["rconsolewarn"] = require("checks/External/rconsolewarn.luau"),
			["rconsoleerr"] = require("checks/External/rconsoleerr.luau"),
			["rconsoleinput"] = require("checks/External/rconsoleinput.luau"),
			["rconsoleclear"] = require("checks/External/rconsoleclear.luau"),
			["rconsolename"] = require("checks/External/rconsolename.luau"),
			["rconsolehide"] = require("checks/External/rconsolehide.luau"),
			["rconsoleshow"] = require("checks/External/rconsoleshow.luau"),
		},

		Reflection = {
			["setthreadidentity"] = require("checks/Reflection/setthreadidentity.luau"),
			["getthreadidentity"] = require("checks/Reflection/getthreadidentity.luau"),
			["setscriptable"] = require("checks/Reflection/setscriptable.luau"),
		},

		Scripts = {
			["getscripts"] = require("checks/Scripts/getscripts.luau"),
			["getrunningscripts"] = require("checks/Scripts/getrunningscripts.luau"),
			["getcallingscript"] = require("checks/Scripts/getcallingscript.luau"),
			["getloadedmodules"] = require("checks/Scripts/getloadedmodules.luau"),
			["getsenv"] = require("checks/Scripts/getsenv.luau"),
			["getscripthash"] = require("checks/Scripts/getscripthash.luau"),
			["loadstring"] = require("checks/Scripts/loadstring.luau"),
			["getscriptbytecode"] = require("checks/Scripts/getscriptbytecode.luau"),
			["getscriptclosure"] = require("checks/Scripts/getscriptclosure.luau"),
			["decompile"] = require("checks/Scripts/decompile.luau"),
		},

		Signals = {},

		WebSocket = {
			["connect"] = require("checks/WebSocket/connect.luau"),
		},
	}

	--// Functions
	local printc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(message)
	end

	local warnc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(`<font color="#FFA500">{message}</font>`)
	end

	local function test()
		if currentTask then
			task.cancel(currentTask)
		end

		currentTask = task.spawn(function()
			local passed = 0
			local failed = 0
			local numStandards = 0

			for groupName, group in checks do
				lastEntreePerGroup[groupName] = nil
				results[groupName] = {}

				for name in group do
					numStandards += 1
					lastEntreePerGroup[groupName] = name
				end
			end

			local flattened = {}
			for groupName, group in checks do
				for name, test in group do
					table.insert(flattened, {
						groupName = groupName,
						name = name,
						test = test,
					})
				end
			end

			for i, entry in ipairs(flattened) do
				local groupName = entry.groupName
				local name = entry.name
				local test = entry.test

				local nextEntry = flattened[i + 1]

				local success, result = pcall(test)
				local status, message

				if not success then
					status = 0
					message = result
					failed += 1
					output:SetValue(`<font color="#FFA500">{name} failed</font>`)
				elseif result.status == 200 then
					status = result.status
					message = result.message
					passed += 1
					output:SetValue(`<font color="#84FF00">{name} passed</font>`)
				else
					status = result.status
					message = result.message
					failed += 1
					output:SetValue(`<font color="#FFA500">{name} failed</font>`)
				end

				if nextEntry then
					printc(`Next test: {nextEntry.name}`)
				end

				table.insert(results[groupName], {
					name = name,
					status = status,
					message = message,
					isLast = lastEntreePerGroup[groupName] == name,
				})

				if testConfig.checkpointDelay ~= 0 then
					task.wait(testConfig.checkpointDelay)
				end
			end

			output:Clear()

			for groupName, groupResults in results do
				local includesFilter = false
				local groupProcessed = false

				for _, result in groupResults do
					if not testConfig.statusFilter or statusCodes[result.status] == testConfig.statusFilter then
						if not groupProcessed then
							printc(groupName .. ":")
							groupProcessed = true
						end
						local displayFunc = (result.status == 200) and printc or warnc
						displayFunc(`{uni.bullet} {statusCodes[result.status]} {result.name}: {result.message}`)
						includesFilter = true
					end
				end

				if includesFilter then
					printc("")
				end
			end

			if testConfig.stripRichtext then
				output:SetValue(output:GetValue():gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
			end
			if testConfig.formatDiff then -- Why is GPT so goated
				output:SetValue(output:GetValue():gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
				local input = output:GetValue()
				local lines = {}

				for i, line in ipairs(string.split(input, "\n")) do
					local cleaned = line:gsub("^•%s*", ""):gsub("^%s*(.-)%s*$", "%1")

					if cleaned ~= "" then
						if cleaned:find("✅") then
							lines[i] = "+ " .. cleaned
						elseif
							cleaned:find("🔎")
							or cleaned:find("❓")
							or cleaned:find("🛠️")
							or cleaned:find("📦")
							or cleaned:find("🏷️")
						then
							lines[i] = "- " .. cleaned
						else
							lines[i] = cleaned
						end
					else
						lines[i] = ""
					end
				end

				output:SetValue(table.concat(lines, "\n"))
			end

			printc(`Summary:`)
			printc(`{uni.bullet} Executor: {identifyexecutor and identifyexecutor() or "Unknown"}`)
			printc(`{uni.bullet} Tested: {numStandards}`)
			printc(`{uni.bullet} Passed: {passed}`)
			printc(`{uni.bullet} Failed: {failed}`)
			printc(`{uni.bullet} Pass Rate: {math.round(passed / numStandards * 100)}%`)

			local executor, executorVers = identifyexecutor()

			if testConfig.includeMetadata then
				local input = output:GetValue()

				local metadata = string.format(
					'@metadata {\n  "generated": "%s",\n  "executor": "%s",\n  "version": "%s",\n} \n\n',
					DateTime.now():ToIsoDate(),
					executor,
					executorVers
				)

				output:SetValue(metadata .. input)
			end

			game.ReplicatedStorage.res:FireServer(results, executor, executorVers)
		end)
	end

	--// Initialize
	tab:Button({
		Text = "Run test",
		Callback = function()
			coroutine.wrap(test)()
		end,
	})

	do -- Test Options
		local testOptions = tab:TreeNode({ Title = "Test options" })

		testOptions:Combo({
			Label = "Status filter",
			Selected = "All",
			Items = {
				"All",
				"✅ Pass",
				"❓ Ambiguous",
				"🔎 Missing",
				"📦 Dependency",
				"🛠️ Functionality",
				"🏷️ Alias",
			},
			Callback = function(self, value)
				local lookup = { -- It won't be in order if I don't do it this way
					["All"] = false,
					["✅ Pass"] = statusCodes[200],
					["❓ Ambiguous"] = statusCodes[0],
					["🔎 Missing"] = statusCodes[400],
					["📦 Dependency"] = statusCodes[401],
					["🛠️ Functionality"] = statusCodes[500],
					["🏷️ Alias"] = statusCodes[501],
				}

				testConfig.statusFilter = lookup[value]
			end,
		})

		testOptions:SliderFloat({
			Label = "Checkpoint delay",
			Default = 0.0,
			Minimum = 0.0,
			Maximum = 1.0,
			Format = "Delay = %.2f",
			Callback = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Include Metadata",
			Callback = function(self, value)
				testConfig.includeMetadata = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Strip Rich-text",
			Callback = function(self, value)
				testConfig.stripRichtext = value
			end,
		})

		testOptions:Checkbox({
			Value = false,
			Label = "Format in diff",
			Callback = function(self, value)
				testConfig.formatDiff = value
			end,
		})
	end

	do -- Info
		local info = tab:TreeNode({ Title = "Info" })
		info:Label({
			Text = "Alias testing comes after the functionality test. So if you see the alias missing that means you still passed the functionality test.",
			TextWrapped = true
		})
	end

	output = tab:Console({
		ReadOnly = true,
		RichText = true,
		LineHeight = 1.3,
		Fill = true,
	}):Clear()

	return results
end
