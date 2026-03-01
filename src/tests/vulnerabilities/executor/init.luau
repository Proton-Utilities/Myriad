return function(output, config, isVulnerable, utils)
	local stats = { checked = 0, secured = 0, vulnerable = 0 }
	local printc = utils.printc
	local warnc = utils.warnc
	local uni = utils.uni
	local statusCodes = utils.statusCodes

	local function runTest(name, func, argsArray)
		stats.checked += 1

		local success, result = pcall(function()
			return func(table.unpack(argsArray))
		end)

		if not success then
			local err = tostring(result):lower()

			if err:find("protocol") or err:find("scheme") or err:find("http") or err:find("invalid") then
				stats.secured += 1
				if config.showSafe then
					printc(`{uni.bullet} {statusCodes[200]} {name}: Blocked invalid protocol (Safe)`)
				end
			elseif err:find("blocked") or err:find("security") or err:find("not allowed") then
				stats.secured += 1
				if config.showSafe then
					printc(`{uni.bullet} {statusCodes[200]} {name}: Blocked by Security (Safe)`)
				end
			else
				stats.vulnerable += 1
				warnc(`{uni.bullet} {statusCodes[400]} {name}: Unexpected error evaluating protection ({err})`)
			end
		else
			stats.vulnerable += 1
			warnc(`{uni.bullet} {statusCodes[400]} {name}: VULNERABLE to file:// protocol fetches`)
		end

		if config.checkpointDelay > 0 then
			task.wait(config.checkpointDelay)
		end
	end

	local env = getgenv and getgenv() or _G

	printc(`\nChecking Executor Globals`)

	if type(env.request) == "function" then
		runTest("request", env.request, { { Url = "file:///C:/" } })
	end

	if type(env.http_request) == "function" then
		runTest("http_request", env.http_request, { { Url = "file:///C:/" } })
	end

	if type(env.http) == "table" and type(env.http.request) == "function" then
		runTest("http.request", env.http.request, { { Url = "file:///C:/" } })
	end

	if type(env.HttpGet) == "function" then
		runTest("HttpGet", env.HttpGet, { "file:///C:/" })
	end

	if type(env.HttpGetAsync) == "function" then
		runTest("HttpGetAsync", env.HttpGetAsync, { "file:///C:/" })
	end

	printc(`\nChecking DataModel Methods`)

	runTest("game:HttpGet", function(url)
		return game:HttpGet(url)
	end, { "file:///C:/" })
	runTest("game:HttpGetAsync", function(url)
		return game:HttpGetAsync(url)
	end, { "file:///C:/" })
	runTest("game:HttpPost", function(url)
		return game:HttpPost(url, "asd")
	end, { "file:///C:/" })
	runTest("game:HttpPostAsync", function(url)
		return game:HttpPostAsync(url, "asd")
	end, { "file:///C:/" })

	return stats
end
