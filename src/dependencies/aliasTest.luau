--!nocheck
--!nolint

return function(aliases)
    local function resolvePath(path)
        local index = getfenv(0)
    
        for segment in string.gmatch(path, "[^%.]+") do
            index = index and index[segment]
            if index == nil then break end
        end
    
        return index
    end    

    for _, alias in ipairs(aliases) do
        if not resolvePath(alias) then
            return false, alias 
        end
    end

    return true
end