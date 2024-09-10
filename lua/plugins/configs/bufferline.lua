-- Basic bufferline settings.
return {
  options = {
    themable = true,
    offsets = {
      -- Things to ignore. Here, NvimTree.
      { filetype = "NvimTree", highlight = "NvimTreeNormal" },
    },
  },
}
