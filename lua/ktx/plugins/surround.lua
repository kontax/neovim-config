return {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- upstream recommends pinning a major for stability
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end,
}
