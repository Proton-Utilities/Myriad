--// Imports
local fs = require("@lune/fs")
local process = require("@lune/process")

--// Private Methods
local function trim(s: string): string
	return s:match("^%s*(.-)%s*$") or s
end

local function split(s: string, sep: string): { string }
	local parts: { string } = {}
	local pattern = "([^" .. sep .. "]*)" .. sep .. "?"
	for part in s:gmatch(pattern) do
		if part ~= "" then
			table.insert(parts, part)
		end
	end
	return parts
end

local function parseTags(line: string): { string }
	local tags: { string } = {}
	for tag in line:gmatch("`([^`]+)`") do
		table.insert(tags, tag)
	end
	return tags
end

--// Types
type ChangeSection = {
	added: { string }?,
	changed: { string }?,
	deprecated: { string }?,
	removed: { string }?,
	fixed: { string }?,
	security: { string }?,
}

type Release = {
	version: string,
	date: string?,
	tags: { string },
	changes: ChangeSection,
}

type Changelog = {
	title: string,
	unreleased: ChangeSection?,
	releases: { Release },
}

--// Parser
local SECTION_KINDS: { [string]: string } = {
	added = "added",
	changed = "changed",
	deprecated = "deprecated",
	removed = "removed",
	fixed = "fixed",
	security = "security",
}

local function parseChangelog(source: string): Changelog
	local lines = split(source, "\n")
	local changelog: Changelog = {
		title = "Changelog",
		releases = {},
	}

	local i = 1
	local currentRelease: Release? = nil
	local currentSection: string? = nil
	local currentChanges: ChangeSection = {}

	local function flushRelease()
		if currentRelease then
			currentRelease.changes = currentChanges
			table.insert(changelog.releases, currentRelease)
			currentRelease = nil
		elseif changelog.unreleased == nil and next(currentChanges) ~= nil then
			changelog.unreleased = currentChanges
		end
		currentChanges = {}
		currentSection = nil
	end

	while i <= #lines do
		local line = lines[i]

		if line:match("^#%s+(.+)") then
			changelog.title = trim(line:match("^#%s+(.+)") or "Changelog")
		elseif line:match("^##%s+") then
			flushRelease()

			local versionRaw = line:match("%[(.-)%]")
			local dateRaw = line:match("%-%s+(%d%d%d%d%-%d%d%-%d%d)")
			local tags = parseTags(line)

			if versionRaw == "Unreleased" then
				currentRelease = nil
			else
				currentRelease = {
					version = versionRaw or "unknown",
					date = dateRaw,
					tags = tags,
					changes = {},
				}
			end
		elseif line:match("^###%s+") then
			local kind = trim(line:match("^###%s+(.+)") or ""):lower()
			currentSection = SECTION_KINDS[kind]
		elseif line:match("^%-%s+") and currentSection then
			local item = trim(line:match("^%-%s+(.+)") or "")
			if item ~= "" then
				local section = currentSection :: string
				local tbl = (currentChanges :: any)[section]
				if tbl == nil then
					tbl = {}
					(currentChanges :: any)[section] = tbl
				end
				table.insert(tbl, item)
			end
		end

		i += 1
	end

	flushRelease()

	return changelog
end

local function jsonString(s: string): string
	s = s:gsub("\\", "\\\\")
	s = s:gsub('"', '\\"')
	s = s:gsub("\n", "\\n")
	s = s:gsub("\r", "\\r")
	s = s:gsub("\t", "\\t")
	return '"' .. s .. '"'
end

local function jsonArray(arr: { string }, indent: string): string
	if #arr == 0 then
		return "[]"
	end
	local inner = indent .. "  "
	local parts: { string } = {}
	for _, v in arr do
		table.insert(parts, inner .. jsonString(v))
	end
	return "[\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "]"
end

local function jsonChanges(changes: ChangeSection, indent: string): string
	local inner = indent .. "  "
	local fields: { string } = {}

	local order = { "added", "changed", "deprecated", "removed", "fixed", "security" }
	for _, key in order do
		local val = (changes :: any)[key]
		if val ~= nil and #val > 0 then
			table.insert(fields, inner .. jsonString(key) .. ": " .. jsonArray(val, inner))
		end
	end

	if #fields == 0 then
		return "{}"
	end
	return "{\n" .. table.concat(fields, ",\n") .. "\n" .. indent .. "}"
end

local function jsonRelease(r: Release, indent: string): string
	local inner = indent .. "  "
	local parts: { string } = {
		inner .. '"version": ' .. jsonString(r.version),
		inner .. '"date": ' .. (r.date and jsonString(r.date) or "null"),
		inner .. '"tags": ' .. jsonArray(r.tags, inner),
		inner .. '"changes": ' .. jsonChanges(r.changes, inner),
	}
	return "{\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "}"
end

local function toJSON(changelog: Changelog): string
	local indent = "  "
	local parts: { string } = {
		indent .. '"title": ' .. jsonString(changelog.title),
	}

	if changelog.unreleased then
		table.insert(parts, indent .. '"unreleased": ' .. jsonChanges(changelog.unreleased, indent))
	else
		table.insert(parts, indent .. '"unreleased": null')
	end

	local relParts: { string } = {}
	for _, r in changelog.releases do
		table.insert(relParts, indent .. "  " .. jsonRelease(r, indent .. "  "))
	end

	local relArr: string
	if #relParts == 0 then
		relArr = "[]"
	else
		relArr = "[\n" .. table.concat(relParts, ",\n") .. "\n" .. indent .. "]"
	end

	table.insert(parts, indent .. '"releases": ' .. relArr)

	return "{\n" .. table.concat(parts, ",\n") .. "\n}"
end

--// Main
do
	local args = process.args

	local inputPath = args[1] or "CHANGELOG.md"
	local outputPath = args[2] or "changelog.json"

	local ok, source = pcall(fs.readFile, inputPath)
	if not ok or type(source) ~= "string" then
		print(`[error] Could not read file: {inputPath}`)
		process.exit(1)
	end

	local changelog = parseChangelog(source)
	local json = toJSON(changelog)

	local writeOk, writeErr = pcall(fs.writeFile, outputPath, json)
	if not writeOk then
		print(`[error] Could not write output: {writeErr}`)
		process.exit(1)
	end

	print(`[ok] Parsed {#changelog.releases} release(s) → {outputPath}`)
end
