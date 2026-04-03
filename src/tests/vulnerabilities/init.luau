local types = require("@packages/cascade/types")

return function(name: string, tab: types.Tab, titledRow: types.Row, app: types.App)
	--// Imports
	local console = require("@dependencies/ui/console")
	local views = require("@self/views")
	local gameRefs = require("@gameRefs")
	local crypt = require("@dependencies/crypt/crypt")
	local config = require("@config")
	local keybind = require("@modules/keybind")
	local modules = {
		Services = require("@self/services"),
		Executor = require("@self/executor"),
		Leaks = require("@self/leaks"),
		Escapes = require("@self/escapes"),
	}

	--// Variables
	local output = nil
	local currentTask = nil
	local testingState = nil
	local builtViews = {}

	local testConfig = {
		checkpointDelay = 0,
		showSafe = true,
		includeMetadata = false,
		testTimeout = 5,
	}

	local uni = { bullet = "•" }
	local statusCodes = {
		[200] = "🛡️",
		[400] = "💀",
		[404] = "❓",
	}

	--// Private Methods
	local printc = function(...)
		output:AppendText(table.concat({ ... }, " "))
	end

	local warnc = function(...)
		output:AppendText(`<font color="#FFA500">{table.concat({ ... }, " ")}</font>`)
	end

	local function isVulnerable(func, host)
		local success, result = pcall(function()
			return func(host)
		end)

		if success then
			return true, "Requested method ran successfully"
		end

		local err = tostring(result):lower()

		if
			err:find("lacking capability")
			or err:find("current thread cannot")
			or err:find("security context")
			or err:find("protected function")
			or err:find("blacklisted")
		then
			return false, "Blocked by Security"
		end

		if err:find("argument") or err:find("missing or nil") or err:find("expected") or err:find("value") then
			return true, "Argument requested (Logic Accessible)"
		end

		return false, "Errored: " .. err
	end

	local function runTests()
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
			local total = { checked = 0, secured = 0, vulnerable = 0 }

			output:Clear()
			local utils = {
				printc = printc,
				warnc = warnc,
				uni = uni,
				statusCodes = statusCodes,
			}

			for modName, moduleFunc in pairs(modules) do
				if testingState then
					testingState.CurrentTest = `Module: {modName}`
				end

				local modStart = os.clock()
				local stats = moduleFunc(output, testConfig, isVulnerable, utils)
				local modElapsed = os.clock() - modStart

				total.checked += stats.checked
				total.secured += stats.secured
				total.vulnerable += stats.vulnerable

				if testingState then
					testingState.Passed = total.secured
					testingState.Failed = total.vulnerable
					testingState.TotalElapsed = time() - startTime
					testingState.CheckElapsed = modElapsed
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

			--// Summary
			local endTime = math.floor((time() - startTime) * 10 ^ 2 + 0.5) / 10 ^ 2
			local rate = total.checked > 0 and math.round((total.secured / total.checked) * 100) or 0
			local executor, version = identifyexecutor()

			printc(`\nSummary:`)
			printc(`{uni.bullet} Took: {endTime}s`)
			printc(`{uni.bullet} Executor: {executor or "Unknown"}`)
			printc(`{uni.bullet} Checked: {total.checked}`)
			printc(`{uni.bullet} Secured: <font color="#55FF55">{total.secured}</font>`)
			printc(`{uni.bullet} Vulnerable: <font color="#FF5555">{total.vulnerable}</font>`)
			printc(`{uni.bullet} Security Rating: {rate}%`)

			local resultsData = {
				checked = total.checked,
				secured = total.secured,
				vulnerable = total.vulnerable,
				details = "Vulnerability scan completed across " .. total.checked .. " methods.",
			}

			if testConfig.includeMetadata then
				local input = output:GetValue()

				local metaBlock = string.format(
					'@metadata {\n  "generated": "%s",\n  "executor": "%s",\n  "version": "%s",\n  "rating": "%d%%"\n} \n\n',
					DateTime.now():ToIsoDate(),
					executor or "Unknown",
					version or "N/A",
					rate
				)

				output:SetValue(metaBlock .. input)
			end

			local metadata = {
				["executor"] = executor or "Unknown",
				["executorVersion"] = version or "N/A",
				["rating"] = rate,
				["testTime"] = endTime,
				["generated"] = DateTime.now():ToIsoDate(),
			}

			local signatureId = ""
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
						headers = data.obfuscatedHeaders

						resultHash = crypt.hash(HttpService:JSONEncode(resultsData) .. data.challenge)
					end
				end
			end)

			gameRefs.res:FireServer("v", resultsData, metadata, signatureId, headers, resultHash)
		end)
	end

	--// UI
	do -- Test Options
		local form = tab:PageSection({ Title = "Test Options", Subtitle = "Configure the tests" }):Form()

		titledRow(form, "Options"):Right():Button({
			Label = "Configure",
			State = "Secondary",
			Pushed = function()
				builtViews.Settings.Selected = true
			end,
		})
	end

	do -- Output
		local form = tab:PageSection({ Title = "Output", Subtitle = "View the results of the tests" }):Form()

		titledRow(form, "Run Test"):Right():Button({
			Label = "Run",
			Pushed = runTests,
		})

		do
			local keybindRow = form:Row()

			local keybindField = keybindRow:Right():KeystrokeField({
				Keys = config.keybinds.runVulnerabilityTest.Value,
				ValueChanged = function(_self, newKeys)
					config.keybinds.runVulnerabilityTest.Value = newKeys
				end,
			})

			config.keybinds.runVulnerabilityTest.Changed:Connect(function(newKeys)
				keybindField.Keys = newKeys
			end)

			keybind.new(config.keybinds.runVulnerabilityTest, { sink = true }):Connect(function(inputComplete: boolean)
				if not inputComplete then
					return
				end

				coroutine.wrap(runTests)()
			end)
		end

		testingState = tab:TestingState({
			Visible = false,
			Passed = 0,
			Failed = 0,
			CurrentTest = "Initializing....",
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
		output:AppendText("")
	end

	do -- Subtabs
		for viewName, viewSettings in views do
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
