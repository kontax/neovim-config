return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                tailwindcss = { "rustywind" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                python = { "ruff" },
                rust = { "rustfmt" },
                -- Was missing entirely - the custom stylua args below were
                -- configured but never actually invoked for any filetype.
                lua = { "stylua" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            formatters = {
                -- Keyed by formatter name (stylua), not filetype (lua) -
                -- this was "lua" before, an override for a formatter
                -- that doesn't exist, silently ignored. Confirmed live via
                -- get_formatter_config("stylua", 0): without this fix the
                -- resolved args never included --indent-type at all.
                stylua = {
                    -- prepend_args, not args: conform's built-in stylua
                    -- formatter already sets args to
                    -- {"--search-parent-directories", "--stdin-filepath",
                    -- "$FILENAME", "-"} (the piece that makes stdin/stdout
                    -- piping work at all) - a plain `args` override here
                    -- would have replaced that wholesale, and even merged
                    -- (conform merges override configs into the built-in
                    -- one) a single "--indent-type Spaces" string lands in
                    -- the args array's first slot, clobbering
                    -- "--search-parent-directories" rather than adding a
                    -- new element.
                    prepend_args = { "--indent-type", "Spaces" },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
