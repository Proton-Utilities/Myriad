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

    if getgenv().MYRI == "Hello, World!" then
        return {
            status = 500,
            message = "getfenv affected getgenv",
        }
    end
    if getgenv().MYRI1 ~= "Hello, World!" then
        return {
            status = 500,
            message = "MYRI1 not found or unexpected value",
        }
    elseif getgenv().MYRI2 ~= 123456789 then
        return {
            status = 500,
            message = "MYRI2 not found or unexpected value",
        }
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
