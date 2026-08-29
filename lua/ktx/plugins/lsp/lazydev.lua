return {
    -- neodev.nvim (this plugin used to be) is EOL upstream - its own
    -- README now points Neovim >= 0.10 users at lazydev.nvim instead.
    -- Confirmed live: neodev's internal require("lspconfig") call was
    -- what actually triggered the "setup_handlers is nil" crash while
    -- investigating the mason-lspconfig API removal, since neodev hasn't
    -- been updated for the ecosystem's move to Neovim's native LSP config.
    'folke/lazydev.nvim',
    ft = "lua",
    opts = {},
}
