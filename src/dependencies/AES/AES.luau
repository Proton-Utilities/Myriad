--!strict
--!nolint

--[=[=========================================================================================
ADVANCED ENCRYPTION STANDARD (AES/Rijndael)
by @RobloxGamerPro200007 (verify the original asset)
This is an optimized version of my previous work using this algorithm and porting
it to Roblox from scratch. It overcomplicated the algorithm a lot so it could be
used for educational purposes only.
Now, this current version implements better features like buffer manipulation,
which serves as raw binary data which led to better performance as well as
native Luau support for even more performance!
Finally, this work has been made with the only purpose of getting the maximum
performance possible, as well as implementing custom Object-Oriented Programming
with the addition of AesCipher objects which their functions are stated below.
Hope this helps!
----------------------------------------------------------------------------------------------
REFERENCE
	* Aes library
	This holds the main functions of key management and block cipher modes of operation.
	- FUNCTIONS:
	
	  new (masterKey: string or buffer, mode: table, pad: table): AesCipher
	Creates an AesCipher object with given key, given mode options:
		> FwdMode (function): Function that holds the encryption mode
		> InvMode (function): Function that holds the decryption mode
		> SegmentSize (number): Segment size for block selection and padding
	and given padding options:
		> Pad (function): Function which pads plaintext.
		> Unpad (function): Function which removes padding from plaintext.
		> Overwrite (boolean): Whether if ciphertext is overwritten while decrypting.
	Other options can be stated for mode and padding. ECB mode is used by default.
	
	  expandKey (key: string or buffer, output: buffer): buffer
	Key expansion that generates round keys by using the AES key schedule. Key size
	must be either 16 (AES-128), 24 (AES-192) or 32 (AES-256) bytes long.
	
	  fromKey (roundKeys: string or buffer, options: table): AesCipher
	Creates an AesCipher object with processed round keys and the options stated
	above. Round keys size must be either 176, 208 or 240 bytes long.
	
	- PROPERTIES:
	
	  modes: table
	Holds built-in block cipher modes of operation. Includes ECB, CBC, PCBC, CFB, OFB
	and CTR modes of operation.
	
	  pads: table
	Holds built-in padding algorithms. Includes non-padding, ANSI X9.23, ISO 10126,
	PCKS#7, ISO/IEC 7816-4 and zero padding
	* AesCipher data type
	This custom object is used for actual symmetric encryption and decryption of data.
	Plaintexts and ciphertexts are split into 4 x 4 byte matrices. Properties and
	methods have read-only access.
	
	- PROPERTIES:
	
	  Key: string
	Cipher's master key.
	
	  Length: number
	Key length. Can be 16, 24 or 32 bytes.
	
	  Mode: table
	Block cipher mode of operation.
	
	  Padding: table
	Cryptographic padding algorithm.
	
	  RoundKeys: string
	Cipher's expanded round keys.
	
	- METHODS:
	
	  Encrypt (plaintext: string or buffer, output: buffer, ...: Variant): buffer
	Applies symmetric encryption into a plaintext and returns it in an output buffer.
	
	  EncryptBlock (plaintext: buffer, offset: number, output: buffer,
	  offsetOut: number): void
	Block cipher encryption of a 16-byte word. Custom offsets can be set for buffer
	reusing.
	
	  Decrypt (ciphertext: string or buffer, output: buffer, ...: Variant): buffer
	Applies symmetric decryption into a plaintext and returns it in an output buffer.
	
	  DecryptBlock (ciphertext: buffer, offset: number, output: buffer,
	  offsetOut: number): void
	Block cipher decryption of a 16-byte word. Custom offsets can be set for buffer
	reusing.
	
	  Destroy (): void
	Locks all properties and methods so it cannot be used again. It is intented
	to prevent accidental leaks when communicating remotely.
----------------------------------------------------------------------------------------------
HISTORY (UTC)
- Dic 25, 2023. 03:00:00	|	Finished MainModule and Modes
- Sep 01, 2024. 18:15:00	|	Added Pads; Revised
- Sep 09, 2024, 03:00:00	|	Released
=========================================================================================]=]--
-->> TODO: Suggest features at [devforum.roblox.com/t/2009120]
----------------------------------------------------------------------------------------------
--  GLOBALS' LOCALIZATION for VM performance and secure environment
----------------------------------------------------------------------------------------------
local error = error
local newproxy = newproxy
local getmetatable = getmetatable
local typeof = typeof
-- Bitwise operators
local bit32_bxor = bit32.bxor
local bit32_rrotate = bit32.rrotate
-- Buffer management
local buffer_copy = 		buffer.copy
local buffer_create = 		buffer.create
local buffer_fromstring = 	buffer.fromstring
local buffer_len = 			buffer.len
local buffer_readu8 = 		buffer.readu8
local buffer_readu16 = 		buffer.readu16
local buffer_readu32 = 		buffer.readu32
local buffer_tostring = 	buffer.tostring
local buffer_writestring = 	buffer.writestring
local buffer_writeu8 = 		buffer.writeu8
local buffer_writeu16 = 	buffer.writeu16
local buffer_writeu32 = 	buffer.writeu32
-- math.floor(x / y) is faster than using x // y
local math_floor = math.floor
-- Substring
local string_sub = string.sub
----------------------------------------------------------------------------------------------
--  LOOKUP TABLES (or buffers)
----------------------------------------------------------------------------------------------
local S_BOX_16 = 	buffer_create(131072)	-- 16-bit LUT S-box
local S_MIX0 = 		buffer_create(65536)	-- 2 . S(b0) ^ 3 . S(b1)
local S_MIX1 = 		buffer_create(65536)	-- S(b0) ^ S(b1)
local INV_S_XOR = 	buffer_create(65536)	-- InvS(b0 ^ b1)
local INV_MIX0 = 	buffer_create(65536)	-- 14 . b0 ^ 11 . b1
local INV_MIX1 = 	buffer_create(65536)	-- 13 . b0 ^ 9 . b1
----------------------------------------------------------------------------------------------
--  RIJNDAEL FUNCTIONS
----------------------------------------------------------------------------------------------
-- Key expansion
local function keySchedule(key: buffer | string, len: number, out: buffer, raw: boolean): buffer
	if raw then -- If input is buffer then copy the bytes
		buffer_copy(out, 0, key :: buffer, 0, len)
	else		-- otherwise write the string into the buffer
		buffer_writestring(out, 0, key :: string, len)
	end
	local word = bit32_rrotate(buffer_readu32(out, len - 4), 8) -- Integers use little-endian codification
	local rc = 0.5 -- RCON LUT is not needed
	
	if len == 32 then -- AES-256, 15 key rounds
		for offs = 32, 192, 32 do
			rc = rc * 2 % 229
			word = bit32_bxor(buffer_readu32(out, offs - 32), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
				buffer_readu16(S_BOX_16, word % 65536 * 2), rc)
			buffer_writeu32(out, offs, word)
			
			word = bit32_bxor(buffer_readu32(out, offs - 28), word)
			buffer_writeu32(out, offs + 4, word)
			word = bit32_bxor(buffer_readu32(out, offs - 24), word)
			buffer_writeu32(out, offs + 8, word)
			word = bit32_bxor(buffer_readu32(out, offs - 20), word)
			buffer_writeu32(out, offs + 12, word)
			
			word = bit32_bxor(buffer_readu32(out, offs - 16), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
				buffer_readu16(S_BOX_16, word % 65536 * 2))
			buffer_writeu32(out, offs + 16, word)
			
			word = bit32_bxor(buffer_readu32(out, offs - 12), word)
			buffer_writeu32(out, offs + 20, word)
			word = bit32_bxor(buffer_readu32(out, offs - 8), word)
			buffer_writeu32(out, offs + 24, word)
			word = bit32_bxor(buffer_readu32(out, offs - 4), word)
			buffer_writeu32(out, offs + 28, word)
			word = bit32_rrotate(word, 8)
		end
		word = bit32_bxor(buffer_readu32(out, 192), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
			buffer_readu16(S_BOX_16, word % 65536 * 2), 64)
		buffer_writeu32(out, 224, word)
		
		word = bit32_bxor(buffer_readu32(out, 196), word)
		buffer_writeu32(out, 228, word)
		word = bit32_bxor(buffer_readu32(out, 200), word)
		buffer_writeu32(out, 232, word)
		buffer_writeu32(out, 236, bit32_bxor(buffer_readu32(out, 204), word))
	elseif len == 24 then -- AES-192, 13 key rounds
		for offs = 24, 168, 24 do
			rc = rc * 2 % 229
			word = bit32_bxor(buffer_readu32(out, offs - 24), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
				buffer_readu16(S_BOX_16, word % 65536 * 2), rc)
			buffer_writeu32(out, offs, word)
			
			word = bit32_bxor(buffer_readu32(out, offs - 20), word)
			buffer_writeu32(out, offs + 4, word)
			word = bit32_bxor(buffer_readu32(out, offs - 16), word)
			buffer_writeu32(out, offs + 8, word)
			word = bit32_bxor(buffer_readu32(out, offs - 12), word)
			buffer_writeu32(out, offs + 12, word)
			word = bit32_bxor(buffer_readu32(out, offs - 8), word)
			buffer_writeu32(out, offs + 16, word)
			word = bit32_bxor(buffer_readu32(out, offs - 4), word)
			buffer_writeu32(out, offs + 20, word)
			word = bit32_rrotate(word, 8)
		end
		word = bit32_bxor(buffer_readu32(out, 168), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
			buffer_readu16(S_BOX_16, word % 65536 * 2), 128)
		buffer_writeu32(out, 192, word)
		
		word = bit32_bxor(buffer_readu32(out, 172), word)
		buffer_writeu32(out, 196, word)
		word = bit32_bxor(buffer_readu32(out, 176), word)
		buffer_writeu32(out, 200, word) 
		buffer_writeu32(out, 204, bit32_bxor(buffer_readu32(out, 180), word))
	else -- AES-128, 11 key rounds
		for offs = 16, 144, 16 do
			rc = rc * 2 % 229
			word = bit32_bxor(buffer_readu32(out, offs - 16), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
				buffer_readu16(S_BOX_16, word % 65536 * 2), rc)
			buffer_writeu32(out, offs, word)
			
			word = bit32_bxor(buffer_readu32(out, offs - 12), word)
			buffer_writeu32(out, offs + 4, word)
			word = bit32_bxor(buffer_readu32(out, offs - 8), word)
			buffer_writeu32(out, offs + 8, word)
			word = bit32_bxor(buffer_readu32(out, offs - 4), word)
			buffer_writeu32(out, offs + 12, word)
			word = bit32_rrotate(word, 8)
		end
		word = bit32_bxor(buffer_readu32(out, 144), buffer_readu16(S_BOX_16, math_floor(word / 65536) * 2) * 65536 +
			buffer_readu16(S_BOX_16, word % 65536 * 2), 54)
		buffer_writeu32(out, 160, word)
		
		word = bit32_bxor(buffer_readu32(out, 148), word)
		buffer_writeu32(out, 164, word)
		word = bit32_bxor(buffer_readu32(out, 152), word)
		buffer_writeu32(out, 168, word)
		buffer_writeu32(out, 172, bit32_bxor(buffer_readu32(out, 156), word))
	end
	return out
