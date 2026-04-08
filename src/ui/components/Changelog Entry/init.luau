local ui = require("@self/ui")
local cascade = require("@packages/cascade")
local binder = cascade.Binder

--// Types
type ChangelogEntryProperties = {
	Version: string?,
	Tags: { string }?,
	Changes: { [string]: { string } }?,
}

--// Publish
return function(self, properties: any)
	properties = properties or {}

	local structures, _theme = ui(self, properties)

	local object = binder.Wrap(properties, {
		Version = function(val: string)
			if structures.VersionLabel then
				structures.VersionLabel.Text = `v{val}`
			end
		end,
		Tags = function(val: { string })
			for _, child in ipairs(structures.TagsFrame:GetChildren()) do
				if not child:IsA("UIListLayout") then
					child:Destroy()
				end
			end
			structures._populate(val, nil, nil)
		end,
		Changes = function(_val)
			structures._populate(
				properties.Version,
				properties.Tags,
				properties.Changes
			)
		end,
	}, structures.Body)

	object.Type       = "ChangelogEntry"
	object.Theme      = self.Theme
	object.Structures = structures
	object.__container = structures.Body

	binder.Apply(properties, object)

	return object :: ChangelogEntryProperties
end
