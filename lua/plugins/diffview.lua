return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview: working tree vs HEAD" },
        { "<leader>gm", "<cmd>DiffviewOpen origin/main...HEAD<CR>", desc = "Diffview: branch vs main" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: file history" },
        { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Diffview: close" },
    },
    opts = {
        enhanced_diff_hl = true,
    },
}
