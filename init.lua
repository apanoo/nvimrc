-- common
require('common')

-- theme
require('theme')

-- plugin
require('plugins')

-- 加快启动时间
require("impatient")

-- plugin config
require('config.nvim-lualine').config()
require('config.nvim-bufferline').config()
require('config.nvim-tree').config()
require('config.nvim-treesitter').config()
require('config.nvim-toggleterm').config()
require('config.nvim-outline').config()
require('config.nvim-indent').config()
require('config.nvim-autopairs').config()
require('config.nvim-hot').config()
require('config.nvim-git').config()
require('config.nvim-telescope').config()
require('config.nvim-comment').config()

-- lsp
require("lsp.setup")
require("lsp.cmp")         -- 补全插件
require("lsp.ui")

-- debug dap
require("lsp.dap.nvim-dap")
require("lsp.dap.nvim-dap-go").setup() -- setup golang

-- 格式化
require("lsp.formatter")
require("lsp.null-ls")

-- keymaps
require('keybindings').setup()

-- helper
require('helper')

-- snippets
require('snippets')