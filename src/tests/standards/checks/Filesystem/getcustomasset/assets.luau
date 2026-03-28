--!nocheck
--!nolint

local crypt = require("@dependencies/crypt/crypt.luau")

return {
	{
		ext = "png",
		type = "ImageLabel",
		prop = "Image",
		data = crypt.base64decode("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=")
	},
	{
		ext = "jpg",
		type = "ImageLabel",
		prop = "Image",
		data = crypt.base64decode("/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAP//////////////////////////////////////////////////////////////////////////////////////wgALCAABAAEBAREA/8QAFBABAAAAAAAAAAAAAAAAAAAAAP/aAAgBAQABPxA="),
	},
	{
		ext = "mp3",
		type = "Sound",
		prop = "SoundId",
		data = crypt.base64decode("//NExAAAAANIAAAAAExBTUUzLjEwMKqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"),
	},
	{
		ext = "ogg",
		type = "Sound",
		prop = "SoundId",
		data = crypt.base64decode("T2dnUwACAAAAAAAAAAAAAACAAAAAAABkAAAAAAAAAFZPUkJJUwMAAAAAAQAAAPwCAAABAAAAPgAAABkAAAAXAAAAAAAAAA=="),
	},
	{
		ext = "webm",
		type = "VideoFrame",
		prop = "Video",
		data = crypt.base64decode("GkXfo0AgQoaBAUL3gQFC8oEEQvOBCEKCQAR3ZWJtQoeBAkKFgQIYU4BnQAThgQNUZ1oAANHrgQ=="),
	},
	{
		ext = "mp4",
		type = "VideoFrame",
		prop = "Video",
		data = crypt.base64decode("AAAAIGZ0eXBpc29tAAAAAGlzb21tcDQx"),
	},
	{
		ext = "obj",
		type = "SpecialMesh",
		prop = "MeshId",
		data = crypt.base64decode("IyBvYmoKdiAwIDAgMAp2IDEgMiAyCmYgMSAy"),
	},
	{
		ext = "ttf",
		type = "Font",
		prop = "FontFace",
		data = crypt.base64decode("AAEAAAAOIAAAAwBgT1MvMgAAAAAAAADgAAAAYGNtYXAAAAAAAAAA+AAAABhnYXNwAAAAAAAAAAEAAAAIZ2x5ZgAAAAAAAAABAAAAFmhlYWQAAAAAAAAAAQAAAAA2aGhlYQAAAAAAAAABAAAAACRobXR4AAAAAAAAAAIAAAAEbG9jYQAAAAAAAAACAAAAAG1heHAAAAAAAAAAAgAAAAAWbmFtZQAAAAAAAAACAAAAACRwb3N0AAAAAAAAAAIAAAAAEg=="),
	}
}
