local M = {}

function M.config()
	local Comment = require("utils").requirePlugin("Comment")

	if not Comment then
		return
	end

	Comment.setup({
		-- ignores empty lines
		ignore = "^$",

		mappings = {
			extended = true,
		},
	})
end

return M
