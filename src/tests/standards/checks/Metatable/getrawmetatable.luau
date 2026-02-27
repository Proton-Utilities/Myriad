--!nocheck
--!nolint

return function()
	if not getrawmetatable then
		return {
			status = 400,
			message = "Global not found",
		}
	end
	
	local tempTable = {}
	local tempUsedata = newproxy(true)
	
	local calledTableNamecall, calledUserdataNamecall = false, false
	local usedataMETA, newTableMETA
	
	do
		newTableMETA = {
			__namecall = function()
				calledTableNamecall = true
			end,
			__metatable = {
				__index = function() end
			}
		}

		setmetatable(tempTable, newTableMETA)
		pcall(setmetatable, tempUsedata, newTableMETA.__metatable)
		
		if pcall(table.clone, tempTable) then
			return {
				status = 500,
				message = "The table is not actually protected by __metatable",
			}
		end

		usedataMETA = getmetatable(tempUsedata)

		usedataMETA.__namecall = function()
			calledUserdataNamecall = true
		end

		usedataMETA.__metatable = newTableMETA.__metatable
		pcall(setmetatable, tempUsedata, usedataMETA.__metatable)
	end
	
	if calledTableNamecall or calledUserdataNamecall then
		return {
			status = 500,
			message = "The method is called so that it will surely return an error and the function will be obtained",
		}
	elseif getrawmetatable(tempTable) ~= newTableMETA then
		return {
			status = 500,
			message = "Returned a different metatable for table",
		}
	elseif getrawmetatable(tempUsedata) ~= usedataMETA then
		return {
			status = 500,
			message = "Returned a different metatable for newproxy",
		}
	end
	
	local rawGameMt = getrawmetatable(game)
	local __index
	
	xpcall(function()
		return game[{}]
	end, function()
		for StackLevel = 2, 10 do
			local func, name, line = debug.info(StackLevel, "fnl")
			if func and name == "" and line == -1 then
				for _ = 1, 5 do
					if not pcall(func, game, "Name") then
						return
					end
				end
				
				__index = func
				break
			end
		end
	end)
	
	if not __index then
		return {
			status = 500,
			message = "Failed to get __index",
		}
	elseif type(rawGameMt) ~= "table" then
		return {
			status = 500,
			message = "Didn't return a table",
		}
	elseif rawGameMt.__index ~= __index then
		return {
			status = 500,
			message = "The __index is not the original",
		}
	elseif rawGameMt ~= getrawmetatable(game) then
		return {
			status = 500,
			message = "Returned a different metatable for game",
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
		if rawGameMt[method] then
			return {
				status = 500,
				message = `Found {name} metamethod in the raw meta table`,
			}
		end
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
