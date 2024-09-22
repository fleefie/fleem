-- install without yarn or npm
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    require("fleem.settings.mappings").markdown()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
