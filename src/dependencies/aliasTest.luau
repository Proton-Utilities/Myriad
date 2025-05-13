--!nocheck
--!nolint

return function(aliases)
    for _, alias in ipairs(aliases) do
        local index = getfenv(0)
    
        for segment in string.gmatch(alias, "[^%.]+") do
            index = index and index[segment]
            if index == nil then break end
        end
    
        if not index then
            return false, alias 
        end
    end

    return true
end