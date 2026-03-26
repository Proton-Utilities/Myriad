--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfiledialog, {
		title = "Myriad",
	})

	if not ok then
		return { status = 0, message = `Errored opening dialog: {result}` }
	elseif result then
		local readOk, content = pcall(function()
			return result:Read()
		end)

		if not readOk then
			return { status = 0, message = `Read() errored: {content}` }
		end

		if type(content) ~= "string" then
			return { status = 0, message = `Read() returned {type(content)}, expected string` }
		end

		return {
			status = 200,
			message = `Read() returned a string {#content} byte(s) from {result:GetName()}`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
