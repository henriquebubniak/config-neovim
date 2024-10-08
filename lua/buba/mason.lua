local servers = {
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "clangd",
}

local settings = {
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("buba.lsp.handlers").on_attach,
		capabilities = require("buba.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	if server ~= "rust_analyzer" then
        lspconfig[server].setup(opts)
    end
end
