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
		local base = "base"
		local suffix = "-appended"

		local writeOk, writeErr = pcall(function()
			result:Write(base)
		end)

		if not writeOk then
			return { status = 0, message = `Write() errored: {writeErr}` }
		end

		local appendOk, appendErr = pcall(function()
			result:Append(suffix)
		end)

		if not appendOk then
			return { status = 0, message = `Append() errored: {appendErr}` }
		end

		local readOk, content = pcall(function()
			return result:Read()
		end)

		if not readOk then
			return { status = 0, message = `Read() after Append() errored: {content}` }
		end

		local expected = base .. suffix

		if content ~= expected then
			return {
				status = 0,
				message = `Append mismatch, expected "{expected}", got "{content}"`,
			}
		end

		return {
			status = 200,
			message = `Append() → Read() passed, content is "{content}" on {result:GetName()}`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
