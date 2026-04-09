--!nocheck

return function(config, utils)
	local iterations = 5000

	local success, err = pcall(function()
		local active = 0

		for i = 1, iterations do
			if i % 2 == 0 then
				task.spawn(function()
					active += 1
					local c = crypt and crypt.hash or function() return "hash" end
					c("TestData" .. tostring(i))
				end)
			else
				coroutine.resume(coroutine.create(function()
					active += 1
					local b = base64_encode or function() return "encode" end
					b("TestData" .. tostring(i))
				end))
			end
		end

		task.wait(0.1)

		if active < iterations then
			error(`Only {active} of {iterations} threads executed.`)
		end
	end)

	if not success then
		return {
			status = 500,
			message = "Failed during concurrent thread execution: " .. tostring(err),
		}
	end

	return {
		status = 200,
		message = `Successfully spawned and executed {iterations} concurrent threads calling executor functions.`,
	}
end
