-- Configures Mason to work with LSP Config.
return {
  -- You may add servers to be installed automatically below
  -- ensure_installed = {'lua_ls', 'rust_analyzer'},

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
  },
}
