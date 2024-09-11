local ibl = require("ibl")
ibl.setup({
  indent = {char = "▏"},
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
})
