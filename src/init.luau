--!nocheck

local Interface = require("dependencies/ReGui/ReGui.luau")

local tests = {
	["Standards"] = require("tests/standards/init.luau"),
	["Vulnerability"] = require("tests/vulnerabilities/init.luau"),
}

local window = Interface:TabsWindow({
	Title = "Myriad General Validity Test",
	Size = UDim2.fromOffset(300, 400),
})

do
	local home = window:CreateTab({
		Name = "Home",
	})

	home:Label({
		RichText = true,
		Text = "<b>Myriad General Validity Test (2025)</b>",
	})
	home:Label({
		RichText = true,
		Text = `Executor: <b>{(identifyexecutor and identifyexecutor() or "Unknown")}</b>`,
	})

	home:Label({
		RichText = true,
		Text = "\nContributors:",
	})
	home:BulletText({
		RichText = true,
		Rows = {
			"biggaboy212",
		},
	})
end

for name, test in tests do
	local tab = window:CreateTab({ Name = name })
	local output = tab:Console({
		ReadOnly = true,
		RichText = true,
		Size = UDim2.new(1, -5, 1, 0),
	})

	tests[name](name, output)
end
