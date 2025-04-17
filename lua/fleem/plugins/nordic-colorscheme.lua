-- colorscheme, nordic.vim
return {
    lazy = true,
    "AlexvZyl/nordic.nvim",
    opts = {
        noice = { style = 'classic' },
        telescope = { style = 'classic' },
        leap = { dim_backdrop = true },
        ts_context = { dark_background = true },

        on_highlight = function(hl, pal)
            local title_color = pal.orange.base
            -- Make selected bold
            hl.Visual = { bold = true }
            -- Make command line dark
            hl.MsgArea = { bg = pal.black0 }

            -- Border for floating windows
            hl.FloatBorder = { fg = pal.black0, bg = pal.black0 }
            hl.FloatTitle = { fg = pal.black0, bg = title_color }
            hl.NormalFloat = { bg = "#242933" }

            -- which-key hates the default float values for some reason
            hl.WhichKeyNormal = { bg = pal.black0 }
            hl.WhichKeyBorder = { fg = pal.black0, bg = pal.black0 }
            hl.WhichKeyTitle = { fg = pal.black0, bg = title_color }

            -- Same with Telescope
            hl.TelescopePromptPrefix = { bg = pal.black0 }
            hl.TelescopePromptTitle = { fg = pal.black0, bg = title_color }
            hl.TelescopePromptBorder = { fg = pal.black0, bg = pal.black0 }
            hl.TelescopePromptNormal = { bg = pal.black0 }

            hl.TelescopePreviewBorder = { fg = pal.black0, bg = pal.black0 }
            hl.TelescopePreviewNormal = { bg = pal.black0 }
            hl.TelescopePreviewTitle = { fg = pal.black0, bg = title_color }

            hl.TelescopeResultsBorder = { fg = pal.black0, bg = pal.black0 }
            hl.TelescopeResultsNormal = { bg = pal.black0 }
            hl.TelescopeResultsSelected = { bg = pal.black0 }
            hl.TelescopeResultsTitle = { fg = pal.black0, bg = title_color }

            -- Indent highlights
            hl.IblIndent = { fg = pal.gray3 }

            -- nvim-cmp fun stuff
            hl.CmpNormalSel = { bg = pal.gray4, fg = "NONE" }
            hl.CmpNormal = { fg = pal.white3, bg = pal.black0 }

            hl.CmpItemAbbrDeprecated = { fg = pal.gray4, bg = "NONE", strikethrough = true }
            hl.CmpItemAbbrMatch = { fg = pal.orange.base, bg = "NONE", bold = true }
            hl.CmpItemAbbrMatchFuzzy = { fg = pal.orange.base, bg = "NONE", bold = true }
            hl.CmpItemMenu = { fg = pal.magenta.base, bg = "NONE", italic = true }

            hl.cmpitemkindfield = { fg = pal.white3, bg = pal.red.base }
            hl.cmpitemkindproperty = { fg = pal.white3, bg = pal.red.base }
            hl.cmpitemkindevent = { fg = pal.white3, bg = pal.red.base }

            hl.cmpitemkindtext = { fg = pal.white3, bg = pal.green.base }
            hl.cmpitemkindenum = { fg = pal.white3, bg = pal.green.base }
            hl.cmpitemkindkeyword = { fg = pal.white3, bg = pal.green.base }

            hl.cmpitemkindconstant = { fg = pal.white3, bg = pal.yellow.base }
            hl.cmpitemkindconstructor = { fg = pal.white3, bg = pal.yellow.base }
            hl.cmpitemkindreference = { fg = pal.white3, bg = pal.yellow.base }

            hl.cmpitemkindfunction = { fg = pal.white3, bg = pal.magenta.dark }
            hl.cmpitemkindstruct = { fg = pal.white3, bg = pal.magenta.dark }
            hl.cmpitemkindclass = { fg = pal.white3, bg = pal.magenta.dark }
            hl.cmpitemkindmodule = { fg = pal.white3, bg = pal.magenta.dark }
            hl.cmpitemkindoperator = { fg = pal.white3, bg = pal.magenta.dark }

            hl.cmpitemkindvariable = { fg = pal.white3, bg = pal.gray4 }
            hl.cmpitemkindfile = { fg = pal.white3, bg = pal.gray4 }

            hl.cmpitemkindunit = { fg = pal.white3, bg = pal.orange.base }
            hl.cmpitemkindsnippet = { fg = pal.white3, bg = pal.orange.base }
            hl.cmpitemkindfolder = { fg = pal.white3, bg = pal.orange.base }

            hl.cmpitemkindmethod = { fg = pal.white3, bg = pal.blue0 }
            hl.cmpitemkindvalue = { fg = pal.white3, bg = pal.blue0 }
            hl.cmpitemkindenummember = { fg = pal.white3, bg = pal.blue0 }

            hl.cmpitemkindinterface = { fg = pal.white3, bg = pal.cyan.base }
            hl.cmpitemkindcolor = { fg = pal.white3, bg = pal.cyan.base }
            hl.cmpitemkindtypeparameter = { fg = pal.white3, bg = pal.cyan.base }

            hl.NvimTreeNormal = { fg = pal.white3, bg = pal.black1 }
        end

        -- Custom colors go here
        -- override = {
        --     -- Make selected bold
        --     Visual = { bold = true },
        --
        ,
    }
}
