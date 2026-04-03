return {
    Standards = {
        [0] = "❓", -- Call errored/failed
        [200] = "✅", -- Passed
        [400] = "🔎", -- Global not found
        [401] = "📦", -- Dependency not found
        [500] = "🛠️", -- Failed functionality test
        [501] = "🏷️", -- Missing alias
    },
    Vulnerabilities = {
        [200] = "🛡️", -- Secured/Blocked
        [400] = "💀", -- Vulnerable
        [404] = "❓", -- Ambiguous
    }
}