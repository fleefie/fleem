local M = {}

-- LSPConfig must be used for this to work bc I'm a lazy little FUCK

function M.config_lsps()
    -- lua-language-server
    vim.lsp.enable('lua_ls')

    -- clangd
    vim.lsp.config('clangd', {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--cross-file-rename",
        }
    })
    vim.lsp.enable('clangd')
end

return M
