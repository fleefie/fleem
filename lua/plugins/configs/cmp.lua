-- Autocompletion engine settings. I unno honestly I hope that lsp-zero will
-- carry me into having a working setup.

return {
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = require('cmp').mapping.preset.insert({}),
}
