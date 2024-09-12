-- Lualine.lua, a config COMPLETELY stolen from LunarVim.
-- Gotta give me credit, I utterly gutted it into its bare essentials.
-- I genuinely think that it would've been faster to just make my own config
-- from scratch at this point, but it's not about efficiency, it's about standing
-- victorious above the body of the living, breathing being that you tore the
-- bones out of to make your crown.
--
-- Oh well.

return {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  dependencies = {
    "lewis6991/gitsigns.nvim"
  },
  config = function()

    -- Helper function to use gitsigns to get the git status and all
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    -- Components are defined here to avoid repetition later
    local components = {

      -- Returns the current mode as a color only. Displays a little unicode symbol
      -- on top. I made it a little flame bc I found it like so cool and all.
      mode = {
        function()
          return " " .. "" .. " "
        end,
        padding = { left = 0, right = 0 },
        color = {},
      },

      -- Returns the current branch using gitsigns.
      branch = {
        "b:gitsigns_head",
        icon = "",
        color = { gui = "bold" },
      },

      -- Still using gitsigns, we print out the status.
      diff = {
        "diff",
        source = diff_source,
        symbols = {
          added = "+" .. " ",
          modified = "~" .. " ",
          removed = "-" .. " ",
        },
        padding = { left = 2, right = 1 },
        diff_color = {
          -- Dirty! I couldn't get the colors to be loaded from the colorscheme...
          added = { fg = "#A3BE8C" },
          modified = { fg = "#EBCB8B" },
          removed = { fg = "#BF616A" },
        },
      },

      -- LSP diagnostics so now there will be a total of four places where they're
      -- displayed in all of their annoying but truthful beauty.
      diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = "✘ ",
          warn = "▲ ",
          info = "» ",
          hint = "󰌶 ",
        },
      },

      -- Shows the currently running LSP client, linter and formatter.
      lsp = {
        function()
          local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
          if #buf_clients == 0 then
            return "LSP Inactive"
          end

          -- local buf_ft = vim.bo.filetype
          local buf_client_names = {}

          -- add client
          for _, client in pairs(buf_clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              table.insert(buf_client_names, client.name)
            end
          end

          -- TODO: convert formatters and linters over to my rewrite
          -- add formatter
          -- local formatters = require "lvim.lsp.null-ls.formatters"
          -- local supported_formatters = formatters.list_registered(buf_ft)
          -- vim.list_extend(buf_client_names, supported_formatters)
          -- add linter
          -- local linters = require "lvim.lsp.null-ls.linters"
          -- local supported_linters = linters.list_registered(buf_ft)
          -- vim.list_extend(buf_client_names, supported_linters)

          local unique_client_names = table.concat(buf_client_names, ", ")
          local language_servers = string.format("[%s]", unique_client_names)

          return language_servers
        end,
        color = { gui = "bold" },
      },

      -- Just the cursor location, nothing big.
      location = { "location" },

      -- Same thing really but here it's a scroll indicator
      progress = {
        "progress",
        fmt = function()
          return "%P/%L"
        end,
        color = {},
      },

      -- And a simple filetype plugin as well. Devicons included!
      filetype = {
        "filetype",
        padding = {
          left = 1,
          right = 1
        }
      },
    }

    local opts = {
      options = {
        globalstatus = true,
        -- I've never been a fan of the whole powerline aesthetic, I always found it
        -- to look... unrefined? Ironic for someone doing neovim visual customizations
        -- but still. Get rid of em for sweet sweet vertical separators.
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- Oh also disable it on the dashboard. For moar clean
        disabled_filetypes = { "alpha" },
      },
      -- Sections go here. They're displayed like [abc     xyz]
      -- Since we're setting both active and inactive, having the components be
      -- in their own table makes this a bit easier.
      -- This whole project really gave me an appreciation for Lua :p
      sections = {
        lualine_a = {
          components.mode,
        },
        lualine_b = {
          components.branch,
        },
        lualine_c = {
          components.diff,
        },
        lualine_x = {
          components.diagnostics,
          components.lsp,
          components.filetype,
        },
        lualine_y = {
          components.location
        },
        lualine_z = {
          components.progress,
        },
      },
      inactive_sections = {
        lualine_a = {
          components.mode,
        },
        lualine_b = {
          components.branch,
        },
        lualine_c = {
          components.diff,
        },
        lualine_x = {
          components.diagnostics,
          components.lsp,
          components.spaces,
          components.filetype,
        },
        lualine_y = {
          components.location
        },
        lualine_z = {
          components.progress,
        },
      },
    }

    require("lualine").setup(opts)
  end
}
