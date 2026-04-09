local fs = require("@lune/fs")
local checks = fs.readFile("src/tests/standards/checks/init.luau")

local flattened = {}
local seen = {}

local function flatten(name)
    if not name or seen[name] then return end
    table.insert(flattened, name)
    seen[name] = true
end

for name, path in string.gmatch(checks, '%["([^"]+)"%] = require%("@checks/([^"]+)"%)') do
    flatten(name)
    
    local file_path = "src/tests/standards/checks/" .. path
    if not string.find(file_path, "%.luau$") then
        file_path = file_path .. ".luau"
    end
    
    if fs.isFile(file_path) then
        local content = fs.readFile(file_path)
        local aliases_block = string.match(content, 'require%("@dependencies/aliasTest%.luau"%)%s*%(%s*{(.-)}%s*%)')
        if aliases_block then
            for alias in string.gmatch(aliases_block, '"([^"]+)"') do
                flatten(alias)
            end
            for alias in string.gmatch(aliases_block, "'([^']+)'") do
                flatten(alias)
            end
        end
    end
end

table.sort(flattened)
print(flattened)

return flattened
