--!nocheck
--!nolint

return function()
	local cryptReference = require("@dependencies/crypt/crypt.luau")
	if not getrunningscripts then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalScript = game.Players.LocalPlayer.Character:FindFirstChild("whysoud")
	local bytecode = getscriptbytecode(originalScript)
	local expectedSegments = {
		"sigma",
		"task",
		"wait",
		"GOT A DROP ON THIS FLEXING FELLA<MYRIAD_UD_MAX_UD_NEVER_SPEAK_TO_ME_AGAIN_KING_VON_IS_A_SAINT",
		"tostring"
	}

	for _, v in pairs(expectedSegments) do
		if not bytecode:find(v) then
			return {
				status = 500,
				message = "Didn't find an expected segment in the bytecode"
			}
		end
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({
		"dumpstring"
	})

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
