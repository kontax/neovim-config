return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "html",
                "cssls",
                "tailwindcss",
                "tsserver",
                "graphql",
                "pyright",
                "rust_analyzer",
                --"ruff",
                --"ruff_lsp"
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "ruff",
                "rustfmt",
                "rustywind",
                "eslint_d",
            },
        })
    end,
}
