--!nocheck

local types = require("@packages/cascade/types")

return function(name: string, tab: types.Tab, titledRow: types.Row, app: types.App)
	--// Imports
	local checks = require("@self/checks/init")
	local views = require("@self/views/init")
	local console = require("@dependencies/ui/console")
	local config = require("@config")
	local keybind = require("@modules/keybind")

	--// Variables
	local currentTask = nil
	local output = nil
	local testingState = nil
	local builtViews = {}

	local testConfig = {
		passes = 25,
		backoffRate = 0.9,
		baseDelay = 0.1,
		testTimeout = 15,
		includedTests = "",
		excludedTests = "",
	}

	local uni = {
		bullet = "•",
	}

	local statusCodes = require("@modules/statusCodes").Standards

	--// Private Methods
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
				testingState.CurrentTest = "Initializing stress scenarios..."
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
			local numTests = 0

			local flattened = {}
			for groupName, group in pairs(checks) do
				for testName, func in pairs(group) do
					table.insert(flattened, {
						groupName = groupName,
						name = testName,
						func = func,
					})
					numTests += 1
				end
			end

			if output then
				output:Clear()
			end

			local utils = {
				printc = printc,
				warnc = warnc,
				uni = uni,
				statusCodes = statusCodes,
			}

			for i, entry in ipairs(flattened) do
				local nextEntry = flattened[i + 1]

				if testingState then
					testingState.CurrentTest = `[{entry.groupName}] {entry.name}`
					testingState.NextTest = nextEntry and `[{nextEntry.groupName}] {nextEntry.name}` or "None"
				end

				local startTestTime = os.clock()
				local success, result
				
				do
					local done = false
					local thread = task.spawn(function()
						success, result = pcall(entry.func, testConfig, utils)
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
						result = { status = 500, message = `Timed out after {testConfig.testTimeout}s` }
					end
				end

				local checkElapsed = os.clock() - startTestTime
                
				if not success then
					failed += 1
					warnc(`{uni.bullet} ❌ [{entry.groupName}] {entry.name}: Crashed/Timeout - {tostring(result)} ({math.floor(checkElapsed*1000)}ms)`)
				elseif result and result.status == 200 then
					passed += 1
					printc(`{uni.bullet} ✅ [{entry.groupName}] {entry.name}: {result.message} ({math.floor(checkElapsed*1000)}ms)`)
				else
					failed += 1
					local msg = result and result.message or "Unknown failure"
					warnc(`{uni.bullet} 🛠️ [{entry.groupName}] {entry.name}: {msg} ({math.floor(checkElapsed*1000)}ms)`)
				end

				if testingState then
					testingState.Passed = passed
					testingState.Failed = failed
					testingState.TotalElapsed = time() - startTime
					testingState.CheckElapsed = checkElapsed
				end
			end

			if testingState then
				testingState.Visible = false
			end
            
			if output then
				output.__instance.Visible = true
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

			local endTime = math.floor((time() - startTime) * 10 ^ 2 + 0.5) / 10 ^ 2
			local executor, executorVers = "Unknown", "N/A"
			if identifyexecutor then
				executor, executorVers = identifyexecutor()
			end

			printc(`\nSummary:`)
			printc(`{uni.bullet} Took: {endTime}s`)
			printc(`{uni.bullet} Executor: {executor}`)
			printc(`{uni.bullet} Stress Tests: {numTests}`)
			printc(`{uni.bullet} Passed: {passed}`)
			printc(`{uni.bullet} Failed: {failed}`)
		end)
	end

	--// Main UI
	do -- Test Options
		local form = tab:PageSection({Title = "Stress Options", Subtitle = "Configure stress variables"}):Form()

		titledRow(form, "Options"):Right():Button({
			Label = "Configure",
			State = "Secondary",
			Pushed = function()
				builtViews.Settings.Selected = true
			end,
		})
	end

	-- Output
	do
		local form = tab:PageSection({Title = "Output", Subtitle = "View the results of the intensive tests"}):Form()

		do
			local row = titledRow(form, "Run Test")

			-- Show keybind
			do
				local keybindRow = form:Row()

				local keybindField = keybindRow:Right():KeystrokeField({
					Keys = config.keybinds.runStressTest.Value,
					ValueChanged = function(_self, newKeys)
						config.keybinds.runStressTest.Value = newKeys
					end,
				})

				config.keybinds.runStressTest.Changed:Connect(function(newKeys)
					keybindField.Keys = newKeys
				end)

				keybind.new(config.keybinds.runStressTest, { sink = true }):Connect(function(inputComplete: boolean)
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
		for viewName, viewSettings in pairs(views) do
			local viewTab = tab:Tab({
				Title = viewName,
				Icon = viewSettings.Icon,
			})

			builtViews[viewName] = viewTab
			viewSettings.Init(name, viewTab, titledRow, app, testConfig)
		end
	end

	return { passed = 0, failed = 0 }
end
