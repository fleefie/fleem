-- Mason is basically a woke package manager, don't overthink it

return {
  "williamboman/mason.nvim",
  lazy=false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- This will get real weird, real fast
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Setup mason
    mason.setup({ ui = { border = "rounded" }})

    -- Setup mason-lspconfig here, but don't configure it.
    mason_lspconfig.setup()

    -- add binaries installed by mason.nvim to path
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT" -- tempted to remove this for the lolz
      vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
    end
}
