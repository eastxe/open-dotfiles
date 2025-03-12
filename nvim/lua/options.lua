local opt = vim.opt

-- 行番号表示
opt.number = true
-- クリックボード連携
opt.clipboard:append('unnamedplus')
-- jjをescに
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true , silent = true})
-- , をleaderに
vim.g.mapleader = ','
