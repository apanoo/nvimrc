-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/apanoo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/apanoo/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/apanoo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/apanoo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/apanoo/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "git@github.com:numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "git@github.com:stevearc/aerial.nvim"
  },
  ["align.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/align.nvim",
    url = "git@github.com:Vonr/align.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "git@github.com:akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "git@github.com:hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "git@github.com:hrsh7th/cmp-vsnip"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "git@github.com:nathom/filetype.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "git@github.com:mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "git@github.com:rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "git@github.com:phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "git@github.com:lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "git@github.com:rebelot/kanagawa.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "git@github.com:ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "git@github.com:onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "git@github.com:glepnir/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "git@github.com:folke/lua-dev.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "git@github.com:arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "git@github.com:jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "git@github.com:mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "git@github.com:rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "git@github.com:williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "git@github.com:jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@github.com:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "git@github.com:simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "git@github.com:b0o/schemastore.nvim"
  },
  ["surround.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/surround.nvim",
    url = "git@github.com:ur4ltz/surround.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "git@github.com:akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "git@github.com:folke/tokyonight.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "git@github.com:moll/vim-bbye"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "git@github.com:RRethy/vim-illuminate"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "git@github.com:dstein64/vim-startuptime"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "git@github.com:mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/apanoo/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "git@github.com:hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope.nvim ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
