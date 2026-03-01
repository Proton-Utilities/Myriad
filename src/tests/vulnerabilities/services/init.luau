local blocklist = require("@self/blocklist")

return function(output, config, isVulnerable, utils)
	local stats = { checked = 0, secured = 0, vulnerable = 0 }
	local printc = utils.printc
	local warnc = utils.warnc
	local uni = utils.uni
	local statusCodes = utils.statusCodes

	local function checkMethods(containerName, container, methods)
		for _, method in ipairs(methods) do
			stats.checked += 1

			local exists, func = pcall(function()
				return container[method]
			end)

			if exists and func then
				local isVuln, msg = isVulnerable(func, container)

				if isVuln then
					stats.vulnerable += 1
					warnc(`{uni.bullet} {statusCodes[400]} {method}: {msg}`)
				else
					stats.secured += 1
					if config.showSafe then
						printc(`{uni.bullet} {statusCodes[200]} {method}: {msg}`)
					end
				end
			else
				stats.secured += 1
				if config.showSafe then
					printc(`{uni.bullet} {statusCodes[200]} {method}: Not found (Safe)`)
				end
			end

			if config.checkpointDelay > 0 then
				task.wait(config.checkpointDelay)
			end
		end
	end

	if blocklist._pseudo then
		printc(`\nChecking Pseudo Targets`)
		for name, data in pairs(blocklist._pseudo) do
			if data.Target then
				checkMethods(name, data.Target, data.Methods)
			else
				warnc(`{uni.bullet} {statusCodes[404]} {name}: Target Instance missing`)
			end
		end
	end

	if blocklist.Services then
		printc(`\nChecking Standard Services`)
		for serviceName, methods in pairs(blocklist.Services) do
			local success, service = pcall(game.GetService, game, serviceName)

			if success and service then
				checkMethods(serviceName, service, methods)
			else
				warnc(`{uni.bullet} {statusCodes[404]} {serviceName}: Service missing`)
			end
		end
	end

	return stats
end
