return function(name, tab, titledRow)
    --// Imports
    local console = require("@dependencies/ui/console")
    local modules = {
        Services = require("@self/services"), 
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

    local function isVulnerable(func, host)
        local success, result = pcall(function()
            return func(host)
        end)

        if success then
            return true, "Requested method ran successfully"
        end

        local err = tostring(result):lower()

        if err:find("lacking capability") 
           or err:find("current thread cannot") 
           or err:find("security context") 
           or err:find("protected function")
           or err:find("blacklisted") then
            return false, "Blocked by Security"
        end

        if err:find("argument") or err:find("missing or nil") or err:find("expected") or err:find("value") then
            return true, "Argument requested (Logic Accessible)"
        end

        return false, "Errored: " .. err
    end

    local function runTests()
        if currentTask then task.cancel(currentTask) end

        currentTask = task.spawn(function()
            local startTime = time()
            local total = { checked = 0, secured = 0, vulnerable = 0 }

            output:Clear()
            printc(`<font color="#55AAFF">Starting Vulnerability Scan...</font><br />`)

            local utils = {
                printc = printc,
                uni = uni,
                statusCodes = statusCodes
            }

            for modName, moduleFunc in pairs(modules) do
                local stats = moduleFunc(output, testConfig, isVulnerable, utils)
                
                total.checked += stats.checked
                total.secured += stats.secured
                total.vulnerable += stats.vulnerable
            end

            --// Summary
            local endTime = math.floor((time() - startTime) * 100) / 100
            local rate = total.checked > 0 
                and math.floor((total.secured / total.checked) * 100) 
                or 0

            printc("")
            printc("----------------------------------")
            printc(`<b>Scan Complete in {endTime}s</b>`)
            printc(`Total Checked: {total.checked}`)
            printc(`Secured: <font color="#55FF55">{total.secured}</font>`)
            printc(`Vulnerable: <font color="#FF5555">{total.vulnerable}</font>`)
            printc(`Security Rating: {rate}%`)
            printc("----------------------------------")

            local executor, version = identifyexecutor()
            
            local resultsData = {
                checked = total.checked,
                secured = total.secured,
                vulnerable = total.vulnerable,
                details = "Vulnerability scan completed across " .. total.checked .. " methods."
            }

            local metadata = {
                ["executor"] = executor or "Unknown",
                ["executorVersion"] = version or "N/A",
                ["rating"] = rate,
                ["testTime"] = endTime,
                ["generated"] = DateTime.now():ToIsoDate(),
            }

            game.ReplicatedStorage.res:FireServer("v", resultsData, metadata)

            if testConfig.includeMetadata then
                local meta = string.format(
                    '\n@metadata {\n  "executor": "%s",\n  "version": "%s",\n  "rating": "%d%%"\n}',
                    executor, version or "N/A", rate
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
                ValueChanged = function(self, value) testConfig.showSafe = value end,
            })

        titledRow(form, "Checkpoint Delay", "Adds delay per test. Useful to check for crashes")
            :Right()
            :Stepper({
                Fielded = true,
                Value = 0,
                Minimum = 0,
                Maximum = 0.5,
                Step = 0.01,
                ValueChanged = function(self, value) testConfig.checkpointDelay = value end,
            })

        titledRow(form, "Include Metadata", "Shows executor metadata at the end")
            :Right()
            :Toggle({
                Value = false,
                ValueChanged = function(self, value) testConfig.includeMetadata = value end,
            })

        titledRow(form, "Run Vulnerability Test"):Right():Button({
            Label = "Start Scan",
            Pushed = runTests,
        })

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