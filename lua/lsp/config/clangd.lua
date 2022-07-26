local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

capabilities.offsetEncoding = { "utf-16" }

local nvim_lsp = require("lspconfig")

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = nvim_lsp.util.validate_bufnr(bufnr)
	local clangd_client = nvim_lsp.util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				print("Corresponding file can’t be determined")
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		print("method textDocument/switchSourceHeader is not supported by any servers active on the current buffer")
	end
end

return {
    on_setup = function(server)
        server.setup({
            capabilities = capabilities,
			single_file_support = true,
			on_attach = function (client, bufnr)
                require("lsp_signature").on_attach({
                    bind = true,
                    use_lspsaga = false,
                    floating_window = true,
                    fix_pos = true,
                    hint_enable = true,
                    hi_parameter = "Search",
                    handler_opts = { "double" },
                })
                require("aerial").on_attach(client)
                require("illuminate").on_attach(client)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                  end
                -- 绑定快捷键
                require("keybindings").mapLSP(buf_set_keymap)
            end,
			args = {
				"--background-index",
				"-std=c++20",
				"--pch-storage=memory",
				"--clang-tidy",
				"--suggest-missing-includes",
			},
			commands = {
				ClangdSwitchSourceHeader = {
					function()
						switch_source_header_splitcmd(0, "edit")
					end,
					description = "Open source/header in current buffer",
				},
				ClangdSwitchSourceHeaderVSplit = {
					function()
						switch_source_header_splitcmd(0, "vsplit")
					end,
					description = "Open source/header in a new vsplit",
				},
				ClangdSwitchSourceHeaderSplit = {
					function()
						switch_source_header_splitcmd(0, "split")
					end,
					description = "Open source/header in a new split",
				},
			},
        })
    end
}