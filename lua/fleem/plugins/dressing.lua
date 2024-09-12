-- Like noice but better tbh
-- Fixes a bug with Noice, nvim-notify and dropdown menus too so theres that
return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      -- Set to false to disable the vim.ui.input implementation
      enabled = false,
    },
    select = {
      telescope = require("telescope.themes").get_dropdown({})
    }
  }
}
