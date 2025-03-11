-- Our actual completion engine! This part is only the actual UI though
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- For some icons
        { "onsails/lspkind.nvim" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
    },


    config = function()
        local cmp = require("cmp")

        -- You will likely want to reduce updatetime which affects CursorHold
        -- note: this setting is global and should be set only once
        -- vim.o.updatetime = 250
        -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        --     group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
        --     callback = function()
        --         vim.diagnostic.open_float(nil, { focus = false })
        --     end
        -- })

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
                { name = "path" },
            },

            mapping = require("fleem.settings.mappings").cmp(),

            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },

            -- window = {
            --   completion = {
            --     border = "none",
            --     winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
            --     col_offset = -3,
            --     side_padding = 0,
            --   },
            --   documentation = {
            --     border = "none",
            --     winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
            --   },
            -- },

            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"
                    return kind
                end,
            },
        })
    end,
}