end
-- Block encryption
local function encryptBlock(keym: buffer, lenm: number, text: buffer, offs: number, out: buffer, offt: number): ()
	-- Initialize matrix construction and round key addition
	local b0 = 	bit32_bxor(buffer_readu8(text, offs), buffer_readu8(keym, 0))
	local b1 = 	bit32_bxor(buffer_readu8(text, offs + 1), buffer_readu8(keym, 1))
	local b2 = 	bit32_bxor(buffer_readu8(text, offs + 2), buffer_readu8(keym, 2))
	local b3 =	bit32_bxor(buffer_readu8(text, offs + 3), buffer_readu8(keym, 3))
	local b4 =	bit32_bxor(buffer_readu8(text, offs + 4), buffer_readu8(keym, 4))
	local b5 =	bit32_bxor(buffer_readu8(text, offs + 5), buffer_readu8(keym, 5))
	local b6 =	bit32_bxor(buffer_readu8(text, offs + 6), buffer_readu8(keym, 6))
	local b7 =	bit32_bxor(buffer_readu8(text, offs + 7), buffer_readu8(keym, 7))
	local b8 =	bit32_bxor(buffer_readu8(text, offs + 8), buffer_readu8(keym, 8))
	local b9 =	bit32_bxor(buffer_readu8(text, offs + 9), buffer_readu8(keym, 9))
	local b10 =	bit32_bxor(buffer_readu8(text, offs + 10), buffer_readu8(keym, 10))
	local b11 = bit32_bxor(buffer_readu8(text, offs + 11), buffer_readu8(keym, 11))
	local b12 = bit32_bxor(buffer_readu8(text, offs + 12), buffer_readu8(keym, 12))
	local b13 = bit32_bxor(buffer_readu8(text, offs + 13), buffer_readu8(keym, 13))
	local b14 = bit32_bxor(buffer_readu8(text, offs + 14), buffer_readu8(keym, 14))
	local b15 = bit32_bxor(buffer_readu8(text, offs + 15), buffer_readu8(keym, 15))
	-- Shifts rows and setting variables for mixing columns
	local i0 = b0 * 256 + b5; 	local i1 = b5 * 256 + b10;	local i2 = b10 * 256 + b15; local i3 = b15 * 256 + b0
	local i4 = b4 * 256 + b9; 	local i5 = b9 * 256 + b14;	local i6 = b14 * 256 + b3; 	local i7 = b3 * 256 + b4
	local i8 = b8 * 256 + b13; 	local i9 = b13 * 256 + b2;	local i10 = b2 * 256 + b7; 	local i11 = b7 * 256 + b8
	local i12 = b12 * 256 + b1; local i13 = b1 * 256 + b6;	local i14 = b6 * 256 + b11; local i15 = b11 * 256 + b12
	
	for offs = 16, lenm, 16 do
		-- Use S_MIX LUTs for SubBytes and MixColumns at once, then AddRoundKey
		b0 =	bit32_bxor(buffer_readu8(S_MIX0, i0), buffer_readu8(S_MIX1, i2), buffer_readu8(keym, offs))
		b1 =	bit32_bxor(buffer_readu8(S_MIX0, i1), buffer_readu8(S_MIX1, i3), buffer_readu8(keym, offs + 1))
		b2 =	bit32_bxor(buffer_readu8(S_MIX0, i2), buffer_readu8(S_MIX1, i0), buffer_readu8(keym, offs + 2))
		b3 =	bit32_bxor(buffer_readu8(S_MIX0, i3), buffer_readu8(S_MIX1, i1), buffer_readu8(keym, offs + 3))
		b4 =	bit32_bxor(buffer_readu8(S_MIX0, i4), buffer_readu8(S_MIX1, i6), buffer_readu8(keym, offs + 4))
		b5 =	bit32_bxor(buffer_readu8(S_MIX0, i5), buffer_readu8(S_MIX1, i7), buffer_readu8(keym, offs + 5))
		b6 =	bit32_bxor(buffer_readu8(S_MIX0, i6), buffer_readu8(S_MIX1, i4), buffer_readu8(keym, offs + 6))
		b7 =	bit32_bxor(buffer_readu8(S_MIX0, i7), buffer_readu8(S_MIX1, i5), buffer_readu8(keym, offs + 7))
		b8 =	bit32_bxor(buffer_readu8(S_MIX0, i8), buffer_readu8(S_MIX1, i10), buffer_readu8(keym, offs + 8))
		b9 =	bit32_bxor(buffer_readu8(S_MIX0, i9), buffer_readu8(S_MIX1, i11), buffer_readu8(keym, offs + 9))
		b10 =	bit32_bxor(buffer_readu8(S_MIX0, i10), buffer_readu8(S_MIX1, i8), buffer_readu8(keym, offs + 10))
		b11 =	bit32_bxor(buffer_readu8(S_MIX0, i11), buffer_readu8(S_MIX1, i9), buffer_readu8(keym, offs + 11))
		b12 =	bit32_bxor(buffer_readu8(S_MIX0, i12), buffer_readu8(S_MIX1, i14), buffer_readu8(keym, offs + 12))
		b13 =	bit32_bxor(buffer_readu8(S_MIX0, i13), buffer_readu8(S_MIX1, i15), buffer_readu8(keym, offs + 13))
		b14 =	bit32_bxor(buffer_readu8(S_MIX0, i14), buffer_readu8(S_MIX1, i12), buffer_readu8(keym, offs + 14))
		b15 =	bit32_bxor(buffer_readu8(S_MIX0, i15), buffer_readu8(S_MIX1, i13), buffer_readu8(keym, offs + 15))
		-- Shift rows and setting variables for next round
		i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15 =
			b0 * 256 + b5, b5 * 256 + b10, b10 * 256 + b15, b15 * 256 + b0, b4 * 256 + b9, b9 * 256 + b14, b14 * 256 + b3, b3 * 256 + b4,
			b8 * 256 + b13, b13 * 256 + b2, b2 * 256 + b7, b7 * 256 + b8, b12 * 256 + b1, b1 * 256 + b6, b6 * 256 + b11, b11 * 256 + b12
	end
	
	-- Last round sets all bytes into the output buffer
	buffer_writeu32(out, offt, bit32_bxor(buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i15), buffer_readu8(S_MIX1, i13),
		buffer_readu8(keym, lenm + 31)) * 512 + bit32_bxor(buffer_readu8(S_MIX0, i10), buffer_readu8(S_MIX1, i8), buffer_readu8(keym, lenm + 26)) * 2)
			* 65536 + buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i5), buffer_readu8(S_MIX1, i7), buffer_readu8(keym, lenm + 21)) * 512 +
				bit32_bxor(buffer_readu8(S_MIX0, i0), buffer_readu8(S_MIX1, i2), buffer_readu8(keym, lenm + 16)) * 2), buffer_readu32(keym, lenm + 32)))
	buffer_writeu32(out, offt + 4, bit32_bxor(buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i3), buffer_readu8(S_MIX1, i1),
		buffer_readu8(keym, lenm + 19)) * 512 + bit32_bxor(buffer_readu8(S_MIX0, i14), buffer_readu8(S_MIX1, i12), buffer_readu8(keym, lenm + 30)) * 2)
			* 65536 + buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i9), buffer_readu8(S_MIX1, i11), buffer_readu8(keym, lenm + 25)) * 512 +
				bit32_bxor(buffer_readu8(S_MIX0, i4), buffer_readu8(S_MIX1, i6), buffer_readu8(keym, lenm + 20)) * 2), buffer_readu32(keym, lenm + 36)))
	buffer_writeu32(out, offt + 8, bit32_bxor(buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i7), buffer_readu8(S_MIX1, i5),
		buffer_readu8(keym, lenm + 23)) * 512 + bit32_bxor(buffer_readu8(S_MIX0, i2), buffer_readu8(S_MIX1, i0), buffer_readu8(keym, lenm + 18)) * 2)
			* 65536 + buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i13), buffer_readu8(S_MIX1, i15), buffer_readu8(keym, lenm + 29)) * 512 +
				bit32_bxor(buffer_readu8(S_MIX0, i8), buffer_readu8(S_MIX1, i10), buffer_readu8(keym, lenm + 24)) * 2), buffer_readu32(keym, lenm + 40)))
	buffer_writeu32(out, offt + 12, bit32_bxor(buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i11), buffer_readu8(S_MIX1, i9),
		buffer_readu8(keym, lenm + 27)) * 512 + bit32_bxor(buffer_readu8(S_MIX0, i6), buffer_readu8(S_MIX1, i4), buffer_readu8(keym, lenm + 22)) * 2)
			* 65536 + buffer_readu16(S_BOX_16, bit32_bxor(buffer_readu8(S_MIX0, i1), buffer_readu8(S_MIX1, i3), buffer_readu8(keym, lenm + 17)) * 512 +
				bit32_bxor(buffer_readu8(S_MIX0, i12), buffer_readu8(S_MIX1, i14), buffer_readu8(keym, lenm + 28)) * 2), buffer_readu32(keym, lenm + 44)))
