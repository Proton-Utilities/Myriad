local blocklist = require("@self/blocklist")

return function(output, config, isVulnerable, utils)
    local stats = { checked = 0, secured = 0, vulnerable = 0 }
    local printc = utils.printc
    local uni = utils.uni
    local statusCodes = utils.statusCodes

    local function checkMethods(containerName, container, methods)
        for _, method in ipairs(methods) do
            stats.checked += 1
            
            local exists, func = pcall(function() return container[method] end)

            if exists and func then
                local isVuln, msg = isVulnerable(func, container)

                if isVuln then
                    stats.vulnerable += 1
                    output:AppendText(`{uni.bullet} {statusCodes[400]} <font color="#FF5555">{method}</font>: {msg}`)
                else
                    stats.secured += 1
                    if config.showSafe then
                        output:AppendText(`{uni.bullet} {statusCodes[200]} <font color="#55FF55">{method}</font>: {msg}`)
                    end
                end
            else
                stats.secured += 1
                if config.showSafe then
                    output:AppendText(`{uni.bullet} {statusCodes[200]} <font color="#888888">{method}</font>: Not found (Safe)`)
                end
            end

            if config.checkpointDelay > 0 then 
                task.wait(config.checkpointDelay) 
            end
        end
    end

    if blocklist._pseudo then
        printc(`<font color="#FFFF00">Checking Pseudo Targets</font>`)
        for name, data in pairs(blocklist._pseudo) do
            if data.Target then
                checkMethods(name, data.Target, data.Methods)
            else
                printc(`{uni.bullet} {statusCodes[404]} <font color="#AAAAAA">{name}</font>: Target Instance missing`)
            end
        end
    end

    if blocklist.Services then
        printc(`<br /><font color="#FFFF00">Checking Standard Services</font>`)
        for serviceName, methods in pairs(blocklist.Services) do
            local success, service = pcall(game.GetService, game, serviceName)
            
            if success and service then
                checkMethods(serviceName, service, methods)
            else
                printc(`{uni.bullet} {statusCodes[404]} <font color="#AAAAAA">{serviceName}</font>: Service missing`)
            end
        end
    end

    return stats
end