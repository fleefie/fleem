-- And projects! Features telescope integration.
return {
  lazy = false,
  "ahmedkhalf/project.nvim",
  main = "project_nvim",
  opts = {
    datapath = vim.fn.stdpath("data"),
  }
}
