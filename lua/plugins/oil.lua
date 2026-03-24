return {
    "stevearc/oil.nvim",
    keys = {
        { "-", "<cmd>Oil<CR>", desc = "Open file explorer" },
    },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
