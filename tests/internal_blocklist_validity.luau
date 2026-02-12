local blocklist = require("@vulnerabilities/services/blocklist")

local function log(status, name, extra)
    local color = status == "OK" and "[\027[32mOK\027[0m]" or "[\027[31mMISSING\027[0m]"
    rconsoleprint(string.format("%s %s %s", color, name, extra or ""))
end

rconsoleclear()

if blocklist._pseudo then
    rconsoleprint("PSEUDO TARGETS")

    for name, data in pairs(blocklist._pseudo) do
        local target = data.Target
        
        if target then
            log("OK", name, "(Target Instance found)")
            
            for _, method in ipairs(data.Methods) do
                local success, result = pcall(function()
                    return target[method]
                end)

                if success and result ~= nil then
                    log("OK", "    ." .. method, "(" .. typeof(result) .. ")")
                else
                    log("MISSING", "    ." .. method)
                end
            end
        else
            log("MISSING", name, "(Target Instance is nil)")
        end
    end
end

if blocklist.Services then
    rconsoleprint("\n STANDARD SERVICES")
    for serviceName, methods in pairs(blocklist.Services) do
        local success, service = pcall(function()
            return game:GetService(serviceName)
        end)

        if success and service then
            log("OK", serviceName)
            
            for _, methodName in ipairs(methods) do
                local exists, member = pcall(function()
                    return service[methodName]
                end)

                if exists and member ~= nil then
                    local memberType = typeof(member)
                    log("OK", "    :" .. methodName, "(" .. memberType .. ")")
                else
                    log("MISSING", "    :" .. methodName)
                end
            end
        else
            log("MISSING", serviceName, "(Service could not be loaded)")
        end
    end
end

rconsoleprint("\nDONE")