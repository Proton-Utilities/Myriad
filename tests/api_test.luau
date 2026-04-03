local myriadAPI = require("@api")

print(myriadAPI.Version)
print(myriadAPI.Target)
print(myriadAPI.BuildDate)

-- If we wanted to do a specific check, we can use the .Checks table and reference a specific one.
-- Hookfunction check
do
    local checks = myriadAPI.Standards.Checks
    local result = checks.Closures.hookfunction()

    if result.status ~= 200 then
        warn(`Your executor does not support hookfunction properly: {result.message}`)
    end
end

-- If we wanted to do all checks, myriad has a function to do it for you.
do
    local passed = 0
    local failed = 0
    myriadAPI.Standards.OnResult:Connect(function(name, result, groupName)
        if result.status == 200 then
            passed += 1
        else
            failed += 1
        end
        print(`{myriadAPI.Standards.StatusCodes[result.status]} {name} - {result.message}`)
    end)

    myriadAPI.Standards.OnComplete:Connect(function()
        print(`All checks completed. Passed: {passed}, Failed: {failed}`)
    end)
    
    myriadAPI.Standards.Run({
        timeout = 5,
    })
end