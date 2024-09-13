-- This should force nvim-lspconfig, mason, mason-lspconfig amd cmp to behave.
-- If they don't I'll be very very sad. "But muh lazy-loading!" Listen bud.
-- You see these FIVE damn plugins? THEY'RE ALL INTERDEPENDANT. Figuring out
-- how to set this all up IN THE FIRST PLACE was a PAIN.
--
-- It JUST works. SHUT UP SHUT UP SHUT UP
return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Lucky me cmp isn't technically needed to be set up here.
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- Mason and Mason-lspconfig were set to be loaded on their own, as they're
    -- independant of the LSP server. However, now, we need them AGAIN past
    -- being simple package managers. So, we just add them to our deps.

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }
  },

  config = function()
    -- Load all three of em up! We'll use all of them here.
    -- Hopefully this shouldn't conflict with mason...
    -- But who cares it's not lazyloaded. Hopefully.
    local lspconfig = require("lspconfig")
    local masonlsp = require("mason-lspconfig")

    -- Load our fancy schmancy LSP keybinds ONLY in an LSP window
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }
        local mappings = require("fleem.settings.mappings")
        mappings.lsp(opts)
        mappings.whichkeylsp()
      end
    })

    -- Tell CMP that we can use the LSP
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- All of the graphical stuff goes here

    -- num column error signs
    local signs = { Error = "✘ ", Warn = "▲ ", Hint = "󰌶 ", Info = "» " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- diagnostic virtual text prefix
    vim.diagnostic.config({
      virtual_text = {
        prefix = "»",
      },
    })

    -- Now the fun part. Mason and Mason-lspconfig are, hopefully, both started
    -- by now. So instead of calling for the mason-lspconfig.setup() function,
    -- we instead use the dedicated setup_handlers() function.

    local default_handler = function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    masonlsp.setup_handlers({
      default_handler,

      -- Clangd, enable linting
      lspconfig["clangd"].setup({
        capabilities = lsp_capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--cross-file-rename",
        }
      })
      -- custom handlers go here. Example:
      -- lua_ls = function()
      --   require('lspconfig').lua_ls.setup({
      --     capabilities = lsp_capabilities,
      --
      --     This is where you place
      --     your custom config
      ---
      --   })
      -- end
    })
  end
}
