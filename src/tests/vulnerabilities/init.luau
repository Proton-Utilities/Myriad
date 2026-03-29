local types = require("@packages/cascade/types")

return function(name: string, tab: types.Tab, titledRow: types.Row, app: types.App)
	--// Imports
	local cascade = require("@packages/cascade")
	local console = require("@dependencies/ui/console")
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

	local testConfig = {
		checkpointDelay = 0,
		showSafe = true,
		includeMetadata = false,
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
			local total = { checked = 0, secured = 0, vulnerable = 0 }

			output:Clear()
			printc(`<font color="#55AAFF">Starting Vulnerability Scan...</font><br />`)

			local utils = {
				printc = printc,
				warnc = warnc,
				uni = uni,
				statusCodes = statusCodes,
			}

			for modName, moduleFunc in pairs(modules) do
				local stats = moduleFunc(output, testConfig, isVulnerable, utils)

				total.checked += stats.checked
				total.secured += stats.secured
				total.vulnerable += stats.vulnerable
			end

			--// Summary
			local endTime = math.floor((time() - startTime) * 100) / 100
			local rate = total.checked > 0 and math.floor((total.secured / total.checked) * 100) or 0

			printc("")
			printc("----------------------------------")
			printc(`Summary: `)
			printc(`{uni.bullet} Took: {endTime}s`)
			printc(`{uni.bullet} Total Checked: {total.checked}`)
			printc(`{uni.bullet} Secured: <font color="#55FF55">{total.secured}</font>`)
			printc(`{uni.bullet} Vulnerable: <font color="#FF5555">{total.vulnerable}</font>`)
			printc(`{uni.bullet} Security Rating: {rate}%`)
			printc("----------------------------------")

			local executor, version = identifyexecutor()

			local resultsData = {
				checked = total.checked,
				secured = total.secured,
				vulnerable = total.vulnerable,
				details = "Vulnerability scan completed across " .. total.checked .. " methods.",
			}

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

			if testConfig.includeMetadata then
				local meta = string.format(
					'\n@metadata {\n  "executor": "%s",\n  "version": "%s",\n  "rating": "%d%%"\n}',
					executor,
					version or "N/A",
					rate
				)
				output:AppendText(meta)
			end
		end)
	end

	--// UI
	do
		local form = tab:Form()

		titledRow(form, "Show Safe Results", "Shows functions that are safe. Disable to only show vulnerabilities.")
			:Right()
			:Toggle({
				Value = true,
				ValueChanged = function(self, value)
					testConfig.showSafe = value
				end,
			})

		titledRow(form, "Checkpoint Delay", "Adds delay per test. Useful to check for crashes"):Right():Stepper({
			Fielded = true,
			Value = 0,
			Minimum = 0,
			Maximum = 0.5,
			Step = 0.01,
			ValueChanged = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

		titledRow(form, "Include Metadata", "Shows executor metadata at the end"):Right():Toggle({
			Value = false,
			ValueChanged = function(self, value)
				testConfig.includeMetadata = value
			end,
		})

		titledRow(form, "Run Vulnerability Test"):Right():Button({
			Label = "Start Scan",
			Pushed = runTests,
		})

		-- Show keybind
		do
			local stack = form:Row():Right():HStack({
				Padding = UDim.new(0, 0),
			})

			stack:Symbol({ Image = cascade.Symbols.command, Style = "Secondary" })
			stack:Label({ Text = table.concat(config.keybinds.runVulnerabilityTest, " + ") })

			keybind.new(config.keybinds.runVulnerabilityTest, { sink = true }):Connect(function(inputComplete: boolean)
				if not inputComplete then
					return
				end

				coroutine.wrap(runTests)()
			end)
		end

		output = console.new(tab.__container, {
			ReadOnly = true,
			RichText = true,
			LineHeight = 1.3,
			Fill = true,
		})

		output:Clear()
		output:AppendText("Ready to scan.")
	end

	return { passed = 0, failed = 0 }
end
