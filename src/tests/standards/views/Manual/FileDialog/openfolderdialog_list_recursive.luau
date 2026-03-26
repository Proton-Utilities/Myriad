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
		local flatOk, flat = pcall(function()
			return result:List(false)
		end)

		local recursiveOk, recursive = pcall(function()
			return result:List(true)
		end)

		if not flatOk then
			return { status = 0, message = `List(false) errored: {flat}` }
		end

		if not recursiveOk then
			return { status = 0, message = `List(true) errored: {recursive}` }
		end

		if type(recursive) ~= "table" then
			return { status = 0, message = `List(true) returned {type(recursive)}, expected table` }
		end

		if #recursive < #flat then
			return {
				status = 0,
				message = `List(true) returned fewer items ({#recursive}) than List(false) ({#flat})`,
			}
		end

		return {
			status = 200,
			message = `List(false)={#flat} item(s), List(true)={#recursive} item(s) in {result:GetName()}`,
		}
	else
		return { status = 200, message = "Returned nil (user cancelled)" }
	end
end
