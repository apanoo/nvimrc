local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Set indentation - to 2 spaces
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
-- Set indentation - End

-- Highlight - 高亮搜索辅助，由于习惯于使用Tab\Shift-Tab快速切换搜索结果，因此做了key绑定
-- local map = require("utils").keyMap

function OnCmdEnter()
	vim.opt.hlsearch = true
	vim.keymap.set("c", "<Tab>", "<C-g>")
	vim.keymap.set("c", "<S-Tab>", "<C-t>")
end

function OnCmdLeave()
	vim.opt.hlsearch = false
	vim.keymap.del("c", "<Tab>")
	vim.keymap.del("c", "<S-Tab>")
end

vim.api.nvim_exec(
	[[
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter [/\?] :lua OnCmdEnter()
  autocmd CmdlineLeave [/\?] :lua OnCmdLeave()
augroup END
]],
	true
)
-- Highlight - End
