-- vim options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard = "unnamedplus"

-- lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- packages
require("lazy").setup({
    performance = { rtp = { disabled_plugins = { "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" } } },
    spec = {
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            opts = { highlight = { enable = true } }
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            event = "VeryLazy",
        },
        { 'numToStr/Comment.nvim', config = true },
        { 'echasnovski/mini.surround', config = true },
        { 'echasnovski/mini.ai', config = true },
        { "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
    }
})

-- vscode specific settings
if vim.g.vscode then
    -- VSCode extension
    local vscode = require("vscode-neovim")

    -- Key mappings for VSCode actions
    vim.keymap.set("n", "<leader>f", function()
        vscode.action("workbench.action.quickOpen")
    end)
    vim.keymap.set("n", "<leader>e", function()
        vscode.action("workbench.action.toggleSidebarVisibility")
    end)
    vim.keymap.set("n", "<leader>x", function()
        vscode.action("workbench.action.closeActiveEditor")
    end)

    -- commenting
    vim.keymap.set("x", "gc", function()
        vscode.action("editor.action.commentLine")
    end)

    -- search
    vim.keymap.set("n", "<leader>s", function()
        vscode.action("workbench.action.findInFiles")
    end)

    -- navigation
    vim.keymap.set("n", "gd", function()
        vscode.action("editor.action.revealDefinition")
    end)
    vim.keymap.set("n", "gr", function()
        vscode.action("editor.action.goToReferences")
    end)
else
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.cmd.colorscheme("catppuccin")
end

-- keybindings
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- autocommands
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
