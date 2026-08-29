return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Reuses ]c/[c (unmapped by default) rather than [d/]d
                -- (already diagnostics, see lspconfig.lua) - falls back to
                -- the native diff-mode jump when inside an actual diff view.
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, "Next git hunk")

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, "Previous git hunk")

                map("n", "<leader>hs", gitsigns.stage_hunk, "Stage git hunk")
                map("n", "<leader>hr", gitsigns.reset_hunk, "Reset git hunk")
                map("v", "<leader>hs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Stage git hunk (selection)")
                map("v", "<leader>hr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "Reset git hunk (selection)")
                map("n", "<leader>hp", gitsigns.preview_hunk, "Preview git hunk")
                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true })
                end, "Show git blame for line")
                map("n", "<leader>hd", gitsigns.diffthis, "Diff against index")
                map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle inline git blame")
            end,
        })
    end,
}