end
-- Block decryption
local function decryptBlock(keym: buffer, lenm: number, ciph: buffer, offs: number, out: buffer, offt: number): ()
	-- Initialize matrix construction and round key addition, InvSubBytes, InvShiftRows and another AddRoundKey
	local b0 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs) * 256 + buffer_readu8(keym, lenm + 32)), buffer_readu8(keym, lenm + 16))
	local b1 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 13) * 256 + buffer_readu8(keym, lenm + 45)), buffer_readu8(keym, lenm + 17))
	local b2 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 10) * 256 + buffer_readu8(keym, lenm + 42)), buffer_readu8(keym, lenm + 18))
	local b3 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 7) * 256 + buffer_readu8(keym, lenm + 39)), buffer_readu8(keym, lenm + 19))
	local b4 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 4) * 256 + buffer_readu8(keym, lenm + 36)), buffer_readu8(keym, lenm + 20))
	local b5 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 1) * 256 + buffer_readu8(keym, lenm + 33)), buffer_readu8(keym, lenm + 21))
	local b6 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 14) * 256 + buffer_readu8(keym, lenm + 46)), buffer_readu8(keym, lenm + 22))
	local b7 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 11) * 256 + buffer_readu8(keym, lenm + 43)), buffer_readu8(keym, lenm + 23))
	local b8 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 8) * 256 + buffer_readu8(keym, lenm + 40)), buffer_readu8(keym, lenm + 24))
	local b9 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 5) * 256 + buffer_readu8(keym, lenm + 37)), buffer_readu8(keym, lenm + 25))
	local b10 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 2) * 256 + buffer_readu8(keym, lenm + 34)), buffer_readu8(keym, lenm + 26))
	local b11 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 15) * 256 + buffer_readu8(keym, lenm + 47)), buffer_readu8(keym, lenm + 27))
	local b12 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 12) * 256 + buffer_readu8(keym, lenm + 44)), buffer_readu8(keym, lenm + 28))
	local b13 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 9) * 256 + buffer_readu8(keym, lenm + 41)), buffer_readu8(keym, lenm + 29))
	local b14 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 6) * 256 + buffer_readu8(keym, lenm + 38)), buffer_readu8(keym, lenm + 30))
	local b15 = bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(ciph, offs + 3) * 256 + buffer_readu8(keym, lenm + 35)), buffer_readu8(keym, lenm + 31))
	-- Setting variables for inverse mixing columns
	local i0 = b0 * 256 + b1; 	local i1 = b1 * 256 + b2;	local i2 = b2 * 256 + b3; 	local i3 = b3 * 256 + b0
	local i4 = b4 * 256 + b5; 	local i5 = b5 * 256 + b6; 	local i6 = b6 * 256 + b7; 	local i7 = b7 * 256 + b4
	local i8 = b8 * 256 + b9; 	local i9 = b9 * 256 + b10; 	local i10 = b10 * 256 + b11;local i11 = b11 * 256 + b8
	local i12 = b12 * 256 + b13;local i13 = b13 * 256 + b14;local i14 = b14 * 256 + b15;local i15 = b15 * 256 + b12
	
	for offs = lenm, 16, - 16 do
		-- Use INV_MIX LUTs for InvMixColumns, shift, InvSubBytes and finally AddRoundKey
		b0 = 	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i0) * 256 + buffer_readu8(INV_MIX1, i2)), buffer_readu8(keym, offs))
		b1 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i13) * 256 + buffer_readu8(INV_MIX1, i15)), buffer_readu8(keym, offs + 1))
		b2 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i10) * 256 + buffer_readu8(INV_MIX1, i8)), buffer_readu8(keym, offs + 2))
		b3 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i7) * 256 + buffer_readu8(INV_MIX1, i5)), buffer_readu8(keym, offs + 3))
		b4 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i4) * 256 + buffer_readu8(INV_MIX1, i6)), buffer_readu8(keym, offs + 4))
		b5 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i1) * 256 + buffer_readu8(INV_MIX1, i3)), buffer_readu8(keym, offs + 5))
		b6 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i14) * 256 + buffer_readu8(INV_MIX1, i12)), buffer_readu8(keym, offs + 6))
		b7 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i11) * 256 + buffer_readu8(INV_MIX1, i9)), buffer_readu8(keym, offs + 7))
		b8 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i8) * 256 + buffer_readu8(INV_MIX1, i10)), buffer_readu8(keym, offs + 8))
		b9 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i5) * 256 + buffer_readu8(INV_MIX1, i7)), buffer_readu8(keym, offs + 9))
		b10 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i2) * 256 + buffer_readu8(INV_MIX1, i0)), buffer_readu8(keym, offs + 10))
		b11 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i15) * 256 + buffer_readu8(INV_MIX1, i13)), buffer_readu8(keym, offs + 11))
		b12 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i12) * 256 + buffer_readu8(INV_MIX1, i14)), buffer_readu8(keym, offs + 12))
		b13 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i9) * 256 + buffer_readu8(INV_MIX1, i11)), buffer_readu8(keym, offs + 13))
		b14 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i6) * 256 + buffer_readu8(INV_MIX1, i4)), buffer_readu8(keym, offs + 14))
		b15 =	bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i3) * 256 + buffer_readu8(INV_MIX1, i1)), buffer_readu8(keym, offs + 15))
		-- Setting variables for next round
		i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15 =
			b0 * 256 + b1, b1 * 256 + b2, b2 * 256 + b3, b3 * 256 + b0, b4 * 256 + b5, b5 * 256 + b6, b6 * 256 + b7, b7 * 256 + b4,
			b8 * 256 + b9, b9 * 256 + b10, b10 * 256 + b11, b11 * 256 + b8, b12 * 256 + b13, b13 * 256 + b14, b14 * 256 + b15, b15 * 256 + b12
	end
	
	-- Last round sets all bytes into the output buffer
	buffer_writeu32(out, offt, bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i7) * 256 + buffer_readu8(INV_MIX1, i5)),
		buffer_readu8(keym, 3)) * 16777216 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i10) * 256 + buffer_readu8(INV_MIX1, i8)),
		buffer_readu8(keym, 2)) * 65536 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i13) * 256 + buffer_readu8(INV_MIX1, i15)),
		buffer_readu8(keym, 1)) * 256 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i0) * 256 + buffer_readu8(INV_MIX1, i2)),
		buffer_readu8(keym, 0)))
	buffer_writeu32(out, offt + 4, bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i11) * 256 + buffer_readu8(INV_MIX1, i9)),
		buffer_readu8(keym, 7)) * 16777216 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i14) * 256 + buffer_readu8(INV_MIX1, i12)),
		buffer_readu8(keym, 6)) * 65536 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i1) * 256 + buffer_readu8(INV_MIX1, i3)),
		buffer_readu8(keym, 5)) * 256 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i4) * 256 + buffer_readu8(INV_MIX1, i6)),
		buffer_readu8(keym, 4)))
	buffer_writeu32(out, offt + 8, bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i15) * 256 + buffer_readu8(INV_MIX1, i13)),
		buffer_readu8(keym, 11)) * 16777216 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i2) * 256 + buffer_readu8(INV_MIX1, i0)),
		buffer_readu8(keym, 10)) * 65536 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i5) * 256 + buffer_readu8(INV_MIX1, i7)),
		buffer_readu8(keym, 9)) * 256 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i8) * 256 + buffer_readu8(INV_MIX1, i10)),
		buffer_readu8(keym, 8)))
	buffer_writeu32(out, offt + 12, bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i3) * 256 + buffer_readu8(INV_MIX1, i1)),
		buffer_readu8(keym, 15)) * 16777216 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i6) * 256 + buffer_readu8(INV_MIX1, i4)),
		buffer_readu8(keym, 14)) * 65536 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i9) * 256 + buffer_readu8(INV_MIX1, i11)),
		buffer_readu8(keym, 13)) * 256 + bit32_bxor(buffer_readu8(INV_S_XOR, buffer_readu8(INV_MIX0, i12) * 256 + buffer_readu8(INV_MIX1, i14)),
		buffer_readu8(keym, 12)))
