--// Requires
local Signal = require("@packages/signal")

--// Variables
local self = {
    Checks = require("@tests/standards/checks"),
    StatusCodes = require("@modules/statusCodes").Standards,
    OnResult = Signal(),
    OnComplete = Signal()
}

--// Types
export type StandardTestOptions = {
    checkpointDelay: number?, 
    includes: { [number]: string }?, 
    excludes: { [number]: string }?, 
    timeout: number?
}

--// Public Methods
function self.Run(options: StandardTestOptions?)
    options = options or {} :: StandardTestOptions

    for groupName, group in self.Checks do
        for name, test in group do
            if options.includes and not (table.find(options.includes, name) or table.find(options.includes, groupName)) then
                continue
            end

            if options.excludes and (table.find(options.excludes, name) or table.find(options.excludes, groupName)) then
                continue
            end

            local isFinished = false
            local result
            
            local thread = task.spawn(function()
                result = test()
                isFinished = true
            end)

            if options.timeout then
                local start = os.clock()
                while not isFinished and os.clock() - start < options.timeout do
                    task.wait()
                end

                if not isFinished then
                    local success = pcall(task.cancel, thread)
                    if not success then
                        pcall(coroutine.close, thread)
                    end
                    result = {
                        status = 408,
                        message = `Test timed out after {options.timeout} seconds.`
                    }
                end
            else
                while not isFinished do
                    task.wait()
                end
            end

            self.OnResult:Fire(name, result, groupName)

            if options.checkpointDelay then
                task.wait(options.checkpointDelay)
            end
        end
    end

    self.OnComplete:Fire()
end

return self