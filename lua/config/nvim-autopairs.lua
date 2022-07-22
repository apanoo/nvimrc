local M = {}

function M.config()

    local AutoPairs = require("utils").requirePlugin("nvim-autopairs")

    if not AutoPairs then
        return 
    end

	AutoPairs.setup {
    }

end

return M