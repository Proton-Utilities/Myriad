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
		return { status = 0, message = `Errored opening dialog: {result}` }
	elseif result then
		local listOk, items = pcall(function()
			return result:List()
		end)

		if not listOk then
			return { status = 0, message = `List() errored: {items}` }
		end

		if type(items) ~= "table" then
			return { status = 0, message = `List() returned {type(items)}, expected table` }
		end

		for i, item in ipairs(items) do
			local nameOk, name = pcall(function()
				return item:GetName()
			end)

			if not nameOk or type(name) ~= "string" then
				return { status = 0, message = `items[{i}] GetName() failed or non-string` }
			end
		end

		return {
			status = 200,
			message = `List() returned {#items} item(s) inside {result:GetName()}`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
