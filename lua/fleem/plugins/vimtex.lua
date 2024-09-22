return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    require("fleem.settings.mappings").vimtex()
    vim.g.vimtex_view_method = "zathura"
  end,
}
