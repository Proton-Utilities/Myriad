--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(savefiledialog, '{ "defaultExtension": true }', {
		suggestedName = "myriad-ext-test",
		defaultExtension = "json",
	})

	if not ok then
		return { status = 0, message = `Errored with defaultExtension option: {result}` }
	elseif result then
		local name = result:GetName()
		local ext = name:match("%.([^%.]+)$")

		if not ext then
			return { status = 0, message = `Saved file has no extension, expected ".json": {name}` }
		end

		if ext:lower() ~= "json" then
			return {
				status = 0,
				message = `Expected ".json" extension but got ".{ext}" in: {name}`,
			}
		end

		return { status = 200, message = `defaultExtension ".json" appended correctly, saved as: {name} ✓` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
