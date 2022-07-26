local status, formatter = pcall(require, "formatter")
if not status then
	vim.notify("没有找到 formatter")
	return
end

local options = {
	{
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "html" },
		rule = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
	},
	{
		filetypes = { "c", "cpp" },
		rule = {
			function()
				return {
					exe = "clang-format",
					args = {
						-- "-style=file"
					},
					stdin = true,
				}
			end,
		},
	},
	{
		filetypes = { "lua" },
		rule = {
			function()
				return {
					exe = "stylua",
					args = {
						-- "--config-path "
						--   .. os.getenv("XDG_CONFIG_HOME")
						--   .. "/stylua/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
	{
		filetypes = { "go" },
		rule = {
			function()
				return {
					exe = "goimports",
					args = {},
					stdin = true,
				}
			end,
		},
	},
	{
		filetypes = { "rust" },
		rule = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
	},
}

local fOptions = {}
for _, ov in ipairs(options) do
	for _, fv in ipairs(ov.filetypes) do
		fOptions[fv] = ov.rule
	end
end

formatter.setup({
	filetype = fOptions,
})

vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "FormatAutogroup",
	pattern = { "*.js", "*.rs", "*.lua", "*.go", "*.cpp", "*.c", "*.ts", "*.tsx", "*.json", "*.html" },
	command = "FormatWrite",
})
