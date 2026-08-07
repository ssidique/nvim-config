return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- Needed so the LspAttach maps for grr/gri can trigger the lazy-load
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        -- sort_mru + ignore_current_buffer puts the last-used buffer first,
        -- so <leader>fb<CR> is a one-shot jump back to where you just were.
        {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>",
            desc = "Buffers",
        },
        { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
        { "<leader>fj", "<cmd>Telescope jumplist<CR>", desc = "Jumplist" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
    },
    -- opts as a function so telescope.actions is required at load time,
    -- not while lazy.nvim is still building the spec table.
    opts = function()
        local actions = require("telescope.actions")
        -- Buffer-local to the prompt, so these shadow the global <C-j>/<C-k>
        -- window navigation only while a picker is open.
        local nav = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- <C-l> replaces actions.complete_tag, which errors on every
            -- picker except lsp_*_symbols and diagnostics.
            ["<C-l>"] = actions.to_fuzzy_refine,
            ["<C-h>"] = actions.which_key,
        }
        return {
            defaults = {
                mappings = { i = nav, n = nav },
            },
        }
    end,
}
