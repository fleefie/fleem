-- Treesitter config.

require("nvim-treesitter.configs").setup {
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
}
