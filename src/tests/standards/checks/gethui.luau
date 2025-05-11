--!nocheck
--!nolint

return function()
	if not getfenv(0).gethui then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local container = gethui()
	if not (container:IsA("Folder") or container:IsA("BasePlayerGui")) then
		return {
			status = 500,
			message = "Hidden container is not a Folder or BasePlayerGui",
		}
	elseif container == game:GetService("CoreGui") then
		return {
			status = 500,
			message = "Container cannot be an uncloned reference to CoreGui",
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
