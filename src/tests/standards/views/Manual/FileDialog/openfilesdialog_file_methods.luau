--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfilesdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfilesdialog, {
		title = "Myriad",
	})

	if not ok then
		return { status = 0, message = `Errored opening dialog: {result}` }
	elseif result then
		if #result == 0 then
			return { status = 0, message = "Got an empty array instead of nil for cancel (expected nil)" }
		end

		local issues = {}

		for i, file in ipairs(result) do
			if file:IsFile() ~= true then
				table.insert(issues, `file[{i}] IsFile() != true`)
			end

			if file:IsFolder() ~= false then
				table.insert(issues, `file[{i}] IsFolder() != false`)
			end

			local nameOk, name = pcall(function()
				return file:GetName()
			end)

			if not nameOk or type(name) ~= "string" then
				table.insert(issues, `file[{i}] GetName() failed or non-string`)
			end

			local readOk, _ = pcall(function()
				return file:Read()
			end)

			if not readOk then
				table.insert(issues, `file[{i}] Read() errored`)
			end
		end

		if #issues > 0 then
			return { status = 0, message = table.concat(issues, " | ") }
		end

		return { status = 200, message = `All methods verified on {#result} file(s)` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
