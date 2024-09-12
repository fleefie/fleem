-- Treesitter my GOAT! super good syntax highlighting.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  opts = {
    -- Automatically install those so you can edit this config on
    -- first launch.
    ensure_installed = { "lua", "vim" },

    -- Enable the highlight server
    highlight = {
      enable = true,
      use_languagetree = true,
    },

    -- Use treesitter's indents.
    indent = { enable = true },
  },
}
