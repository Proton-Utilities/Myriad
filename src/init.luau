--!nocheck
local tests = {
	["Identity Validity"] = require("identity/init.luau"),
	["Standards Naming & Output Conventions"] = require("standards/init.luau"),
	["Vulnerability Mitigation"] = require("vulnerabilities/init.luau"),
}
local results = {}

local uni = {
	bullet = "•",
	section1 = "~~~~~~~~ TESTS ~~~~~~~~",
	section2 = "---------------------------------------------",
}

print("Myriad General Validity Test (2025)")

print(`Executor: {identifyexecutor and identifyexecutor() or "Unknown"}\n`)

print("Contributors:")
print(`{uni.bullet} biggaboy212\n`)

print(uni.section1 .. "\n")
for index, test in pairs(tests) do
	results[index] = test(index)
    if index ~= "Vulnerability Mitigation" then
        print(uni.section2 .. "\n")
    end
end