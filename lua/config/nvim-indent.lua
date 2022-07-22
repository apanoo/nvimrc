local M = {}

function M.config()
    vim.opt.list = true
    vim.opt.listchars:append("eol:↴") -- 行尾结束标记

    local IndentBlankline = require("utils").requirePlugin("indent_blankline")

    if not IndentBlankline then
        return 
    end

	IndentBlankline.setup {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,  -- 显示行尾结束标记
    }

end


return M