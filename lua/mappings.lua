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


-- Write, copy, paste
map("n", "<C-s>", "<cmd> w <CR>") -- binds Ctrl+s to :w<return>
map("n", "<leader>p", "<cmd> +p <CR>") -- system clipboard paste
map("n", "<leader>y", "<cmd> +y <CR>") -- system clipboard copy

-- bufferline.nvim, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>") -- Tab through buffers
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>") -- And in reverse!

-- LSP-related keybinds.
-- A bit of a hack, but it works. Put them in this function, lsp-zero will
-- load them as needed. Hopefully.
function SetLspKeybinds(client, bufnr)
  local opts = {buffer = bufnr}
  client = client

  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

end
