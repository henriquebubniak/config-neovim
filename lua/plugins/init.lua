vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/stevearc/oil.nvim',
})

require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
        end,
    },
})
require('gitsigns').setup()
require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true, -- Set this to true
        },
    },
})
require('bufferline').setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree",
            }
        }
    }
})
require('mason').setup()
require('mason-lspconfig').setup()

require('plugins.cmp-setup')
