-- And there it is! the plugin file.
-- This return table are Lazy's plugin list.
-- *try* to load configs from /lua/plugins/configs/*.lua. This is plugin-specific,
-- of course.
-- Oh and bc this took me way too long to understand... If a plugin asks you to
-- specify something in its setup call, it's the "opts" table that will be ran,
-- such as plugin.setup(opts).

-- There's two possible ways to do a config, you can either put stuff in the opts
-- table, or you may run the "config = function()" call which will run after the
-- plugin is loaded. Both are valid, and the file structure doesn't quite allow
-- using both at once gracefully but who cares.
-- See treesitter and bufferline for examples of both ways to go at it.
-- If anything fails, you can always use /lua/after.lua

return {
  -- Plenary, a library that nearly everyone uses.
  {
    lazy = true,
    "nvim-lua/plenary.nvim"
  },

  -- colorscheme, nordic.nvim
  {
    lazy = false,
    "AlexvZyl/nordic.nvim",
    opts = require "plugins.configs.nordic-colorscheme",
  },

  -- Lets you use a character for virtcolumn
  {"xiyaowong/virtcolumn.nvim"},

  -- NvimTree file browser
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {},
  },

  -- web-devicons, used by some stuff
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- Treesitter my GOAT! super good syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- Bufferline, a... buffer line.
  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require "plugins.configs.bufferline",
  },

  -- Gitsigns, for sidebar git status and some lualine stuff
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Lualine, a fancy little status line
  -- FYI I *completely* stole this from LunarVim lmao.
  {
    "nvim-lualine/lualine.nvim",
    opts = require("plugins.configs.lualine"),
    event = "VimEnter",
    dependencies = {
      "AlexvZyl/nordic.nvim",
      "lewis6991/gitsigns.nvim"
    }
  },

  -- Telescope!
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  -- Super sweet, highlights todos
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Adds the :IncRename command, which is incremental renaming for LSP symbols
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- Makes gx (open in browser) not suck ass
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },

  -- We can't live without fortune now, can we?
  {"rubiin/fortune.nvim"},

  -- Noice is the handler for notifications, command and search inputs, as well
  -- as the LSP signature display. Quite frankly it's just fluff that genuinely
  -- slows you down and is incredibly inconvenient to use.
  --
  -- ... But it looks good. So it gets added ;)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "plugins.configs.noice",
    setup = function()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },


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
