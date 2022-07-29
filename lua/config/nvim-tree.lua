local M = {}
function M.config()
	-- https://github.com/kyazdani42/nvim-tree.lua
	local Nvimtree = require("utils").requirePlugin("nvim-tree")

	if not Nvimtree then
		return
	end

	local nvim_tree_config = require("utils").requirePlugin("nvim-tree.config")
	if not nvim_tree_config then
		return
	end

	local tree_cb = nvim_tree_config.nvim_tree_callback
	local Api = require("utils").requirePlugin("nvim-tree.api")
	if not Api then
		return
	end

	Nvimtree.setup({
		-- 完全禁止内置netrw
		disable_netrw = true,

		-- 默认打开
		open_on_setup = true,

		-- 显示 git 状态图标
		git = {
			enable = true,
			ignore = false,
		},
		-- project plugin 需要这样设置
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		filesystem_watchers = {
			enable = false,
			debounce_delay = 50,
		},
		filters = {
			-- 隐藏 .文件
			dotfiles = false,
			-- 隐藏 node_modules 文件夹
			-- custom = { "node_modules" },
			custom = { ".git", "node_modules" },
			exclude = { ".gitignore" },
		},
		view = {
			-- 宽度
			width = 34,
			-- 也可以 'right'
			side = "left",
			-- 隐藏根目录
			hide_root_folder = false,
			-- 自定义列表中快捷键
			mappings = {
				custom_only = false,
				list = {
					{ key = "v", cb = tree_cb("vsplit") },
					{ key = "i", cb = tree_cb("split") },
					-- 切换到下一个同级项
					{ key = "<A-j>", cb = Api.node.navigate.sibling.next },
					-- 切换到上一个同级项
					{ key = "<A-k>", cb = Api.node.navigate.sibling.prev },
				},
			},
			-- 不显示行数
			number = false,
			relativenumber = false,
			-- 显示图标
			signcolumn = "yes",
		},
		diagnostics = {
			enable = true,
			show_on_dirs = false,
			icons = {
			  hint = "",
			  info = "",
			  warning = "",
			  error = "",
			},
		  },	
		renderer = {
			icons = {
				git_placement = "before", -- "before" | "after"
				padding = " ",
				symlink_arrow = " ➛ ",
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		actions = {
			open_file = {
				-- 首次打开大小适配
				resize_window = true,
				-- 打开文件时关闭 tree
				quit_on_open = false,
			},
		},
		-- wsl install -g wsl-open
		-- https://github.com/4U6U57/wsl-open/
		system_open = {
			-- mac
			cmd = "open",
			-- windows
			-- cmd = "wsl-open",
		},
	})
end

return M
