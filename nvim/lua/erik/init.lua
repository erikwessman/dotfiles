require("erik.remap")
require("erik.set")
require("erik.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- system clipboard same as nvim clipboard
vim.opt.clipboard = 'unnamedplus'
