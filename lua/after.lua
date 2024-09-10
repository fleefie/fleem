-- This file is ran after everything has been loaded, hopefully.

-- Colorscheme setup, it's now safe to add it
vim.cmd.colorscheme("nordic")

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT" -- tempted to remove this for the lolz
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