end
----------------------------------------------------------------------------------------------
--  SUBSTITUTION BOX AND MIX COLUMNS CALCULATOR
----------------------------------------------------------------------------------------------
do
	local S_BOX = 		buffer_create(256) -- Temporary LUT
	local INV_S_BOX = 	buffer_create(256) -- S[i] = j <=> InvS[j] = i
	-- GF multiplication temporary LUTs
	local MUL3 = buffer_create(256)
	local MUL9 = buffer_create(256)
	local MUL11 = buffer_create(256)
	local p = 1; local q = 1; local t
	-- Galois Field (256) multiplication
	local function gfmul(a: number, b: number): number --wikipedia.org/wiki/Rijndael_MixColumns#Implementation_example
		local p = 0
		
		for _ = 0, 7 do
			if b % 2 == 1 then
				p = bit32_bxor(p, a)
			end
			
			if a >= 128 then
				a = bit32_bxor(a * 2 % 256, 27)
			else
				a = a * 2 % 256
			end
			b = math_floor(b / 2)
		end
		return p
	end
	
	-- S-box and Inverse S-box computing
	buffer_writeu8(S_BOX, 0, 99) -- Zero has no inverse
	for _ = 1, 255 do --wikipedia.org/wiki/Rijndael_S-box#Example_implementation_in_C_language
		p = bit32_bxor(p, p * 2, if p < 128 then 0 else 27) % 256
		q = bit32_bxor(q, q * 2)
		q = bit32_bxor(q, q * 4)
		q = bit32_bxor(q, q * 16) % 256
		if q >= 128 then
			q = bit32_bxor(q, 9)
		end
		
		t = bit32_bxor(q, q % 128 * 2 + q / 128, q % 64 * 4 + q / 64, q % 32 * 8 + q / 32, q % 16 * 16 + q / 16, 99) -- ROTL8 trick
		buffer_writeu8(S_BOX, p, t)
		buffer_writeu8(INV_S_BOX, t, p)
		-- GF LUTs can be computed in the same iteration
		buffer_writeu8(MUL3, p, gfmul(3, p))
		buffer_writeu8(MUL9, p, gfmul(9, p))
		buffer_writeu8(MUL11, p, gfmul(11, p))
	end
	
	-- Final permament LUTs computing
	local pb, g2, g14, g13; t = 0
	for i = 0, 255 do
		p = buffer_readu8(S_BOX, i); pb = p * 256
		g2, g13, g14 = gfmul(2, p), gfmul(13, i), gfmul(14, i)
		for j = 0, 255 do
			q = buffer_readu8(S_BOX, j)
			buffer_writeu16(S_BOX_16, t * 2, pb + q) -- Elements occupy two bytes
			buffer_writeu8(INV_S_XOR, t, buffer_readu8(INV_S_BOX, bit32_bxor(i, j)))
			buffer_writeu8(S_MIX0, t, bit32_bxor(g2, buffer_readu8(MUL3, q)))
			buffer_writeu8(S_MIX1, t, bit32_bxor(p, q))
			buffer_writeu8(INV_MIX0, t, bit32_bxor(g14, buffer_readu8(MUL11, j)))
			buffer_writeu8(INV_MIX1, t, bit32_bxor(g13, buffer_readu8(MUL9, j)))
			t += 1
		end
	end
