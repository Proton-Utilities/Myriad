--!nocheck
--!nolint

return function()
	if not getfenv(0).iscclosure then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local function luaClosure()
		return 1
	end
	local cClosure1 = print
	local cClosure2 = newcclosure(function()
		return 1
	end)

	if iscclosure(luaClosure) then
		return {
			status = 500,
			message = "Lua closure identified as C closure",
		}
	elseif not iscclosure(cClosure1) then
		return {
			status = 500,
			message = "C closure not identified as C closure",
		}
	elseif not iscclosure(cClosure2) then
		return {
			status = 500,
			message = "C closure not identified as C closure",
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
