-- Mason is basically a woke package manager, don't overthink it

return {
    "williamboman/mason.nvim",
    lazy = false,

    config = function()
        local mason = require("mason")

        -- Setup mason
        mason.setup({ ui = { border = "none" } })

        -- add binaries installed by mason.nvim to path
        local is_windows = vim.loop.os_uname().sysname == "Windows_NT" -- tempted to remove this for the lolz
        vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
    end
}
