--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfiledialog then
		return { status = 400, message = "Global not found" }
	end

	local allowed = { png = true, jpg = true, jpeg = true }

	local ok, result = pcall(openfiledialog, {
		title = "Myriad",
		extensionFilter = { "png", "jpg", "jpeg" },
	})

	if not ok then
		return { status = 0, message = `Errored with multi extensionFilter: {result}` }
	elseif result then
		local name = result:GetName()
		local ext = name:match("%.([^%.]+)$")

		if ext and allowed[ext:lower()] then
			return { status = 200, message = `Got image file: {name}` }
		else
			return { status = 0, message = `Extension filter not enforced. Got: {name}` }
		end
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
