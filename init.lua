vim.pack.add ({
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
})

require('gitsigns').setup()
require("nvim-tree").setup()
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
require('mason-tool-installer').setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"clangd",
	}
})
local cmp = require('cmp')
local luasnip = require("luasnip")
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
        ['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

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
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 999

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
