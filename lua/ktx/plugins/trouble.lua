return {
    "folke/trouble.nvim",
    -- v3, a full rewrite - upstream's own words. :TroubleToggle and its
    -- provider-name arguments (workspace_diagnostics, document_diagnostics)
    -- are gone entirely, replaced by :Trouble <mode> toggle. Migrated from
    -- the old v2 pin (see git log) before it broke on a future update, the
    -- same way mason-lspconfig's removed API did earlier tonight.
    cmd = "Trouble",
    opts = {},
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
        -- New (v3 only): pairs with lspconfig.lua's own <leader>c* code
        -- action/rename keymaps.
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP definitions/references" },
    }
}
