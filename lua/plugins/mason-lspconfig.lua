return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup()
    end,
  },
}
