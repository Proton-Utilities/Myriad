--!nocheck
--!nolint UnknownGlobal

local Interface = require("dependencies/ReGui/ReGui.luau")

local tests = {
	["Standards"] = require("tests/standards/init.luau"),
	["Vulnerability"] = require("tests/vulnerabilities/init.luau"),
}

local window = Interface:TabsWindow({
	Title = "Myriad General Validity Test",
	Size = UDim2.fromOffset(400, 500),
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

	home:Separator({"STANDARDS TEST"})

	home:Label({
		Text = [[❓ - Call errored or failed
✅ - Passed
🔎 - Global not found
📦 - Dependency not found
🛠️ - Failed functionality test
🏷️ - Missing alias]]
	})

	local inputOutput = nil
	home:Button({
		Text = "Strip RichText (For copying results)",
		Callback = function(self)
			inputOutput:SetValue(inputOutput:GetValue():gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
		end,
	})
	inputOutput = home:Console({
		ReadOnly = false,
		Size = UDim2.new(1, -5, 0, 50),
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
