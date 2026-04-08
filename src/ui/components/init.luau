--// Imports
local cascade = require("@packages/cascade")

--// Variables
local components = {
    ["TestingState"]   = require("@self/Testing State"),
    ["KeybindLabel"]   = require("@self/Keybind Label"),
    ["KeystrokeField"] = require("@self/Keystroke Field"),
    ["ChangelogEntry"] = require("@self/Changelog Entry"),
}

--// Publish
return function()
    for name, component in pairs(components) do
        cascade.RegisterComponent(name, component)
    end
end
