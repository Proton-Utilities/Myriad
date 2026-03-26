--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(savefiledialog, "", {
		suggestedName = "myriad-empty",
		defaultExtension = "txt",
	})

	if not ok then
		return { status = 0, message = `Errored with empty content: {result}` }
	elseif result then
		local readOk, content = pcall(function()
			return result:Read()
		end)

		if not readOk then
			return { status = 0, message = `Read() on empty-content file errored: {content}` }
		end

		if content ~= "" then
			return {
				status = 0,
				message = `Expected empty string, got {#content} byte(s): "{content}"`,
			}
		end

		return { status = 200, message = `Empty content written and Read() confirmed 0 bytes ✓ ({result:GetName()})` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
