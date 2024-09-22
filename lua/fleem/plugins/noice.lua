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
      bottom_search = false,     -- use a classic bottom cmdline for search
      command_palette = true,    -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,         -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,     -- add a border to hover docs and signature help
    },
  },
}
