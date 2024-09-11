return {
  noice = { style = 'classic' },
  telescope = { style = 'classic' },
  leap = { dim_backdrop = true },
  ts_context = { dark_background = true },
  -- Custom colors go here
  override = {
    -- Make selected bold
    Visual = { bold = true },
    -- Border for floating windows
    FloatBorder = { fg = "#8ebbba", bg = "#242933" },
    NormalFloat = { bg = "#242933" },
    -- which-key hates the default float values for some reason
    WhichKeyFloat = { bg = "#242933" },
    WhichKeyBorder = { fg = "#8ebbba", bg = "#242933" },
    -- Same with Telescope
    TelescopePromptBorder = { fg = "#8ebbba" },
    TelescopePreviewBorder = { fg = "#8ebbba" },
    TelescopeResultsBorder = { fg = "#8ebbba" },
    TelescopePromptPrefix = { fg = "#ebcb8b" },
    -- The noice search icon thingy, for some, reason has a dark bg
    NoiceCmdlineIconSearch = { bg = "#242933" },
    -- Okay what is it with stuff not using the built-in float borders???
    CmpPmenuBorder = { fg = "#8ebbba", bg = "#242933"},
    -- Indent highlights
    IblIndent = { fg = "#3b4251"}
  },
}
