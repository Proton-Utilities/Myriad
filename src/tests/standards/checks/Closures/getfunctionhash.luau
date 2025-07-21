--!nocheck
--!nolint

return function()
	if not getfunctionhash then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function hexEncoded(hash)
		return #hash == 96 and hash:match("^[0-9a-fA-F]+$") ~= nil
	end
	
	local function1 = function() end
	local function2 = function(...) end
	local function3 = function() end
	local function4 = function() return 1 end
	local function5 = function() return 2 end
	local cHashSuccess = pcall(function()
		getfunctionhash(print)
	end)

	if not hexEncoded(getfunctionhash(function1)) then
		return {
			status = 500,
			message = "Hash is not hex encoded",
		}
	elseif getfunctionhash(function1) == getfunctionhash(function2) then
		return {
			status = 500,
			message = "Unequal functions returned equal hashes",
		}
	elseif getfunctionhash(function1) ~= getfunctionhash(function3) then
		return {
			status = 500,
			message = "Equal functions returned unequal hashes",
		}
	elseif getfunctionhash(function4) == getfunctionhash(function5) then
		return {
			status = 500,
			message = "Unequal returns gave equal returns",
		}
	elseif cHashSuccess then
		return {
			status = 500,
			message = "Passed when given a lua standard C closure",
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
