--!nocheck
--!nolint

return function(page, tab, titledRow)
	if not savefiledialog then
		return { status = 400, message = "Global not found" }
	end

	local ok, result = pcall(savefiledialog, "item type test", {
		suggestedName = "myriad-type-test",
		defaultExtension = "txt",
	})

	if not ok then
		return { status = 0, message = `Errored: {result}` }
	elseif result then
		local isFile = result:IsFile()
		local isFolder = result:IsFolder()

		if isFile ~= true then
			return { status = 0, message = `IsFile() returned {tostring(isFile)}, expected true` }
		end

		if isFolder ~= false then
			return { status = 0, message = `IsFolder() returned {tostring(isFolder)}, expected false` }
		end

		return { status = 200, message = `IsFile()=true, IsFolder()=false ✓ ({result:GetName()})` }
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
