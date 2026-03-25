return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
    },
}
