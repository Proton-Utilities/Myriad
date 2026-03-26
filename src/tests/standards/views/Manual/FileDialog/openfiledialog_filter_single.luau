--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfiledialog, {
		title = "Myriad",
		extensionFilter = { "txt" },
	})

	if not ok then
		return { status = 0, message = `Errored with single extensionFilter: {result}` }
	elseif result then
		local name = result:GetName()
		local ext = name:match("%.([^%.]+)$")

		if ext and ext:lower() == "txt" then
			return { status = 200, message = `Got .txt file: {name}` }
		else
			return { status = 0, message = `Extension filter not enforced. Got: {name}` }
		end
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
