--!nocheck
--!nolint

return function()
	if not hookfunction then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not clonefunction then
		return {
			status = 401,
			message = "Dependency 'clonefunction' missing",
		}
	elseif not newcclosure then
		return {
			status = 401,
			message = "Dependency 'newcclosure' missing",
		}
	elseif not loadstring then
		return {
			status = 401,
			message = "Dependency 'loadstring' missing",
		}
	end
	
	local function temp_newcclosure(closure)
		return coroutine.wrap(function(...)

			local func
			func = function(...) 
				return func(coroutine.yield(closure(...)))
			end 
			
			func(...)
		end)
	end
	
	local function AnlyzeDebugInfo(func, needFullInfo, ...)
		local oldFuncFunction, oldFuncSource, oldFuncName, oldFuncLine, oldFuncNArgs, oldFuncIsVarArg = ...
		local newFuncFunction, newFuncSource, newFuncName, newFuncLine, newFuncNArgs, newFuncIsVarArg = debug.info(func, "fsnla")
		
		local infoChanges = {}

		if oldFuncFunction ~= newFuncFunction then table.insert(infoChanges, "Function") end
		if oldFuncSource ~= newFuncSource then table.insert(infoChanges, "Source") end
		if oldFuncName ~= newFuncName then table.insert(infoChanges, "Name") end
		if oldFuncLine ~= newFuncLine then table.insert(infoChanges, "Line") end
		
		if needFullInfo then
			if oldFuncNArgs ~= newFuncNArgs then table.insert(infoChanges, "NumberOfArgs") end
			if oldFuncIsVarArg ~= newFuncIsVarArg then table.insert(infoChanges, "IsVariableArgs") end
		end

		return table.concat(infoChanges, ", ")
	end
	
	-- Normal L
	
	local tempENV = {}
	local function1 = loadstring([[
        local upValue = 1
		local function function1(A, B)
            upValue = upValue
			return 1
		end
		
		return setfenv(function1, ...)
	]], "=MYRIAD")(tempENV)

	local function function2()
		return 2
	end
	
	local function function3()
		task.wait()
		return 3
	end

	if function1() ~= 1 then
		return {
			status = 500,
			message = "This should never evaluate. Did a cosmic ray hit your computer and flip a bit?",
		}
	end
	
	local oldFunc1FullInfo = {debug.info(function1, "fsnla")}
	local originalFunc1Clone = hookfunction(function1, function2)
	
	local validOriginalCloneENV = getfenv(originalFunc1Clone) == tempENV
	
	if function1() ~= 2 then
		return {
			status = 500,
			message = "(L->L): Hooked function did not return the expected value",
		}
	elseif originalFunc1Clone() ~= 1 then
		return {
			status = 500,
			message = "(L->L): Old function clone did not return the expected value",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function1, false, unpack(oldFunc1FullInfo))
		
		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(L->L): The function changed main info: ".. infoChanges,
			}
		end
	end
	
	hookfunction(function1, function3)
	
	local function1Start = tick()
	local moddedFunc1Result = function1()
	local function1Taked = tick() - function1Start

	if function1Taked < 0.0001 then
		return {
			status = 500,
			message = "(L->LYield): Hooked function its not keeping yielding",
		}
	elseif moddedFunc1Result ~= 3 then
		return {
			status = 500,
			message = "(L->LYield): Hooked function did not return the expected value",
		}
	end
	
	-- Now function1 its LYield
	
	local RemovedCWrap = false
	setfenv(function1, setmetatable({}, {
		__index = function()
			RemovedCWrap = true
			return 0
		end,
	}))
	
	hookfunction(function1, newcclosure(function()
		return 0
	end))
	
	if function1() ~= 0 then
		return {
			status = 500,
			message = "(L->NC): Hooked function did not return the expected value",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function1, false, unpack(oldFunc1FullInfo))

		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(L->NC): The function changed main info: ".. infoChanges,
			}
		elseif getfenv(function1) ~= tempENV then
			return {
				status = 500,
				message = "(L->NC): I'm too sleepy to think about what this is",
			}
		end
	end

	hookfunction(function1, originalFunc1Clone)

	if function1() ~= 1 then
		return {
			status = 500,
			message = "(LYield->L): Restored function did not return the expected value",
		}
	elseif validOriginalCloneENV and getfenv(function1) ~= tempENV then
		return {
			status = 500,
			message = "After restoring the function the ENV changed",
		}
	end
	
	-- We are forcing an Lwrap to be done; many executors do not copy the original information in these cases.
	hookfunction(function1, temp_newcclosure(function()
		return 4
	end))
	
	if function1() ~= 4 then
		return {
			status = 500,
			message = "(L->C): Hooked function did not return the expected value",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function1, true, unpack(oldFunc1FullInfo))

		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(L->C): The wrap function changed the principal function info: ".. infoChanges,
			}
		elseif getfenv(function1) ~= tempENV then
			-- Since it's a wrapper for a C function, it does not matter which ENV is assigned to it.
			return {
				status = 500,
				message = "(L->C): The wrap function changed the ENV for the principal function",
			}
		end
	end
	
	-- Normal C
	
	local function5 = temp_newcclosure(function()
		return 5
	end)
	
	local oldFunc5ENV = getfenv(function5)
	local oldFunc5FullInfo = {debug.info(function5, "fsnla")}
	
	local originalFunc5Clone = hookfunction(function5, coroutine.isyieldable)
	
	if type(function5()) ~= "boolean" then
		return {
			status = 500,
			message = "(C->C): Hooked function did not return the expected value",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function5, true, unpack(oldFunc5FullInfo))

		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(C->C): The function changed main info: ".. infoChanges,
			}
		elseif getfenv(function5) ~= oldFunc5ENV then
			return {
				status = 500,
				message = "(C->C): The C function changed the ENV for the principal C function",
			}
		end
	end
	
	hookfunction(function5, originalFunc5Clone)
	
	if function5() ~= 5 then
		return {
			status = 500,
			message = "(C->C): Restored function did not return the expected value",
		}
	end
	
	local function6 = clonefunction(wait)
	local oldFunc6ENV = getfenv(function6)
	local oldFunc6FullInfo = {debug.info(function6, "fsnla")}
	
	local originalFunc6Clone = hookfunction(function6, coroutine.isyieldable)

	local function6Start = tick()
	local moddedFunc6Result = function6()
	local function6Taked = tick() - function6Start
	
	if function6Taked > 0.0001 then
		return {
			status = 500,
			message = "(CYield->C): Hooked function its keeping yielding",
		}
	elseif type(moddedFunc6Result) ~= "boolean" then
		return {
			status = 500,
			message = "(CYield->C): Hooked function did not return the expected value",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function6, true, unpack(oldFunc6FullInfo))

		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(CYield->C): The function changed main info: ".. infoChanges,
			}
		end
	end

	hookfunction(function6, originalFunc6Clone)
	
	local originalFunc6Result = function6()
	if type(originalFunc6Result) ~= "number" or originalFunc6Result < 0.001 then
		return {
			status = 500,
			message = "(CYield->C): Restored function did not return the expected value",
		}
	end
	
	local Tick, TWait = tick, task.wait
	local function7Container = setfenv(function() -- Even if the ENV changes, it should not affect C wrap
		local start = Tick()
		TWait()
		return (Tick() - start > 0.0001 and 7) or "YIELD_TAMPERED"
	end, tempENV)
	
	local function7 = newcclosure(function7Container)
	
	hookfunction(function6, function7)
	
	local function6Start2 = tick()
	local moddedFunc6Result2 = function6()
	local function6Taked2 = tick() - function6Start2
	
	if function6Taked2 < 0.0001 then
		return {
			status = 500,
			message = "(CYield->NCYield): Hooked function its not keeping yielding",
		}
	elseif moddedFunc6Result2 == "YIELD_TAMPERED" then
		return {
			status = 500,
			message = "(CYield->NCYield): the time it took was too short",
		}
	elseif moddedFunc6Result2 ~= 7 then
		return {
			status = 500,
			message = "(CYield->NCYield): Hooked function did not return the expected value",
		}
	elseif getfenv(function7Container) ~= tempENV then
		return {
			status = 500,
			message = "(CYield->NCYield): the function changed the container ENV",
		}
	else
		local infoChanges = AnlyzeDebugInfo(function6, true, unpack(oldFunc6FullInfo))

		if infoChanges ~= "" then
			return {
				status = 500,
				message = "(CYield->NCYield): The function changed main info: ".. infoChanges,
			}
		elseif getfenv(function6) ~= oldFunc6ENV then
			return {
				status = 500,
				message = "(C->C): The C function changed the ENV for the principal C function",
			}
		end
	end
	
	
	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"hookfunc",
		"replaceclosure",
	})

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
