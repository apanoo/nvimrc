--- 设置golang补全配置
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	on_setup = function(server)
		server.setup({
			on_attach = function(client, bufnr)
				-- 禁用格式化功能，交给专门插件插件处理
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_range_formatting = false
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end
				-- 绑定快捷键
				require("keybindings").mapLSP(buf_set_keymap)

				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
			end,

			cmd = { "gopls" },
			capabilities = capabilities,
			settings = {
				gopls = {
					experimentalPostfixCompletions = true,
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
				},
			},
			init_options = {
				--- true: 补全function时可以提供参数预览填充,通过tab键切换预览参数
				-- false: 只补全括号
				-- 与cmp中的autopairs不冲突
				usePlaceholders = false,
			},
		})
	end,
}
