-- Autocompletion engine settings. I unno honestly I hope that lsp-zero will
-- carry me into having a working setup.
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({ ---@diagnostic disable-line: redundant-parameter
            -- SHUT UP SHUT UP SHUT UP SHUT UP
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
    ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})
