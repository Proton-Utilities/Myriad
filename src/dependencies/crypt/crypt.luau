--!nocheck

local Base64 = require("./Base64.luau")
-- local sha = require("./sha.luau")
local AES = require("./AES.luau")

local bf_ts = buffer.tostring
-- local hash = sha.sha256

local kb = bit32.lshift(1,10)

local crypt = {}

function crypt.encrypt(data: string, key: string, initVector: string) : string
	return AES.encrypt_CBC(key, data, initVector)
end

function crypt.decrypt(data: string, key: string, initVector: string) : string
	return AES.decrypt_CBC(key, data, initVector)
end

function crypt.base64encode(data: string) : string
    local bufferData = buffer.fromstring(data)
    return buffer.tostring(Base64.encode(bufferData))
end

function crypt.base64decode(data: string) : string
    local decodedBuffer = Base64.decode(data)
    return buffer.tostring(decodedBuffer) 
end

--[[ function crypt.hash(data: string) : string
	return hash(data)
end ]]

function crypt.random(size : number) : number
	if size > kb or size < 0 then
		error("Expected number within range (0, 1024), got: "..tostring(size),0)
	else
		local charset = {}
		
		for ascii = 33, 57 do
			table.insert(charset, string.char(ascii))
		end

		for ascii = 65, 90 do
			table.insert(charset, string.char(ascii))
		end

		for ascii = 97, 122 do
			table.insert(charset, string.char(ascii))
		end

		--[[local specials = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
		for char in specials:gmatch(".") do
			table.insert(charset, char)
		end]]

		local randomString = {}
		for _ = 1, size do
			local randomIndex = math.random(1, #charset)
			table.insert(randomString, charset[randomIndex])
		end

		return table.concat(randomString)
	end
end

return crypt