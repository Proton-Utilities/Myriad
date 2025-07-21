--!nocheck
--!nolint

return function()
	if not writefile then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not delfile then
		return {
			status = 401,
			message = "Dependency 'delfile' not found",
		}
	elseif not readfile then
		return {
			status = 401,
			message = "Dependency 'readfile' not found",
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
	elseif readfile("test1.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't give expected contnet"
		}
	elseif readfile("test2.txt") ~= "Content" then
		return {
			status = 500,
			message = "File didn't give expected contnet"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")

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
