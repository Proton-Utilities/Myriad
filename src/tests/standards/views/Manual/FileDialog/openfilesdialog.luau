--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfilesdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfilesdialog, { extensionFilter = {} })

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		local names = {}
		for _, file in ipairs(result) do
			table.insert(names, file:GetName())
		end
		return { status = 200, message = `Got {#result} file(s): {table.concat(names, ", ")}` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
