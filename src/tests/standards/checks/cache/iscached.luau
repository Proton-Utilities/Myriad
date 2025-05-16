--!nocheck
--!nolint

return function()
	if not getfenv(0).cache or not getfenv(0).cache.iscached then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).cache.invalidate then
		return {
			status = 401,
			message = "Dependency 'cache.invalidate' missing",
		}
	end

	--// Functionality test
	local part = Instance.new("Part")

	if not cache.iscached(part) then
		return {
			status = 500,
			message = "Cached part assumed uncached"
		}
	end

	cache.invalidate(part)

	if cache.iscached(part) then
		return {
			status = 500,
			message = "Uncached part assumed cached"
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
