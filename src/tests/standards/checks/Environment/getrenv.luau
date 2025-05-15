--!nocheck
--!nolint

return function()
	if not getfenv(0).getrenv then
		return {
			status = 400,
			message = "Global not found",
		}
	end

    getrenv().MYRIR1 = "Hello, World!"
    getrenv().MYRIR2 = 123456789

    if getrenv().MYRIR1 ~= "Hello, World!" then
        return {
            status = 500,
            message = "MYRIR1 not found or unexpected value",
        }
    elseif getrenv().MYRIR2 ~= 123456789 then
        return {
            status = 500,
            message = "MYRIR2 not found or unexpected value",
        }
    elseif getrenv().game ~= game then
        return {
            status = 500,
            message = "game not found or unexpected value",
        }
    elseif getrenv().print ~= print then
        return {
            status = 500,
            message = "print not found or unexpected value",
        }
    elseif getrenv()._G == _G then
        return {
            status = 500,
            message = "_G in roblox environment shouldn't match the executor's",
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
