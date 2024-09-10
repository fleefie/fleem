-- These just load up our options, keymaps and commands.
-- Equivalent to running lua/options.lua,
--                       lua/mappings.lua and
--                       lua/commands.lua.
-- Be aware that you cannot call plugin functions in these files,
-- but you can bind to them.
require "options"
require "mappings"
require "commands"


-- This snippet places lazy's install path into nvim's standard data directory.
-- By default, this is ~/.local/share/nvim.
-- We just concat lazy's specific install directory to it. So basically, this
-- should work even if nvim's stdpaths are different on your machine.
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- fs_stat just checks if "lazypath" exists. If it does, great! Otherwise, it
-- means that we couldn't find lazy, so we install it. Theoretically this
-- snippet is utterly useless after the first launch, but hey, a bit of error
-- handling never held anyone back.
if not vim.loop.fs_stat(lazypath) then
  NotInstalled = true
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Adds lazy to the RTP (runtime path). This lets us call its functions easily.
vim.opt.rtp:prepend(lazypath)

-- Loads up the plugin list into a fancy schmancy table.
-- This just means that /lua/plugins/init.lua is called,
-- Thats the file containing our plugin list. It returns
-- the plugin table thingy that lazy expects.
local plugins = require "plugins"

-- Finally, ask lazy to load the plugins from the table,
-- and pass the /lua/plugins/lazy_config.lua table too.
-- This lets the configs be more structured instead of the not so great defaults
-- of lazy.nvim. No more keybinds IN the plugin spec file, yippee!!
require("lazy").setup(plugins, require "lazy_config")

-- One final call just in case you ever need it, like if you want to run a plugin
-- function AFTER it's loaded. Typically this is where hacks go :p
require "after"
