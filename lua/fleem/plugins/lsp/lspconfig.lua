-- nvim-lspconfig is just pre-baked configs. Neat1
return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    lazy = false,

    config = function()
        -- This makes sure to only enable LSP-related keybinds if an LSP
        -- is running
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                local mappings = require("fleem.settings.mappings")
                mappings.lsp(opts)
                mappings.whichkeylsp()
            end
        })

        -- Gutter error symbols
        local signs = { Error = "✘ ", Warn = "▲ ", Hint = "󰌶 ", Info = "» " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- diagnostic virtual text prefix
        vim.diagnostic.config({
            virtual_text = {
                prefix = "»",
            },
        })
    end
}
