--!nocheck

local standardChecks = require("@tests/standards/checks/init")

return function(config, utils)
	local passes = config.passes or 10
	local backoffRate = config.backoffRate or 0.9
	local baseDelay = config.baseDelay or 0.5
	
    local exclusions = {}
    if config.excludedTests and config.excludedTests ~= "" then
        for _, ex in ipairs(string.split(config.excludedTests, ",")) do
            exclusions[ex:gsub("^%s*(.-)%s*$", "%1")] = true
        end
    end

    local inclusions = {}
    local hasInclusions = false
    if config.includedTests and config.includedTests ~= "" then
        hasInclusions = true
        for _, inc in ipairs(string.split(config.includedTests, ",")) do
            inclusions[inc:gsub("^%s*(.-)%s*$", "%1")] = true
        end
    end

    local testsToRun = {}
    for groupName, groupChecks in pairs(standardChecks) do
        for testName, testFunc in pairs(groupChecks) do
            local isDangerous = (groupName == "External" or groupName == "FileDialog" or testName == "writefile" or testName == "makefolder" or testName == "delfile" or testName == "delfolder")
            
            if isDangerous and (not hasInclusions or not (inclusions[groupName] or inclusions[testName])) then
                continue
            end

            if exclusions[groupName] or exclusions[testName] or exclusions[groupName .. "." .. testName] then
                continue
            end

            if hasInclusions then
                if not (inclusions[groupName] or inclusions[testName] or inclusions[groupName .. "." .. testName]) then
                    continue
                end
            end

            table.insert(testsToRun, {name = testName, func = testFunc})
        end
    end

    local failedSpam = 0
    local passedSpam = 0
    local success, err = pcall(function()
        for pass = 1, passes do
            local currentDelay = math.max(0, baseDelay * (backoffRate ^ (pass - 1)))
            
            for _, testInfo in ipairs(testsToRun) do
                local testSuccess = pcall(testInfo.func)
                if not testSuccess then
                    failedSpam += 1
                else
                    passedSpam += 1
                end
            end

            if currentDelay > 0 then
                task.wait(currentDelay)
            end
        end
    end)

    if not success then
        return {
            status = 500,
            message = "Standards Spam test crashed: " .. tostring(err),
        }
    end

	return {
		status = 200,
		message = `Completed {passes} passes over {math.round(#testsToRun)} selected standards APIs.`,
	}
end
