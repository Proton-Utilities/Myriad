--!nocheck
--!nolint

return function()
	if not getcallingscript then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not checkcaller then
		return {
			status = 401,
			message = "Dependency 'checkcaller' not found"
		}
	elseif not hookmetamethod then
		return {
			status = 401,
			message = "Dependency 'hookmetamethod' not found"
		}
	end

	--// Functionality test
	local original;
	original = hookmetamethod(game, "__index", function(self, index)
		if not checkcaller() then
			local caller = getcallingscript()

			hookmetamethod(game, "__index", original)
		end

		return original(self, index)
	end) -- https://docs.sunc.su/Scripts/getcallingscript/#example

	if getcallingscript() then
		return {
			status = 500,
			message = "Executor call assumed to be a game call"
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
		message = `Passed`,
	}
end
