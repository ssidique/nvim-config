return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "python", "lua", "json", "yaml", "bash", "dockerfile" },
        })
    end,
}
