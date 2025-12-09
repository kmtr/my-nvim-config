-- :MasonInstall rust-analyzer codelldb
-- :MasonUpdate
vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        }
    }
})

