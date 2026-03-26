--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local payload = '{ "myriad": true, "test": "content-written" }'

	local ok, result = pcall(savefiledialog, payload, {
		extensionFilter = { "json" },
		suggestedName = "myriad-content-test",
		defaultExtension = "json",
	})

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		local readOk, content = pcall(function()
			return result:Read()
		end)

		if not readOk then
			return { status = 0, message = `Read() on saved file errored: {content}` }
		end

		if content ~= payload then
			return {
				status = 0,
				message = `Content mismatch, wrote "{payload}", read back "{content}"`,
			}
		end

		return {
			status = 200,
			message = `Content verified on disk in {result:GetName()} ✓`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
