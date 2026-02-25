--!nocheck
--!nolint

return function()
	if not debug or not debug.getproto then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalFunction = loadstring([[
		return function()
			local function MYRIAD(_, _, ...) return "MYRI_1" end
			return function() return "MYRI_2" end
		end
	]])()

	local firstProto = debug.getproto(originalFunction, 1)
	local success, errorOrName, numberOfArgs, isVariableArgs = pcall(debug.info, firstProto, "na")

	if not success then
		return {
			status = 500,
			message = "Proto is not introspectable via debug.info",
		}
	elseif errorOrName ~= "MYRIAD" or numberOfArgs ~= 2 or not isVariableArgs then
		return {
			status = 500,
			message = "The information from Proto does not match",
		}
	end

	local firstProtoActive = debug.getproto(originalFunction, 1, true)

	if type(firstProtoActive) ~= "table" or not firstProtoActive[1] then
		return { status = 500, message = "getproto did not return proto" }
	elseif type(firstProtoActive[1]) ~= "function" then
		return { status = 500, message = "getproto(active=true) result[1] is not callable" }
	elseif firstProtoActive[1]() ~= "MYRI_1" then
		return { status = 500, message = "Proto returned incorrect value when called" }
	end

	local secondProtoActive = debug.getproto(originalFunction, 2, true)

	if type(secondProtoActive) ~= "table" or not secondProtoActive[1] then
		return { status = 500, message = "getproto did not return proto" }
	elseif type(secondProtoActive[1]) ~= "function" then
		return { status = 500, message = "getproto(active=true) result[1] is not callable" }
	elseif secondProtoActive[1]() ~= "MYRI_2" then
		return { status = 500, message = "Proto returned incorrect value when called" }
	end

	if pcall(debug.getproto, print, 1, true) then
		return { status = 500, message = "getproto should error when given a C closure" }
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"getproto",
	})

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
