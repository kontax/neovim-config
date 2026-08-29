return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9", -- was 0.1.5, over 4 point releases behind (bugfixes/new pickers, no known breaking changes)
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- build = "make": without it lazy never compiles the native
        -- sorter at all (confirmed live - no .so ever produced), so this
        -- sat installed and completely inert; load_extension below is the
        -- other half, telling telescope to actually use it once built.
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
        pcall(telescope.load_extension, "fzf")

        -- keymaps
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" } )
        keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" } )
        keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" } )
        keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "List normal mode keymappings" })
        -- Previously missing entirely despite being some of the most
        -- commonly used pickers.
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
        keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
        keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "List recently opened files" })
    end
}
