return {
    "nvim-treesitter/nvim-treesitter",
    -- Upstream's default branch is now "main", a rewritten plugin with a
    -- different API (no nvim-treesitter.configs module at all) - confirmed
    -- live, an unpinned clone broke config() below with "module
    -- 'nvim-treesitter.configs' not found". master still carries the
    -- classic API this config (ensure_installed/highlight/indent/autotag)
    -- is written against.
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "yaml",
                "json",
                "dockerfile",
                "gitignore",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "jsdoc",
                "graphql",
                "c",
                "rust",
                "python",
            },

            sync_install = false,
            auto_install = true,
            indent = { enable = true },
            autotag = { enable = true },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end
}
