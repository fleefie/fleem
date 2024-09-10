-- Configures Mason to work with LSP Config.
return {
  -- You may add servers to be installed automatically below
  ensure_installed = {'lua_ls'},

  -- This funky little function automagically sets up the LSP servers. Neat!
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- You may setup custom LSP server configurations down here, using this
    -- example. mason-lspconfig will load the above first, then these.
    -- example_server = function()
    --   require('lspconfig').example_server.setup({
    --     ---
    --     -- in here you can add your own
    --     -- custom configuration
    --     ---
    --   })
    -- end,

    -- LUA!
    require('lspconfig').lua_ls.setup({
      Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
      },
    })
  },
}
