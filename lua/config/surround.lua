local M = {}

function M.config()
	local Surround = require("utils").requirePlugin("surround")

	if not Surround then
		return
	end

	Surround.setup {mappings_style = "surround"}
end

return M
