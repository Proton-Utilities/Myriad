# Standards

The standards test lets you check the executor's environment and compliance with the Myriad enhanced version of the [UNC](https://www.roblox.com/games/79035306837882) specification.

!!! info
    You still should be in the [Myriad game](https://www.roblox.com/games/79035306837882), or else certain functions might error if they can't find our game references.

## Usage

```luau
local myriadAPI = loadstring(game:HttpGet("https://github.com/Standard-2/Myriad/releases/latest/download/api.luau"))()

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

    -- We MUST bind our connections before starting, since .Run() is synchronous.
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

    -- You can also optionally pass StandardTestOptions to Run()
    --[[ 
        type StandardTestOptions = {
            checkpointDelay: number?,
            includes: {string}?,
            excludes: {string}?,
            timeout: number?
        } 
    ]]

    myriadAPI.Standards.Run({
        timeout = 5, -- 5 second timeout per test
        -- includes = {"hookfunction", "cache"}, -- This will only include `hookfunction` and every test inside the `cache` group.
        checkpointDelay = 0.05 -- Wait 0.5s between each test
    })
end
```
