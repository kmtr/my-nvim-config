vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

vim.keymap.set({"n"}, "<C-n>", ":NvimTreeOpen<CR>")
vim.keymap.set({"n"}, "<C-S-n>", ":NvimTreeClose<CR>")
vim.keymap.set({"n"}, "<Leader>n", ":NvimTreeFocus<CR>")
