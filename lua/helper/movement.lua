-- 移动当前行

local map = require('utils').keyMap

-- 向下
map('n', '<C-j>', ':m .+1<CR>==')
map('i', '<C-j>', '<ESC>:m .+1<CR>==gi')
-- 向上
map('n', '<C-k>', ':m .-2<CR>==')
map('i', '<C-k>', '<ESC>:m .-2<CR>==gi')

