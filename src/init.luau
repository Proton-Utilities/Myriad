--!nocheck

local tests = {
	["Standards Naming & Output Conventions"] = require("standards/init.luau"),
	["Vulnerability Mitigation"] = require("vulnerabilities/init.luau"),
}
local results = {}

local uni = {
	bullet = "•",
	section1 = "~~~~~~~~~~~~~~~~~~~~~~~~~ TESTS ~~~~~~~~~~~~~~~~~~~~~~~~~",
	section2 = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
	section3 = "────────────────",
}

print("Myriad General Validity Test (2025)")

print(`Executor: {identifyexecutor and identifyexecutor() or "Unknown"}\n`)

print("Contributors:")
print(`{uni.bullet} biggaboy212\n`)

print(uni.section1 .. "\n")

local function test(name)
	results[name] = tests[name](name)
end

test("Standards Naming & Output Conventions")
print(uni.section3 .. "\n")
test("Vulnerability Mitigation")

print(uni.section2)