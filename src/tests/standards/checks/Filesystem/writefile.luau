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
	elseif not isfolder then
		return {
			status = 401,
			message = "Dependency 'isfolder' not found",
		}
	elseif not delfolder then
		return {
			status = 401,
			message = "Dependency 'delfolder' not found",
		}
	end

	--// Functionality test
	local legal1Suc, legal1Msg = pcall(writefile, "test1.txt", "Content")
	local legal2Suc, legal2Msg = pcall(writefile, "./test2.txt", "Content")
	local nestedSuc, nestedMsg = pcall(writefile, "bub/lik.txt", "")
	
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
	elseif not nestedSuc then
		return {
			status = 0,
			message = "Failed to write @ bub/lik.txt: " .. nestedMsg
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
	elseif not isfolder("bub") then
		return {
			status = 500,
			message = "Nested folder was not created"
		}
	end

	delfile("test1.txt")
	delfile("./test2.txt")
	delfolder("bub")

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
