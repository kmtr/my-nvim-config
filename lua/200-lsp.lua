require("mason").setup()

vim.lsp.config("ts_ls", {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

require("mason-lspconfig").setup({
    -- mason-lspconfig uses the lspconfig server name; this installs typescript-language-server.
    ensure_installed = { "ts_ls" },
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.opt.updatetime = 300

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "x",
            [vim.diagnostic.severity.WARN] = "!",
            [vim.diagnostic.severity.HINT] = ">",
            [vim.diagnostic.severity.INFO] = ">",
        },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local cmp = require"cmp"
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = "path" },                              -- file paths
    { name = "nvim_lsp", keyword_length = 3 },      -- from language server
    { name = "nvim_lsp_signature_help"},            -- display function signatures with current parameter emphasized
    { name = "nvim_lua", keyword_length = 2},       -- complete neovim"s Lua runtime API such vim.lsp.*
    { name = "buffer", keyword_length = 2 },        -- source current buffer
    { name = "vsnip", keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = "calc"},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {"menu", "abbr", "kind"},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = "λ",
              vsnip = "⋗",
              buffer = "buf",
              path = "/",
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})
