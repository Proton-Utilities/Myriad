--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfiledialog then
		return { status = 400, message = "Global not found" }
	end

	local writePayload = "myriad-write-test"

	local ok, result = pcall(openfiledialog, {
		title = "Myriad",
	})

	if not ok then
		return { status = 0, message = `Errored opening dialog: {result}` }
	elseif result then
		local writeOk, writeErr = pcall(function()
			result:Write(writePayload)
		end)

		if not writeOk then
			return { status = 0, message = `Write() errored: {writeErr}` }
		end

		local readOk, content = pcall(function()
			return result:Read()
		end)

		if not readOk then
			return { status = 0, message = `Read() after Write() errored: {content}` }
		end

		if content ~= writePayload then
			return {
				status = 0,
				message = `Write/Read mismatch, wrote "{writePayload}", read back "{content}"`,
			}
		end

		return { status = 200, message = `Write() → Read() roundtrip passed on {result:GetName()}` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
