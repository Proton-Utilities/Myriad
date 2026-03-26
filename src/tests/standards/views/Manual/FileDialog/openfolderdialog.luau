--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfolderdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfolderdialog, {})

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		return { status = 200, message = `Got folder: {result:GetName()}` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
