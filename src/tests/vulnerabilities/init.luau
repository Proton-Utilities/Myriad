--!nocheck
--!nolint LocalUnused

return function(name, output)
	output:Clear()

	local warn = function(message)
		output:AppendText(`<font color="#FFA500">{tostring(message)}</font>`)
	end

    output:AppendText("Not implemented")
end
