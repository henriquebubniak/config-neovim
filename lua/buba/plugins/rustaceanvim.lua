vim.g.rustaceanvim = {
    server = {
        on_attach = require("buba.lsp.handlers").on_attach,
    }
}

return {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
}
