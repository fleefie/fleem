return {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    config = function(_, opts)
        local colorizer = require "colorizer"

        -- Set the options here
        local default_opts = {
            RGB = true,          -- #RGB hex codes
            RRGGBB = true,       -- #RRGGBB hex codes
            names = false,       -- "Name" codes like Blue or blue
            RRGGBBAA = true,     -- #RRGGBBAA hex codes
            rgb_fn = true,       -- CSS rgb() and rgba() functions
            hsl_fn = true,       -- CSS hsl() and hsla() functions
            css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RRGGBB
            css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
            mode = "background", -- Set the display mode. Possible values are: "background", "foreground", "virtualtext"
        }

        colorizer.setup(opts.filetypes or { "*" }, vim.tbl_deep_extend("force", default_opts, opts))
    end,
}
