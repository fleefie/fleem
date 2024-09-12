-- And there it is! the plugin file.
-- This return table are Lazy's plugin list.
-- *try* to load configs from /lua/plugins/configs/*.lua. This is plugin-specific,
-- of course.
-- Oh and bc this took me way too long to understand... If a plugin asks you to
-- specify something in its setup call, it's the "opts" table that will be ran,
-- such as plugin.setup(opts).

-- There's two possible ways to do a config, you can either put stuff in the opts
-- table, or you may run the "config = function()" call which will run after the
-- plugin is loaded. You could do multiple ones if you returned a table of all
-- tables to be used (see toggleterm.lua)
-- See treesitter and bufferline for examples of both ways to go at it.
-- If anything fails, you can always use /lua/after.lua

return {
  -- I can feel it coming...
  -- Oh no...

  -- SAVE ME LSP-ZERO, SAVE ME!!!
  -- Everything below is stuff used by it.

  -- lsp-zero is a super nice abstraction layer for all of this.
  -- I don't really know if I NEED it, but for now, I'll keep it.
  -- It just makes things convenient.
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
    -- Prevents a conflict with Noice
    -- Setting this to another value will make lsp-zero force define
    -- the signature help stuff, we don't want that
    init = function()
      vim.g.lsp_zero_ui_float_border = 0
    end,
  },

  -- Mason allows automatic downloads for LSPs, linters, debuggers, etc.
  -- It's basically a cool package manager.
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = { ui = { border = "rounded" }},
    config = true,
  },

  -- Our actual completion engine! This part is only the actual UI though
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require "plugins.configs.nvim-cmp"
    end,
    dependencies = {
      -- For some icons
      {"onsails/lspkind.nvim"}
    }
  },

  -- nvim-lspconfig handles... the LSP config. Wowie.
  -- NOTE: THIS ALSO INCLUDES MASON-LSPCONFIG!!!!
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      require "plugins.configs.nvim-lspconfig"
    end
  }
}
