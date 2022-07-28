local M = {}

function M.config()
	local Toggleterm = require("utils").requirePlugin("toggleterm")

	if not Toggleterm then
		return
	end

	Toggleterm.setup({
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})

	local Terminal = require("toggleterm.terminal").Terminal

	-- 示例，直接打开htop终端，其他终端类型可以参考
	local htop = Terminal:new({ cmd = "htop", hidden = true })
	function _HTOP_TOGGLE()
		htop:toggle()
	end

	-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	-- 需要下载lazygit二进制/brew install lazygit
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
		float_opts = {
			border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		},
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		-- on_close = function(term)
		--   vim.cmd("Closing terminal")
		-- end,
	})

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	local node = Terminal:new({ cmd = "node", hidden = true })
	function _NODE_TOGGLE()
		node:toggle()
	end

	local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
	function _NCDU_TOGGLE()
		ncdu:toggle()
	end

	local python = Terminal:new({ cmd = "python", hidden = true })
	function _PYTHON_TOGGLE()
		python:toggle()
	end
end

return M
