local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	max_jobs = 16,
	git = { -- 使用ssh协议下载插件更稳定，https经常失败
		default_url_format = "git@github.com:%s",
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install all plugins
require("packer").startup({
	function()
		-- Packer itself
		use("wbthomason/packer.nvim")

		-- 配色主题 (disabled other themes to optimize startup time)
		use("rebelot/kanagawa.nvim")

		-- 状态栏 lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use("arkav/lualine-lsp-progress")
		-- lualine theme : tokyonight
		use("folke/tokyonight.nvim")

		-- buffer
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("moll/vim-bbye") -- for more sensible delete buffer cmd

		-- 文件树
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- 语法着色，增量选择，代码格式化，代码折叠
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-- 终端
		use({ "akinsho/toggleterm.nvim", tag = "v1.*" })

		-- file telescope 文件搜索
		use({
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		-- 加速文件搜索速度,如果安装失败需要到插件目录执行make命令手动编译
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", after = "telescope.nvim" })

		-- tagbar / outline
		use("stevearc/aerial.nvim")

		-- indent guide 缩进线
		use("lukas-reineke/indent-blankline.nvim")

		-- starup time optimise
		use("dstein64/vim-startuptime") -- 显示启动时间
		use("lewis6991/impatient.nvim") -- 加速lua module加载时间，加快插件加载
		use("nathom/filetype.nvim") -- 替换默认的 filetype

		-- 括号匹配
		use("windwp/nvim-autopairs")

		-- 快速跳转
		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
		})

		-- 多光标选择
		use("mg979/vim-visual-multi")

		-- git
		use("lewis6991/gitsigns.nvim")

		-- comment
		use("numToStr/Comment.nvim")

		-- 高亮光标当前单词
		use("RRethy/vim-illuminate")

		--------------------- LSP --------------------
		use({ "williamboman/nvim-lsp-installer" })

		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- Snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		-- 常见编程语言代码段
		use("ray-x/lsp_signature.nvim") -- now just for clangd
		use("rafamadriz/friendly-snippets")
		-- UI 增强
		use("onsails/lspkind-nvim")
		use("glepnir/lspsaga.nvim")
		-- 代码格式化
		use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- TypeScript 增强
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		-- Lua 增强
		use("folke/lua-dev.nvim")
		-- JSON 增强
		use("b0o/schemastore.nvim")
		-- Rust 增强
		use("simrat39/rust-tools.nvim")

		--------------------- Debug --------------------
		use("mfussenegger/nvim-dap")
		use("rcarriga/nvim-dap-ui")

		-- surround
		use("ur4ltz/surround.nvim")

		-- align
		use("Vonr/align.nvim")
	end,
})
