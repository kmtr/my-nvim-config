vim.g.mapleader = " "
vim.keymap.set({"n", "o", "!"}, "<C-a>", "<Home>")
vim.keymap.set({"n", "o", "!"}, "<C-e>", "<End>")
vim.keymap.set({"n"}, "<ESC><ESC>", ":nohlsearch<CR>")
vim.keymap.set({"i", "n", "o"}, "<C-s>", "<ESC>:w<CR>")

vim.keymap.set({"v"}, "<Leader>y", "\"+y")
vim.keymap.set({"v"}, "<Leader>d", "\"+d")
vim.keymap.set({"n", "v"}, "<Leader>p", "\"+p")
vim.keymap.set({"n", "v"}, "<Leader>P", "\"+P")

vim.keymap.set({"t"}, "<ESC>", "<C-\\><C-n>")

