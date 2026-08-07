return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    input = { enabled = true },
    notifier = { enabled = true },
    -- picker deliberately off: telescope is the single fuzzy finder.
  },
  keys = {
    -- bufdelete is an on-demand util, not a module -- no opts entry needed.
    -- Deletes the buffer without collapsing the window layout.
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
  },
}
