--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfilesdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfilesdialog, {
		title = "Myriad",
		extensionFilter = { "txt", "json" },
	})

	if not ok then
		return { status = 0, message = `Errored with extensionFilter: {result}` }
	elseif result then
		local allowed = { txt = true, json = true }
		local violations = {}

		for _, file in ipairs(result) do
			local name = file:GetName()
			local ext = name:match("%.([^%.]+)$")

			if not ext or not allowed[ext:lower()] then
				table.insert(violations, name)
			end
		end

		if #violations > 0 then
			return {
				status = 0,
				message = `Extension filter not enforced, unexpected files: {table.concat(violations, ", ")}`,
			}
		end

		local names = {}
		for _, file in ipairs(result) do
			table.insert(names, file:GetName())
		end

		return { status = 200, message = `Got {#result} filtered file(s): {table.concat(names, ", ")}` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
