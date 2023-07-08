vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "easymotion/vim-easymotion"
    use "EdenEast/nightfox.nvim"
    use "danilamihailov/beacon.nvim"

    use "nvim-tree/nvim-tree.lua"

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/vim-vsnip"

    use "nvim-treesitter/nvim-treesitter"

    use "mfussenegger/nvim-dap"
end)

