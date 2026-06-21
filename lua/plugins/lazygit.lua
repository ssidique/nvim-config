return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
    keys = {
        { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
}
