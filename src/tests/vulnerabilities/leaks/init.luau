return function(output, config, isVulnerable, utils)
	local stats = { checked = 0, secured = 0, vulnerable = 0 }
	local printc = utils.printc
	local warnc = utils.warnc
	local uni = utils.uni
	local statusCodes = utils.statusCodes

	local function runAuthTest(name, func, argsArray)
		stats.checked += 1
		local success, result = pcall(function()
			return func(table.unpack(argsArray))
		end)

		if not success then
			stats.secured += 1
			if config.showSafe then
				printc(`{uni.bullet} {statusCodes[200]} {name}: Blocked Roblox API request (Safe)`)
			end
		else
			local resp = tostring(result)
			if type(result) == "table" and result.Body then
				resp = tostring(result.Body)
			end

			if resp:find('"robux"') or resp:find('"isPremium"') then
				stats.vulnerable += 1
				warnc(`{uni.bullet} {statusCodes[400]} {name}: VULNERABLE to Roblox API Auth Leak (Cookies are sent!)`)
			else
				stats.secured += 1
				if config.showSafe then
					printc(`{uni.bullet} {statusCodes[200]} {name}: Allows Roblox API but strips Auth (Safe)`)
				end
			end
		end

		if config.checkpointDelay > 0 then
			task.wait(config.checkpointDelay)
		end
	end

	local env = getgenv and getgenv()
	local testUrl = "https://economy.roblox.com/v1/user/currency"

	printc(`\nChecking Auth Leak Vulnerabilities`)

	if type(env.request) == "function" then
		runAuthTest("request (Auth)", env.request, { { Url = testUrl } })
	end

	if type(env.http_request) == "function" then
		runAuthTest("http_request (Auth)", env.http_request, { { Url = testUrl } })
	end

	if type(env.http) == "table" and type(env.http.request) == "function" then
		runAuthTest("http.request (Auth)", env.http.request, { { Url = testUrl } })
	end

	if type(env.HttpGet) == "function" then
		runAuthTest("HttpGet (Auth)", env.HttpGet, { testUrl })
	end

	if type(env.HttpGetAsync) == "function" then
		runAuthTest("HttpGetAsync (Auth)", env.HttpGetAsync, { testUrl })
	end

	runAuthTest("game:HttpGet (Auth)", function(url)
		return game:HttpGet(url)
	end, { testUrl })

	runAuthTest("game:HttpGetAsync (Auth)", function(url)
		return game:HttpGetAsync(url)
	end, { testUrl })

	return stats
end
