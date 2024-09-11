-- Here, all of your non-plugin mappings will be defined.
-- A map command works as such :
-- vim.keymap.set(MODE, KEYBIND, COMMAND)
-- For a quick shorthand, the line right below aliases map to vim.keymap.set
local map = vim.keymap.set
-- In my config, I like to preface everything with my leader key if it isn't
-- a default bind. And I also like to define keybinds using which-key because
-- I'm a big dummy and I forget my binds all the time, so you'll see them
-- mostly defined in /lua/plugins/configs/which-key.lua. Though I'll put all of
-- my non-leader mappings here.

-- Used to refer to this file in different contexts
M = {}

-- Default keymaps go here.
function M.keymaps()
-- Write, copy, paste
map("n", "<C-s>", "<cmd> w <CR>") -- binds Ctrl+s to :w<return>
map("n", "<leader>p", "<cmd> +p <CR>") -- system clipboard paste
map("n", "<leader>y", "<cmd> +y <CR>") -- system clipboard copy

-- bufferline.nvim, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>") -- Tab through buffers
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>") -- And in reverse!

end


-- Lsp-related keymaps, defined here and calls them in nvim-lspconfig.lua
function M.lspmaps(opts)
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>',":IncRename ", opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- WhichKey! Menus taken from LunarVim because I'm already used to that.
-- M.whichkey returns normal mode binds,
-- M.vwhichkey returns visual mode binds.
function M.whichkey()
  local wk = require("which-key")
  wk.add({
    -- Menuless keyubinds
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line", nowait = true, remap = false },
    { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard", nowait = true, remap = false },
    { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer", nowait = true, remap = false },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer", nowait = true, remap = false },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Reset search highlight", nowait = true, remap = false },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>f", "<cmd>lua require('plugins.configs.telescope').find_project_files()<CR>", desc = "Files", nowait = true, remap = false },

    -- Config-related options
    { "<leader>N", group = "NeoVim", nowait = true, remap = false },
    { "<leader>Nc", "<cmd>edit ~/.config/nvim/init.lua<cr>", desc = "Edit config.lua", nowait = true, remap = false },
    { "<leader>Nf", "<cmd>lua require('plugins.configs.telescope').find_config_files()<cr>", desc = "Find config files", nowait = true, remap = false },
    { "<leader>Ng", "<cmd>lua require('plugins.configs.telescope').grep_config_files()<cr>", desc = "Grep config files", nowait = true, remap = false },
    { "<leader>Nk", "<cmd>Telescope keymaps<cr>", desc = "View keymappings", nowait = true, remap = false },

    -- Buffer stuff
    { "<leader>b", group = "Buffers", nowait = true, remap = false },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory", nowait = true, remap = false },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language", nowait = true, remap = false },
    { "<leader>bW", "<cmd>noautocmd w<cr>", desc = "Save without formatting (noautocmd)", nowait = true, remap = false },
    { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous", nowait = true, remap = false },
    { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close", nowait = true, remap = false },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find", nowait = true, remap = false },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left", nowait = true, remap = false },
    { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump", nowait = true, remap = false },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right", nowait = true, remap = false },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next", nowait = true, remap = false },

    -- Debug commands
    { "<leader>d", group = "Debug", nowait = true, remap = false },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor", nowait = true, remap = false },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI", nowait = true, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", nowait = true, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", nowait = true, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", nowait = true, remap = false },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", nowait = true, remap = false },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", nowait = true, remap = false },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", nowait = true, remap = false },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause", nowait = true, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit", nowait = true, remap = false },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl", nowait = true, remap = false },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start", nowait = true, remap = false },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", nowait = true, remap = false },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", nowait = true, remap = false },

    -- Git stuff
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)", nowait = true, remap = false },
    { "<leader>gL", "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", desc = "Blame Line (full)", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },

    -- LSP commands
    { "<leader>l", group = "LSP", nowait = true, remap = false },
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info", nowait = true, remap = false },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics", nowait = true, remap = false },
    { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix", nowait = true, remap = false },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format", nowait = true, remap = false },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic", nowait = true, remap = false },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
    { "<leader>lr", ":IncRename ", desc = "Rename", nowait = true, remap = false },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics", nowait = true, remap = false },

    -- Plugin Management
    { "<leader>p", group = "Plugins", nowait = true, remap = false },
    { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean", nowait = true, remap = false },
    { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug", nowait = true, remap = false },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log", nowait = true, remap = false },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile", nowait = true, remap = false },
    { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update", nowait = true, remap = false },

    -- Searches
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects", nowait = true, remap = false},
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search", nowait = true, remap = false },
    { "<leader>sc", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text", nowait = true, remap = false },
  })

  wk.add({
      -- visual-specific keybinds
      mode = { "v" },
      { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)", nowait = true, remap = false },
      { "<leader>g", group = "Git", nowait = true, remap = false },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk", nowait = true, remap = false },
      { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk", nowait = true, remap = false },
      { "<leader>l", group = "LSP", nowait = true, remap = false },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
  })

end

return M
