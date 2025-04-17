-- This file sets up Lazy.nvim to load the plugins

-- Lazy install path
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Install Lazy if it isn't installed et
if not vim.loop.fs_stat(lazypath) then
    NotInstalled = true
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end

-- Add Lazy to RUNTIMEPATH
vim.opt.rtp:prepend(lazypath)

-- Load lazy
require("lazy").setup({
    -- Plugin import paths
    { import = "fleem.plugins" },
    { import = "fleem.plugins.lsp" },

    -- Config
    install = {
        colorscheme = { "nordic" }
    },
    ui = {
        border = "rounded",
        backdrop = 100
    },
    checker = {
        enabled = true
    }
})
