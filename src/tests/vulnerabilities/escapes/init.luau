return function(output, config, isVulnerable, utils)
	local stats = { checked = 0, secured = 0, vulnerable = 0 }
	local printc = utils.printc
	local warnc = utils.warnc
	local uni = utils.uni
	local statusCodes = utils.statusCodes

	printc(`\nChecking Environment Escaping`)

	stats.checked += 1
	local success, result = pcall(function()
		local _loadstring = getgenv().loadstring
		getrenv().loadstring = _loadstring
		getrenv().getgenv = getgenv().getgenv
		getrenv()._set = clonefunction(setthreadidentity)
		local e1 = nil

		local old
		old = hookmetamethod(game, "__index", function(a, b)
			task.spawn(function()
				getrenv()._set(7)
				task.wait(0.1)
				local _s1
				_s1, e1 = pcall(function()
					_loadstring("return true")()
				end)
			end)
			hookmetamethod(game, "__index", old)
			return old(a, b)
		end)

		task.wait(0.3)
		if e1 == "Argument 1 missing or nil" or e1 == nil then
			return false
		end

		-- Test check
		return true
	end)

	if not success or result == false then
		stats.secured += 1
		if config.showSafe then
			printc(`{uni.bullet} {statusCodes[200]} Escaping Env (__index hook): Properly mitigated (Safe)`)
		end
	else
		stats.vulnerable += 1
		warnc(`{uni.bullet} {statusCodes[400]} Escaping Env (__index hook): VULNERABLE to Context Escaping!`)
	end

	if config.checkpointDelay > 0 then
		task.wait(config.checkpointDelay)
	end

	return stats
end
