-- This file defines every custom command that you could ever want. Yippee!!
-- Below is an example of a command, from the original repo's commands.lua.
-- I'm leaving it here in case you need an example of how to create commands
-- yourself. Though these require you to know Lua to create them.


-- Highlight on yank
-- See: help vim.highlight.on_yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup="Search", timeout = 200 })
  end,
})


---- mason, write correct names only
-- vim.api.nvim_create_user_command("MasonInstallAll", function()
--   vim.cmd "MasonInstall css-lsp html-lsp lua-language-server typescript-language-server stylua prettier"
-- end, {})
