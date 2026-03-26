--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfilesdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfilesdialog)

	if not ok then
		return { status = 0, message = `Errored with no options: {result}` }
	elseif result then
		return { status = 200, message = `Got {#result} file(s)` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
