local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

-- local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		-- 已使用formatter.nvim做格式化，null-ls的格式化功能不用了

		-- Diagnostics  ---------------------
		-- 配置lint
		diagnostics.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
		-- diagnostics.markdownlint,
		-- markdownlint-cli2
		-- diagnostics.markdownlint.with({
		--   prefer_local = "node_modules/.bin",
		--   command = "markdownlint-cli2",
		--   args = { "$FILENAME", "#node_modules" },
		-- }),
		--
		-- code actions ---------------------
		code_actions.gitsigns,
		code_actions.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "[#{s}] #{m}",
})
