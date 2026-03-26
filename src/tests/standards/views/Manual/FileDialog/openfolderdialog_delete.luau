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
		local folderName = "myriad-delete-test"

		local makeOk, sub = pcall(function()
			return result:MakeFolder(folderName)
		end)

		if not makeOk then
			return { status = 0, message = `MakeFolder() errored (needed for delete test): {sub}` }
		end

		local deleteOk, deleteErr = pcall(function()
			sub:Delete()
		end)

		if not deleteOk then
			return { status = 0, message = `Delete() errored: {deleteErr}` }
		end

		local listOk, items = pcall(function()
			return result:List()
		end)

		if not listOk then
			return {
				status = 200,
				message = "Delete() did not error but List() failed, cannot confirm removal from disk",
			}
		end

		for _, item in ipairs(items) do
			if item:GetName() == folderName then
				return {
					status = 0,
					message = `Delete() did not error but "{folderName}" still appears in List()`,
				}
			end
		end

		return {
			status = 200,
			message = `Delete() removed "{folderName}" from {result:GetName()} ✓`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
