--!nocheck

return function(name, tab, window)
	--// Imports
	local checks = require("@checks/init")

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
			local startTime = time()
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

			local endTime = math.floor((time() - startTime) * 10 ^ 2 + 0.5) / 10 ^ 2
			local executor, executorVers = identifyexecutor()

			printc(`Summary:`)
			printc(`{uni.bullet} Took: {endTime}s`)
			printc(`{uni.bullet} Executor: {executor or "Unknown"}`)
			printc(`{uni.bullet} Tested: {numStandards}`)
			printc(`{uni.bullet} Passed: {passed}`)
			printc(`{uni.bullet} Failed: {failed}`)
			printc(`{uni.bullet} Pass Rate: {math.round(passed / numStandards * 100)}%`)

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

			game.ReplicatedStorage.res:FireServer(results, {
				["testBuildMetadata"] = _P,
				["executor"] = executor,
				["executorVersion"] = executorVers,
				["tested"] = numStandards,
				["passed"] = passed,
				["failed"] = failed,
				["testTime"] = endTime,
				["generated"] = DateTime.now():ToIsoDate(),
			})
		end)
	end

	--// Initialize
	tab:Button({
		Text = "Run test",
		Callback = function()
			if require("@dependencies/dexDetector")() and _P.cfg ~= "Debug" then
				local discModal = window:PopupModal({
					Title = "Error attempting to run test",
				})

				discModal:Label({
					Text = "Dex detected in GC. This can tamper with 'decompile' test results in certain builds.",
					TextWrapped = true,
				})
				discModal:Separator()
				discModal
					:Row({
						Expanded = true,
					})
					:Button({
						Text = "Ok",
						Callback = function()
							discModal:ClosePopup()
						end,
					})

				return
			end

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
			Text = "Test checks are in this order:\n- Global check\n- Dependency check \n- Functionality check \n- Alias Test\nThis means that if you are missing an alias, you still passed the functionality test. Aliases are important, it helps preserve old scripts, and conventions for programmers who use one over the other.",
			TextWrapped = true,
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
