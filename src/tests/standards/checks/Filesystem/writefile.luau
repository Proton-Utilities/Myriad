--!nocheck
--!nolint

return function()
	if not getfenv(0).writefile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not getfenv(0).delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
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
			status = 0,
			message = "Didn't fail to write in illegal location: @ C:/test3.txt"
		}
	elseif illegal2Suc then
		return {
			status = 0,
			message = "Didn't fail to write in illegal location: @ ../test4.txt"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")

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
