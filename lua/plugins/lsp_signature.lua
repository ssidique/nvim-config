return {
    "ray-x/lsp_signature.nvim",
    -- VeryLazy rather than InsertEnter: setup() hooks LspAttach, so loading
    -- lazily on first insert can miss clients that attached during startup.
    event = "VeryLazy",
    opts = {
        bind = true,
        -- The float carries the signature; the inline virtual-text hint is
        -- redundant with it and adds noise on every call.
        hint_enable = false,
        handler_opts = { border = "rounded" },
        max_height = 8,
    },
}
