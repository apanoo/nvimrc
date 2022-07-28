local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Set indentation to 2 spaces
-- 'set expandtab'表示空格代替tab
augroup("setIndent", { clear = true })
autocmd("Filetype", {
	group = "setIndent",
	pattern = {
		"xml",
		"html",
		"xhtml",
		"css",
		"scss",
		"javascript",
		"typescript",
		"yaml",
		"lua",
		"typescriptreact",
		"javascriptreact",
	},
	command = "setlocal shiftwidth=2 tabstop=2 expandtab",
})
