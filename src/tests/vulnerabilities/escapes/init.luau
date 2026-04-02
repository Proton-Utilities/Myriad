local parentVectors = require("@self/vectors")

return function(output, config, isVulnerable, utils)
	local stats = { checked = 0, secured = 0, vulnerable = 0 }
	local printc = utils.printc
	local warnc = utils.warnc
	local uni = utils.uni
	local statusCodes = utils.statusCodes

	printc(`\nChecking Executor Environment Escapes`)

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

		return true
	end)

	if not success or result == false then
		stats.secured += 1
		if config.showSafe then
			printc(`{uni.bullet} {statusCodes[200]} Identity Escalation (__index hook): Properly mitigated (Safe)`)
		end
	else
		stats.vulnerable += 1
		warnc(`{uni.bullet} {statusCodes[400]} Identity Escalation (__index hook): VULNERABLE to Context Escalation!`)
	end

	if config.checkpointDelay > 0 then
		task.wait(config.checkpointDelay)
	end

	printc(`\nChecking Parent-Traversal Escapes`)

	local function isSecurityError(err)
		return err:find("lacking capability")
			or err:find("current thread cannot")
			or err:find("security context")
			or err:find("protected function")
			or err:find("blacklisted")
			or err:find("blocked")
			or err:find("not allowed")
	end

	local function testParentVector(vector)
		stats.checked += 1

		local gotInstance, root = pcall(vector.getter)
		if not gotInstance or root == nil then
			stats.secured += 1
			if config.showSafe then
				printc(`{uni.bullet} {statusCodes[200]} {vector.name}: Getter blocked or nil (Safe)`)
			end
			return
		end

		local callOk, callErr = pcall(function()
			return root:OpenScreenshotsFolder()
		end)

		if callOk then
			stats.vulnerable += 1
			warnc(`{uni.bullet} {statusCodes[400]} {vector.name}: VULNERABLE – escaped to real DataModel!`)
		else
			local err = tostring(callErr):lower()
			if isSecurityError(err) then
				stats.secured += 1
				if config.showSafe then
					printc(`{uni.bullet} {statusCodes[200]} {vector.name}: Blocked by security (Safe)`)
				end
			else
				stats.vulnerable += 1
				warnc(
					`{uni.bullet} {statusCodes[400]} {vector.name}: VULNERABLE – reached DataModel ({callErr})`
				)
			end
		end

		if config.checkpointDelay > 0 then
			task.wait(config.checkpointDelay)
		end
	end

	for _, vector in ipairs(parentVectors) do
		testParentVector(vector)
	end

	return stats
end
