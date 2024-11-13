-- General options
require("fleem.settings.commands").nvim()
require("fleem.settings.mappings").nvim()
require("fleem.settings.options").nvim()

-- Load Lazy
require("fleem.lazy")

-- Load post-lazy commands. Avoid these like the plague!
require("fleem.lazy_after")

-- HACK: should be in its own file!
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.asm" },
  command = "lua vim.api.nvim_command('setfiletype rgbds')"
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.inc" },
  command = "lua vim.api.nvim_command('setfiletype rgbds')"
})
