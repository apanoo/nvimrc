-- 缩进后自动选中，方便再次操作

local map = require('utils').keyMap

-- 向左
map('v', '<', '<gv')
-- 向右
map('v', '>', '>gv')