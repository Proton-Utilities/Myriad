--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local suggested = "myriad-suggested"

	local ok, result = pcall(savefiledialog, "suggestedName test", {
		suggestedName = suggested,
		defaultExtension = "txt",
	})

	if not ok then
		return { status = 0, message = `Errored with suggestedName option: {result}` }
	elseif result then
		local name = result:GetName()
		local stem = name:match("^(.+)%.[^%.]+$") or name

		if stem == suggested then
			return { status = 200, message = `suggestedName preserved, saved as: {name} ✓` }
		else
			return {
				status = 0,
				message = `Saved as: {name} (stem "{stem}" differs from suggested "{suggested}", may be intentional)`,
			}
		end
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
