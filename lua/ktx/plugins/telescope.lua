return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require('telescope.builtin')
        local keymap = vim.keymap

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
        })

        -- keymaps
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" } )
        keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" } )
        keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" } )
        keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "List normal mode keymappings" })
    end
}
