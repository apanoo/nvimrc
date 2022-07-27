local M = {}
function M.config()
	-- https://github.com/kyazdani42/nvim-tree.lua
	local Nvimtree = require("utils").requirePlugin("nvim-tree")

    if not Nvimtree then
        return 
    end

	Nvimtree.setup({
		-- 完全禁止内置netrw
		disable_netrw = true,

		-- 默认打开
		open_on_setup = true,

		-- 不显示 git 状态图标
		git = {
			enable = true,
		},
		-- project plugin 需要这样设置
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		filters = {
			-- 隐藏 .文件
			dotfiles = false,
			-- 隐藏 node_modules 文件夹
			-- custom = { "node_modules" },
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
				-- 只用内置快捷键
				custom_only = true,
			},
			-- 不显示行数
			number = false,
			relativenumber = false,
			-- 显示图标
			signcolumn = "yes",
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
