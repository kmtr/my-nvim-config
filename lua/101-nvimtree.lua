vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

function toggle_nvimtree()
	if vim.fn.bufname():match 'NvimTree_' then
		vim.cmd.wincmd 'p'
	else
        vim.cmd('NvimTreeFocus')
	end
end

vim.keymap.set({"n"}, "<C-S-n>", ":NvimTreeToggle<CR>")
vim.keymap.set({"n"}, "<C-n>", "<cmd>:lua toggle_nvimtree()<CR>")
