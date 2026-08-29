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
                "ts_ls", -- was "tsp_server", a typo matching no server at all
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
                -- rustfmt isn't in Mason's registry at all (it ships with
                -- rustup, not as a standalone mason package) - confirmed
                -- live, this errored "Cannot find package rustfmt" on
                -- every startup. Install via `rustup component add
                -- rustfmt` instead.
                "rustywind",
                "eslint_d",
            },
        })
    end,
}
