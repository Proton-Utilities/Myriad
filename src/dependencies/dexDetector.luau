--// Dex tampers with decompile function in some builds

return function()
	for _, v in pairs(getgc(true)) do
		if typeof(v) == "table" then
			if rawget(v, "SideWindow") == 8 
               and rawget(v, "Window") == 10 
               and rawget(v, "Menu") == 100000 
               and rawget(v, "Core") == 101000 then
                return true
            end
		end
	end
	return false
end
