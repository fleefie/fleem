-- indent blankline. Just shows indents. That's it. That's the plugin.
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    exclude = {
      filetypes = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "",
        "toggleterm",
        "alpha"
      },
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
        "alpha",
        "toggleterm"
      },
    }
  }
}
