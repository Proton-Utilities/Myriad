local valueState = require("@modules/valueState")

return {
	keybinds = {
		toggleMenu = valueState.new({ Enum.KeyCode.RightControl }),
		runStandardsTest = valueState.new({ "Control", "Shift", "S" }),
		runVulnerabilityTest = valueState.new({ "Control", "Shift", "V" }),
		runStressTest = valueState.new({ "Control", "Shift", "T" }),
	},
}
