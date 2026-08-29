return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

        local fugitive = vim.api.nvim_create_augroup("fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, vim.tbl_extend("force", opts, { desc = "Git push" }))

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, vim.tbl_extend("force", opts, { desc = "Git pull --rebase" }))

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ",
                    vim.tbl_extend("force", opts, { desc = "Git push -u origin <branch>" }));
            end,
        })

        -- gu/gh (diffget from the //2 "ours"///3 "theirs" merge stages)
        -- only make sense in an actual 3-way merge-conflict diff view -
        -- bound globally before, they silently ate the real gu{motion}
        -- (lowercase a range) and gh (start Select mode) everywhere else.
        -- &diff, not filetype=fugitive, is what's actually set on those
        -- buffers (fugitive's own filetype is just the :Git status
        -- summary window).
        autocmd("BufWinEnter", {
            group = fugitive,
            pattern = "*",
            callback = function()
                if not vim.wo.diff then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", vim.tbl_extend("force", opts, { desc = "Diffget ours (merge conflict)" }))
                vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", vim.tbl_extend("force", opts, { desc = "Diffget theirs (merge conflict)" }))
            end,
        })
    end
}
