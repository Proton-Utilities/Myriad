--// Imports
local cascade = require("@packages/cascade")

--// Variables
local components = {
    ["TestingState"] = require("@self/Testing State"),
    ["KeybindLabel"] = require("@self/Keybind Label"),
}

--// Publish
return function()
    for name, component in pairs(components) do
        cascade.RegisterComponent(name, component)
    end
end
