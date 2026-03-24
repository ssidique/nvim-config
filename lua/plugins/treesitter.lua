return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "lua", "json", "yaml", "bash", "dockerfile" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
