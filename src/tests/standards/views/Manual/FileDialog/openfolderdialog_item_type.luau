--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not openfolderdialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(openfolderdialog, {
		title = "Myriad",
	})

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		local isFile = result:IsFile()
		local isFolder = result:IsFolder()

		if isFile ~= false then
			return { status = 0, message = `IsFile() returned {tostring(isFile)}, expected false` }
		end

		if isFolder ~= true then
			return { status = 0, message = `IsFolder() returned {tostring(isFolder)}, expected true` }
		end

		return { status = 200, message = `IsFile()=false, IsFolder()=true ✓ ({result:GetName()})` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
