-- lua/304-nix.lua
-- Nix開発環境の設定（シンタックスハイライト + alejandraフォーマット）

local M = {}

-- Neoformatの設定
local function setup_neoformat()
  -- alejandraフォーマッターの設定
  vim.g.neoformat_nix_alejandra = {
    exe = 'alejandra',
    args = { '--quiet' },
    stdin = 1,
  }
  
  -- デフォルトのNixフォーマッターをalejandraに設定
  vim.g.neoformat_enabled_nix = { 'alejandra' }
  
  -- デバッグが必要な場合は以下をコメントアウト解除
  -- vim.g.neoformat_verbose = 1
end

-- Nixファイルタイプ用の設定
local function setup_nix_filetype()
  local augroup = vim.api.nvim_create_augroup("NixSettings", { clear = true })
  
  -- Nixファイルの基本設定
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "nix",
    callback = function()
      -- インデント設定
      vim.bo.tabstop = 2
      vim.bo.shiftwidth = 2
      vim.bo.softtabstop = 2
      vim.bo.expandtab = true
      
      -- コメント文字列
      vim.bo.commentstring = "# %s"
      
      -- フォーマットオプション
      vim.opt_local.formatoptions:remove({ "r", "o" })  -- 改行時の自動コメント継続を無効化
    end,
  })
  
  -- フォーマット用キーマッピング
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "nix",
    callback = function()
      local opts = { buffer = true, silent = true, desc = "Format Nix file" }
      
      -- <Leader>f でフォーマット実行
      vim.keymap.set('n', '<Leader>f', ':Neoformat<CR>', opts)
      vim.keymap.set('v', '<Leader>f', ':Neoformat<CR>', opts)
      
      -- 代替キーマッピング（お好みで）
      -- vim.keymap.set('n', '<Leader>nf', ':Neoformat<CR>', opts)
    end,
  })
  
  -- 保存時の自動フォーマット（オプション）
  -- コメントを外すと有効になります
  --[[
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    pattern = "*.nix",
    callback = function()
      vim.cmd("Neoformat")
    end,
  })
  --]]
  
  -- ファイル認識の改善
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = { "*.nix", "flake.nix", "default.nix", "shell.nix", "configuration.nix" },
    callback = function()
      vim.bo.filetype = "nix"
    end,
  })
  
  -- flake.lockはJSONとして扱う
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = "flake.lock",
    callback = function()
      vim.bo.filetype = "json"
    end,
  })
end

-- alejandraが利用可能かチェック
local function check_alejandra()
  if vim.fn.executable('alejandra') == 0 then
    vim.notify(
      "alejandra not found! Install with: cargo install alejandra",
      vim.log.levels.WARN,
      { title = "Nix Setup" }
    )
    return false
  end
  return true
end

-- 診断メッセージのカスタマイズ（オプション）
local function setup_diagnostics()
  -- Nixファイル用の診断表示設定
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    callback = function()
      -- より見やすい診断表示
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          spacing = 4,
        },
        float = {
          source = "always",
          border = "rounded",
        },
      }, vim.api.nvim_get_current_buf())
    end,
  })
end

-- セットアップ関数
function M.setup()
  -- Neoformatの設定
  setup_neoformat()
  
  -- ファイルタイプ設定
  setup_nix_filetype()
  
  -- 診断表示のカスタマイズ
  setup_diagnostics()
  
  -- alejandraの存在確認
  vim.defer_fn(function()
    if check_alejandra() then
      vim.notify("Nix environment configured with alejandra", vim.log.levels.INFO, { title = "Nix Setup" })
    end
  end, 100)
end

-- 手動フォーマット用のヘルパー関数
function M.format()
  if vim.bo.filetype == "nix" then
    vim.cmd("Neoformat")
  else
    vim.notify("Not a Nix file", vim.log.levels.WARN)
  end
end

-- セットアップを自動実行
M.setup()

return M
