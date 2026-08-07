return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Keymaps on LSP attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    -- Buffer-local, so these shadow Neovim's built-in grr/gri
                    -- without deleting them. grn/gra keep working as shipped.
                    map("grr", "<cmd>Telescope lsp_references<CR>", "References")
                    map("gri", "<cmd>Telescope lsp_implementations<CR>", "Implementations")
                    map("K", vim.lsp.buf.hover, "Hover docs")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("<leader>d", vim.diagnostic.open_float, "Line diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                end,
            })

            -- Server configs using vim.lsp.config (Neovim 0.11+)
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        -- Default is "Disable", which completes a bare name.
                        -- "Replace" inserts the full call with each parameter
                        -- as a snippet tab-stop (<Tab>/<S-Tab> to move).
                        completion = { callSnippet = "Replace" },
                    },
                },
            })

            vim.lsp.enable({ "pyright", "lua_ls" })
        end,
    },
}
