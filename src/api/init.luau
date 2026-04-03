--// Variables
local self = {
    Version = _P.vers,
    Target = _P.cfg,
    BuildDate = _P.genDate
}

--// Public
self.Standards = require("@self/tests").Standards

return self