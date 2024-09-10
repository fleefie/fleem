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

-- LSP-related keybinds:
-- See nvim-lspconfig pluging config file!

-- NvimTree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>")
