local opts = { noremap = true, silent = true }

local builtin = require("telescope.builtin")

local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
