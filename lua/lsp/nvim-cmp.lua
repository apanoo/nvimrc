-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind-nvim

--local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 来源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		-- For vsnip users.
		{ name = "vsnip" },
		{ name = "buffer" },
		-- For luasnip users.
		-- { name = 'luasnip' },
		--For ultisnips users.
		-- { name = 'ultisnips' },
		-- -- For snippy users.
		-- { name = 'snippy' },
	}, { { name = "path" } }),

	-- 快捷键
	mapping = require("keybindings").cmp(cmp),
	-- 使用lspkind-nvim显示类型图标
	formatting = require("lsp.ui").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- 可选： 补全function结束后，自动补全括号
-- 与lspconfig中的usePlaceholders不冲突
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
