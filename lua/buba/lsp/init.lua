local servers = {
    "lua_ls",
}

require("buba.mason")
require("buba.lsp.handlers").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})
