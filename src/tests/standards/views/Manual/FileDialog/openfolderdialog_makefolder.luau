--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfolderdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfolderdialog, {
		title = "Myriad",
	})

	if not ok then
		return { status = 0, message = `Errored opening dialog: {result}` }
	elseif result then
		local folderName = "myriad-test-subfolder"

		local makeOk, sub = pcall(function()
			return result:MakeFolder(folderName)
		end)

		if not makeOk then
			return { status = 0, message = `MakeFolder() errored: {sub}` }
		end

		if type(sub) ~= "table" then
			return { status = 0, message = `MakeFolder() returned {type(sub)}, expected folder object` }
		end

		if sub:IsFolder() ~= true then
			return { status = 0, message = `MakeFolder() result IsFolder() != true` }
		end

		if sub:IsFile() ~= false then
			return { status = 0, message = `MakeFolder() result IsFile() != false` }
		end

		local subName = sub:GetName()
		if subName ~= folderName then
			return {
				status = 0,
				message = `MakeFolder() name mismatch, expected "{folderName}", got "{subName}"`,
			}
		end

		local listOk, items = pcall(function()
			return result:List()
		end)

		if not listOk then
			return {
				status = 200,
				message = `MakeFolder() returned valid object but List() errored, cannot confirm on disk`,
			}
		end

		local found = false
		for _, item in ipairs(items) do
			if item:GetName() == folderName then
				found = true
				break
			end
		end

		if not found then
			return {
				status = 0,
				message = `MakeFolder() object ok but "{folderName}" not found via List(), not written to disk?`,
			}
		end

		return {
			status = 200,
			message = `MakeFolder() created "{folderName}" inside {result:GetName()} ✓`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
