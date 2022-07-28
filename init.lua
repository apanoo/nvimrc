-- common options
require("options")

-- autocmd
require("autocmd")

-- plugin
require("plugins")

-- theme
require("theme")

-- 加快启动时间
require("impatient")

-- plugin config
require("config.lualine").config()
require("config.bufferline").config()
require("config.nvim-tree").config()
require("config.nvim-treesitter").config()
require("config.toggleterm").config()
require("config.aerial").config()
require("config.indent_blankline").config()
require("config.nvim-autopairs").config()
require("config.hop").config()
require("config.gitsigns").config()
require("config.telescope").config()
require("config.comment").config()
require("config.surround").config()

-- lsp
require("lsp.setup")
require("lsp.nvim-cmp") -- 补全插件
require("lsp.ui")

-- debug dap
require("lsp.dap.nvim-dap")
require("lsp.dap.nvim-dap-go").setup() -- setup golang

-- 格式化
require("lsp.formatter")
-- lint
require("lsp.null-ls")

-- keymaps
require("keybindings")

-- snippets
require("snippets")
