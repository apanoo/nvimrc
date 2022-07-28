local M = {}

function M.config()
	local Hop = require("utils").requirePlugin("hop")

	if not Hop then
		return
	end

	-- you can configure Hop the way you like here; see :h hop-config
	Hop.setup({ keys = "etovxqpdygfblzhckisuran" })
end

return M
