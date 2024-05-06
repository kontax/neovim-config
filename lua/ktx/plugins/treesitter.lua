return {
    "nvim-treesitter/nvim-treesitter",
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
