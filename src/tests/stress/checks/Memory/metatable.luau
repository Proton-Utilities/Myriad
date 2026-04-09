--!nocheck

return function(config, utils)
	local iterations = 1000

	if not require("@checks/Metatable/hookmetamethod") then
		return {
			status = 401,
			message = "hookmetamethod not supported.",
		}
	end

	local instances = {}
	local originalHooks = {}

	for i = 1, iterations do
		local proxy = newproxy(true)
		local mt = getmetatable(proxy)
		
		mt.__index = function(self, key)
			return key
		end

		instances[i] = proxy
	end

	local success, err = pcall(function()
		for i = 1, iterations do
			local proxy = instances[i]
			local old
			old = hookmetamethod(proxy, "__index", function(self, key)
				if key == "Test" then return "Hooked" end
				return old(self, key)
			end)
			originalHooks[i] = { proxy = proxy, old = old }
		end
	end)

	if not success then
		return {
			status = 500,
			message = "Failed during bulk metatable hooking: " .. tostring(err),
		}
	end

	for i = 1, iterations do
		local result = instances[i].Test
		if result ~= "Hooked" then
			return {
				status = 500,
				message = `Hook failed verification at iteration {i}: {result}`,
			}
		end
	end

	instances = nil
	originalHooks = nil

	return {
		status = 200,
		message = `Successfully hooked and verified {iterations} metatables.`,
	}
end
