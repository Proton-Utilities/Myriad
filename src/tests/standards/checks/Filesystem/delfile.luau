--!nocheck
--!nolint

return function()
	if not delfile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not writefile then
		return {
			status = 401,
			message = "Dependency 'writefile' not found",
		}
	elseif not isfile then
		return {
			status = 401,
			message = "Dependency 'isfile' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(writefile, "test1.txt", "Content")
	local legal2Suc, legal2Msg = pcall(writefile, "./test2.txt", "Content")
	
	local illegal1Suc = pcall(writefile, "C:/test3.txt", "Content")
	local illegal2Suc = pcall(writefile, "../test4.txt", "Content")	

	if not legal1Suc then
		return {
			status = 0,
			message = "Failed to write @ test1.txt: " .. legal1Msg
		}
	elseif not legal2Suc then
		return {
			status = 0,
			message = "Failed to write @ ./test2.txt: " .. legal2Msg
		}
	elseif illegal1Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ C:/test3.txt"
		}
	elseif illegal2Suc then
		return {
			status = 500,
			message = "Didn't fail to write in illegal location: @ ../test4.txt"
		}
	elseif not isfile("test1.txt") then
		return {
			status = 500,
			message = "Didn't find: test1.txt"
		}
	elseif not isfile("./test2.txt") then
		return {
			status = 500,
			message = "Didn't find: ./test2.txt"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")

	task.wait(0.2)

	if isfile("test1.txt") then
		return {
			status = 500,
			message = "Found: test1.txt"
		}
	elseif isfile("./test2.txt") then
		return {
			status = 500,
			message = "Found: ./test2.txt"
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
