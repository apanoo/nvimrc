local map = require('utils').keyMap
local opt = {
	noremap = true,
	silent = true,
}

-- 插件快捷键
local pluginKeys = {}


pluginKeys.setup = function ()
	-- bufferline
	-- 打开buffer-tab中的第1-9页
	map('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>')
	map('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>')
	map('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>')
	map('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>')
	map('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>')
	map('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>')
	map('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>')
	map('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>')
	map('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>')
	-- bufferline
	-- 切换前后buffer-tab
	map('n', '<C-h>', ':BufferLineCyclePrev<cr>')
	map('n', '<C-l>', ':BufferLineCycleNext<cr>')

	-- NerdTree config
	-- 打开文件树
	map('n', 'tt', ':NvimTreeToggle<cr>')

	-- toggleterm 打开终端
	map({ 'n', 'i' }, '<leader>t', ':ToggleTerm<cr>', opt)
	-- toggleterm lazygit gui
	map({ 'n', 'i' }, '<leader>g', function() _LAZYGIT_TOGGLE() end, opt)

	-- y: telescope
	map('n', '<C-p>', function() require 'telescope.builtin'.find_files {} end, opt)
	map('n', '<leader>ff', function() require 'telescope.builtin'.find_files {} end, opt)
	map('n', '<leader>fg', function() require 'telescope.builtin'.live_grep {} end, opt)
	map('n', '<leader>fb', function() require 'telescope.builtin'.buffers {} end, opt)
	map({ 'n', 'i' }, '<leader>rg', function() require 'telescope.builtin'.registers {} end, opt)

	-- hot.nvim
	map('n', 'ff', ':HopWord<cr>', opt) -- find global
	-- other example:
	-- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
	-- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
	-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
	-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

	-- code comment
	-- see https://github.com/numToStr/Comment.nvim

	-- ========= dap/dapui settings ========

	map('n', '<leader>db', function() require 'dap'.continue() end, opt)
	map('n', '<leader>b', function() require 'dap'.toggle_breakpoint() end, opt)
	map('n', '<leader>so', function() require 'dap'.step_over() end, opt)
	map('n', '<leader>si', function() require 'dap'.step_into() end, opt)
	map('n', '<leader>tg', function() require 'dapui'.toggle() end, opt)
	-- map('n', '<leader>b', function () require'dapui'.toggle() end, opt)
	-- nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>
	-- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>

	-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
	-- nnoremap <silent> <Leader><F9> <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 确认
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- snippets 跳转
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- super Tab
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-CR>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
    Lspsaga 替换 rn
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    --]]
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	--
	--Lspsaga 替换 ca
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	--
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

	-- go xx
	--[[
      mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    --]]
	mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	mapbuf("n", "<C-]>", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	-- Lspsaga 替换 gh
	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	--[[
    Lspsaga 替换 gr
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt) -- 偶尔会报错FIXME
	-- mapbuf("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opt)

	--[[
    Lspsaga 替换 gp, gj, gk
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

return pluginKeys
