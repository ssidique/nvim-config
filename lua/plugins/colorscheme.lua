return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = { harpoon = true },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
