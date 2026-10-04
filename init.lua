-- Base settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.updatetime = 250

-- Keymaps
local map = vim.keymap.set

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffers
-- <S-h>/<S-l>/<leader>b* live in lua/plugins/bufferline.lua so they follow the
-- tabline's order rather than buffer-number order. <leader>bd is in snacks.lua.
-- <C-^> (built-in) toggles the alternate buffer.

-- Quickfix navigation -- walks the list telescope's <C-q> fills
map("n", "]q", ":cnext<CR>zz", { silent = true, desc = "Next quickfix" })
map("n", "[q", ":cprev<CR>zz", { silent = true, desc = "Prev quickfix" })
map("n", "]Q", ":clast<CR>zz", { silent = true, desc = "Last quickfix" })
map("n", "[Q", ":cfirst<CR>zz", { silent = true, desc = "First quickfix" })

map("n", "<leader>q", function()
    -- getwininfo() flags quickfix=1 for location-list windows too, so
    -- loclist==0 is what actually isolates the quickfix window.
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 and win.loclist == 0 then
            vim.cmd("cclose")
            return
        end
    end
    vim.cmd("copen")
end, { desc = "Toggle quickfix" })

-- Better escape
map("i", "jk", "<Esc>")

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear search highlight
map("n", "<Esc>", ":noh<CR>", { silent = true })

-- Review comment for Claude Code's nvim-review mod: opens a `CLAUDE: ` marker above the
-- cursor line in the filetype's own comment syntax (# / -- / // / <!-- -->), in insert mode.
map("n", "<leader>cc", function()
    local cs = vim.bo.commentstring
    if not cs:find("%%s") then cs = "# %s" end
    local before, after = cs:match("^(.-)%%s(.-)$")
    local indent = vim.api.nvim_get_current_line():match("^%s*")
    local head = indent .. vim.trim(before) .. " CLAUDE: "
    local tail = vim.trim(after) == "" and "" or " " .. vim.trim(after)
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { head .. tail })
    vim.api.nvim_win_set_cursor(0, { row, #head })
    -- with nothing after the cursor, `startinsert!` appends at the end of the line
    vim.cmd(tail == "" and "startinsert!" or "startinsert")
end, { desc = "Claude review comment" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")
