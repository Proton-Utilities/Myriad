--!nocheck
--!nolint

return function()
	if not getfenv(0).Drawing or not getfenv(0).Drawing.new then
		return {
			status = 400,
			message = "Global Drawing API not found",
		}
	end

	local function checkProperties(objectName, instance, properties)
		for _, property in ipairs(properties) do
			local success, value = pcall(function()
				return instance[property]
			end)
			if not success or value == nil then
				return {
					status = 500,
					message = `{objectName} is missing property: {property} (Did you give it a default value?)`,
				}
			end
		end
	end

	-- Line
	do
		local Line = Drawing.new("Line")
		if not Line then
			return {
				status = 400,
				message = "Line drawing object not found",
			}
		end

		local result = checkProperties("Line", Line, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Thickness",
			"From",
			"To",
		})
		if result then
			return result
		end
	end

	-- Text
	do
		local Text = Drawing.new("Text")
		if not Text then
			return {
				status = 400,
				message = "Text drawing object not found",
			}
		end

		local result = checkProperties("Text", Text, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Text",
			"TextBounds",
			"Center",
			"Size",
			"Font",
			"Outline",
			"OutlineColor",
			"Position",
		})
		if result then
			return result
		end
	end

	-- Image
	do
		local Image = Drawing.new("Image")
		if not Image then
			return {
				status = 400,
				message = "Image drawing object not found",
			}
		end

		local result = checkProperties("Image", Image, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Data",
			"Size",
			"Position",
		})
		if result then
			return result
		end
	end

	-- Circle
	do
		local Circle = Drawing.new("Circle")
		if not Circle then
			return {
				status = 400,
				message = "Circle drawing object not found",
			}
		end

		local result = checkProperties("Circle", Circle, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"NumSides",
			"Radius",
			"Position",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Square
	do
		local Square = Drawing.new("Square")
		if not Square then
			return {
				status = 400,
				message = "Square drawing object not found",
			}
		end

		local result = checkProperties("Square", Square, {
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",
			"Destroy",

			"Size",
			"Position",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Quad
	do
		local Quad = Drawing.new("Quad")
		if not Quad then
			return {
				status = 400,
				message = "Quad drawing object not found",
			}
		end

		local result = checkProperties("Quad", Quad, {
			"Destroy",
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",

			"PointA",
			"PointB",
			"PointC",
			"PointD",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	-- Triangle
	do
		local Triangle = Drawing.new("Triangle")
		if not Triangle then
			return {
				status = 400,
				message = "Triangle drawing object not found",
			}
		end

		local result = checkProperties("Triangle", Triangle, {
			"Destroy",
			"Visible",
			"ZIndex",
			"Transparency",
			"Color",
			"__OBJECT_EXISTS",

			"PointA",
			"PointB",
			"PointC",
			"Thickness",
			"Filled",
		})
		if result then
			return result
		end
	end

	return {
		status = 200,
		message = "Passed",
	}
end
