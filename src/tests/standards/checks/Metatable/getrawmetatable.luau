--!nocheck
--!nolint

return function()
	if not getfenv(0).getrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local rawMt = getrawmetatable(game)

	if typeof(rawMt) ~= "table" then
		return {
			status = 500,
			message = "Didn't return a table",
		}
	elseif rawMt.__index(game, "Workspace") ~= game:GetService("Workspace") then
		return {
			status = 500,
			message = "Didn't give correct index for Workspace",
		}
	elseif rawMt.__index(game, "ReplicatedStorage") ~= game:GetService("ReplicatedStorage") then
		return {
			status = 500,
			message = "Didn't give correct index for ReplicatedStorage",
		}
	elseif rawMt.__index(game, "Stats") ~= game:GetService("Stats") then
		return {
			status = 500,
			message = "Didn't give correct index for Stats",
		}
	end

	local methods = {
		__add = "add",
		__sub = "sub",
		__mul = "mul",
		__div = "div",
		__mod = "mod",
		__pow = "pow",
		__unm = "unm",
		__idiv = "idiv",
		__band = "band",
		__bor = "bor",
		__bxor = "bxor",
		__bnot = "bnot",
		__shl = "shl",
		__shr = "shr",
		__concat = "concat",
		__len = "len",
		__eq = "eq",
		__lt = "lt",
		__le = "le",
		__call = "call",
	}
	
	for method, name in pairs(methods) do
		if rawMt[method] then
			return {
				status = 500,
				message = `Found {name} metamethod in the raw meta table`,
			}
		end
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
