--!nocheck
--!nolint

return function()
	if not getfenv(0).makefolder then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(makefolder, "test1")
	local legal2Suc, legal2Msg = pcall(makefolder, "./test2")
	
	local illegal1Suc = pcall(makefolder, "C:/test3")
	local illegal2Suc = pcall(makefolder, "../test4")	

	if not legal1Suc then
		return {
			status = 0,
			message = "Failed to make @ test1: " .. legal1Msg
		}
	elseif not legal2Suc then
		return {
			status = 0,
			message = "Failed to make @ ./test2: " .. legal2Msg
		}
	elseif illegal1Suc then
		return {
			status = 0,
			message = "Didn't fail to make in illegal location: @ C:/test3"
		}
	elseif illegal2Suc then
		return {
			status = 0,
			message = "Didn't fail to make in illegal location: @ ../test4"
		}
	end

	delfolder("test1.txt")
	delfolder("./test2.txt")

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
