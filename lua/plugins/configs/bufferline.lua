-- Bufferline config!

-- Yoinked and modified from LunarVim AGAIN lol
local function diagnostics_indicator(num, _, diagnostics, _)
  local result = {}
  local symbols = {
    error = "✘",
    warning = "▲",
    info = "»",
    hint = "󰌶",
  }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. " " .. count)
    end
  end
  local resultString = ""
  resultString = table.concat(result, " ")
  return #resultString > 0 and resultString or ""
end

return {
  -- Set the selected buffer to bold,
  -- and all to italic.
  highlights = {
    background = {
      italic = true,
    },
    buffer_selected = {
      bold = true,
    },
  },
  options = {
    -- RMB to dupe buffer vertically
    right_mouse_command = "vert sbuffer %d",
    -- Thanks LunarVim for this little script. Hides .md from markdown files
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match "%.md" then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    -- Tie into nvim_lsp
    diagnostics = "nvim_lsp",
    diagnostics_indicator = diagnostics_indicator,
    offsets = {
      {
        filetype = "undotree",
        text = "Undotree",
        highlight = "PanelHeading",
        padding = 1,
      },
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
      },
      {
        filetype = "lazy",
        text = "Lazy",
        highlight = "PanelHeading",
        padding = 1,
      },
    },
    separator_style = "thin",
    always_show_bufferline = true,
  },
}
