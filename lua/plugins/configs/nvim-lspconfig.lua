local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  client = client
  local opts = { buffer = bufnr }
  -- Load keymaps from main file
  require("mappings").lspmaps(opts)
end

-- UI settings go here!
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  info = 'i',
  hint = "󰌶",
})



lsp_zero.extend_lspconfig({
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require("lspconfig.ui.windows").default_options.border = "rounded"

-- NOTE: MASON-LSPCONFIG IS HANDLED HERE!!
require('mason-lspconfig').setup({
  -- Automatic installation goes here
  ensure_installed = {},

  -- LSP Handler configs
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
