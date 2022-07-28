local map = require("utils").keyMap
local opt = {
	noremap = true,
	silent = true,
}

-- bufferline
-- 打开buffer-tab中的第1-9页
map("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>")
map("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>")
map("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>")
-- bufferline
-- 切换前后buffer-tab
map("n", "<S-h>", ":BufferLineCyclePrev<cr>")
map("n", "<S-l>", ":BufferLineCycleNext<cr>")

-- 快速切换窗口
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- NerdTree config
-- 打开文件树
map("n", "tt", ":NvimTreeToggle<cr>")

-- toggleterm 打开终端
map({ "n", "i" }, "<leader>t", ":ToggleTerm<cr>", opt)
-- toggleterm lazygit gui
map({ "n", "i" }, "<leader>g", function()
	_LAZYGIT_TOGGLE()
end, opt)

-- y: telescope
map("n", "<C-p>", function()
	require("telescope.builtin").find_files({})
end, opt)
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({})
end, opt)
map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({})
end, opt)
map("n", "<leader>fb", function()
	require("telescope.builtin").buffers({})
end, opt)
map({ "n", "i" }, "<leader>rg", function()
	require("telescope.builtin").registers({})
end, opt)

-- hot.nvim
map("n", "ff", ":HopWord<cr>", opt) -- find global
-- other example:
-- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- code comment
-- see https://github.com/numToStr/Comment.nvim

-- ========= dap/dapui settings ========

map("n", "<leader>db", function()
	require("dap").continue()
end, opt)
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, opt)
map("n", "<leader>so", function()
	require("dap").step_over()
end, opt)
map("n", "<leader>si", function()
	require("dap").step_into()
end, opt)
map("n", "<leader>tg", function()
	require("dapui").toggle()
end, opt)
-- map('n', '<leader>b', function () require'dapui'.toggle() end, opt)
-- nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>
-- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>

-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- nnoremap <silent> <Leader><F9> <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>

-- outline | aerial
map({ "n", "i" }, "tb", ":AerialToggle<cr>", opt)
map({ "n", "i" }, "<F8>", ":AerialToggle<cr>", opt)

-- 移动当前行
-- 注意：
-- Alt键在Mac(对应option键)上是默认关闭的：
-- 1. 如果使用Kitty，则需要配置：macos_option_as_alt left
-- 2. 如果使用iTerm，则需要配置：Profiles -> Left Option key: Esc+
-- normal move down
map("n", "<A-j>", ":m .+1<CR>==")
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi")

-- normal move up
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- 缩进后自动选中，方便再次操作
-- 向左
map("v", "<", "<gv")
-- 向右
map("v", ">", ">gv")

-- 代码格式化
map("n", "<leader>f", ":FormatWrite<cr>", opt)

-- Buffer删除
map({ "n", "i" }, "<A-w>", ":Bdelete<cr>", opt)
