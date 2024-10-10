-- Noice is the handler for notifications, command and search inputs, as well
-- as the LSP signature display. Quite frankly it's just fluff that genuinely
-- slows you down and is incredibly inconvenient to use.
--
-- ... But it looks good. So it gets added ;)
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "smjonas/inc-rename.nvim",
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,            -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true         -- add a border to hover docs and signature help
    },
    notify = {
      enabled = true,
      fps = 75,
      level = "ERROR"
    },
    -- https://github.com/AlexvZyl/nvim/blob/main/lua/alex/plugins/ui/noice.lua
    routes = {
      { filter = { find = "written", },                                opts = { skip = true } },
      { filter = { find = "fewer lines", },                            opts = { skip = true } },
      { filter = { find = "line less;", },                             opts = { skip = true } },
      { filter = { find = "Already at", },                             opts = { skip = true } },
      { filter = { find = "lines yanked", },                           opts = { skip = true } },
      { filter = { find = "more line", },                              opts = { skip = true } },
      { filter = { find = "change;", },                                opts = { skip = true } },
      { filter = { find = "E486", },                                   opts = { skip = true } },
      { filter = { find = "No results", },                             opts = { skip = true } },
      { filter = { find = "Nothing currently selected", },             opts = { skip = true } },
      { filter = { find = "changes;", },                               opts = { skip = true } },
      { filter = { find = "No information available", },               opts = { skip = true } },
      { filter = { find = "has already been sent, please wait", },     opts = { skip = true } },
      { filter = { find = "is not supported by any of the servers", }, opts = { skip = true } },
      { filter = { find = "hover is not supported", },                 opts = { skip = true } },
      { filter = { find = "response of request method", },             opts = { skip = true } },
      { filter = { find = "not found:", },                             opts = { skip = true } },
      { filter = { find = "No buffers found with", },                  opts = { skip = true } },
      { filter = { find = "no client attached", },                     opts = { skip = true } },
      { filter = { find = "E21", },                                    opts = { skip = true } },
      { filter = { find = "E382", },                                   opts = { skip = true } },
      { filter = { find = "E553", },                                   opts = { skip = true } },
      { filter = { find = "Cursor position outside buffer", },         opts = { skip = true } },
      { filter = { find = "telescope.builtin.lsp_definitions", },      opts = { skip = true } },
      { filter = { find = "telescope.builtin.diagnostics", },          opts = { skip = true } },
      { filter = { find = "No signature help", },                      opts = { skip = true } },
      { filter = { find = "E42", },                                    opts = { skip = true } },
      { filter = { find = "Format request failed", },                  opts = { skip = true } },
      { filter = { find = "Invalid window id: 1001", },                opts = { skip = true } },
      { filter = { find = "WARNING: vim.treesitter", },                opts = { skip = true } },
      { filter = { find = "NotifyBackground", },                       opts = { skip = true } },
      { filter = { find = "no parser for", },                          opts = { skip = true } },
      { filter = { find = "No buffers were deleted:  bdelete #", },    opts = { skip = true } },
    }
  },
}