end
----------------------------------------------------------------------------------------------
--  MAIN FUNCTIONS
----------------------------------------------------------------------------------------------
-- AesCipher data type set
export type AesCipher = typeof(setmetatable({} :: { -- userdata simulating to be a table attached to a metatable for now
	Key: string, Length: number, Mode: {FwdMode: ((input: buffer, offset: number, output: buffer, offsetOut: number) -> (),
		(input: buffer, offset: number, output: buffer, offsetOut: number) -> (), buffer, buffer, {any}, ...any) -> (),
		InvMode: ((input: buffer, offset: number, output: buffer, offsetOut: number) -> (),
			(input: buffer, offset: number, output: buffer, offsetOut: number) -> (), buffer, buffer, {any}, ...any) -> ()},
	Padding: {Pad: (buffer, buffer?, number) -> buffer, Unpad: (buffer, buffer?, number) -> buffer, Overwrite: boolean?}, RoundKeys: string,
	Encrypt: (self: AesCipher, plaintext: buffer | string, output: buffer?, ...any) -> buffer,
	Decrypt: (self: AesCipher, ciphertext: buffer | string, output: buffer?, ...any) -> buffer,
	EncryptBlock: (self: AesCipher, plaintext: buffer, offset: number, output: buffer?, offsetOut: number?) -> (),
	DecryptBlock: (self: AesCipher, ciphertext: buffer, offset: number, output: buffer?, offsetOut: number?) -> (),
	Destroy: (self: AesCipher) -> ()
}, {}))
local function newidx(_, idx)
	return error(`{idx} cannot be assigned to`)
