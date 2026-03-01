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
	local actor = game.Players.LocalPlayer.PlayerScripts:FindFirstChild("PMOVON")

	if not actor then
		return {
			status = 500,
			message = "Failed find to actor",
		}
	end

	local tempFolder = Instance.new("Folder", game)
	tempFolder.Name = os.date("%H")

	local detectXref = {}
	local sendData = {
		["GAME"] = game,
		["TABLE"] = detectXref,
		["TABLE_STR"] = tostring(detectXref),
	}

	local success, errorMessage = pcall(
		run_on_actor,
		actor,
		[[local Table = ...
    workspace:SetAttribute("MYRIAD_ROA_TABLETEST", type(Table) == "table")]],
		{}
	)

	task.wait(0.1)

	local receivedTable = workspace:GetAttribute("MYRIAD_ROA_TABLETEST")
	workspace:SetAttribute("MYRIAD_ROA_TABLETEST", nil)

	if not success or not receivedTable then
		return {
			status = 500,
			message = "Does not support tables as argument",
		}
	end

	run_on_actor(
		actor,
		[[
        local externaldData = ({...})[1]
        
        local originalPart = Instance.new("TrussPart")
        
        if not externaldData or type(externaldData) ~= "table" then
            originalPart.Name = "ONE_ARG"
        elseif tostring(externaldData["TABLE"]) == externaldData["TABLE_STR"] then
            originalPart.Name = "SAME_XREF"
        elseif externaldData["GAME"] ~= game then
            originalPart.Name = "GAME_XREF"
        elseif select("#", ...) ~= 5 then
            originalPart.Name = "MULTI_ARGS"
        else
            originalPart.Name = "SUCCESS"
        end
        
        task.delay(0.25, function()
            originalPart:Destroy()
        end)

        originalPart.Parent = game[os.date("%H")]
    ]],
		sendData,
		1,
		2,
		3,
		4
	)

	task.wait(0.1)

	local TrussPart = tempFolder:FindFirstChildWhichIsA("TrussPart")

	tempFolder:Destroy()

	if not TrussPart then
		return {
			status = 500,
			message = "Failed to find a TrussPart created by the actor",
		}
	end

	local statusResult = TrussPart.Name
	TrussPart:Destroy()

	if statusResult == "SAME_XREF" then
		return {
			status = 500,
			message = "The tables have the same xrefs as in the main VM",
		}
	elseif statusResult == "GAME_XREF" then
		return {
			status = 500,
			message = "Xrefs are not converted automatically, which could cause problems in functions and table Keys",
		}
	elseif statusResult == "ONE_ARG" then
		return {
			status = 500,
			message = "Its fatal error, does not support a single argument",
		}
	elseif statusResult == "MULTI_ARGS" then
		return {
			status = 500,
			message = "Does not support multiple arguments",
		}
	elseif statusResult ~= "SUCCESS" then
		return {
			status = 500,
			message = "Unknown error, check console",
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
