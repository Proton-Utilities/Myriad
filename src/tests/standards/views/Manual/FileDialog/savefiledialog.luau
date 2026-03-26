--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(savefiledialog, '{ "test": true }', {
		extensionFilter = { "json" },
		suggestedName = "myriad-test",
		defaultExtension = "json",
	})

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		return { status = 200, message = `Saved as: {result:GetName()}` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
