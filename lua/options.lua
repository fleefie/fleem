-- Options! Same alias method as in /lua/mappings.lua
-- We set all of our vim options here. No nasty vimscript around these parts!
local o = vim.o


-- Okay so this is super important, Lazy f*cking DIES if it doesn't have a leader
-- mapped for SOME REASON. 
vim.keymap.set({"n","v"}, "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "


-- I HATE system clipboard. If I want to yank to my clip I'll do it using <leader>y.
-- o.clipboard = "unnamedplus"


-- Indenting
local indentwidth = 2 -- shorthand
o.shiftwidth  = indentwidth  -- tabs are two long
o.tabstop     = indentwidth -- tabs are still two long
o.softtabstop = indentwidth -- I'm honestly too lazy to look up what that does. TWO LONG!
o.expandtab = true -- tab to spaces
o.smartindent = false -- Use treesitter's indent instead!
vim.opt.fillchars = { eob = " " } -- Fills empty stuff with spaces. Dunno why thats specified.


-- Search
o.hlsearch = false  -- Do not highlight search results after search is exited
o.incsearch = true  -- Live search preview as you type. WHY IS THIS NOT DEFAULT?
o.ignorecase = true -- Ignore case when searching...
o.smartcase = true  -- ... unless we specify case in our search.
                    -- ex: /search not sensitive
                    --     /SearcH sensitive


-- I like my mouse personally. Always comes in handy, sometimes.
-- Pro tip: shift + mouse to bypass it on most terminals.
o.mouse = "a"
o.mousemoveevent = true -- Enable hover events, super cool stuff!!!


-- Margin, ruler and line settings
o.nu = true             -- Line numbers
o.relativenumber = true -- Make them relative
o.signcolumn = "yes"  -- Always display the sign column,
                      -- Used for IDE stuff (breakpoints, diags) or git lines.
o.cursorline = true -- Highlights the cursor's line
vim.opt.colorcolumn = "80"


-- Split settings
o.splitbelow = true -- splitbelow = true
o.splitright = true -- Another helpful comment


-- State files settings
o.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath("data") .. "/undodir"
o.undofile = true


-- misc settings
o.termguicolors = true -- true color
o.timeoutlen = 400 -- 400ms command timeout
o.scrolloff = 8 -- Always display 8 lines between the cursor line and the edges
-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = <icon here>,
--   },
-- }) 
