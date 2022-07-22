local M = {}
function M.config()
    -- nvim-treesitter config
    local TreeSitterConfig = require("utils").requirePlugin("nvim-treesitter.configs")

    if not TreeSitterConfig then
        return 
    end

    TreeSitterConfig.setup {
        -- ensure_installed = "maintained", -- for installing all maintained parsers
        ensure_installed = { "c", "cpp", "rust", "lua", "go", "json", "python", "toml" }, -- for installing specific parsers
        sync_install = true, -- install synchronously
        ignore_install = {}, -- parsers to not install

        -- 启用代码高亮
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- disable standard vim highlighting
        },

        -- 启用增量选择
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<CR>',
                node_incremental = '<CR>',
                node_decremental = '<BS>',
                scope_incremental = '<TAB>',
            }
        },

        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
        indent = {
            enable = true
        }
    }

    -- 开启 Folding
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    -- 打开文件后默认不折叠，使用快捷键`zc` `zo`进行折叠和展开
    vim.o.foldlevelstart = 99 
end

return M
