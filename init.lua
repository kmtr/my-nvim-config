vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

require("101-plugins")
require("102-opts")
require("103-keys")
require("104-nvimtree")

require("200-lsp")
require("201-treesitter")
require("202-dap")

require("301-rust")

vim.opt.termguicolors = true
