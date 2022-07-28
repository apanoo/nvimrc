-- 插件快捷键
local pluginKeys = {}

-- common keymap
require("keybindings.commom")

-- cmp
pluginKeys.cmp = require("keybindings.cmp")
-- lsp
pluginKeys.mapLSP = require("keybindings.lsp")
-- lsp for typescript
pluginKeys.mapTsLSP = require("keybindings.lsp-typescript")

return pluginKeys
