-- Call it witch key with how weird it is to configure sometimes
-- Folke please I LOVE your work but WHY does it have to be so
-- esoteric to configure :(
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  cmd = "WhichKey",

  config = function()
    local which_key = require "which-key"

    local opts = {
      -- WhichKey plugin config.
      plugins = {
        -- shows a list of your marks on ' and `
        marks = false,
        -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        registers = false,
        -- Spelling help when pressing z=
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false,  -- adds help for operators like d, y, ...
          motions = false,    -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,    -- default bindings on <c-w>
          nav = false,        -- misc bindings to work with windows
          z = false,          -- bindings for folds, spelling and others prefixed with z
          g = false,          -- bindings for prefixed with g
        },
      },

      -- Icon settings.
      icons = {
        breadcrumb = "»",
        separator = "",
        group = "",
        mappings = false,
        keys = { Space = "<leader>", Esc = "<esc>", BS = "<bs>" }
      },

      -- Keybinds for the whichkey window
      keys = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },

      -- Window display settings
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        border = "rounded",
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = "Keymaps",
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },

      -- Window display layout
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                  -- spacing between columns
      },

      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = { { "<space>", mode = "nixsotc" } },
      -- Disable in specific buffers
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    }


    which_key.setup(opts)
    require("fleem.settings.mappings").whichkey()
  end,

}
