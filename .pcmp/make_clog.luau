--// Imports
local fs = require("@lune/fs")
local process = require("@lune/process")

--// Constants
local inputPath = process.args[1] or "CHANGELOG.md"
local outputPath = process.args[2] or "changelog.json"

--// Types
type Entry = {
	version: string,
	tags: { string },
	changes: { string },
	notes: string?,
}

--// Private Functions
local function trim(s: string): string
	return s:match("^%s*(.-)%s*$") or s
end

local function splitLines(s: string): { string }
	local lines: { string } = {}
	for line in (s .. "\n"):gmatch("([^\n]*)\n") do
		table.insert(lines, line)
	end
	return lines
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
	local items: { string } = {}
	for _, v in arr do
		table.insert(items, inner .. jsonString(v))
	end
	return "[\n" .. table.concat(items, ",\n") .. "\n" .. indent .. "]"
end

local function jsonTagArray(arr: { string }, indent: string): string
	if #arr == 0 then
		return "[]"
	end
	local items: { string } = {}
	for _, v in arr do
		table.insert(items, jsonString(v))
	end
	return "[ " .. table.concat(items, ", ") .. " ]"
end

local function parseChangelog(source: string): { Entry }
	local lines = splitLines(source)
	local entries: { Entry } = {}
	local current: Entry? = nil
	local inDiff = false
	local inNote = false
	local noteLines: { string } = {}

	local function flushNote()
		if current and #noteLines > 0 then
			current.notes = trim(table.concat(noteLines, "\n"))
		end
		noteLines = {}
		inNote = false
	end

	local function commitCurrent()
		if current then
			flushNote()
			table.insert(entries, current)
			current = nil
		end
	end

	for _, raw in lines do
		local line = raw
		local headerRest = line:match("^##%s+(.+)$")

		if headerRest then
			commitCurrent()
			inDiff = false

			local tags: { string } = {}
			local version: string = ""

			for token in headerRest:gmatch("`([^`]+)`") do
				if token:match("^v%d") then
					version = token
				else
					table.insert(tags, token)
				end
			end

			if version == "" then
				version = headerRest:match("v[%d%.%-a-zA-Z]+") or ""
			end

			if version ~= "" then
				current = { version = version, tags = tags, changes = {} }
			end

			continue
		end

		if not current then
			continue
		end

		if line:match("^```diff") or line:match("^``` diff") then
			inDiff = true
			inNote = false
			continue
		end
		if inDiff and line:match("^```") then
			inDiff = false
			continue
		end

		if line:match("^>%s*%[!NOTE%]") then
			inNote = true
			noteLines = {}
			continue
		end
		if inNote then
			local noteText = line:match("^>%s*(.*)$")
			if noteText then
				table.insert(noteLines, noteText)
			else
				flushNote()
			end
			continue
		end

		if inDiff then
			if trim(line) == "" then
				continue
			end

			local marker, rest = line:match("^([%+!%-])%s+(.+)$")
			if marker and rest then
				table.insert(current.changes, trim(rest))
			end

			continue
		end

		local bullet = line:match("^%-%s+(.+)$")
		if bullet then
			table.insert(current.changes, trim(bullet))
			continue
		end

		if line:match("^```") then
			continue
		end
	end

	commitCurrent()
	return entries
end

local function entriesToJson(entries: { Entry }): string
	local parts: { string } = {}

	for _, e in entries do
		local lines: { string } = {}
		table.insert(lines, "  {")
		table.insert(lines, '    "version": ' .. jsonString(e.version) .. ",")
		table.insert(lines, '    "tags": ' .. jsonTagArray(e.tags, "    ") .. ",")
		table.insert(lines, '    "changes": ' .. jsonArray(e.changes, "    "))

		if e.notes then
			lines[#lines] = lines[#lines] .. ","
			table.insert(lines, '    "notes": ' .. jsonString(e.notes))
		end

		table.insert(lines, "  }")
		table.insert(parts, table.concat(lines, "\n"))
	end

	return "[\n" .. table.concat(parts, ",\n") .. "\n]\n"
end

--// Main
do
	if not fs.isFile(inputPath) then
		print(`[error] File not found: {inputPath}`)
		process.exit(1)
	end

	local source = fs.readFile(inputPath)
	local entries = parseChangelog(source)
	local json = entriesToJson(entries)

	fs.writeFile(outputPath, json)
	print(`{outputPath}`)
end
