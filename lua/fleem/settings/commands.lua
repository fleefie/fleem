-- This file defines every custom command that you could ever want. Yippee!!
-- Call them whenever needed.
local M = {}


-- These commands require no plugins
function M.nvim()

  -- Highlight on yank
  -- See: help vim.highlight.on_yank
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank({ higroup="Search", timeout = 200 })
    end,
  })

end

return M
