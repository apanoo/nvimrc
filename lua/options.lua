
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	fileencoding = "utf-8", -- the encoding written to a file
	ignorecase = true, -- ignore case in search patterns
	smartindent = true, -- make indenting smarter again
	swapfile = false, -- creates a swapfile
	--  mouse = "a"                      -- allow the mouse to be used in neovim
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	wrap = true, -- display lines as one long line
	number = true,
	relativenumber = true,
	termguicolors = true,
	shiftround = true,
	updatetime = 100,
	cursorline = true,
	autowrite = true,

	-- tabs
	autoindent = true,
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
local globals = {
	loaded_matchparen = 1,
	loaded_matchit = 1,
	loaded_logiPat = 1,
	loaded_rrhelper = 1,
	loaded_tarPlugin = 1,
	loaded_gzip = 1,
	loaded_zipPlugin = 1,
	loaded_2html_plugin = 1,
	loaded_shada_plugin = 1,
	loaded_spellfile_plugin = 1,
	loaded_netrw = 1,
	loaded_netrwPlugin = 1,
	loaded_tutor_mode_plugin = 1,
	loaded_remote_plugins = 1,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end
