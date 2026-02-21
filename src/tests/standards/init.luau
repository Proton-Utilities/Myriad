--!nocheck

return function(name, tab, titledRow)
	--// Imports
	local checks = require("@checks/init")
	local console = require("@dependencies/ui/console")

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
		excludedTests = "",
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
			local excludedCount = 0

			local exclusions = {}
			if testConfig.excludedTests and testConfig.excludedTests ~= "" then
				for _, ex in ipairs(string.split(testConfig.excludedTests, ",")) do
					exclusions[ex:gsub("^%s*(.-)%s*$", "%1")] = true
				end
			end

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

				if exclusions[groupName] or exclusions[name] or exclusions[groupName .. "." .. name] then
					excludedCount += 1
					continue
				end

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
			printc(`{uni.bullet} Tested: {numStandards - excludedCount}`)
			printc(`{uni.bullet} Passed: {passed}`)
			printc(`{uni.bullet} Failed: {failed}`)
			printc(`{uni.bullet} Pass Rate: {math.round(passed / (numStandards - excludedCount) * 100)}%`)

			if excludedCount > 0 then
				printc(`{uni.bullet} Excluded: {excludedCount} tests`)
			end

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

			game.ReplicatedStorage.res:FireServer("s", results, {
				["testBuildMetadata"] = _P,
				["executor"] = executor,
				["executorVersion"] = executorVers,
				["tested"] = numStandards,
				["passed"] = passed,
				["failed"] = failed,
				["testTime"] = endTime,
				["generated"] = DateTime.now():ToIsoDate(),
				["excludedCount"] = excludedCount,
			})
		end)
	end

	--// Initialize
	do -- Test Options
		local form = tab:Form()

		titledRow(form, "Status Filter", "Filter by status codes"):Right():PopUpButton({
			Options = {
				"All",
				"✅ Pass",
				"❓ Ambiguous",
				"🔎 Missing",
				"📦 Dependency",
				"🛠️ Functionality",
				"🏷️ Alias",
			},
			Value = 1,
			ValueChanged = function(self, value: number)
				local reference = {
					[1] = false,
					[2] = 200,
					[3] = 0,
					[4] = 400,
					[5] = 401,
					[6] = 500,
					[7] = 501,
				}

				testConfig.statusFilter = reference[value]
			end,
		})

		titledRow(form, "Excluded Tests", "Exclude libs or globals from testing (delimited by commas)"):Right():TextField({
            Placeholder = "crypt, debug.info",
            Value = "",
            ValueChanged = function(self, value)
                testConfig.excludedTests = value
            end,
        })

		titledRow(form, "Checkpoint Delay", "Add delay per-checkpoint to analyze easily."):Right():Stepper({
			Fielded = true,
			Value = 0,
			Minimum = 0,
			Maximum = 1,
			Step = 0.01,
			ValueChanged = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

		titledRow(form, "Include Metadata", "Includes metadata in the output. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.includeMetadata = value
				end,
			})

		titledRow(form, "Strip richtext", "Strips the richtext from output. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.stripRichtext = value
				end,
			})

		titledRow(form, "Diff output", "Formats the output in diff. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.formatDiff = value
				end,
			})
	end

	-- Output
	do
		local form = tab:Form()

		titledRow(form, "Run Test"):Right():Button({
			Label = "Run",
			Pushed = function()
				if require("@dependencies/dexDetector")() and _P.cfg ~= "Debug" then
					warn(
						"Cant run test: Dex detected in GC. This can tamper with 'decompile' test results in certain builds."
					)

					return
				end

				coroutine.wrap(test)()
			end,
		})

		output = console.new(tab.__container, {
			ReadOnly = true,
			RichText = true,
			LineHeight = 1.3,
			Fill = true,
		})

		output:Clear()
	end

	return results
end
