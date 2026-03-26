--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfiledialog then
		return { status = 400, message = "Global not found" }
	end

	local saveOk = savefiledialog ~= nil

	if saveOk then
		local saveResult
		local ok, err = pcall(function()
			saveResult = savefiledialog("myriad-delete-file-test", {
				suggestedName = "myriad-delete-me",
				defaultExtension = "txt",
			})
		end)

		if not ok then
			return { status = 0, message = `savefiledialog() errored while setting up: {err}` }
		end

		if not saveResult then
			return { status = 200, message = "Save cancelled, skipping delete test" }
		end

		local deleteOk, deleteErr = pcall(function()
			saveResult:Delete()
		end)

		if not deleteOk then
			return { status = 0, message = `Delete() errored on file: {deleteErr}` }
		end

		local readOk, _ = pcall(function()
			return saveResult:Read()
		end)

		if readOk then
			return {
				status = 0,
				message = "Delete() did not error, but Read() still succeeded. File may not be gone.",
			}
		end

		return { status = 200, message = `Delete() removed {saveResult:GetName()} and Read() correctly errored ✓` }
	else
		local ok, result = pcall(openfiledialog, {
			title = "Myriad",
		})

		if not ok then
			return { status = 0, message = `Errored opening dialog: {result}` }
		elseif result then
			local name = result:GetName()

			local deleteOk, deleteErr = pcall(function()
				result:Delete()
			end)

			if not deleteOk then
				return { status = 0, message = `Delete() errored: {deleteErr}` }
			end

			local readOk, _ = pcall(function()
				return result:Read()
			end)

			if readOk then
				return {
					status = 0,
					message = "Delete() did not error, but Read() still succeeded. File may not be gone.",
				}
			end

			return { status = 200, message = `Delete() removed {name} and Read() correctly errored ✓` }
		else
			return { status = 200, message = "Returned nil (user cancelled)" }
		end
	end
end
