return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- Must be pinned: this config uses the `main` rewrite API
        -- (require("nvim-treesitter").setup). The repo default branch is
        -- `master`, whose API is incompatible.
        branch = "main",
        build = ":TSUpdate",
        config = function()
            -- On `main`, TSConfig accepts only `install_dir` -- an
            -- `ensure_installed` key here is silently discarded. Parsers are
            -- installed with install(), and highlighting must be started
            -- explicitly; the branch does neither for you.
            require("nvim-treesitter").setup()

            local want = { "python", "lua", "json", "yaml", "bash", "dockerfile" }
            local have = require("nvim-treesitter.config").get_installed("parsers")
            local missing = vim.tbl_filter(function(lang)
                return not vim.tbl_contains(have, lang)
            end, want)
            if #missing > 0 then
                require("nvim-treesitter").install(missing)
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
                callback = function(ev)
                    -- Errors when no parser exists for the filetype; that is
                    -- the normal case for plenty of buffers, so swallow it.
                    pcall(vim.treesitter.start, ev.buf)
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main", -- see note above
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
            })

            local map = vim.keymap.set
            map({ "x", "o" }, "af", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
            end, { desc = "Select outer function" })
            map({ "x", "o" }, "if", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
            end, { desc = "Select inner function" })
            map({ "x", "o" }, "ac", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
            end, { desc = "Select outer class" })
            map({ "x", "o" }, "ic", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
            end, { desc = "Select inner class" })
        end,
    },
}
