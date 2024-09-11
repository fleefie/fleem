My personal NeoVim config and plugins. Theres a bunch of comments in there in case you want to learn how to do something (in case I look at this mess in a few months and want to relearn how to do it.)

Major credits go to NvChad for providing the base file layout (forked from them, see minimal branch for a basic setup that mimmicks theirs) and to LunarVim, for providing (letting me steal) a TON of helper functions everywhere, the lualine config and the whichkey menu layout which I really enjoyed and took for myself. I also took the liberty of updating it all to newer specs of the plugins in question since they were all based on fairly old versions of plugin configs and using the latest version screwed things up.

File structure is as follows:
```
    init.lua                boot file, launches Lazy and calls the settings
    lua                     main directory
    |
    +- plugins              plugin stuff
    |    |
    |    +- configs         plugin configs
    |    |   |
    |    |   + alpha.lua
    |    |   + bufferline.lua
    |    |   + indent-blankline.lua
    |    |   + ...
    |    |
    |    +- init.lua        plugin list, calls the configs
    |
    +- after.lua            this file is called after lazy is fully loaded
    +- commands.lua         custom commands and autocommands
    +- lazy_config.lua      lazy configuration
    +- mappings.lua         keymaps. Contains submodules called by plug cfgs
    +- options.lua          general (neo)vim options
```
