--!nocheck

local types = require("@packages/cascade/types")

return function(name: string, tab: types.Tab, titledRow: types.Row, app: types.App)
	--// Imports
	local cascade = require("@packages/cascade")
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
			tab.Selected = true

			game:GetService("TweenService")
				:Create(
					tab.Structures.Page.__instance,
					TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{
						CanvasPosition = Vector2.new(
							0,
							output.__instance.AbsolutePosition.Y
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

				local startTestTime = os.clock()
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

				if testConfig.checkpointDelay ~= 0 then
					task.wait(testConfig.checkpointDelay)
				end

				table.insert(results[groupName], {
					name = name,
					status = status,
					message = message,
					elapsedTestTime = (os.clock() - startTestTime),
				})
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

		titledRow(form, "Excluded Tests", "Exclude libs or globals from testing (delimited by commas)")
			:Right()
			:TextField({
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

		do
			local row = titledRow(form, "Run Test")

			-- Show keybind
			do
				local stack = form:Row():Right():HStack({
					Padding = UDim.new(0, 0),
				})

				stack:Symbol({ Image = cascade.Symbols.command, Style = "Secondary" })
				stack:Label({ Text = table.concat(config.keybinds.runStandardsTest, " + ") })

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

		output = console.new(tab.__container, {
			ReadOnly = true,
			RichText = true,
			LineHeight = 1.3,
			Fill = true,
		})

		output:Clear()
	end

	-- Manual Tests
	do
		for viewName, viewFn in views do
			local viewTab = tab:Tab({
				Title = viewName,
				Icon = cascade.Symbols.pencilLine,
			})

			viewFn(name, viewTab, titledRow, app)
		end
	end

	return results
end
