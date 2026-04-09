--!nocheck

return function(config, utils)
	local iterations = 2000

	if not require("@checks/Drawing/new") then
		return {
			status = 401,
			message = "Drawing.new not supported.",
		}
	elseif not require("@checks/Drawing/cleardrawcache") then
		return {
			status = 401,
			message = "cleardrawcache not supported.",
		} 
	end

	local objs = {}
	
	local success, err = pcall(function()
		for i = 1, iterations do
			local obj = Drawing.new("Circle")
			
			obj.Position = Vector2.new(math.random(0, 100), math.random(0, 100))
			obj.Radius = math.random(5, 20)
			obj.Color = Color3.new(1, 0, 0)
			obj.Filled = true
			obj.Thickness = 1
			obj.Transparency = 0.5
			obj.Visible = false

			table.insert(objs, obj)
		end
	end)

	if not success then
		return {
			status = 500,
			message = "Failed during bulk drawing creation: " .. tostring(err),
		}
	end

	local cleanupSuccess, cleanupErr = pcall(function()
		for _, obj in ipairs(objs) do
			obj:Remove()
		end

		cleardrawcache()
	end)

	if not cleanupSuccess then
		return {
			status = 500,
			message = "Failed during bulk drawing cleanup: " .. tostring(cleanupErr),
		}
	end

	return {
		status = 200,
		message = `Successfully instanced and cleared {iterations} drawing objects.`,
	}
end
