# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim as the plugin manager. All configuration is in Lua.

## Structure

- `init.lua` — Entry point: base vim options, global keymaps, lazy.nvim bootstrap, then loads `lua/plugins/` via `require("lazy").setup("plugins")`
- `lua/plugins/` — Each file returns a lazy.nvim plugin spec (table or list of tables). Lazy.nvim auto-discovers all files in this directory.
- `lazy-lock.json` — Lockfile for plugin versions (managed by lazy.nvim, do not edit manually)

## Key Conventions

- **Leader key**: Space (`<leader>` and `<localleader>`)
- **Plugin specs**: Each plugin gets its own file in `lua/plugins/`. Files return a single spec table or a list of spec tables (for related plugins like the LSP group in `lsp.lua`).
- **LSP servers** are installed via Mason and configured in `lsp.lua`. Currently: `pyright` (Python), `lua_ls` (Lua). LSP keymaps are set via an `LspAttach` autocmd.
- **Completion** uses nvim-cmp with sources: LSP, LuaSnip, buffer, path.
- **Colorscheme**: Catppuccin Mocha.

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec table. No imports or registration needed — lazy.nvim picks it up automatically.

## Adding a New LSP Server

1. Add the server name to the `ensure_installed` list in the mason-lspconfig spec (`lua/plugins/lsp.lua`)
2. Add `lspconfig.<server>.setup({ capabilities = capabilities })` in the nvim-lspconfig config block

## Commands

- `:Lazy` — Open lazy.nvim UI (install/update/manage plugins)
- `:Mason` — Open Mason UI (install/manage LSP servers, formatters, linters)
- `:checkhealth` — Diagnose issues with Neovim and plugins
