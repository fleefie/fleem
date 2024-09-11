local M = {}

-- Yet another thing stolen from neovim but you're CRAZY if you think that I'm
-- doing that shit. It's 2:30 AM as I'm typing this.


-- The config. This will act as our DEFAULT config. Essentially, this is a fallback
-- for compatibility reasons.
M.config = {
  -- size can be a number or function which is passed the current terminal
  size = 20,
  -- Disable the default map.
  open_mapping = [[<c-\\>]],
  -- Hide the num col in terms
  hide_numbers = true,
  -- No shading
  shade_filetypes = {},
  shade_terminals = false,
  -- Self-explainatory
  start_in_insert = true,
  -- Don't remember the size
  persist_size = false,
  -- default direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = "float",
  -- Automatically close when we exit the shell or the process,
  -- and automatically scroll the buffer.
  close_on_exit = true,
  auto_scroll = true,
  -- Default shell
  shell = nil,
  -- Float term options
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  -- I'll be fr idk what this does but it breaks if I remove it
  winbar = {
    enabled = false,
  },
  -- This is mostly what I stole from Lvim. You may add custom executables here
  -- to be executed into a specified terminal. Format:
  -- { cmd, keymap, description, direction, size }
  execs = {
    { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
    { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
    { nil, "<M-3>", "Float Terminal", "float", nil },
  },
}


-- Helper function to get the current buffer size
local function get_buf_size()
  local cbuf = vim.api.nvim_get_current_buf()
  local bufinfo = vim.tbl_filter(function(buf)
    return buf.bufnr == cbuf
  end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
  if bufinfo == nil then
    return { width = -1, height = -1 }
  end
  return { width = bufinfo.width, height = bufinfo.height }
end


-- Helper function to get a dynamic terminal size
local function get_dynamic_terminal_size(direction, size)
  size = size or M.config.size
  if direction ~= "float" and tostring(size):find(".", 1, true) then
    size = math.min(size, 1.0)
    local buf_sizes = get_buf_size()
    local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
    return buf_size * size
  else
    return size
  end
end


-- Helper function to turn our M.config.execs into proper keybinds
M.add_exec = function(opts)
  vim.keymap.set({ "n", "t" }, opts.keymap, function()
    M._exec_toggle { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size() }
  end, { desc = opts.label, noremap = true, silent = true })
end


-- It's now 2:50 AM: I do not want to reverse engineer this. I have never even
-- seen the lua : syntax before man.
M._exec_toggle = function(opts)
  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new { cmd = opts.cmd, count = opts.count, direction = opts.direction }
  term:toggle(opts.size, opts.direction)
end


-- blah blah init function that takes our custom binds into account
M.init = function()
  for i, exec in pairs(M.config.execs) do
    local direction = exec[4] or M.config.direction

    local opts = {
      cmd = exec[1] or M.config.shell or vim.o.shell,
      keymap = exec[2],
      label = exec[3],
      -- NOTE: unable to consistently bind id/count <= 9, see #2146
      -- ^^^ I didn't write this. But hillarious hack. If its stupid
      --     and it works, it's not stupid.
      count = i + 100,
      direction = direction,
      size = function()
        return get_dynamic_terminal_size(direction, exec[5])
      end,
    }

    M.add_exec(opts)
  end
end


-- Blah blah load the plugin with our custom config.
M.setup = function()
  local terminal = require "toggleterm"
  terminal.setup(M.config)
end

return M