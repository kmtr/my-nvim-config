-- :MasonInstall rust-analyzer codelldb
-- :MasonUpdate
local lspconfig = require'lspconfig'

local on_attach = function(client)
end

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        }
    }
})

