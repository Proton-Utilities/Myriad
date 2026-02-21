--!nocheck
--!nolint

return function()
	if not run_on_actor then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local actor = game.Players.LocalPlayer.Character:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed find to actor"
		}
	end

	local tempFolder = Instance.new("Folder", game)
	tempFolder.Name = os.date("%H")

	run_on_actor(actor, [[
        local OriginalGame = ({...})[1]
        
        local originalPart = Instance.new("TrussPart")
		
		if not OriginalGame then
			originalPart.Name = "ONE_ARG"
        elseif OriginalGame == game then
            originalPart.Name = "SAME_GAME"
        elseif select("#", ...) ~= 5 then
            originalPart.Name = "MULTI_ARGS"
        else
            originalPart.Name = "SUCCESS"
        end
        
        task.delay(0.25, function()
            originalPart:Destroy()
        end)

        originalPart.Parent = game[os.date("%H")]
    ]], game, 1, 2, 3, 4)

	task.wait(0.1)

	local TrussPart = tempFolder:FindFirstChildWhichIsA("TrussPart")

	tempFolder:Destroy()

	if not TrussPart then
		return {
			status = 500,
			message = "Failed to find a TrussPart created by the actor"
		}
	end

	local statusResult = TrussPart.Name
	TrussPart:Destroy()

	if statusResult == "SAME_GAME" then
		return {
			status = 500,
			message = "The xrefs of the original VM are the same as those of the actor"
		}
	elseif statusResult == "ONE_ARG" then
		return {
			status = 500,
			message = "Its fatal error, does not support a single argument"
		}
	elseif statusResult == "MULTI_ARGS" then
		return {
			status = 500,
			message = "Does not support multiple arguments"
		}
	elseif statusResult ~= "SUCCESS" then
		return {
			status = 500,
			message = "Unknown error, check console"
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
