# Myriad API Implementation draft

## Objects

```luau
local myriadAPI = loadstring(game:HttpGet(".../download/api.luau"))()

print(myriadAPI.Version) -- Internally, this should use ProCMP build data @pipeline\frames\stable.luau
print(myriadAPI.Target) -- Internally, this should use ProCMP build data @pipeline\frames\stable.luau
print(myriadAPI.BuildDate) -- Internally, this should use ProCMP build data @pipeline\frames\stable.luau

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
    local results = myriadAPI.Standards.Run()

    for name, result in results do
        if result.status ~= 200 then
            warn(`Your executor does not support {name} properly: {myriadAPI.Standards.StatusCodes[result.status]} - {result.message}`)
        end
    end
end

-- You can also attempt to resolve a specific environment function to a myriad check
do
    local hookfunction = myriadAPI.Standards.Resolve(hookfunction)
    local result = hookfunction()

    if result.status ~= 200 then
        warn(`Your executor does not support hookfunction properly: {result.message}`)
    end
end
```
