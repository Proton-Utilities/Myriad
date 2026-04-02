--!nocheck

local types = require("@packages/cascade/types")

return function(name: string, tab: types.Tab, titledRow: types.Row, app: types.App)
	--// Imports
	local checks = require("@checks/init")
	local views = require("@self/views")
	local console = require("@dependencies/ui/console")
	local gameRefs = require("@gameRefs")
	local crypt = require("@dependencies/crypt/crypt")
	local config = require("@config")
	local keybind = require("@modules/keybind")

	--// Variables
	local currentTask = nil
	local output = nil
	local testingState = nil
	local lastEntreePerGroup = {}
	local results = {}
	local builtViews = {}

	local testConfig = {
		checkpointDelay = 0,
		statusFilter = false,
		stripRichtext = false,
		formatDiff = false,
		includeMetadata = false,
		excludedTests = "",
		includedTests = "",
		testTimeout = 8,
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
			tab.Selected = true

			if testingState then
				testingState.Visible = true
				testingState.Passed = 0
				testingState.Failed = 0
				testingState.CurrentTest = "Initializing..."
				testingState.NextTest = "None"
				testingState.TotalElapsed = 0
				testingState.CheckElapsed = 0
			end

			if output then
				output.__instance.Visible = false
			end

			local targetY = 0
			if testingState and testingState.__container then
				targetY = testingState.__container.AbsolutePosition.Y
			elseif output and output.__instance then
				targetY = output.__instance.AbsolutePosition.Y
			end

			game:GetService("TweenService")
				:Create(
					tab.Structures.Page.__instance,
					TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{
						CanvasPosition = Vector2.new(
							0,
							targetY
								- tab.Structures.Page.__instance.AbsolutePosition.Y
								+ tab.Structures.Page.__instance.CanvasPosition.Y
						),
					}
				)
				:Play()

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

			local inclusions = {}
			local hasInclusions = false
			if testConfig.includedTests and testConfig.includedTests ~= "" then
				hasInclusions = true
				for _, inc in ipairs(string.split(testConfig.includedTests, ",")) do
					inclusions[inc:gsub("^%s*(.-)%s*$", "%1")] = true
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

				if hasInclusions then
					if not (inclusions[groupName] or inclusions[name] or inclusions[groupName .. "." .. name]) then
						excludedCount += 1
						continue
					end
				end

				local nextEntry = flattened[i + 1]

				if testingState then
					testingState.CurrentTest = name
					testingState.NextTest = nextEntry and nextEntry.name or "None"
				end

				local startTestTime = os.clock()
				local success, result

				do
					local done = false
					local thread = task.spawn(function()
						success, result = pcall(test)
						done = true
					end)

					local elapsed = 0
					while not done and elapsed < testConfig.testTimeout do
						task.wait(0.061)
						elapsed = os.clock() - startTestTime
						if testingState then
							testingState.TotalElapsed = time() - startTime
							testingState.CheckElapsed = elapsed
						end
					end

					if not done then
						task.cancel(thread)
						success = false
						result = `Timed out after {testConfig.testTimeout}s`
					end
				end

				local checkElapsed = os.clock() - startTestTime
				local status, message

				if not success then
					status = 0
					message = result
					failed += 1
				elseif result.status == 200 then
					status = result.status
					message = result.message
					passed += 1
				else
					status = result.status
					message = result.message
					failed += 1
				end

				if testingState then
					testingState.Passed = passed
					testingState.Failed = failed
					testingState.TotalElapsed = time() - startTime
					testingState.CheckElapsed = checkElapsed
				end

				if testConfig.checkpointDelay ~= 0 then
					task.wait(testConfig.checkpointDelay)
				end

				table.insert(results[groupName], {
					name = name,
					status = status,
					message = message,
					elapsedTestTime = checkElapsed,
				})
			end

			if testingState then
				testingState.Visible = false
			end
			if output then
				output.__instance.Visible = true
				output:Clear()
			end

			if output and output.__instance then
				local consoleY = output.__instance.AbsolutePosition.Y
				game:GetService("TweenService")
					:Create(
						tab.Structures.Page.__instance,
						TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{
							CanvasPosition = Vector2.new(
								0,
								consoleY
									- tab.Structures.Page.__instance.AbsolutePosition.Y
									+ tab.Structures.Page.__instance.CanvasPosition.Y
							),
						}
					)
					:Play()
			end

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

			local signatureId = ""
			local challenge = ""
			local headers = ""
			local resultHash = ""

			pcall(function()
				local ReqFunc = request or http_request or (http and http.request)
				if ReqFunc then
					local response = ReqFunc({
						Url = "https://myriad.tools/api/gensignature",
						Method = "GET",
					})

					if response and response.StatusCode == 200 then
						local HttpService = game:GetService("HttpService")
						local data = HttpService:JSONDecode(response.Body)
						signatureId = data.signatureId
						challenge = data.challenge
						headers = data.obfuscatedHeaders

						resultHash = crypt.hash(HttpService:JSONEncode(results) .. challenge)
					end
				end
			end)

			gameRefs.res:FireServer("s", results, {
				["testBuildMetadata"] = _P,
				["executor"] = executor,
				["executorVersion"] = executorVers,
				["tested"] = numStandards,
				["passed"] = passed,
				["failed"] = failed,
				["testTime"] = endTime,
				["generated"] = DateTime.now():ToIsoDate(),
				["excludedCount"] = excludedCount,
			}, signatureId, headers, resultHash)
		end)
	end

	--// Initialize
	do -- Test Options
		local form = tab:PageSection({Title = "Test Options", Subtitle = "Configure the tests"}):Form()

		titledRow(form, "Options"):Right():Button({
			Label = "Configure",
			Pushed = function()
				builtViews.Settings.Selected = true
			end,
		})
	end

	-- Output
	do
		local form = tab:PageSection({Title = "Output", Subtitle = "View the results of the tests"}):Form()

		do
			local row = titledRow(form, "Run Test")

			-- Show keybind
			do
				form:Row():Right():KeybindLabel({
					Keys = config.keybinds.runStandardsTest,
				})

				keybind.new(config.keybinds.runStandardsTest, { sink = true }):Connect(function(inputComplete: boolean)
					if not inputComplete then
						return
					end

					coroutine.wrap(test)()
				end)
			end

			row:Right():Button({
				Label = "Run",
				Pushed = function()
					coroutine.wrap(test)()
				end,
			})
		end

		testingState = tab:TestingState({
			Visible = false,
			Passed = 0,
			Failed = 0,
			CurrentTest = "Initializing...",
			NextTest = "None",
		})

		output = console.new(tab.__container, {
			ReadOnly = true,
			RichText = true,
			LineHeight = 1.3,
			Fill = true,
		})

		output.__instance.Visible = false

		output:Clear()
	end

	do
		for viewName, viewSettings in views do
			local viewTab = tab:Tab({
				Title = viewName,
				Icon = viewSettings.Icon,
			})

			builtViews[viewName] = viewTab
			viewSettings.Init(name, viewTab, titledRow, app, testConfig)
		end
	end

	return results
end
