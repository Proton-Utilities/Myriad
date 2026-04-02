return {
	--// Globals
	{
		name = "Stats().Parent",
		getter = function()
			return Stats().Parent
		end,
	},
	{
		name = "UserSettings().Parent",
		getter = function()
			return UserSettings().Parent
		end,
	},
	{
		name = "settings().Parent",
		getter = function()
			return settings().Parent
		end,
	},

	--// GetService
	{
		name = "GetService(Stats).Parent",
		getter = function()
			return game:GetService("Stats").Parent
		end,
	},
	{
		name = "GetService(UserGameSettings).Parent",
		getter = function()
			return game:GetService("UserGameSettings").Parent
		end,
	},

	--// Instance.new
	{
		name = "Instance.new(...).Parent -> ...",
		getter = function()
			local v = Instance.new("ObjectValue")
			v.Parent = game:GetService("ReplicatedStorage")
			local root = v
			for _ = 1, 8 do
				local p = root.Parent
				if p == nil then
					break
				end
				root = p
			end
			v:Destroy()
			return root
		end,
	},
}