end
local function tostr()
	return "AesCipher"
end
local modes = require("Modes.luau") -- Importing block cipher modes of operation
local pads = require("Pads.luau") -- Importing padding
local function expandKey(key: buffer | string, output: buffer?): buffer -- Key expansion
	local raw = typeof(key) == "buffer"
	local len = if raw then buffer_len(key :: buffer) else #(key :: string)
	local lenx = if len == 32 then 240 elseif len == 24 then 208 elseif len == 16 then 176 else error("Key must be either 16, 24 or 32 bytes long")
	return keySchedule(key, len, output or buffer_create(lenx :: number), raw)
end
local function fromKey(roundKeys: buffer, mode: {FwdMode: ((input: buffer, offset: number, output: buffer, offsetOut: number) -> (),
	(input: buffer, offset: number, output: buffer, offsetOut: number) -> (), buffer, buffer, {[string]: any}, ...any) -> (),
	InvMode: ((input: buffer, offset: number, output: buffer, offsetOut: number) -> (),
		(input: buffer, offset: number, output: buffer, offsetOut: number) -> (), buffer, buffer, {[string]: any}, ...any) -> ()}?,
	pad: {Pad: (buffer, buffer?, number) -> buffer, Unpad: (buffer, buffer?, number) -> buffer, Overwrite: boolean?}?): AesCipher
	local len: number? = buffer_len(roundKeys)
	local lenm: number?; local key: string?
	local keyst: string? = buffer_tostring(roundKeys)
	if len == 240 then
		lenm = 192
		key = string_sub(keyst :: string, 1, 32)
	elseif len == 208 then
		lenm = 160
		key = string_sub(keyst :: string, 1, 24)
	elseif len == 176 then
		lenm = 128
		key = string_sub(keyst :: string, 1, 16)
	else
		error("Round keys must be either 240, 208 or 128 bytes long")
	end
	
	-- Object internal properties
	local keym: buffer? = roundKeys
	local mode: any = mode or modes.ECB
	local fwd = mode.FwdMode; local inv = mode.InvMode; local segm = mode.SegmentSize or 16
	local pad: any = pad or pads.Pkcs7
	local pd = pad.Pad; local upd = pad.Unpad
	local cipher = newproxy(true) :: AesCipher -- New AesCipher object
	local meta = getmetatable(cipher) -- userdatas cannot share the same metatable in Luau
	-- Object internal methods
	local function encp(plaintext, offset, output, offsetOut)
		encryptBlock(keym :: buffer, lenm :: number, plaintext, offset, output, offsetOut)
	end
	local function decp(ciphertext, offset, output, offsetOut)
		decryptBlock(keym :: buffer, lenm :: number, ciphertext, offset, output, offsetOut)
	end
	local function enc(self: AesCipher, plaintext, output, ...)
		local raw = typeof(plaintext)
		local text = if raw == "buffer" then plaintext :: buffer elseif raw == "string" then buffer_fromstring(plaintext)
			else error(`Unable to cast {raw} to buffer`) -- Type cast
		output = typeof(output) == "buffer" and output
		if self ~= cipher then -- If method is called on other cipher, then call it on the correct one
			return self:Encrypt(text, output :: buffer, ...)
		elseif lenm then
			local out = pd(text, output, segm)
			fwd(encp, decp, if pad.Overwrite == false then text else out, out, mode, ...)
			return out
		else
			error("AesCipher object's already destroyed")
			return buffer_create(0) -- Dummy return for type checking
		end
	end
	local function encb(self: AesCipher, plaintext, offset, output, offsetOut)
		if self ~= cipher then
			self:EncryptBlock(plaintext, offset, output, offsetOut)
		elseif lenm then
			encryptBlock(keym :: buffer, lenm :: number, plaintext, offset, output or plaintext, offsetOut or offset)
		else
			error("AesCipher object's already destroyed")
		end
	end
	local function dec(self: AesCipher, ciphertext, output, ...)
		local raw = typeof(ciphertext)
		local ciph = if raw == "buffer" then ciphertext :: buffer elseif raw == "string" then buffer_fromstring(ciphertext)
			else error(`Unable to cast {raw} to buffer`)
		output = typeof(output) == "buffer" and output
		if self ~= cipher then
			return self:Decrypt(ciph, output :: buffer, ...)
		elseif lenm then
			local ovw = pad.Overwrite
			local text = if ovw == nil then buffer_create(buffer_len(ciph)) elseif ovw then ciph else output or buffer_create(buffer_len(ciph))
			inv(encp, decp, ciph, text, mode, ...)
			return upd(text, output, segm)
		else
			error("AesCipher object's already destroyed")
			return buffer_create(0)
		end
	end
	local function decb(self: AesCipher, ciphertext, offset, output, offsetOut)
		if self ~= cipher then
			self:DecryptBlock(ciphertext, offset, output, offsetOut)
		elseif lenm then
			decryptBlock(keym :: buffer, lenm :: number, ciphertext, offset, output or ciphertext, offsetOut or offset)
		else
			error("AesCipher object's already destroyed")
		end
	end
	local function destroy(self: AesCipher): ()
		if self ~= cipher then
			self:Destroy()
		elseif lenm then
			keyst, keym, lenm, fwd, inv, mode, pad, key, len = nil, nil, nil, nil, nil, nil, nil, nil, nil
		else
			error("AesCipher object's already destroyed")
		end
	end
	
	-- Metatable settings
	meta.__index = function(_, idx)
		return if idx == "Encrypt" then enc elseif idx == "Decrypt" then dec elseif idx == "EncryptBlock" then encb elseif idx == "DecryptBlock" then decb
			elseif idx == "Destroy" then destroy elseif lenm then (if idx == "Key" then key elseif idx == "RoundKeys" then keyst
				elseif idx == "Mode" then mode elseif idx == "Padding" then pad elseif idx == "Length" then len
				else error(`{idx} is not a valid member of AesCipher`)) else error("AesCipher object's already destroyed")
	end
	meta.__newindex = newidx
	meta.__tostring = tostr
	meta.__len = function(): number
		return len or error("AesCipher object's destroyed")
	end
	meta.__metatable = "AesCipher object: Metatable's locked"
	return cipher
end
return table.freeze({
	new = function(masterKey, mode, pad) -- Combining functions
		return fromKey(expandKey(masterKey), mode, pad)
	end,
	expandKey = expandKey,
	fromKey = fromKey,
	modes = modes, --wikipedia.org/wiki/Block_cipher_mode_of_operation#Confidentiality_only_modes
	pads = pads --wikipedia.org/wiki/Padding_(cryptography)#Byte_padding
}) -- Protecting table from unwanted editing
;--{3329013a-4204-43df-b0b1-69be87c18202}