vim.opt.pumheight = 5
vim.opt.termguicolors = true
vim.cmd("colorscheme kanagawa")
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>f", ":FzfLua files resume=true<CR>", { desc = "Search files" })
vim.keymap.set("n", "<Leader>s", ":FzfLua live_grep resume=true<CR>", { desc = "Grep files" })
vim.keymap.set("n", "<Leader>b", ":FzfLua buffers resume=true<CR>", { desc = "Search buffers" })
vim.keymap.set("n", "<S-h>", ":bp<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<S-l>", ":bn<CR>", { desc = "Go to next buffer" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Move to down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Move to up window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Move to right window' })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.keymap.set('n', '\\', ':NvimTreeFindFile<CR>', { desc = 'Find current file in NvimTree' })
vim.keymap.set('n', '<leader>gp', ':lua require("gitsigns").preview_hunk()<CR>')
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition" })
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}), {0})
end, { desc = "Toggle Inlay Hints" })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { desc = 'Close buffer with pick' })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 999
-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
