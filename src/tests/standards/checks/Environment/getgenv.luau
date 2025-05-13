--!nocheck
--!nolint

return function()
	if not getfenv(0).getgenv then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    getfenv().MYRI = "Hello, World!"
    getgenv().MYRI1 = "Hello, World!"
    getgenv().MYRI2 = 123456789
    getgenv().MYRI3 = {"Hello,", "World!"}

    if not getgenv().MYRI == "Hello, World!" then
        return {
            status = 500,
            message = "getfenv unaffected getgenv",
        }
    end
    if not getgenv().MYRI1 == "Hello, World!" then
        return {
            status = 500,
            message = "MYRI1 not found or unexpected value",
        }
    elseif not getgenv().MYRI2 == 123456789 then
        return {
            status = 500,
            message = "MYRI2 not found or unexpected value",
        }
    elseif not getgenv().MYRI3 == {"Hello,", "World!"} then
        return {
            status = 500,
            message = "MYRI3 not found or unexpected value",
        }
    end

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
