--!nocheck
--!nolint

return function()
	if not newcclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalFunction = function(...)
		local startTick = tick()
		local elapsedTick = task.wait(0.05)

		if tick() - startTick < 0.025 or elapsedTick < 0.025 then
			return "TICK_ERROR"
		end

		return select("#", ...), ...
	end

	local cFunction = newcclosure(originalFunction, "MYR1AD")

	if debug.info(originalFunction, "l") == -1 then
		return {
			status = 500,
			message = "The original function was also made C closure (line check)",
		}
	elseif debug.info(cFunction, "l") ~= -1 then
		return {
			status = 500,
			message = "The new C closure is not C (line check)",
		}
	elseif debug.info(cFunction, "n") ~= "MYR1AD" then
		return {
			status = 500,
			message = "C closure have a different name",
		}
	end

	for i = 1, 5 do
		local startTick = tick()
		local nilsCount = math.random(3, 10)
		local result = table.pack(pcall(cFunction, i, unpack({}, 1, nilsCount)))

		if not result[1] then
			return {
				status = 500,
				message = `C closure gave the error: {result[2]}`,
			}
		elseif tick() - startTick < 0.025 then
			return {
				status = 500,
				message = "C closure is not yielding",
			}
		end

		table.move(result, 2, result.n, 1)
		result.n -= 1

		if result[1] == "TICK_ERROR" or result[1] == nil then
			return {
				status = 500,
				message = "C closure omits the yields",
			}

		elseif result[1] ~= nilsCount + 1 then
			return {
				status = 500,
				message = "C closure is cutting arguments",
			}

		elseif result[2] ~= i then
			return {
				status = 500,
				message = "C closure did not return the expected value",
			}

		else
			local argsCount = nilsCount + 2
			local validNils = true

			for i = 3, nilsCount do
				if result[i] ~= nil then
					validNils = false
					break
				end
			end

			if result.n ~= argsCount or not validNils then
				print(result.n, nilsCount)

				return {
					status = 500,
					message = "C closure is cutting returns",
				}
			end
		end
	end

	local wrapped = cFunction
	for i = 1, 198 do
		wrapped = coroutine.wrap(wrapped)
	end

	if not pcall(wrapped) then
		-- Many executors omit this protection. Native C functions can be wrapped 198 times without errors
		return {
			status = 500,
			message = "C closure stack overflow",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end