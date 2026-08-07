return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
        { "<leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle pin buffer" },
    },
    -- No catppuccin highlight override: catppuccin no longer ships a bufferline
    -- integration, so bufferline derives its colours from the colorscheme.
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            show_buffer_close_icons = false,
            separator_style = "slant",
        },
    },
}
