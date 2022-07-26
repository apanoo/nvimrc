local status, formatter = pcall(require, "formatter")
if not status then
  vim.notify("没有找到 formatter")
  return
end

formatter.setup({
  filetype = {
    c = {
      function()
        return {
          exe = "clang-format",
          args = {
          },
          stdin = true,
        }
      end
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {
          },
          stdin = true,
        }
      end
    },
    lua = {
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
    go = {
      function()
        return {
          exe = "goimports",
          args = {},
          stdin = true,
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
          stdin = true,
        }
      end,
    },
  },
})

-- format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.go,*.cpp,*.c FormatWrite
augroup END
]] ,
  true
)
