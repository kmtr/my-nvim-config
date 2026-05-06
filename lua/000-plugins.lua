-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    "EdenEast/nightfox.nvim",
    "danilamihailov/beacon.nvim",

    "nvim-tree/nvim-tree.lua",
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
    },
    {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/vim-vsnip",

    "mfussenegger/nvim-dap",

    "sbdchd/neoformat",
    "LnL7/vim-nix",
})
