return {
    'rust-lang/rust.vim',
    dependencies = "neovim/nvim-lspconfig",
    config = function ()
        vim.g.rustfmt_autosave = 1
    end
}
